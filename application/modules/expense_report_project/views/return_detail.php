<?php
$labels = [
    'waiting_return'       => 'Menunggu Pengembalian',
    'waiting_verification' => 'Menunggu Verifikasi',
    'completed'            => 'Selesai'
];
$isAdmin = method_exists($this->auth, 'is_admin') && $this->auth->is_admin();
$canSubmit = (!$finance || $isAdmin) && $return['status'] === 'waiting_return' && (has_permission('Expense_Report_Project.Manage') || $isAdmin);
$canVerify = ($finance || $isAdmin) && $return['status'] === 'waiting_verification' && ($isAdmin || (string) $header['created_by'] !== (string) $this->auth->user_id());

$status = $return['status'];
$badgeClass = ['waiting_return' => 'bd-pend', 'waiting_verification' => 'bd-ver', 'completed' => 'bd-ok'][$status] ?? 'bd-draft';
$amountNumber = (float) str_replace(',', '', $return['amount']);
$spkNumber = $spk_no ?? '-';
$companyName = $company_name ?? '-';
$requesterName = $requester ?? '-';
$bankLabel = '-';
foreach ($banks as $bankRow) {
    if ((string) $bankRow['id'] === (string) ($return['bank_id'] ?? '')) {
        $bankLabel = $bankRow['nama_bank'] . ' - ' . $bankRow['rekening'] . ' (a.n ' . $bankRow['nama'] . ')';
        break;
    }
}
$backUrl = site_url($finance ? 'expense_report_project/verification' : 'expense_report_project');
$bankCoa = [];
foreach ($banks as $bankRow) {
    $bankCoa[$bankRow['id']] = ['coa' => $bankRow['coa_bank'] ?? '-', 'name' => $bankRow['nama_bank'] . ' - ' . $bankRow['rekening']];
}
?>
<link rel="stylesheet" href="<?= base_url('assets/css/expense_report_project.css') ?>">
<link rel="stylesheet" href="<?= base_url('assets/css/erp_mock.css') ?>">

<div class="mk erp-return-detail">
<?php if (!empty($return['rejection_reason'])): ?>
    <div class="banner-red"><i class="fa fa-exclamation-triangle"></i><div><b>Bukti sebelumnya ditolak Finance.</b> Catatan: <?= html_escape($return['rejection_reason']) ?>. Silakan upload ulang bukti yang sesuai.</div></div>
<?php endif; ?>

<?php if (!$canVerify): ?>
<div class="card">
    <div class="card-h"><span><i class="fa fa-info-circle"></i> Informasi Laporan</span><span class="bd <?= $badgeClass ?>"><?= html_escape($labels[$status] ?? $status) ?></span></div>
    <div class="fgrid">
        <div class="fg"><label>No. Expense</label><input class="in" readonly value="<?= html_escape($header['id']) ?>"></div>
        <div class="fg"><label>Nomor SPK</label><input class="in" readonly value="<?= html_escape($spkNumber) ?>"></div>
        <div class="fg"><label>No. Kasbon</label><div style="padding-top: 4px;"><span class="pill"><i class="fa fa-tag"></i> <?= html_escape($header['id_header']) ?></span></div></div>
        <div class="fg"><label>Total Kasbon</label><input class="in" readonly style="text-align: right;" value="<?= number_format((float) str_replace(',', '', $header['total_kasbon'] ?? 0), 2) ?>"></div>
        <div class="fg"><label>Total Realisasi</label><input class="in" readonly style="text-align: right;" value="<?= number_format((float) str_replace(',', '', $header['total_expense_report'] ?? 0), 2) ?>"></div>
        <div class="fg"><label>Harus Dikembalikan</label><input class="in erp-return-amount" readonly style="text-align: right; font-weight: 700; color: #12874a;" value="<?= number_format($amountNumber, 2) ?>"></div>
    </div>
</div>
<?php endif; ?>

