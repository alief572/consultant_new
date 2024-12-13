<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Cashflow_project_model extends BF_Model
{

    public function __construct()
    {
        parent::__construct();

        $this->ENABLE_ADD     = has_permission('Cashflow_Project.Add');
        $this->ENABLE_MANAGE  = has_permission('Cashflow_Project.Manage');
        $this->ENABLE_VIEW    = has_permission('Cashflow_Project.View');
        $this->ENABLE_DELETE  = has_permission('Cashflow_Project.Delete');
    }

    public function get_data_spk()
    {
        $draw = $this->input->post('draw');
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $search = $this->input->post('search');

        $this->db->select('a.*, c.nm_sales');
        $this->db->from('kons_tr_spk_budgeting a');
        $this->db->join('kons_tr_kasbon_project_header b', 'b.id_spk_budgeting = a.id_spk_budgeting', 'left');
        $this->db->join('kons_tr_spk_penawaran c', 'c.id_spk_penawaran = a.id_spk_penawaran', 'left');
        $this->db->where('b.sts', 1);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.id_spk_budgeting', $search['value'], 'both');
            $this->db->or_like('a.nm_customer', $search['value'], 'both');
            $this->db->or_like('c.nm_sales', $search['value'], 'both');
            $this->db->or_like('a.nm_project_leader', $search['value'], 'both');
            $this->db->or_like('a.nm_project', $search['value'], 'both');
            $this->db->group_end();
        }
        $this->db->group_by('a.id_spk_budgeting');
        $this->db->order_by('a.id_spk_budgeting', 'desc');
        $this->db->limit($length, $start);

        $get_data = $this->db->get();

        $this->db->select('a.*, c.nm_sales');
        $this->db->from('kons_tr_spk_budgeting a');
        $this->db->join('kons_tr_kasbon_project_header b', 'b.id_spk_budgeting = a.id_spk_budgeting', 'left');
        $this->db->join('kons_tr_spk_penawaran c', 'c.id_spk_penawaran = a.id_spk_penawaran', 'left');
        $this->db->where('b.sts', 1);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.id_spk_budgeting', $search['value'], 'both');
            $this->db->or_like('a.nm_customer', $search['value'], 'both');
            $this->db->or_like('c.nm_sales', $search['value'], 'both');
            $this->db->or_like('a.nm_project_leader', $search['value'], 'both');
            $this->db->or_like('a.nm_project', $search['value'], 'both');
            $this->db->group_end();
        }
        $this->db->group_by('a.id_spk_budgeting');
        $this->db->order_by('a.id_spk_budgeting', 'desc');

        $get_data_all = $this->db->get();

        $hasil = [];

        $no = 0;
        foreach ($get_data->result() as $item) {
            $no++;

            $option = '<a href="' . base_url('cashflow_project/view_cashflow/' . urlencode(str_replace('/', '|', $item->id_spk_budgeting))) . '" class="btn btn-sm btn-primary" title="View Cashflow"><i class="fa fa-eye"></i></a>';



            $hasil[] = [
                'no' => $no,
                'id_spk_penawaran' => $item->id_spk_penawaran,
                'nm_customer' => $item->nm_customer,
                'nm_sales' => $item->nm_sales,
                'nm_project' => $item->nm_project,
                'option' => $option
            ];
        }

        echo json_encode([
            'draw' => intval($draw),
            'recordsTotal' => $no,
            'recordsFiltered' => $no,
            'data' => $hasil
        ]);
    }
}
