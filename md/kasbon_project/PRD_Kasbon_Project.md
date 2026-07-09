# Product Requirements Document (PRD)

## 1. Metadata (Informasi Dasar)
- **Nama Produk/Fitur:** Modul Kasbon Project
- **Status:** Approved
- **Author:** Alief Daffa Naufal
- **Tim Terkait:** UI/UX Designer, Tech Lead, Backend, QA
- **Tanggal:** 9 Juli 2026

---

## 2. Executive Summary (Latar Belakang)
- **Background:** Permintaan dana uang muka operasional (Kasbon) oleh konsultan sering melebihi batas anggaran awal tanpa validasi yang *strict*, sehingga menyebabkan kerugian ( *overbudgeting* ) di akhir proyek.
- **Objective:** Mengunci pengajuan kasbon agar selalu <= Total Plafon Budget. Apabila pengeluaran dirasa membengkak (contoh: tiket pesawat mendadak naik), *user* dipaksa melalui prosedur khusus yaitu Pengajuan *Overbudget* (OVB).
- **Target Audience:** Konsultan Lapangan (Pemohon) dan Finance (Validasi pencairan).

---

## 3. Goals & Success Metrics
- **Business Goals:** Nol (0) kebocoran anggaran operasional tak terkontrol. Setiap pembengkakan tercatat resmi dan di- *approve* Direksi via mekanisme OVB.
- **Success Metrics (KPI):**
  - 100% *Rejection* otomatis oleh sistem jika nilai form kasbon melebihi Sisa Limit Plafon.
  - Efisiensi waktu pengecekan manual limit oleh Finance menjadi otomatis/instan.
- **Non-Goals:** Kasbon Project HANYA mencatat permohonan "Uang Keluar". Tidak mencatat struk kembalian/ *reimburse* (ini ada di Modul *Expense Report*).

---

## 4. User Journey & Flow
- **User Persona:** Dina (Konsultan Lapangan).
- **User Journey Map:**
  1. Dina masuk ke menu Kasbon Project dan melihat Proyek A (Budget disetujui Rp 10 Juta).
  2. Dina mengajukan Kasbon Akomodasi Rp 2 Juta. (Sisa plafon Rp 8 Juta).
  3. Sistem memproses draf dan mengarahkan ke Finance.
  4. Di tahap lain, Dina mengajukan Kasbon lagi sebesar Rp 9 Juta. Sistem **memblokir** karena sisa tinggal Rp 8 Juta, dan tombol beralih ke warna kuning ( *Request OVB* ).
  5. Dina mengajukan OVB, disetujui oleh Direksi. Saldo plafon Dina bertambah menjadi Rp 12 Juta.
  6. Dina baru bisa mengajukan Kasbon reguler.

---

## 5. Functional Requirements (Fitur Utama)
| ID | Fitur/Komponen | Deskripsi | Prioritas |
|---|---|---|---|
| FR-01 | Smart Baseline Tracker | Backend secara terus menerus mengecek (Total Budget + Total OVB) dikurangi Total Kasbon (Draft + Approved). | P0 (Wajib) |
| FR-02 | Dynamic UI Button | Menyembunyikan tombol "Add Kasbon" dan memunculkan "Request OVB" secara *real-time* jika limit tercapai. | P0 (Wajib) |
| FR-03 | Request OVB Mechanism | Modul terpisah tempat *user* mengajukan "Budget Tambahan". Bila *Approved*, kuota limit proyek bertambah. | P0 (Wajib) |
| FR-04 | Checkbox / Tab Input | *User* bisa memilih parsial komponen mana saja yang ingin dicairkan (Lab saja, atau Akomodasi saja). | P1 (Penting) |

---

## 6. Non-Functional Requirements
- **Performance:** Kueri agregasi raksasa (`UNION ALL` hingga 12 tabel) harus dioptimasi agar tidak *timeout* saat dimuat dalam DataTables (Server-side rendering mutlak).
- **Security:** Manipulasi JS di sisi *client* (DOM Manipulation) tidak boleh bisa menembus sisa plafon, validasi akhir tetap di Backend `save()`.
- **Scalability & Platform:** Mendukung penggunaan via Tablet/Mobile browser (untuk konsultan *remote*).

---

## 7. UX/UI Design & Wireframes
- **Link Figma/Adobe XD:** `[Masukkan Link Figma Di Sini]`
- **Design Notes:** 
  - Harus ada indikator **Progress Bar** Sisa Plafon Anggaran (Sangat mencolok di UI).
  - Tombol **OVB** gunakan warna mencolok seperti *Warning (Kuning / Oranye)* dengan ikon panah ke atas.

---

## 8. Constraints & Assumptions (Kendala & Asumsi)
- **Assumptions:** Data Project Budgeting (sebagai pembatas plafon) telah final dan nilainya absolut.
- **Constraints:** Struktur DB *highly fragmented* (dipecah per jenis biaya), sehingga kueri menjadi sangat kompleks di tingkat Controller.

---

## 9. Future Iterations / Phase 2
- Integrasi ke ERP Finance pusat ( *seamless transfer* lewat API *banking* ).
- Sisa plafon yang tidak dipakai sampai akhir proyek secara otomatis ditandai sebagai "Net Profit Tambahan".