<?php if ($canSubmit): ?>
<form id="return-submit-form" enctype="multipart/form-data" method="post" action="<?= site_url('expense_report_project/submit_return') ?>">
    <input type="hidden" name="expense_id" value="<?= html_escape($header['id']) ?>">
    <input type="hidden" name="settlement_token" value="<?= html_escape($settlement_token) ?>">
    <div class="card">
        <div class="card-h"><span><i class="fa fa-undo"></i> Pengembalian Kelebihan Kasbon (Transfer ke Rekening Perusahaan)</span></div>
        <div class="fgrid">
            <div class="fg">
                <label for="return-bank">Bank Pengembalian (Tujuan Transfer) <span class="rq">*</span></label>
                <select id="return-bank" name="bank_id" class="in" required>
                    <option value="">- Pilih Bank -</option>
                    <?php foreach ($banks as $bank): ?>
                        <option value="<?= html_escape($bank['id']) ?>"><?= html_escape($bank['nama_bank'] . ' - ' . $bank['rekening'] . ' (' . $bank['nama'] . ')') ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="fg">
                <label for="return-date">Tanggal Transfer <span class="rq">*</span></label>
                <input id="return-date" type="date" class="in" name="transfer_date" min="<?= html_escape(substr($header['approved_date'], 0, 10)) ?>" max="<?= date('Y-m-d') ?>" required>
            </div>
            <div class="fg">
                <label for="return-amount">Nominal Transfer</label>
                <input id="return-amount" class="in erp-money" name="amount" style="text-align: right; font-weight: 700;" value="<?= html_escape(number_format($amountNumber, 2)) ?>" readonly>
                <div class="hint">Harus sama dengan jumlah yang harus dikembalikan.</div>
            </div>
        </div>
        <div class="fg">
            <label for="return-proof">Upload Bukti Transfer Balik <span class="rq">*</span></label>
            <input id="return-proof" type="file" name="return_proof" class="in" style="max-width: 360px; height: auto;" accept=".jpg,.jpeg,.png,.pdf" required>
            <div class="hint">JPG, PNG, PDF (Max 2MB)</div>
        </div>
    </div>

    <div class="card">
        <div class="card-h"><span><i class="fa fa-book"></i> Preview Jurnal Pengembalian Kasbon <span class="bd bd-draft" style="margin-left: 6px;">Draft: disimpan setelah verifikasi Finance</span></span></div>
        <div class="tw">
            <table class="jt" id="return-preview-table">
                <thead><tr><th>Tanggal Jurnal</th><th>COA</th><th>Nama Company</th><th>Nama Account</th><th>Deskripsi</th><th>Debit (Rp)</th><th>Kredit (Rp)</th></tr></thead>
                <tbody id="return-preview-body"></tbody>
                <tfoot><tr class="tt"><td colspan="5" style="text-align: center;">Total Balancing Jurnal</td><td class="r"><?= number_format($amountNumber, 2) ?></td><td class="r"><?= number_format($amountNumber, 2) ?></td></tr></tfoot>
            </table>
        </div>
    </div>

    <div class="btn-row" style="margin-bottom: 16px; justify-content: space-between;">
        <a class="mkb b-out" href="<?= $backUrl ?>"><i class="fa fa-angle-left"></i> Kembali</a>
        <button class="mkb b-green" type="submit"><i class="fa fa-paper-plane"></i> Kirim Bukti Transfer</button>
    </div>
</form>
<?php else: ?>

<?php if ($canVerify): ?>
<form id="return-verify-form" method="post" action="<?= site_url('expense_report_project/verify_return') ?>">
    <input type="hidden" name="expense_id" value="<?= html_escape($header['id']) ?>">
    <input type="hidden" name="settlement_token" value="<?= html_escape($settlement_token) ?>">
<?php endif; ?>

