# Expense Report Project: penyelesaian selisih v2

Approval tetap menggunakan modul dan permission existing. Semua enam jenis expense memakai flow baru untuk laporan yang dibuat setelah rilis. Kolom `flow_version` bernilai default **1**, sedangkan aplikasi secara eksplisit menyimpan **2** pada laporan baru. Revisi tidak mengubah versinya.

## Pencatatan

Selisih dihitung dari total kasbon dikurangi total realisasi. Nominal memakai sen integer untuk kalkulasi dan `DECIMAL` untuk penyimpanan. Qty dan harga kasbon berasal dari database, bukan hidden input. COA beban mengikuti mapping master yang digunakan modul existing; fallback tetap `5101-01-03`.

| Kondisi | Saat approval existing | Proses lanjutan |
|---|---|---|
| Sama | Debit beban, kredit piutang `1103-01-14` | Selesai |
| Kasbon lebih besar | Debit beban sebesar realisasi, debit `1103-01-15` (Piutang Kelebihan Kasbon) sebesar sisa, dan kredit `1103-01-14` sebesar kasbon penuh | User upload pengembalian penuh; Finance verifikasi, debit Bank dan kredit `1103-01-15` sebesar sisa |
| Realisasi lebih besar | Debit beban, kredit piutang sebesar kasbon `1103-01-14` dan hutang expense `9999-99-99` sebesar selisih | Satu item di `db_sendigs_ss.request_payment` |

Contoh Rp1.000.000 kasbon dan Rp800.000 realisasi: approval mencatat beban Rp800.000 (Debit), piutang kelebihan kasbon Rp200.000 (Debit `1103-01-15`), dan penyelesaian kasbon konsultan Rp1.000.000 (Kredit `1103-01-14`). Piutang kelebihan kasbon Rp200.000 baru dikreditkan saat uang masuk diverifikasi Finance (Debit Bank, Kredit `1103-01-15`). Jika realisasi nol, approval mencatat Debit `1103-01-15` dan Kredit `1103-01-14` sebesar seluruh kasbon sampai uang masuk dikembalikan.

Approval dan verifikasi menggunakan row lock pada header untuk menghindari proses ganda. Header, jurnal Finance, data pengembalian, dan Request Payment ditulis menggunakan satu koneksi MySQL lintas schema. Tabel wajib InnoDB dan schema harus ada pada server yang sama. Kegagalan insert menyebabkan rollback seluruh transaksi terkait.

## Pengembalian

- Tab Pengembalian Kasbon hanya menampilkan laporan milik pengguna login.
- Status terpisah dari status approval: `waiting_return`, `waiting_verification`, `completed`.
- Bukti JPG/JPEG/PNG/PDF maksimal 2 MB. Nominal wajib sama dengan seluruh sisa. Tanggal transfer sejak approval sampai hari ini.
- Finance wajib mencentang tiga checklist: nominal, tanggal, dan dana masuk. Penolakan wajib disertai alasan dan mengembalikan status ke `waiting_return`.
- Riwayat bukti dan keputusan dipertahankan. Setelah penolakan, bukti lama tidak aktif dan preview pelunasan dikosongkan sampai user mengirim ulang.
- Bukti disimpan di `application/private/expense_returns/`. Direktori ini harus writable oleh PHP, persisten, ikut backup dokumen, dan tidak dapat diakses langsung dari web. Endpoint download memeriksa kepemilikan atau permission verifikator.
- Endpoint submit dan keputusan verifikasi memeriksa token sesi form. File yang gagal dikaitkan ke transaksi dibersihkan.
- Finance tidak boleh memverifikasi laporan buatannya sendiri.

## Integrasi Finance

Sumber satu-satunya untuk reimburse v2 adalah **`db_sendigs_ss.request_payment`**. Tabel lokal bernama sama tidak dipakai. Laporan lama tetap menggunakan kode integrasi lamanya.

Kolom tambahan `source_module='expense_report_project'`, `source_id`, `id_company`, dan `nm_company` mengidentifikasi sumber serta company. Unique key `(source_module,source_id)` mencegah duplikasi sumber tanpa memengaruhi record lama yang nilainya NULL.

