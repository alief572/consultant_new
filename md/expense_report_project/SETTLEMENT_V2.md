# Expense Report Project: penyelesaian selisih v2

Approval tetap satu tingkat dan menggunakan modul serta permission existing. Untuk laporan flow baru, `Approval_expense_report_project` mendelegasikan approve/reject ke `Expense_project_settlement::approve()` / `reject()` (satu transaksi: jurnal, data pengembalian atau `tr_expense`, dan header). Menyimpan laporan langsung mengajukannya ke antrian Appr Expense Report (`sts_req = 1`); laporan yang ditolak direvisi lewat Edit lalu disimpan ulang. Semua enam jenis expense memakai flow baru untuk laporan yang dibuat setelah rilis. Kolom `flow_version` bernilai default **1**, sedangkan aplikasi secara eksplisit menyimpan **2** pada laporan baru. Revisi tidak mengubah versinya.

## Pencatatan

Selisih dihitung dari total kasbon dikurangi total realisasi. Nominal memakai sen integer untuk kalkulasi dan `DECIMAL` untuk penyimpanan. Qty dan harga kasbon berasal dari database, bukan hidden input. COA beban mengikuti mapping master yang digunakan modul existing; fallback tetap `5101-01-03`.

| Kondisi | Saat approval existing | Proses lanjutan |
|---|---|---|
| Sama | Debit beban, kredit piutang `1103-01-14` | Selesai |
| Kasbon lebih besar | Debit beban sebesar realisasi, debit `1103-01-15` (Piutang Kelebihan Kasbon) sebesar sisa, dan kredit `1103-01-14` sebesar kasbon penuh | User upload pengembalian penuh; Finance verifikasi, debit Bank dan kredit `1103-01-15` sebesar sisa |
| Realisasi lebih besar | Debit beban, kredit piutang sebesar kasbon `1103-01-14` dan hutang expense `9999-99-99` sebesar selisih | Baris `tr_expense` + `tr_expense_detail` di `db_sendigs_ss` (sumber kategori Expense di Request Payment SENDIGS) |

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

Reimburse v2 ditulis ke **`db_sendigs_ss.tr_expense`** dan **`tr_expense_detail`** (`status = 2`, `sts_finance = 1`, `project_consultant = '1'`, `no_expense_consultant` = nomor laporan), dalam transaksi yang sama dengan approval. Jurnal ditulis ke `db_sendigs_ss.tr_jurnal` dengan nomor urut AJV (`NNNNN-AJV-<romawi bulan>-<yy>`) dan keterangan `<nama COA> - <no expense> - <no kasbon>`. Nomor laporan di atas 50 karakter ditolak agar tidak terpotong. Pajak, admin, serta approval/pembayaran Finance tidak diubah.

Monitoring reimburse memantau siklus Request Payment di SENDIGS SS (`tr_rp_pengajuan_h`, `tr_rp_pengajuan_d`, `tr_rp_record`, `tr_rp_reject_log`) untuk laporan v2 dengan selisih negatif.

| Kondisi / Status Request Payment | Sub-tab | Badge Status | No. Pengajuan | Keterangan |
|---|---|---|---|---|
| Expense Report belum disetujui (`sts != 1`) | Menunggu Diajukan | Draft Expense / Menunggu Approval Expense / Expense Ditolak | - | - (atau alasan revisi expense) |
| Expense Report disetujui (`sts = 1`), belum diajukan Finance | Menunggu Diajukan | Menunggu Diajukan Finance | - | - |
| Finance ajukan batch (`ph.status = 'pending'`) | Menunggu Approval | Menunggu Approval | `PGJ-XXXX` | - |
| Approval RP menyetujui (`ph.status = 'done', d.decision = 'approved'`) | Disetujui | Disetujui | `PGJ-XXXX` | - |
| Approval RP menolak (`ph.status = 'done', d.decision = 'rejected'`) | Menunggu Diajukan | Menunggu Diajukan Finance (+ Ditolak di Request Payment) | - | Alasan penolakan dari reject log (+ nomor PGJ) |

Disetujui di Request Payment belum berarti sudah dibayar kasir/bank; pemantauan pada tab ini berakhir pada persetujuan batch Request Payment. Pengajuan ulang setelah penolakan RP mengikuti pembuatan batch PGJ baru di SENDIGS SS tanpa membuka kembali status Expense Report di Consultant.

## Instalasi dan akses

0. Migrasi v3 (kolom `keterangan_laporan`): `php scripts/migrate_expense_report_v3.php` untuk preflight, tambahkan `--apply` untuk instalasi. SQL: `application/modules/expense_report_project/sql/expense_report_v3.sql`. Laporan lama dibiarkan kosong.
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