<?php if (!empty($return['bank_id'])): ?>
<div class="fgrid" style="grid-template-columns: 1fr 1fr; align-items: start;">
    <div class="card">
        <div class="card-h"><span><i class="fa fa-info-circle"></i> Bukti dari Pemohon</span></div>
        <div class="kv">
            <span>Pemohon</span><span><?= html_escape($requesterName) ?></span>
            <span>Nomor SPK</span><span><?= html_escape($spkNumber) ?></span>
            <span>No. Kasbon</span><span><span class="pill"><i class="fa fa-tag"></i> <?= html_escape($header['id_header']) ?></span></span>
            <span>Bank tujuan</span><span><?= html_escape($bankLabel) ?></span>
            <span>Tanggal transfer</span><span><?= html_escape($return['transfer_date'] ?? '-') ?></span>
            <span>Waktu dikirim</span><span><?= html_escape($return['submitted_at'] ?? '-') ?></span>
            <span>Nominal</span><span><b>Rp <?= number_format($amountNumber) ?></b></span>
        </div>
        <?php foreach ($history as $entry): if (($entry['action'] ?? '') === 'submit' && !empty($entry['file_path'])): ?>
            <div style="margin-top: 8px;"><span class="chip"><a href="<?= site_url('expense_report_project/return_file/' . (int) $entry['id']) ?>" target="_blank" rel="noopener"><i class="fa fa-folder-o"></i> Unduh Bukti (<?= html_escape($entry['created_at']) ?>)</a></span></div>
        <?php endif; endforeach; ?>
    </div>

    <?php if ($canVerify): ?>
    <div class="card">
        <div class="card-h"><span><i class="fa fa-bank"></i> Pencocokan Mutasi Rekening</span></div>
        <?php
        $mutasiNama = '';
        foreach ($history as $historyRow) {
            if (($historyRow['action'] ?? '') === 'submit') { $mutasiNama = $historyRow['nm_lengkap'] ?? ''; break; }
        }
        ?>
        <div class="tw">
            <table class="dt" id="return-mutation-table" style="min-width: 0;">
                <thead><tr><th>Tanggal</th><th>Rekening</th><th>Keterangan</th><th style="text-align: right;">Kredit</th></tr></thead>
                <tbody><tr>
                    <td><?= html_escape($return['transfer_date'] ?? '-') ?></td>
                    <td><?= html_escape($bankLabel) ?></td>
                    <td><?= html_escape('TRF masuk ' . $mutasiNama) ?></td>
                    <td class="num"><?= number_format($amountNumber) ?></td>
                </tr></tbody>
            </table>
        </div>
        <div class="card-h" style="margin: 14px 0 4px;"><span>Checklist verifikasi</span></div>
        <?php foreach ([
            'amount'   => 'Nominal bukti transfer sama dengan piutang (Rp ' . number_format($amountNumber) . ')',
            'date'     => 'Tanggal transfer sesuai dengan yang diinput user',
            'received' => 'Dana sudah masuk di mutasi rekening bank'
        ] as $key => $label): ?>
            <label class="chk"><input type="checkbox" name="checks[<?= $key ?>]" value="1"> <span><?= html_escape($label) ?></span></label>
        <?php endforeach; ?>
        <div class="fg" style="margin-top: 8px;">
            <label for="return-note">Catatan Finance (wajib jika ditolak)</label>
            <textarea id="return-note" class="in" name="note" rows="3" maxlength="2000" placeholder="Contoh: nominal pada bukti tidak sesuai mutasi..."></textarea>
        </div>
        <p class="hint">Baris mutasi di atas dibentuk dari data yang dikirim pemohon. Cocokkan dengan mutasi rekening bank; pencocokan otomatis dengan Mutasi Bank belum tersedia.</p>
    </div>
    <?php else: ?>
    <div class="card">
        <div class="card-h"><span><i class="fa fa-check-circle"></i> Status Verifikasi</span></div>
        <?php if ($status === 'waiting_verification'): ?>
            <p><i class="fa fa-hourglass-half"></i> Bukti pengembalian telah berhasil diunggah dan sedang dalam antrean verifikasi oleh tim Finance.</p>
        <?php elseif ($status === 'completed'): ?>
            <p><i class="fa fa-check-circle" style="color: #17a85a;"></i> Seluruh pengembalian sisa kasbon telah selesai diverifikasi dan jurnal telah diposting.</p>
        <?php else: ?>
            <p>Menunggu pemohon mengunggah bukti pengembalian.</p>
        <?php endif; ?>
    </div>
    <?php endif; ?>
</div>
<?php elseif ($status === 'waiting_return'): ?>
<div class="card"><p>Menunggu pemohon mengunggah bukti pengembalian.</p></div>
<?php endif; ?>

