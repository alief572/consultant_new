# Code Review: Modul Cashflow Project

**Reviewer:** Kiro  
**Tanggal:** 12 Agustus 2026  
**Status:** Perlu Perbaikan

---

## Ringkasan

| Aspek | Status | Catatan |
|-------|--------|---------|
| Struktur HMVC | ✅ OK | Sesuai standar |
| Naming convention | ✅ OK | Konsisten |
| Permission check | ⚠️ Partial | Tidak ada di endpoint AJAX |
| SQL Injection | ⚠️ Partial | Ada raw interpolation |
| XSS Prevention | ❌ Gagal | Output tidak di-escape |
| Separation of Concerns | ❌ Gagal | Model melakukan `echo` |
| Performance | ⚠️ Partial | N+1 query pada listing |
| Dead Code | ⚠️ Ada | Variabel/property tidak terpakai |
| Transaction Safety | ⚠️ Berisiko | Tidak ada DB transaction wrapping |

---

## 1. KEAMANAN (Prioritas Tinggi)

### 1.1 Permission Check Tidak Ada di Endpoint AJAX

**File:** `controllers/Cashflow_project.php`  
**Method:** `get_data_spk()`, `get_data_report()`, `get_data_view_tipe()`, `get_years()`, `export_excel()`

**Masalah:** Endpoint ini bisa diakses siapapun yang tahu URL-nya tanpa validasi permission.

**Solusi:**
```php
public function get_data_spk()
{
    $this->auth->restrict($this->viewPermission); // Tambahkan ini
    $this->Cashflow_project_model->get_data_spk();
}

public function get_data_report()
{
    $this->auth->restrict($this->viewPermission); // Tambahkan ini
    // ...
}

public function get_data_view_tipe()
{
    $this->auth->restrict($this->viewPermission); // Tambahkan ini
    // ...
}

public function get_years()
{
    $this->auth->restrict($this->viewPermission); // Tambahkan ini
    // ...
}

public function export_excel()
{
    $this->auth->restrict($this->viewPermission); // Tambahkan ini
    // ...
}
```

---

### 1.2 XSS — Output Tidak Di-escape

**File:** `views/view.php`  
**Baris:** Semua output data dari database

**Masalah:** Data ditampilkan tanpa `htmlspecialchars()`. Jika ada script berbahaya tersimpan di DB, bisa dijalankan di browser user.

**Contoh yang bermasalah:**
```php
<?= $header->nm_customer ?>
<?= $header->nm_project_leader ?>
<?= $header->alamat ?>
```

**Solusi:**
```php
<?= htmlspecialchars($header->nm_customer, ENT_QUOTES, 'UTF-8') ?>
<?= htmlspecialchars($header->nm_project_leader, ENT_QUOTES, 'UTF-8') ?>
<?= htmlspecialchars($header->alamat, ENT_QUOTES, 'UTF-8') ?>
```

Atau buat helper singkat:
```php
// di application/helpers/app_helper.php
function esc($str) {
    return htmlspecialchars($str ?? '', ENT_QUOTES, 'UTF-8');
}
```

Lalu pakai: `<?= esc($header->nm_customer) ?>`

---

### 1.3 SQL Injection — Raw String Interpolation

**File:** `models/Cashflow_project_model.php`  
**Method:** `get_data_spk()`, `get_report_data()`, `get_all_report_data()`

**Masalah:** Meskipun variabel di-cast ke `(int)`, pattern raw interpolation rawan jika developer lain tidak konsisten.

**Contoh yang bermasalah:**
```php
$where_year = " AND YEAR(b.created_date) = {$year}";
```

**Solusi (opsi 1 — query binding):**
```php
$count_sql = "SELECT COUNT(DISTINCT a.id_spk_budgeting) as total
    FROM kons_tr_spk_budgeting a
    INNER JOIN kons_tr_kasbon_project_header b ON b.id_spk_budgeting = a.id_spk_budgeting
    WHERE b.tipe != 1 AND YEAR(b.created_date) = ?";
$records_total = (int) $this->db->query($count_sql, [$year])->row()->total;
```

**Solusi (opsi 2 — minimal, pastikan cast):**
```php
$year = (int) $year; // pastikan selalu ada cast sebelum dipakai
```

---

## 2. TRANSACTION SAFETY (Prioritas Tinggi)

### 2.1 Tidak Ada Database Transaction

**File:** `models/Cashflow_project_model.php`

**Masalah:** Modul ini memang read-only (tidak ada INSERT/UPDATE/DELETE), jadi secara langsung tidak ada risiko data corruption dari write operation.

