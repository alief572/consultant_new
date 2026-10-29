<?php

class Expense_project_flow
{
    public static function returnLabels()
    {
        return ['waiting_return' => 'Menunggu Pengembalian', 'waiting_verification' => 'Menunggu Verifikasi', 'completed' => 'Selesai'];
    }

    public static function reportStatus(array $header)
    {
        if (!$header) return ['label' => 'New', 'style' => 'success'];
        if ((string) ($header['sts'] ?? '') === '1') {
            $status = $header['return_status'] ?? '';
            $labels = self::returnLabels();
            return ['label' => $labels[$status] ?? 'Approved',
                'style' => $status === 'waiting_return' ? 'warning' : ($status === 'waiting_verification' ? 'info' : 'success')];
        }
        if ((string) ($header['sts_req'] ?? '') === '1') return ['label' => 'Menunggu Approval', 'style' => 'primary'];
        if ((string) ($header['sts'] ?? '') === '2' || !empty($header['reject_reason'])) return ['label' => 'Ditolak', 'style' => 'danger'];
        return ['label' => 'Draft', 'style' => 'warning'];
    }

    public static function reimbursementPresentation(array $row)
    {
        $status = $row['monitoring_status'];
        if ($status === 'Disetujui') return ['group' => 'approved', 'label' => 'Disetujui', 'style' => 'completed'];
        if ($status === 'Menunggu Approval') return ['group' => 'pending', 'label' => 'Menunggu Approval Pembayaran', 'style' => 'review'];
        if (in_array($status, ['Menunggu Diajukan', 'Terkirim ke Finance'], true)) {
            return ['group' => 'unsubmitted', 'label' => 'Menunggu Diajukan Finance', 'style' => 'waiting'];
        }
        return ['group' => 'unsubmitted', 'label' => $status, 'style' => 'error'];
    }

    public static function cents($value)
    {
        $value = str_replace(',', '', (string) $value);
        if (!preg_match('/^\d{1,12}(?:\.\d{1,2})?$/D', $value)) {
            throw new InvalidArgumentException('Nominal tidak valid.');
        }
        $parts = explode('.', $value);
        return ((int) $parts[0] * 100) + (int) str_pad($parts[1] ?? '', 2, '0');
    }

    public static function amount($cents)
    {
        return sprintf('%d.%02d', intdiv($cents, 100), $cents % 100);
    }

    public static function product($quantity, $price)
    {
        $q = self::cents($quantity);
        $p = self::cents($price);
        if ($q && $p > intdiv(PHP_INT_MAX - 50, $q)) {
            throw new InvalidArgumentException('Nominal melebihi batas.');
        }
        return intdiv($q * $p + 50, 100);
    }

    public static function settlement($advance, $actual)
    {
        return [
            'difference' => $advance - $actual,
            'refund_debit' => max(0, $advance - $actual),
            'receivable_credit' => $advance,
            'payable_credit' => max(0, $actual - $advance)
        ];
    }

    public static function paymentStatus(array $payment)
    {
        if (in_array((string) ($payment['status'] ?? ''), ['1', '2'], true)) {
            return 'Disetujui';
        }
        return empty($payment['no_request']) ? 'Menunggu Diajukan' : 'Menunggu Approval';
    }

    public static function reimbursementStatus(array $row)
    {
        if (!empty($row['payment_id'])) {
            if (in_array((string) ($row['payment_status'] ?? ''), ['1', '2'], true)) {
                return 'Disetujui';
            }
            return empty($row['no_request']) ? 'Menunggu Diajukan' : 'Menunggu Approval';
        }
        if (!empty($row['expense_id'])) {
            return 'Terkirim ke Finance';
        }
        return 'Integrasi Finance perlu diperiksa';
    }
}