<?php if ($journals): ?>
<div class="card">
    <div class="card-h"><span><i class="fa fa-book"></i> Preview Jurnal Pengembalian Kasbon <span class="bd <?= $return['status'] === 'completed' ? 'bd-ok' : 'bd-draft' ?>" style="margin-left: 6px;"><?= $return['status'] === 'completed' ? 'Posted' : 'Draft: disimpan saat diverifikasi' ?></span></span></div>
    <div class="tw">
        <table class="jt">
            <thead><tr><th>Tanggal Jurnal</th><th>COA</th><th>Nama Company</th><th>Nama Account</th><th>Deskripsi</th><th>Debit (Rp)</th><th>Kredit (Rp)</th></tr></thead>
            <tbody>
            <?php $jDebit = 0; $jKredit = 0; foreach ($journals as $row): $jDebit += (float) $row['debit']; $jKredit += (float) $row['kredit']; ?>
                <tr class="<?= (float) $row['debit'] > 0 ? 'g' : '' ?>">
                    <td style="text-align: center;"><?= html_escape($row['tgl_jurnal']) ?></td>
                    <td style="text-align: center;"><?= html_escape($row['coa']) ?></td>
                    <td style="text-align: center;"><?= html_escape($row['nm_company']) ?></td>
                    <td><?= html_escape($row['nm_coa']) ?></td>
                    <td><?= html_escape($row['nm_coa'] . ' - ' . $header['id'] . ' - ' . $header['id_header']) ?></td>
                    <td class="r"><?= number_format($row['debit'], 2) ?></td>
                    <td class="r"><?= number_format($row['kredit'], 2) ?></td>
                </tr>
            <?php endforeach; ?>
                <tr class="tt"><td colspan="5" style="text-align: center;">Total Balancing Jurnal</td><td class="r"><?= number_format($jDebit, 2) ?></td><td class="r"><?= number_format($jKredit, 2) ?></td></tr>
            </tbody>
        </table>
    </div>
</div>
<?php endif; ?>

<?php if ($canVerify): ?>
    <div class="btn-row" style="margin-bottom: 16px;">
        <button class="mkb b-green" type="submit" name="decision" value="approve" disabled><i class="fa fa-check"></i> Verifikasi &amp; Simpan Jurnal</button>
        <button class="mkb b-outred" type="submit" name="decision" value="reject"><i class="fa fa-times"></i> Tolak, Minta Upload Ulang</button>
        <a class="mkb b-out" href="<?= $backUrl ?>"><i class="fa fa-angle-left"></i> Kembali</a>
    </div>
</form>
<?php endif; ?>

<?php if (!$canVerify): ?>
    <div class="btn-row" style="margin-bottom: 16px;"><a class="mkb b-out" href="<?= $backUrl ?>"><i class="fa fa-angle-left"></i> Kembali ke Daftar</a></div>
<?php endif; ?>
<?php endif; ?>

<div class="card">
    <div class="card-h"><span><i class="fa fa-history"></i> Riwayat Bukti &amp; Verifikasi</span></div>
    <p class="hint" style="margin: -6px 0 10px;">Bukti aktif adalah unggahan terbaru yang sedang menunggu verifikasi atau sudah disetujui. Bukti pada siklus yang ditolak tersimpan sebagai audit trail.</p>
    <div class="tw">
        <table class="dt" style="min-width: 0;">
            <thead><tr><th>Waktu</th><th>Aksi</th><th>Pengguna</th><th>Tgl. Transfer</th><th>Catatan / Bukti</th></tr></thead>
            <tbody>
            <?php if (!empty($history)): foreach ($history as $entry): ?>
                <tr>
                    <td><?= html_escape($entry['created_at']) ?></td>
                    <td><?php
                        $act = $entry['action'];
                        if ($act === 'submit') { echo '<span class="bd bd-ver">Upload Bukti</span>'; }
                        elseif ($act === 'verify') { echo '<span class="bd bd-ok">Terverifikasi</span>'; }
                        elseif ($act === 'reject') { echo '<span class="bd bd-rej">Ditolak</span>'; }
                        else { echo html_escape($act); }
                    ?></td>
                    <td><b><?= html_escape(!empty($entry['nm_lengkap']) ? $entry['nm_lengkap'] : $entry['actor']) ?></b></td>
                    <td><?= html_escape($entry['transfer_date'] ?? '-') ?></td>
                    <td><?= html_escape($entry['note'] ?? '') ?>
                        <?php if (!empty($entry['file_path'])): ?>
                            <div style="margin-top: 4px;"><span class="chip"><a href="<?= site_url('expense_report_project/return_file/' . (int) $entry['id']) ?>" target="_blank" rel="noopener"><i class="fa fa-download"></i> Unduh Bukti</a></span></div>
                        <?php endif; ?>
                    </td>
                </tr>
            <?php endforeach; else: ?>
                <tr><td colspan="5" class="empty">Belum ada riwayat transaksi.</td></tr>
            <?php endif; ?>
            </tbody>
        </table>
    </div>
