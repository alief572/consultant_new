# 📋 Cara Modul Cashflow Project Track Payment Status

## TL;DR

Modul cashflow_project track payment status dengan 2 metode berbeda tergantung **metode pembayaran**:

| Metode                  | Tabel                                   | Status Field | Nilai "Dibayar" | Tabel Join |
| ----------------------- | --------------------------------------- | ------------ | --------------- | ---------- |
| **Kasbon (ER)**         | `kons_tr_expense_report_project_header` | `sts`        | `1`             | Lokal DB   |
| **Direct Payment (DP)** | `db_sendigs_ss.payment_approve`         | `status`     | `2`             | Cross-DB   |

---

## 1️⃣ DIRECT PAYMENT (DP) — Metode Pembayaran = 2

### Definisi:

Direct Payment = pembayaran langsung tanpa expense report (kasbon dulu).

### Flow:

```
User buat Kasbon (Direct Payment)
    ↓
Data tersimpan di `kons_tr_kasbon_project_header` dengan `metode_pembayaran = 2`
    ↓
User approve payment di modul **Payment Approve** (db_sendigs_ss)
    ↓
Status di-update di `db_sendigs_ss.payment_approve` dengan `status = 2` (Approved)
    ↓
Cashflow_project query ke `payment_approve` → join ke kasbon
    ↓
Hanya kasbon dengan `payment_approve.status = 2` yg dihitung sebagai "DIBAYAR"
```

### Database Structure:

```sql
-- Tabel Kasbon (main database)
Table: kons_tr_kasbon_project_header
├── id (PK)
├── id_spk_budgeting
├── grand_total
├── metode_pembayaran = 2  ← Direct Payment marker
├── created_date
└── ...

-- Tabel Payment Approve (db_sendigs_ss)
Table: payment_approve
├── id (PK)
├── no_doc = kasbon.id  ← FOREIGN KEY (soft join)
├── status = 2          ← APPROVED/DIBAYAR
└── ...
```

### Query di Cashflow Model:

```php
// get_total_actual_spk($id_spk) — count total DP yang sudah dibayar
$this->db->select('IFNULL(SUM(a.grand_total), 0) as total', false);
$this->db->from('kons_tr_kasbon_project_header a');
$this->db->join($this->sendigs_db_name . '.payment_approve pa', 'pa.no_doc = a.id', 'inner');
$this->db->where('a.metode_pembayaran', 2);           // Direct Payment only
$this->db->where('a.id_spk_budgeting', $id_spk);
$this->db->where('a.tipe !=', 1);
$this->db->where('pa.status', 2);                     // APPROVED = DIBAYAR
$query_dp = $this->db->get();
$actual_dp = ($query_dp && $query_dp->num_rows() > 0) ? (float) $query_dp->row()->total : 0;
```

### Status Values di payment_approve:

```
status = 0  → Draft / Pending
status = 1  → Submitted / Waiting Approval
status = 2  → APPROVED ✅ (Dihitung di Cashflow sebagai DIBAYAR)
status = 3  → Rejected
```

### Contoh Logic di View:

```
Jika kasbon dengan metode_pembayaran=2 ada di `payment_approve` dengan status=2
  → Tampilkan di "Total Actual" / "Realisasi"

Jika kasbon dengan metode_pembayaran=2 ada di `payment_approve` dengan status != 2
  → Kasbon BELUM DIBAYAR, tidak masuk realisasi (tapi masuk "Pengajuan Terpakai")
```

---

## 2️⃣ KASBON + EXPENSE REPORT (ER) — Metode Pembayaran = 1

### Definisi:

Kasbon = user ambil uang dulu, terus laporan pengeluaran (expense report).

### Flow:

```
User buat Kasbon (Kasbon ER)
    ↓
Data tersimpan di `kons_tr_kasbon_project_header` dengan `metode_pembayaran = 1`
    ↓
User buat Expense Report & attach ke kasbon
    ↓
Data ER tersimpan di `kons_tr_expense_report_project_header`
    ↓
User/Manager approve ER → `sts = 1` (Approved)
    ↓
Cashflow_project query ER yang sudah approved
    ↓
Hanya kasbon dengan ER.sts = 1 yg dihitung sebagai "DIBAYAR"
```

