<?php
$labels = [
    'waiting_return'       => 'Menunggu Pengembalian',
    'waiting_verification' => 'Menunggu Verifikasi',
    'completed'            => 'Selesai'
];
$isAdmin = method_exists($this->auth, 'is_admin') && $this->auth->is_admin();
$canSubmit = !$finance && $return['status'] === 'waiting_return' && (has_permission('Expense_Report_Project.Manage') || $isAdmin);
$canVerify = ($finance || $isAdmin) && $return['status'] === 'waiting_verification' && ($isAdmin || (string) $header['created_by'] !== (string) $this->auth->user_id());

$status = $return['status'];
$badgeClass = 'erp-badge-neutral';
if ($status === 'waiting_return') {
    $badgeClass = 'erp-badge-warning';
} elseif ($status === 'waiting_verification') {
    $badgeClass = 'erp-badge-info';
} elseif ($status === 'completed') {
    $badgeClass = 'erp-badge-success';
}
?>

<link rel="stylesheet" href="<?= base_url('assets/css/expense_report_project.css') ?>">

<div class="erp-return-detail">
    <div class="erp-card-header">
        <h4 class="erp-card-title">
            Pengembalian sisa kasbon:
            <span class="text-primary"><?= html_escape($header['id']) ?></span>
        </h4>
        <div>
            <span class="erp-badge <?= $badgeClass ?>" style="font-size: 13px; padding: 5px 12px;">
                <span class="erp-badge-dot"></span>
                <?= html_escape($labels[$status] ?? $status) ?>
            </span>
        </div>
    </div>

    <div class="erp-card-body">
        <?php if (!empty($return['rejection_reason'])): ?>
            <div class="alert alert-warning" style="border-radius: 4px; margin-bottom: 20px;">
                <i class="fa fa-exclamation-triangle"></i> <strong>Catatan Finance:</strong> <?= html_escape($return['rejection_reason']) ?>
            </div>
        <?php endif; ?>

        <!-- Split View Layout -->
        <div class="erp-detail-split">
            <!-- Left Column: Information & History -->
            <div>
                <!-- Metadata Info Card -->
                <div class="erp-card" style="margin-bottom: 15px;">
                    <div class="erp-card-header" style="padding: 10px 14px;">
                        <h5 class="erp-card-title" style="font-size: 13px;"><i class="fa fa-info-circle"></i> Ringkasan Pengembalian</h5>
                    </div>
                    <div class="erp-card-body" style="padding: 14px;">
                        <div class="erp-meta-grid" style="grid-template-columns: 1fr 1fr; gap: 12px; padding: 12px;">
                            <div class="erp-meta-item">
                                <span class="erp-meta-label">Nomor Tiket Kasbon</span>
                                <span class="erp-meta-value highlight"><i class="fa fa-ticket"></i> <?= html_escape($header['id_header']) ?></span>
                            </div>
                            <div class="erp-meta-item">
                                <span class="erp-meta-label">Sisa Wajib Lunas</span>
                                <span class="erp-meta-value erp-return-amount">
                                    Rp <?= number_format($return['amount'], 2) ?>
                                </span>
                            </div>
                            <?php if ($return['bank_id']): ?>
                                <div class="erp-meta-item" style="grid-column: span 2;">
                                    <span class="erp-meta-label">Rekening Perusahaan Tujuan</span>
                                    <span class="erp-meta-value">
                                        <?php 
                                        $bankName = '-';
                                        foreach ($banks as $bank) {
                                            if ((string) $bank['id'] === (string) $return['bank_id']) {
                                                $bankName = $bank['nama_bank'] . ' - ' . $bank['rekening'] . ' (a.n ' . $bank['nama'] . ')';
                                                break;
                                            }
                                        }
                                        echo html_escape($bankName);
                                        ?>
                                    </span>
                                </div>
                                <div class="erp-meta-item">
                                    <span class="erp-meta-label">Tanggal Transfer</span>
                                    <span class="erp-meta-value"><?= html_escape($return['transfer_date'] ?? '-') ?></span>
                                </div>
                                <div class="erp-meta-item">
                                    <span class="erp-meta-label">Waktu Dikirim</span>
                                    <span class="erp-meta-value"><?= html_escape($return['submitted_at'] ?? '-') ?></span>
                                </div>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>

                <!-- History / Timeline Card -->
                <div class="erp-card" style="margin-bottom: 15px;">
                    <div class="erp-card-header" style="padding: 10px 14px;">
                        <h5 class="erp-card-title" style="font-size: 13px;"><i class="fa fa-history"></i> Riwayat Bukti & Verifikasi</h5>
                    </div>
                    <div class="erp-card-body" style="padding: 14px;">
                        <p class="erp-section-description">
                            Bukti aktif adalah unggahan terbaru yang sedang menunggu verifikasi atau sudah disetujui. Bukti pada siklus yang ditolak tersimpan sebagai audit trail.
                        </p>
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped erp-table" style="font-size: 11px;">
                                <thead>
                                    <tr>
                                        <th>Waktu</th>
                                        <th>Aksi</th>
                                        <th>Pengguna</th>
                                        <th>Tgl. Transfer</th>
                                        <th>Catatan / Bukti</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if (!empty($history)): ?>
                                        <?php foreach ($history as $entry): ?>
                                            <tr>
                                                <td><?= html_escape($entry['created_at']) ?></td>
                                                <td>
                                                    <?php
                                                    $act = $entry['action'];
                                                    if ($act === 'submit') {
                                                        echo '<span class="erp-badge erp-badge-info">Upload Bukti</span>';
                                                    } elseif ($act === 'verify') {
                                                        echo '<span class="erp-badge erp-badge-success">Terverifikasi</span>';
                                                    } elseif ($act === 'reject') {
                                                        echo '<span class="erp-badge erp-badge-danger">Ditolak</span>';
                                                    } else {
                                                        echo html_escape($act);
                                                    }
                                                    ?>
                                                </td>
                                                <td><strong><?= html_escape(!empty($entry['nm_lengkap']) ? $entry['nm_lengkap'] : $entry['actor']) ?></strong></td>
                                                <td><?= html_escape($entry['transfer_date'] ?? '-') ?></td>
                                                <td>
                                                    <?= html_escape($entry['note'] ?? '') ?>
                                                    <?php if ($entry['file_path']): ?>
                                                        <div style="margin-top: 4px;">
                                                            <a class="erp-btn erp-btn-sm erp-btn-default" href="<?= site_url('expense_report_project/return_file/' . (int) $entry['id']) ?>" target="_blank" rel="noopener">
                                                                <i class="fa fa-download text-primary"></i> Unduh Bukti
                                                            </a>
                                                        </div>
                                                    <?php endif; ?>
                                                </td>
                                            </tr>
                                        <?php endforeach; ?>
                                    <?php else: ?>
                                        <tr><td colspan="5" class="text-center text-muted">Belum ada riwayat transaksi.</td></tr>
                                    <?php endif; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- Journal Card (if available) -->
                <?php if ($journals): ?>
                    <div class="erp-card">
                        <div class="erp-card-header" style="padding: 10px 14px;">
                            <h5 class="erp-card-title" style="font-size: 13px;">
                                <i class="fa fa-book"></i> 
                                <?= $return['status'] === 'completed' ? 'Jurnal Pengembalian (Posted)' : 'Preview Jurnal Pengembalian (Unposted)' ?>
                            </h5>
                        </div>
                        <div class="erp-card-body" style="padding: 10px;">
                            <div class="table-responsive">
                                <table class="table table-bordered erp-table" style="font-size: 11px;">
                                    <thead>
                                        <tr>
                                            <th>Tanggal</th>
                                            <th>COA</th>
                                            <th>Akun</th>
                                            <th>Company</th>
                                            <th class="text-right">Debit</th>
                                            <th class="text-right">Kredit</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php foreach ($journals as $row): ?>
                                            <tr>
                                                <td><?= html_escape($row['tgl_jurnal']) ?></td>
                                                <td><?= html_escape($row['coa']) ?></td>
                                                <td><?= html_escape($row['nm_coa']) ?></td>
                                                <td><?= html_escape($row['nm_company']) ?></td>
                                                <td class="text-right"><?= number_format($row['debit'], 2) ?></td>
                                                <td class="text-right"><?= number_format($row['kredit'], 2) ?></td>
                                            </tr>
                                        <?php endforeach; ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                <?php endif; ?>
            </div>

            <!-- Right Column: Action Form (Submit or Verify) -->
            <div>
                <?php if ($canSubmit): ?>
                    <div class="erp-card">
                        <div class="erp-card-header" style="padding: 10px 14px;">
                            <h5 class="erp-card-title" style="font-size: 13px;">
                                <i class="fa fa-upload"></i> Form Unggah Bukti Pengembalian
                            </h5>
                        </div>
                        <div class="erp-card-body" style="padding: 16px;">
                            <form id="return-submit-form" enctype="multipart/form-data" method="post" action="<?= site_url('expense_report_project/submit_return') ?>">
                                <input type="hidden" name="expense_id" value="<?= html_escape($header['id']) ?>">
                                <input type="hidden" name="settlement_token" value="<?= html_escape($settlement_token) ?>">
                                
                                <div class="form-group">
                                    <label for="return-bank" class="erp-meta-label" style="font-size: 12px; margin-bottom: 5px;">Rekening Perusahaan Tujuan <span class="text-danger">*</span></label>
                                    <select id="return-bank" name="bank_id" class="form-control erp-input-sm" style="height: 34px;" required>
                                        <option value="">-- Pilih Rekening Bank Tujuan --</option>
                                        <?php foreach ($banks as $bank): ?>
                                            <option value="<?= html_escape($bank['id']) ?>">
                                                <?= html_escape($bank['nama_bank'] . ' - ' . $bank['rekening'] . ' (' . $bank['nama'] . ')') ?>
                                            </option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="return-date" class="erp-meta-label" style="font-size: 12px; margin-bottom: 5px;">Tanggal Transfer <span class="text-danger">*</span></label>
                                    <input id="return-date" type="date" class="form-control erp-input-sm" style="height: 34px;" name="transfer_date" min="<?= html_escape(substr($header['approved_date'], 0, 10)) ?>" max="<?= date('Y-m-d') ?>" required>
                                </div>

                                <div class="form-group">
                                    <label for="return-amount" class="erp-meta-label" style="font-size: 12px; margin-bottom: 5px;">Nominal Pengembalian (Wajib Lunas)</label>
                                    <input id="return-amount" class="form-control erp-input-sm erp-money" name="amount" value="<?= html_escape(number_format((float) str_replace(',', '', $return['amount']), 2)) ?>" readonly>
                                </div>

                                <div class="form-group">
                                    <label for="return-proof" class="erp-meta-label" style="font-size: 12px; margin-bottom: 5px;">File Bukti Transfer (JPG, PNG, PDF; Max 2MB) <span class="text-danger">*</span></label>
                                    <input id="return-proof" type="file" name="return_proof" class="form-control" style="font-size: 12px; height: auto; padding: 6px;" accept=".jpg,.jpeg,.png,.pdf" required>
                                </div>

                                <div style="margin-top: 20px;">
                                    <button class="erp-btn erp-btn-primary" style="width: 100%; height: 38px;" type="submit">
                                        <i class="fa fa-paper-plane"></i> Kirim Bukti Pengembalian
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                <?php endif; ?>

                <?php if ($canVerify): ?>
                    <div class="erp-card">
                        <div class="erp-card-header" style="padding: 10px 14px;">
                            <h5 class="erp-card-title" style="font-size: 13px;">
                                <i class="fa fa-check-square-o"></i> Verifikasi Pengembalian (Finance / Admin)
                            </h5>
                        </div>
                        <div class="erp-card-body" style="padding: 16px;">
                            <form id="return-verify-form" method="post" action="<?= site_url('expense_report_project/verify_return') ?>">
                                <input type="hidden" name="expense_id" value="<?= html_escape($header['id']) ?>">
                                <input type="hidden" name="settlement_token" value="<?= html_escape($settlement_token) ?>">

                                <div style="background: var(--erp-slate-50); border: 1px solid var(--erp-slate-200); border-radius: 4px; padding: 12px; margin-bottom: 16px;">
                                    <span class="erp-meta-label" style="display: block; margin-bottom: 8px;">Checklist Kelayakan Verifikasi</span>
                                    <?php foreach ([
                                        'amount'   => 'Nominal bukti transfer sesuai seluruh sisa kasbon',
                                        'date'     => 'Tanggal transfer pada bukti valid & sesuai',
                                        'received' => 'Dana sudah efektif masuk di rekening koran/mutasi bank'
                                    ] as $key => $label): ?>
                                        <div class="checkbox" style="margin-top: 6px; margin-bottom: 6px;">
                                            <label style="font-size: 12px; color: var(--erp-slate-700);">
                                                <input type="checkbox" name="checks[<?= $key ?>]" value="1"> <?= html_escape($label) ?>
                                            </label>
                                        </div>
                                    <?php endforeach; ?>
                                </div>

                                <div class="form-group">
                                    <label for="return-note" class="erp-meta-label" style="font-size: 12px; margin-bottom: 5px;">Catatan Finance (Wajib jika menolak)</label>
                                    <textarea id="return-note" class="form-control erp-textarea-sm" name="note" rows="3" maxlength="2000" placeholder="Tuliskan catatan verifikasi atau alasan penolakan..."></textarea>
                                </div>

                                <div style="display: flex; gap: 10px; margin-top: 15px;">
                                    <button class="erp-btn erp-btn-success" style="flex: 1; height: 38px;" type="submit" name="decision" value="approve" disabled>
                                        <i class="fa fa-check"></i> Verifikasi & Simpan
                                    </button>
                                    <button class="erp-btn erp-btn-danger" style="flex: 1; height: 38px;" type="submit" name="decision" value="reject">
                                        <i class="fa fa-times"></i> Tolak & Minta Upload Ulang
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                <?php endif; ?>

                <?php if (!$canSubmit && !$canVerify && $return['status'] === 'waiting_verification'): ?>
                    <div class="alert alert-info" style="border-radius: 4px;">
                        <i class="fa fa-hourglass-half"></i> Bukti pengembalian telah berhasil diunggah dan sedang dalam antrean verifikasi oleh tim Finance.
                    </div>
                <?php elseif (!$canSubmit && !$canVerify && $return['status'] === 'completed'): ?>
                    <div class="alert alert-success" style="border-radius: 4px;">
                        <i class="fa fa-check-circle"></i> Seluruh pengembalian sisa kasbon telah selesai diverifikasi dan jurnal telah diposting.
                    </div>
                <?php endif; ?>

                <div id="return-feedback" class="erp-feedback" role="status" aria-live="polite" tabindex="-1"></div>
            </div>
        </div>

        <div style="margin-top: 25px; padding-top: 15px; border-top: 1px solid var(--erp-slate-200);">
            <a class="erp-btn erp-btn-default" href="<?= site_url($finance ? 'expense_report_project/verification' : 'expense_report_project') ?>">
                <i class="fa fa-arrow-left"></i> Kembali ke Daftar
            </a>
        </div>
    </div>
</div>

<script>
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
