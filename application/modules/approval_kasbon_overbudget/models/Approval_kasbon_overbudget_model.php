<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/*
 * @author Harboens
 * @copyright Copyright (c) 2020
 *
 * This is model class for table "Budget Rutin"
 */

class Approval_kasbon_overbudget_model extends BF_Model
{
    public function get_data_overbudget()
    {
        $draw = $this->input->post('draw');
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $search = $this->input->post('search');

        $query_get_data = '
            SELECT
                z.id_request_ovb,
                z.id_spk_budgeting,
                z.id_spk_penawaran,
                z.sts,
                z.id_penawaran,
                z.nama_customer,
                z.nominal,
                z.tipe
            FROM (
                    SELECT
                        a.id_request_ovb as id_request_ovb, 
                        a.id_spk_budgeting as id_spk_budgeting,
                        a.id_spk_penawaran as id_spk_penawaran,
                        a.sts as sts,
                        a.id_penawaran as id_penawaran,
                        b.nm_customer as nama_customer,
                        SUM(c.pengajuan_budget) as nominal,
                        "2" as tipe
                    FROM
                        kons_tr_kasbon_req_ovb_akomodasi_header a
                        LEFT JOIN kons_tr_spk_penawaran b ON b.id_spk_penawaran = a.id_spk_penawaran
                        LEFT JOIN kons_tr_kasbon_req_ovb_akomodasi_detail c ON c.id_request_ovb = a.id_request_ovb
                    WHERE
                        a.sts IS NULL AND (
                            a.id_spk_budgeting LIKE "%' . $search['value'] . '%" OR
                            a.id_spk_penawaran LIKE "%' . $search['value'] . '%" OR
                            a.id_penawaran LIKE "%' . $search['value'] . '%" OR
                            b.nm_customer LIKE "%' . $search['value'] . '%"
                        )
                    
                    UNION ALL

                    SELECT
                        a.id_request_ovb as id_request_ovb, 
                        a.id_spk_budgeting as id_spk_budgeting,
                        a.id_spk_penawaran as id_spk_penawaran,
                        a.sts as sts,
                        a.id_penawaran as id_penawaran,
                        b.nm_customer as nama_customer,
                        SUM(c.pengajuan_budget) as nominal,
                        "1" as tipe
                    FROM
                        kons_tr_kasbon_req_ovb_subcont_header a
                        LEFT JOIN kons_tr_spk_penawaran b ON b.id_spk_penawaran = a.id_spk_penawaran
                        LEFT JOIN kons_tr_kasbon_req_ovb_subcont_detail c ON c.id_request_ovb = a.id_request_ovb
                    WHERE
                        a.sts IS NULL AND (
                            a.id_spk_budgeting LIKE "%' . $search['value'] . '%" OR
                            a.id_spk_penawaran LIKE "%' . $search['value'] . '%" OR
                            a.id_penawaran LIKE "%' . $search['value'] . '%" OR
                            b.nm_customer LIKE "%' . $search['value'] . '%"
                        )
                    
                    UNION ALL

                    SELECT
                        a.id_request_ovb as id_request_ovb, 
                        a.id_spk_budgeting as id_spk_budgeting,
                        a.id_spk_penawaran as id_spk_penawaran,
                        a.sts as sts,
                        a.id_penawaran as id_penawaran,
                        b.nm_customer as nama_customer,
                        SUM(c.pengajuan_budget) as nominal,
                        "3" as tipe
                    FROM
                        kons_tr_kasbon_req_ovb_others_header a
                        LEFT JOIN kons_tr_spk_penawaran b ON b.id_spk_penawaran = a.id_spk_penawaran
                        LEFT JOIN kons_tr_kasbon_req_ovb_others_detail c ON c.id_request_ovb = a.id_request_ovb
                    WHERE
                        a.sts IS NULL AND (
                            a.id_spk_budgeting LIKE "%' . $search['value'] . '%" OR
                            a.id_spk_penawaran LIKE "%' . $search['value'] . '%" OR
                            a.id_penawaran LIKE "%' . $search['value'] . '%" OR
                            b.nm_customer LIKE "%' . $search['value'] . '%"
                        )

                    UNION ALL

                    SELECT
                        a.id_request_ovb as id_request_ovb, 
                        a.id_spk_budgeting as id_spk_budgeting,
                        a.id_spk_penawaran as id_spk_penawaran,
                        a.sts as sts,
                        a.id_penawaran as id_penawaran,
                        b.nm_customer as nama_customer,
                        SUM(c.pengajuan_budget) as nominal,
                        "4" as tipe
                    FROM
                        kons_tr_kasbon_req_ovb_lab_header a
                        LEFT JOIN kons_tr_spk_penawaran b ON b.id_spk_penawaran = a.id_spk_penawaran
                        LEFT JOIN kons_tr_kasbon_req_ovb_lab_detail c ON c.id_request_ovb = a.id_request_ovb
                    WHERE
                        a.sts IS NULL AND (
                            a.id_spk_budgeting LIKE "%' . $search['value'] . '%" OR
                            a.id_spk_penawaran LIKE "%' . $search['value'] . '%" OR
                            a.id_penawaran LIKE "%' . $search['value'] . '%" OR
                            b.nm_customer LIKE "%' . $search['value'] . '%"
                        )
            ) z
             WHERE
                z.id_request_ovb IS NOT NULL AND
                z.id_request_ovb <> ""
             GROUP BY z.id_request_ovb
             ORDER BY z.id_request_ovb DESC
             LIMIT ' . $length . ' OFFSET ' . $start;
        $get_data = $this->db->query($query_get_data);

        $query_get_data_all = '
            SELECT
                z.id_request_ovb,
                z.id_spk_budgeting,
                z.id_spk_penawaran,
                z.sts,
                z.id_penawaran,
                z.nama_customer,
                z.nominal,
                z.tipe
            FROM (
                    SELECT
                        a.id_request_ovb as id_request_ovb, 
                        a.id_spk_budgeting as id_spk_budgeting,
                        a.id_spk_penawaran as id_spk_penawaran,
                        a.sts as sts,
                        a.id_penawaran as id_penawaran,
                        b.nm_customer as nama_customer,
                        SUM(c.pengajuan_budget) as nominal,
                        "2" as tipe
                    FROM
                        kons_tr_kasbon_req_ovb_akomodasi_header a
                        LEFT JOIN kons_tr_spk_penawaran b ON b.id_spk_penawaran = a.id_spk_penawaran
                        LEFT JOIN kons_tr_kasbon_req_ovb_akomodasi_detail c ON c.id_request_ovb = a.id_request_ovb
                    WHERE
                        a.sts IS NULL AND (
                            a.id_spk_budgeting LIKE "%' . $search['value'] . '%" OR
                            a.id_spk_penawaran LIKE "%' . $search['value'] . '%" OR
                            a.id_penawaran LIKE "%' . $search['value'] . '%" OR
                            b.nm_customer LIKE "%' . $search['value'] . '%"
                        )
                    
                    UNION ALL

                    SELECT
                        a.id_request_ovb as id_request_ovb, 
                        a.id_spk_budgeting as id_spk_budgeting,
                        a.id_spk_penawaran as id_spk_penawaran,
                        a.sts as sts,
                        a.id_penawaran as id_penawaran,
                        b.nm_customer as nama_customer,
                        SUM(c.pengajuan_budget) as nominal,
                        "1" as tipe
                    FROM
                        kons_tr_kasbon_req_ovb_subcont_header a
                        LEFT JOIN kons_tr_spk_penawaran b ON b.id_spk_penawaran = a.id_spk_penawaran
                        LEFT JOIN kons_tr_kasbon_req_ovb_subcont_detail c ON c.id_request_ovb = a.id_request_ovb
                    WHERE
                        a.sts IS NULL AND (
                            a.id_spk_budgeting LIKE "%' . $search['value'] . '%" OR
                            a.id_spk_penawaran LIKE "%' . $search['value'] . '%" OR
                            a.id_penawaran LIKE "%' . $search['value'] . '%" OR
                            b.nm_customer LIKE "%' . $search['value'] . '%"
                        )

                    UNION ALL

                    SELECT
                        a.id_request_ovb as id_request_ovb, 
                        a.id_spk_budgeting as id_spk_budgeting,
                        a.id_spk_penawaran as id_spk_penawaran,
                        a.sts as sts,
                        a.id_penawaran as id_penawaran,
                        b.nm_customer as nama_customer,
                        SUM(c.pengajuan_budget) as nominal,
                        "4" as tipe
                    FROM
                        kons_tr_kasbon_req_ovb_lab_header a
                        LEFT JOIN kons_tr_spk_penawaran b ON b.id_spk_penawaran = a.id_spk_penawaran
                        LEFT JOIN kons_tr_kasbon_req_ovb_lab_detail c ON c.id_request_ovb = a.id_request_ovb
                    WHERE
                        a.sts IS NULL AND (
                            a.id_spk_budgeting LIKE "%' . $search['value'] . '%" OR
                            a.id_spk_penawaran LIKE "%' . $search['value'] . '%" OR
                            a.id_penawaran LIKE "%' . $search['value'] . '%" OR
                            b.nm_customer LIKE "%' . $search['value'] . '%"
                        )
            ) z
             WHERE
                z.id_request_ovb IS NOT NULL AND
                z.id_request_ovb <> ""
             GROUP BY z.id_request_ovb
             ORDER BY z.id_request_ovb DESC';
        $get_data_all = $this->db->query($query_get_data_all);

        $hasil = array();

        $no = 0;
        foreach ($get_data->result_array() as $item) {
            $no++;

            $view = '<button type"button" class="btn btn-sm btn-info detail" data-id="' . $item['id_request_ovb'] . '" data-tipe="'.$item['tipe'].'" title="View Overbudget"><i class="fa fa-eye"></i></button>';

            $approval = '<button type="button" class="btn btn-sm btn-success approval" data-id="' . $item['id_request_ovb'] . '" data-tipe="' . $item['tipe'] . '" title="Approve Overbudget"><i class="fa fa-check"></i></button>';

            $option = $view . ' ' . $approval;

            $status = '<button type="button" class="btn btn-sm btn-primary">Waiting Approval</button>';
            if ($item['sts'] == 1) {
                $status = '<button type="button" class="btn btn-sm btn-success">Approved</button>';
            }
            if ($item['sts'] == 2) {
                $status = '<button type="button" class="btn btn-sm btn-danger">Rejected</button>';
            }

            $hasil[] = [
                'no' => $no,
                'id_request' => $item['id_request_ovb'],
                'id_spk_budgeting' => $item['id_spk_budgeting'],
                'id_spk_penawaran' => $item['id_spk_penawaran'],
                'id_penawaran' => $item['id_penawaran'],
                'nama_customer' => $item['nama_customer'],
                'nominal' => number_format($item['nominal'], 2),
                'status' => $status,
                'option' => $option
            ];
        }

        echo json_encode([
            'draw' => intval($draw),
            'recordsTotal' => $get_data_all->num_rows(),
            'recordsFiltered' => $get_data_all->num_rows(),
            'data' => $hasil
        ]);
    }
}