**NAMUN**, ada risiko **data inconsistency saat read** karena:

1. **Multiple query yang saling bergantung tanpa transaction/locking:**
   - `get_summary_per_tipe()` menjalankan 4 query terpisah (budget, actual_er, actual_dp, pengajuan_terpakai)
   - `get_data_spk()` menjalankan count + data query + N kali `get_spk_budget()` + N kali `get_total_actual_spk()`
   - Antara query pertama dan terakhir, data bisa berubah (misal ada transaksi baru masuk), sehingga angka budget vs realisasi tidak konsisten

2. **Cross-database read tanpa isolation:**
   - Join ke `db_sendigs_ss.payment_approve` — jika ada perubahan status payment di antara query, total bisa tidak match

**Dampak:** Angka di laporan bisa salah/tidak konsisten jika ada transaksi masuk bersamaan saat user sedang melihat report.

**Solusi (jika konsistensi penting):**
```php
public function get_summary_per_tipe($id_spk, $tipe)
{
    $this->db->trans_start(['isolation_level' => 'REPEATABLE READ']); // opsional, tergantung kebutuhan

    // ... semua query di sini ...

    $this->db->trans_complete();
    return $result;
}
```

**Rekomendasi realistis:** Untuk modul reporting seperti ini, risiko inconsistency biasanya acceptable. Tapi jika laporan ini digunakan untuk keputusan keuangan, pertimbangkan minimal `REPEATABLE READ` isolation pada method `get_report_data()` dan `get_all_report_data()`.

---

### 2.2 Tidak Ada Error Handling pada Query Failure

**File:** `models/Cashflow_project_model.php`  
**Method:** Hampir semua method

**Masalah:** Jika query gagal (DB down, timeout, dsb), tidak ada handling. Bisa menghasilkan PHP notice/error yang terekspos ke user.

**Contoh yang bermasalah:**
```php
$actual_er = (float) $this->db->get()->row()->total; // Fatal jika query return false
```

**Solusi:**
```php
$query = $this->db->get();
$actual_er = ($query && $query->num_rows() > 0) ? (float) $query->row()->total : 0;
```

---

### 2.3 Cross-Database Join Hardcoded

**File:** `models/Cashflow_project_model.php`  
**Semua method yang join ke** `db_sendigs_ss.payment_approve`

**Masalah:** Nama database `db_sendigs_ss` di-hardcode. Jika environment berbeda (dev/staging), query akan gagal.

**Solusi:**
```php
// Di constructor atau config
protected $db_sendigs_ss = 'db_sendigs_ss'; // bisa diambil dari config

// Di query
$this->db->join($this->db_sendigs_ss . '.payment_approve pa', 'pa.no_doc = a.id', 'inner');
```

---

## 3. ARSITEKTUR & CLEAN CODE (Prioritas Sedang)

### 3.1 Model Melakukan `echo` Output

**File:** `models/Cashflow_project_model.php`  
**Method:** `get_data_spk()`

**Masalah:** Model seharusnya hanya return data. `echo json_encode()` adalah tanggung jawab controller.

**Solusi:**  
Ubah method di model agar return array, lalu echo di controller:

```php
// Model
public function get_data_spk($year, $start, $length, $search)
{
    // ... query logic ...
    return [
        'draw' => intval($draw),
        'recordsTotal' => $records_total,
        'recordsFiltered' => $records_filtered,
        'data' => $hasil
    ];
}

// Controller
public function get_data_spk()
{
    $this->auth->restrict($this->viewPermission);
    $result = $this->Cashflow_project_model->get_data_spk(
        $this->input->post('year'),
        $this->input->post('start'),
        $this->input->post('length'),
        $this->input->post('search')
    );
    echo json_encode($result);
}
```

---

### 3.2 Export Excel Terlalu Panjang di Controller

**File:** `controllers/Cashflow_project.php`  
**Method:** `export_excel()` (~200 baris)

**Masalah:** Controller berisi detail formatting Excel. Sulit di-maintain dan di-test.

**Solusi:** Pindahkan logic Excel ke library terpisah:
```
application/libraries/Cashflow_excel_export.php
```

Controller cukup:
```php
public function export_excel()
{
    $this->auth->restrict($this->viewPermission);
    $this->load->library('Cashflow_excel_export');
    $year = $this->input->post('year') ?: (int) date('Y');
    $data = $this->Cashflow_project_model->get_all_report_data($year);
    $this->cashflow_excel_export->generate($data, $year);
}
```

---

