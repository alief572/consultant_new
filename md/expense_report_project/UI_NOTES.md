# UI Expense Report Project

Perubahan mengikuti UI AdminLTE/Bootstrap yang sudah ada dalam project. Halaman dipakai pelapor untuk mempertanggungjawabkan biaya dan Finance untuk memeriksa pengembalian. Fokus tiap layar adalah dokumen, nominal, status, dan tindakan berikutnya.

Antislop during dipilih pengguna untuk sesi ini. Design Read: aplikasi operasional Finance dengan bahasa visual terang yang mengikuti identitas aplikasi existing; **ENERGY 1 / RHYTHM 2 / MOTION 1**.

## Alasan keputusan visual

- Biru existing diperdalam menjadi `#24688f` supaya teks putih pada tombol utama memenuhi kontras AA.
- Font mewarisi aplikasi agar tidak memuat font eksternal tambahan; ukuran tabel dan kontrol dinaikkan untuk keterbacaan angka.
- Digit tabular dan perataan kanan dipakai supaya nominal antardokumen mudah dibandingkan.
- Nominal dan status ditempatkan setelah identitas dokumen karena menentukan tindakan pelapor dan verifikator.
- Ringkasan kasbon, realisasi, dan selisih dikelompokkan sebagai satu rangkaian angka, tanpa garis warna dekoratif pada tiap kartu.
- Warna status menunjukkan menunggu, diperiksa, selesai, atau gagal; nominal daftar tetap netral karena besarnya bukan indikator keberhasilan.
- Form, riwayat, dan jurnal dipisahkan menurut pekerjaan yang dilakukan, tanpa panel statistik tambahan atau data buatan.
- Tabel lebar digeser di dalam region sendiri. Form dan filter menyusun ulang pada layar kecil agar halaman tidak melebar.
- Tombol nota memakai elemen button native untuk mendukung keyboard. Fokus terlihat pada tombol, tab, filter, dan region tabel.
- Transisi hanya mendukung hover/fokus; tidak ada animasi berulang dan preferensi reduced motion dihormati.

## Perilaku

- Pencarian dan status digabungkan dalam masing-masing daftar tanpa memengaruhi tab lain.
- Jumlah hasil diperbarui dan diumumkan lewat live region. Pesan dataset kosong dibedakan dari hasil pencarian kosong; reset tersedia untuk hasil kosong.
- Daftar SPK menampilkan proses loading, pesan gagal, dan tombol muat ulang. Nilai teks dari server dirender sebagai teks yang di-escape.
- Tab mendukung panah kiri/kanan serta Home/End, dan menyelaraskan `aria-selected` dengan tab aktif.
- Feedback pengembalian menampilkan proses simpan, keberhasilan, dan kegagalan. Pesan server tidak dimasukkan sebagai HTML; tombol dinonaktifkan selama pengiriman.
- Halaman Finance standalone memuat CSS/JS modul secara langsung. Shared script memiliki guard agar handler tidak terpasang ganda.

## Pemeriksaan dan batas verifikasi

Delivery Gate dan UI checklist diperiksa terhadap kode: tidak ada data buatan, navigasi dekoratif, gradient/glow, atau perubahan alur transaksi. Kontras tombol utama dan teks status diperiksa dengan rumus WCAG, minimal 4.5:1. Form existing dan halaman detail mendapat ukuran serta jarak yang sama dari stylesheet bersama.

Pemeriksaan otomatis:

```sh
node --test tests/ExpenseProjectUITest.js
node --check assets/js/expense_report_project_ui.js
docker exec consultant_web php /var/www/tests/ExpenseProjectViewsTest.php
```

Tes JavaScript menjalankan handler pencarian/filter pada fixture DOM ringan; ini bukan pengujian browser. Tes render memeriksa escaping, label, tab, empty state, dan tombol sesuai status. Sintaks PHP seluruh view dan JavaScript hasil render juga diperiksa.

Sesuai arahan pengguna, pengujian browser tidak dijalankan. Pemeriksaan visual pada perangkat nyata dan navigasi keyboard dalam browser belum dikonfirmasi. Hak akses, approval, jurnal, dan sumber data Finance tidak diubah oleh pembaruan UI ini.