Field existing yang diisi: `tipe='expense'`, `no_doc`/`ids` nomor laporan, `nama` pemohon, `tgl_doc` tanggal laporan, `keperluan` berawalan `Lebih Expense`, `jumlah` sebesar kekurangan, rekening penerima dari kasbon, `currency='IDR'`, dan status awal `0`. Nomor laporan di atas kapasitas `no_doc` (50 karakter) ditolak agar tidak terpotong. Pajak, admin, serta approval/pembayaran Finance tidak diubah.

Monitoring membaca record Finance secara langsung:

| Status Finance | Tampilan |
|---|---|
| `0`/NULL tanpa `no_request` | Menunggu Diajukan |
| `0`/NULL dengan `no_request` | Menunggu Approval |
| `1` (Disetujui) atau `2` (Selesai) | Disetujui |

`keterangan` Finance ditampilkan agar alasan pengembalian/penolakan yang dicatat di sana terbaca. Pengajuan ulang mengikuti mekanisme Finance: record dikembalikan ke status awal dan nomor pengajuan dilepas. Expense yang sudah approved tidak dibuka kembali. Record Finance yang hilang ditandai **Integrasi Finance perlu diperiksa**, tidak dianggap sukses.

## Instalasi dan akses

1. Backup schema consultant dan Finance. Jalankan saat perubahan form baru belum dipakai pengguna.
2. Jalankan `php scripts/migrate_expense_project_settlement.php` untuk preflight, lalu tambahkan `--apply` untuk instalasi. Default konfigurasi memakai environment development; set `CI_ENV` jika memakai environment lain. SQL berada di `application/modules/expense_report_project/sql/settlement_v2.sql`.
3. Runner memeriksa schema, InnoDB, dan keberadaan menu approval. Pemanggilan ulang setelah instalasi lengkap tidak menjalankan DDL lagi. Jika instalasi terputus sebagian, perbaiki berdasarkan schema aktual; jangan menjalankan SQL mentah berulang.
4. Berikan **`Expense_Project_Return.Verify`** kepada role Finance melalui pengaturan role. Migrasi membuat permission/menu, tetapi tidak otomatis memberi hak ke pengguna atau role.
5. User pelapor menggunakan hak existing View, Add, dan Manage untuk laporan serta pengembalian miliknya. Tidak ada tahap approval bisnis baru.
6. Untuk rollback aplikasi, pastikan tidak ada laporan v2 aktif sebelum mengembalikan kode lama. Jangan menurunkan versi laporan atau menghapus jurnal/DDL secara otomatis. Laporan v2 yang sudah dibuat harus diselesaikan atau direkonsiliasi terlebih dahulu.

Skrip perbaikan jurnal lama `repair_expense_report_journals.php` secara eksplisit menahan laporan v2 supaya tidak mengganti jurnal terpisah dengan aturan legacy.

## Pemeriksaan

```sh
docker exec consultant_web php /var/www/tests/ExpenseProjectFlowTest.php
docker exec consultant_web php /var/www/tests/ExpenseProjectSettlementIntegrationTest.php
docker exec consultant_web php /var/www/tests/ExpenseProjectViewsTest.php
docker exec consultant_web php /var/www/tests/ExpenseReportJournalRepairTest.php
```

Tes integrasi memakai driver mysqli CodeIgniter sesungguhnya serta schema sementara dengan prefix `expense_flow_test_`, dihapus setelah pengujian. Tidak mengubah record aplikasi. Cakupan: seluruh kategori dan kondisi selisih, item standard/custom, selisih antaritem berlawanan, realisasi nol, nominal tidak valid, kepemilikan, edit saat pending/approved, reject/revisi, upload tanpa jurnal, checklist, upload ulang, monitoring Finance, rollback lintas schema, serta approval/verifikasi bersamaan.

Pengujian browser tidak diperlukan untuk perubahan ini. Tidak ada pencocokan mutasi otomatis, pembayaran sebagian, email, atau migrasi laporan lama.
