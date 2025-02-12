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

        $this->db->select('a.id_request_ovb, a.id_spk_budgeting, a.id_spk_penawaran, a.sts, a.id_penawaran, b.nm_customer as nama_customer, SUM(c.pengajuan_budget) as nominal');
        $this->db->from('kons_tr_kasbon_req_ovb_akomodasi_header a');
        $this->db->join('kons_tr_spk_penawaran b', 'b.id_spk_penawaran = a.id_spk_penawaran');
        $this->db->join('kons_tr_kasbon_req_ovb_akomodasi_detail c', 'c.id_request_ovb = a.id_request_ovb');
        $this->db->where('a.sts', null);
        $this->db->or_where('a.sts', 2);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.id_spk_budgeting', $search['value'], 'both');
            $this->db->or_like('a.id_spk_penawaran', $search['value'], 'both');
            $this->db->or_like('a.id_penawaran', $search['value'], 'both');
            $this->db->or_like('b.nm_customer', $search['value'], 'both');
            $this->db->group_end();
        }
        $this->db->group_by('a.id_request_ovb');
        $this->db->order_by('a.id_request_ovb', 'desc');
        $this->db->limit($length, $start);

        $get_data = $this->db->get();

        $this->db->select('a.id_request_ovb, a.id_spk_budgeting, a.id_spk_penawaran, a.sts, a.id_penawaran, b.nm_customer as nama_customer, SUM(c.pengajuan_budget) as nominal');
        $this->db->from('kons_tr_kasbon_req_ovb_akomodasi_header a');
        $this->db->join('kons_tr_spk_penawaran b', 'b.id_spk_penawaran = a.id_spk_penawaran');
        $this->db->join('kons_tr_kasbon_req_ovb_akomodasi_detail c', 'c.id_request_ovb = a.id_request_ovb');
        $this->db->where('a.sts', null);
        $this->db->or_where('a.sts', 2);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.id_spk_budgeting', $search['value'], 'both');
            $this->db->or_like('a.id_spk_penawaran', $search['value'], 'both');
            $this->db->or_like('a.id_penawaran', $search['value'], 'both');
            $this->db->or_like('b.nm_customer', $search['value'], 'both');
            $this->db->group_end();
        }
        $this->db->group_by('a.id_request_ovb');
        $this->db->order_by('a.id_request_ovb', 'desc');

        $get_data_all = $this->db->get();

        $hasil = array();

        $no = 0;
        foreach ($get_data->result_array() as $item) {
            $no++;

            $view = '<button type"button" class="btn btn-sm btn-info detail" data-id="' . $item['id_request_ovb'] . '" data-tipe="2" title="View Overbudget"><i class="fa fa-eye"></i></button>';

            $approval = '<button type="button" class="btn btn-sm btn-success approval" data-id="' . $item['id_request_ovb'] . '" data-tipe="2" title="Approve Overbudget"><i class="fa fa-check"></i></button>';

            $option = $view . ' ' . $approval;

            $status = '<button type="button" class="btn btn-sm btn-primary">Waiting Approval</button>';
            if($item['sts'] == 1) {
                $status = '<button type="button" class="btn btn-sm btn-success">Approved</button>';
            }
            if($item['sts'] == 2) {
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