### 3.3 N+1 Query Problem

**File:** `models/Cashflow_project_model.php`  
**Method:** `get_data_spk()`

**Masalah:** Setiap row SPK memanggil 2 method tambahan:
```php
foreach ($get_data->result() as $item) {
    $total_budget = $this->get_spk_budget($item->id_spk_budgeting);      // +1 query (actually 5 queries!)
    $total_actual = $this->get_total_actual_spk($item->id_spk_budgeting); // +2 queries
}
```
Untuk 10 SPK = 10 × 7 = **70 query tambahan** per page load.

**Solusi:** Gabungkan ke 1 query dengan subquery/JOIN, atau minimal batch-load budget per page.

---

## 4. DEAD CODE & MINOR ISSUES (Prioritas Rendah)

### 4.1 Variabel Global `$status` Tidak Dipakai

**File:** `controllers/Cashflow_project.php`, baris 14

```php
$status = array(); // Hapus baris ini
```

---

### 4.2 Property `$gl` Tidak Dipakai

**File:** `models/Cashflow_project_model.php`

Property `$this->gl` (koneksi ke `gl_sendigs`) di-load di constructor tapi tidak pernah digunakan di method manapun. Hapus atau tambahkan komentar kenapa ada.

---

### 4.3 Permission Variables Tidak Dipakai di View

**File:** `views/index.php`, baris 2

```php
$ENABLE_VIEW = has_permission('Cashflow_Project.View'); // Tidak dipakai di template
```

Hapus jika memang tidak dibutuhkan, atau gunakan untuk conditional rendering.

---

### 4.4 CDN Tanpa Fallback

**File:** `views/index.php` dan `views/view.php`

```html
<link rel="stylesheet" href="https://cdn.datatables.net/2.1.8/css/dataTables.dataTables.min.css">
<script src="https://cdn.datatables.net/2.1.8/js/dataTables.min.js"></script>
```

Sebaiknya gunakan asset lokal dari `assets/adminlte/plugins/` yang sudah tersedia di project.

---

## 5. CHECKLIST PERBAIKAN

| # | Item | Priority | Est. Effort |
|---|------|----------|-------------|
| 1 | Tambah permission check di semua endpoint AJAX | 🔴 High | 10 menit |
| 2 | Escape output di views (XSS) | 🔴 High | 20 menit |
| 3 | Tambah null-check setelah query execution | 🔴 High | 30 menit |
| 4 | Pindahkan `echo` dari model ke controller | 🟡 Medium | 15 menit |
| 5 | Gunakan query binding di raw SQL | 🟡 Medium | 30 menit |
| 6 | Externalize nama database cross-join | 🟡 Medium | 15 menit |
| 7 | Pindahkan logic Excel ke library | 🟡 Medium | 45 menit |
| 8 | Optimasi N+1 query | 🟡 Medium | 1 jam |
| 9 | Hapus dead code | 🟢 Low | 5 menit |
| 10 | Ganti CDN dengan asset lokal | 🟢 Low | 10 menit |
| 11 | Tambah transaction isolation untuk report keuangan | 🟡 Medium | 20 menit |

---

## 6. CATATAN KEAMANAN TRANSAKSI (Query Safety)

### Kesimpulan: **Aman dari data corruption, tapi ada risiko inconsistency**

**Kenapa aman:**
- Modul ini 100% read-only (SELECT saja, tidak ada INSERT/UPDATE/DELETE)
- Tidak ada operasi write yang perlu di-rollback
- Input numerik sudah di-cast ke `(int)`
- Search input menggunakan `escape_like_str()`

**Kenapa masih berisiko:**
- **Race condition pada read:** Jika user A sedang melihat report dan user B approve pembayaran baru di waktu bersamaan, angka di halaman user A bisa tidak konsisten (budget benar tapi realisasi belum terupdate pada query berikutnya)
- **Tidak ada retry logic:** Jika koneksi DB ke `db_sendigs_ss` timeout di tengah-tengah, partial data bisa ditampilkan tanpa indikasi error
- **Query failure silent:** Method tidak membedakan antara "data kosong" dan "query gagal"

**Rekomendasi:**
- Untuk laporan yang dipakai sebagai acuan keuangan/audit, tambahkan timestamp "Data per: [waktu query]" agar user tahu kapan data di-snapshot
- Tambahkan basic error handling agar query failure tidak menampilkan angka 0 yang menyesatkan

---

*Dokumen ini bisa digunakan sebagai pedoman perbaikan. Selesaikan item prioritas 🔴 terlebih dahulu.*