</div>

<div id="return-feedback" class="erp-feedback" role="status" aria-live="polite" tabindex="-1"></div>
</div>

<script>
var returnBanks = <?= json_encode($bankCoa) ?>;
var returnPreview = {amount: <?= json_encode(number_format($amountNumber, 2)) ?>, company: <?= json_encode($companyName) ?>, kasbon: <?= json_encode($header['id_header']) ?>, today: <?= json_encode(date('d F Y')) ?>};
function renderReturnPreview() {
    var body = document.getElementById('return-preview-body');
    if (!body) { return; }
    var bank = returnBanks[$('#return-bank').val()];
    var esc = function (v) { return $('<div>').text(v).html(); };
    body.innerHTML =
        '<tr class="g"><td style="text-align:center">' + esc(returnPreview.today) + '</td><td style="text-align:center">' + esc(bank ? bank.coa : '-') + '</td><td style="text-align:center">' + esc(returnPreview.company) + '</td><td>' + esc(bank ? bank.name : '(pilih bank)') + '</td><td>Pengembalian Kelebihan Kasbon ' + esc(returnPreview.kasbon) + '</td><td class="r">' + esc(returnPreview.amount) + '</td><td class="r">0.00</td></tr>' +
        '<tr><td style="text-align:center">' + esc(returnPreview.today) + '</td><td style="text-align:center">1103-01-15</td><td style="text-align:center">' + esc(returnPreview.company) + '</td><td>Piutang Kelebihan Kasbon</td><td>Pelunasan Piutang Kelebihan Kasbon (' + esc(returnPreview.kasbon) + ')</td><td class="r">0.00</td><td class="r">' + esc(returnPreview.amount) + '</td></tr>';
}
$('#return-bank').on('change', renderReturnPreview);
renderReturnPreview();

$('#return-verify-form input[type="checkbox"]').on('change', function () {
    $('#return-verify-form button[value="approve"]').prop('disabled', $('#return-verify-form input[type="checkbox"]:checked').length !== 3);
});

$('#return-verify-form button[type="submit"]').on('click', function () {
    $(this.form).data('decision', this.value);
});

$('#return-submit-form, #return-verify-form').on('submit', function (event) {
    event.preventDefault();
    var form = this;
    var submitter = event.originalEvent && event.originalEvent.submitter;
    var data = new FormData(form);
    if (submitter) data.set(submitter.name, submitter.value);
    else if ($(form).data('decision')) data.set('decision', $(form).data('decision'));
    var feedback = $('#return-feedback');
    var succeeded = false;
    if (data.get('decision') === 'reject' && !String(data.get('note')).trim()) {
        feedback.attr('data-kind', 'error').text('Alasan penolakan wajib diisi.');
        $('#return-note').trigger('focus');
        return;
    }
    $(form).attr('aria-busy', 'true').find('button').each(function () {
        $(this).data('idleLabel', $(this).text()).prop('disabled', true);
    });
    if (submitter) $(submitter).text('Memproses...');
    feedback.removeAttr('data-kind').text('Menyimpan pengembalian kasbon...');
    $.ajax({url: form.action, type: 'POST', data: data, processData: false, contentType: false, dataType: 'json'})
        .done(function (result) {
            if (result.status === 1) {
                succeeded = true;
                feedback.attr('data-kind', 'success').text(result.pesan);
                setTimeout(function() { window.location.reload(); }, 1000);
            } else {
                feedback.attr('data-kind', 'error').text(result.pesan || 'Data belum tersimpan. Periksa isian lalu coba lagi.').trigger('focus');
            }
        }).fail(function () {
            feedback.attr('data-kind', 'error').text('Data belum tersimpan. Periksa koneksi lalu coba lagi.').trigger('focus');
        })
        .always(function () {
            $(form).attr('aria-busy', 'false');
            if (!succeeded) {
                $(form).find('button').each(function () { $(this).text($(this).data('idleLabel')).prop('disabled', false); });
                $('#return-verify-form input[type="checkbox"]').first().trigger('change');
            }
        });
});
</script>