### Database Structure:

```sql
-- Tabel Kasbon (main database)
Table: kons_tr_kasbon_project_header
├── id (PK)
├── id_spk_budgeting
├── grand_total
├── metode_pembayaran = 1  ← Kasbon+ER marker
└── ...

-- Tabel Expense Report (same database, linked by id_header = kasbon.id)
Table: kons_tr_expense_report_project_header
├── id (PK)
├── id_header = kasbon.id  ← FK
├── total_expense_report   ← Amount disetujui
├── sts = 1                ← APPROVED/DIBAYAR
└── ...
```

### Query di Cashflow Model:

```php
// get_total_actual_spk($id_spk) — count total ER yang sudah approved
$this->db->select('IFNULL(SUM(er.total_expense_report), 0) as total', false);
$this->db->from('kons_tr_kasbon_project_header a');
$this->db->join('kons_tr_expense_report_project_header er', 'er.id_header = a.id', 'inner');
$this->db->where('a.metode_pembayaran', 1);           // Kasbon ER only
$this->db->where('a.id_spk_budgeting', $id_spk);
$this->db->where('a.tipe !=', 1);
$this->db->where('er.sts', 1);                        // APPROVED = DIBAYAR
$query_er = $this->db->get();
$actual_er = ($query_er && $query_er->num_rows() > 0) ? (float) $query_er->row()->total : 0;
```

### Status Values di expense_report_project_header:

```
sts = 0  → Draft
sts = 1  → APPROVED ✅ (Dihitung di Cashflow sebagai DIBAYAR)
sts = -1 → Rejected
```

---

## 3️⃣ KOMBINASI: Cara Cashflow Hitung Total Realisasi

### Pseudocode:

```
TOTAL_ACTUAL =
    SUM(ER yang approved) +
    SUM(DP yang approved)

=
    SUM(kasbon metode=1 + ER.sts=1) +
    SUM(kasbon metode=2 + payment.status=2)
```

### Method: `get_total_actual_spk($id_spk)`

```php
public function get_total_actual_spk($id_spk)
{
    // 1. Sum Kasbon ER yang approved
    $actual_er = 0;
    $this->db->select('IFNULL(SUM(er.total_expense_report), 0) as total', false);
    $this->db->from('kons_tr_kasbon_project_header a');
    $this->db->join('kons_tr_expense_report_project_header er', 'er.id_header = a.id', 'inner');
    $this->db->where('a.metode_pembayaran', 1);
    $this->db->where('a.id_spk_budgeting', $id_spk);
    $this->db->where('a.tipe !=', 1);
    $this->db->where('er.sts', 1);  // ← KEY: Status = 1 = APPROVED
    $query_er = $this->db->get();
    $actual_er = ($query_er && $query_er->num_rows() > 0) ? (float) $query_er->row()->total : 0;

    // 2. Sum Direct Payment yang approved
    $actual_dp = 0;
    $this->db->select('IFNULL(SUM(a.grand_total), 0) as total', false);
    $this->db->from('kons_tr_kasbon_project_header a');
    $this->db->join($this->sendigs_db_name . '.payment_approve pa', 'pa.no_doc = a.id', 'inner');
    $this->db->where('a.metode_pembayaran', 2);
    $this->db->where('a.id_spk_budgeting', $id_spk);
    $this->db->where('a.tipe !=', 1);
    $this->db->where('pa.status', 2);  // ← KEY: Status = 2 = APPROVED
    $query_dp = $this->db->get();
    $actual_dp = ($query_dp && $query_dp->num_rows() > 0) ? (float) $query_dp->row()->total : 0;

    // 3. Return total
    return $actual_er + $actual_dp;  // TOTAL ACTUAL = ER + DP
}
```

---

## 4️⃣ UI/Report Logic

### Di Laporan Cashflow:

```
Budget:            Rp 1,000,000,000   (dari SPK budgeting table)
├─ Total Actual:   Rp 650,000,000     (ER approved + DP approved)
│  ├─ ER Approved: Rp 400,000,000     (kasbon metode=1 + sts=1)
│  └─ DP Approved: Rp 250,000,000     (kasbon metode=2 + status=2)
├─ Pengajuan/Terpakai: Rp 750,000,000 (SUM kasbon grand_total, regardless status)
└─ Sisa Budget:    Rp 250,000,000     (1B - 750M)

Perbedaan Actual vs Terpakai:
- Terpakai = ALL kasbon yang diajukan (status pending/approved/rejected)
- Actual = HANYA kasbon yang sudah APPROVED/DIBAYAR
```

---

## 5️⃣ ISSUE: Gimana Tau Kasbon Belum Dibayar?

### Scenario:

```
User buat Kasbon Direct Payment
    ↓
Entry di kons_tr_kasbon_project_header (metode=2)
    ↓
Entry di payment_approve (status=0 atau belum ada)  ← BELUM DIBAYAR
    ↓
Cashflow modul join dengan payment_approve status=2
    ↓
INNER JOIN → kasbon ini TIDAK MUNCUL (karena status != 2)
    ↓
Dia dihitung di "Pengajuan Terpakai" (SUM grand_total)
    tapi TIDAK di "Total Actual" (hanya approved)
```

### SQL Query yang Track "BELUM DIBAYAR":

```sql
-- Kasbon yang pending (belum dibayar)
SELECT a.*
FROM kons_tr_kasbon_project_header a
LEFT JOIN db_sendigs_ss.payment_approve pa ON pa.no_doc = a.id
WHERE a.metode_pembayaran = 2
  AND a.id_spk_budgeting = 'SPK-XXX'
  AND (pa.status IS NULL OR pa.status != 2)  -- ← PENDING

-- Kasbon yang sudah dibayar
SELECT a.*
FROM kons_tr_kasbon_project_header a
INNER JOIN db_sendigs_ss.payment_approve pa ON pa.no_doc = a.id
WHERE a.metode_pembayaran = 2
  AND a.id_spk_budgeting = 'SPK-XXX'
  AND pa.status = 2  -- ← APPROVED/DIBAYAR
```

---

## 6️⃣ Status Reference Table

### Direct Payment Status Flow:

```
payment_approve.status
0 → Draft          (User belum submit)
1 → Submitted      (Waiting approval)
2 → APPROVED ✅    (Dibayar, masuk Actual)
3 → REJECTED       (Ditolak, tidak masuk Actual)
```

### Kasbon ER Status Flow:

```
kons_tr_expense_report_project_header.sts
0  → Draft         (User sedang input)
1  → APPROVED ✅   (Dibayar, masuk Actual)
-1 → REJECTED      (Ditolak, tidak masuk Actual)
```

---

## 7️⃣ Kesimpulan

**Direct Payment (DP)** sudah dibayar jika:

- ✅ `kons_tr_kasbon_project_header.metode_pembayaran = 2`
- ✅ Ada entry di `db_sendigs_ss.payment_approve` dengan `no_doc = kasbon.id`
- ✅ `payment_approve.status = 2` (APPROVED)

**Kasbon ER** sudah dibayar jika:

- ✅ `kons_tr_kasbon_project_header.metode_pembayaran = 1`
- ✅ Ada entry di `kons_tr_expense_report_project_header` dengan `id_header = kasbon.id`
- ✅ `kons_tr_expense_report_project_header.sts = 1` (APPROVED)

Modul cashflow_project **hanya menghitung approved payment sebagai "Realisasi"** (Total Actual). Kasbon yang belum approved masuk di "Pengajuan/Terpakai" tapi tidak di "Actual".

---

## 🔗 Related Code Files

- **Model Method:** `Cashflow_project_model.php`
  - `get_total_actual_spk($id_spk)` — hitung total actual (both ER + DP)
  - `get_summary_per_tipe($id_spk, $tipe)` — summary per expense type
  - `get_transactions_by_tipe()` — detail transaction list per tipe

- **Database Config:** `database.php`
  - `$db['sendigs_finance']` → koneksi ke db_sendigs_ss (payment_approve)

- **Payment Approval Module:** (external, di modul payment/approval)
  - Handles status update di `payment_approve.status`

---

**Last Updated:** 13 Agustus 2026  
**Module:** cashflow_project  
**Status:** DOCUMENTED
