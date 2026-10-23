<?php

class Expense_project_flow
{
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
