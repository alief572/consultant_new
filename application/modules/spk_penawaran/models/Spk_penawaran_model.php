<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Spk_penawaran_model extends BF_Model
{

    protected $ENABLE_ADD;
    protected $ENABLE_MANAGE;
    protected $ENABLE_VIEW;
    protected $ENABLE_DELETE;

    protected $dbhr;

    public function __construct()
    {
        parent::__construct();

        $this->ENABLE_ADD     = has_permission('SPK_penawaran.Add');
        $this->ENABLE_MANAGE  = has_permission('SPK_penawaran.Manage');
        $this->ENABLE_VIEW    = has_permission('SPK_penawaran.View');
        $this->ENABLE_DELETE  = has_permission('SPK_penawaran.Delete');

        $this->dbhr = $this->load->database('dbhr', true);
    }

    function generate_id_spk_penawaran()
    {
        $Ym             = date('ym');
        $srcMtr            = "SELECT MAX(id_spk_penawaran) as maxP FROM kons_tr_spk_penawaran WHERE id_spk_penawaran LIKE '%/" . date('y') . "%' ";
        $resultMtr        = $this->db->query($srcMtr)->result_array();
        $angkaUrut2        = $resultMtr[0]['maxP'];
        $urutan2        = (int)substr($angkaUrut2, 0, 3);
        $urutan2++;
        $urut2            = sprintf('%03s', $urutan2);
        $kode_trans        = $urut2 . '/STM/MKT-SPK/' . int_to_roman(date('m')) . '/' . date('y');

        return $kode_trans;
    }

    function generate_id_spk_penawaran_non_kons()
    {
        $Ym             = date('ym');
        $srcMtr            = "SELECT MAX(id_spk_penawaran) as maxP FROM kons_tr_spk_non_kons WHERE id_spk_penawaran LIKE '%/" . date('y') . "%' ";
        $resultMtr        = $this->db->query($srcMtr)->result_array();
        $angkaUrut2        = $resultMtr[0]['maxP'];
        $urutan2        = (int)substr($angkaUrut2, 11, 3);
        $urutan2++;
        $urut2            = sprintf('%03s', $urutan2);
        $kode_trans        = $urut2 . '/STM-NON-KONS/MKT-SPK/' . int_to_roman(date('m')) . '/' . date('y');

        return $kode_trans;
    }

    public function render_status_spk($item)
    {
        $approval_position = '';
        $approval_position_arr = [];
        if ($item->approval_sales_sts == null) {
            $approval_position_arr[] = 'Sales';
        }
        if ($item->approval_sales_sts !== null && $item->approval_konsultan_1_sts == null && $item->id_konsultan_1 !== '') {
            $approval_position_arr[] = 'Konsultan 1';
        }
        if ($item->approval_sales_sts !== null && $item->approval_konsultan_2_sts == null && $item->id_konsultan_2 !== '') {
            $approval_position_arr[] = 'Konsultan 2';
        }

        if (empty($approval_position_arr) && $item->approval_level2_sts == null) {
            $approval_position = 'Direktur';
        }
        if (empty($approval_position_arr) && $item->approval_manager_sales == null) {
            $approval_position = 'Manager Sales';
        }
        if (empty($approval_position_arr) && $item->approval_project_leader_sts == null) {
            $approval_position = 'Project Leader';
        }

        $status_spk = '';

        if (!empty($approval_position_arr)) {
            $status_spk = '<span class="badge bg-blue">Waiting Approval : ' . implode(' & ', $approval_position_arr) . '</span>';
        }
        if (!empty($approval_position)) {
            $status_spk = '<span class="badge bg-blue">Waiting Approval : ' . $approval_position . '</span>';
        }

        if ($item->sts_spk == '1') {
            $status_spk = '<span class="badge bg-green">Approved</span>';
        }
        if ($item->sts_spk == '0') {
            $status_spk = '<span class="badge bg-red">Rejected</span>';
        }

        if ($item->reject_sales_sts !== null) {
            $status_spk = '<span class="badge bg-red" style="font-weight: bold;"> Rejected by : Sales</span>';
        }
        if ($item->reject_konsultan_1_sts !== null) {
            $status_spk = '<span class="badge bg-red" style="font-weight: bold;"> Rejected by : Konsultan 1</span>';
        }
        if ($item->reject_konsultan_2_sts !== null) {
            $status_spk = '<span class="badge bg-red" style="font-weight: bold;"> Rejected by : Konsultan 2</span>';
        }
        if ($item->reject_project_leader_sts !== null) {
            $status_spk = '<span class="badge bg-red" style="font-weight: bold;"> Rejected by : Project Leader</span>';
        }
        if ($item->reject_manager_sales_sts !== null) {
            $status_spk = '<span class="badge bg-red" style="font-weight: bold;"> Rejected by : Manager Sales</span>';
        }
        if ($item->reject_level2_by !== null) {
            $status_spk = '<span class="badge bg-red" style="font-weight: bold;"> Rejected by : Direktur</span>';
        }

        return $status_spk;
    }

    public function render_status($item)
    {


        $status = '<span class="badge bg-green">New</span>';

        $get_penawaran = $this->db->get_where('kons_tr_penawaran', ['id_quotation' => $item->id_penawaran])->row();
        if (!empty($get_penawaran) && $get_penawaran->sts_cust == 0) {
            $status = '
                <span class="badge bg-yellow" style="width: 100% !important;">
                    <b>New</b>
                </span>
            ';
        } else {
            $status = '
                <span class="badge bg-light-blue" style="width: 100% !important;">
                    <b>Repeat</b>
                </span>
            ';
        }

        return $status;
    }


    public function get_new_penawaran_non_kons()
    {
        $this->db->select('a.*');
        $this->db->from('kons_tr_penawaran_non_konsultasi a');
        $this->db->join('kons_tr_spk_non_kons b', 'b.id_penawaran = a.id_penawaran', 'left');
        $this->db->where('a.sts_deal', '1');
        $this->db->where('a.sts_quot', '1');
        $this->db->where('b.id_penawaran', null);
        $get_data = $this->db->get()->result();

        return $get_data;
    }

    public function get_penawaran_non_kons($id_penawaran = null)
    {
        $this->db->select('a.*');
        $this->db->from('kons_tr_penawaran_non_konsultasi a');
        if (!empty($id_penawaran)) {
            $this->db->where('a.id_penawaran', $id_penawaran);
            $get_data = $this->db->get()->row();
        } else {
            $get_data = $this->db->get()->result();
        }

        return $get_data;
    }

    public function get_penawaran_detail_non_kons($id_penawaran)
    {
        $this->db->select('a.*');
        $this->db->from('kons_tr_detail_penawaran_non_konsultasi a');
        $this->db->where('a.id_header', $id_penawaran);
        $get_data = $this->db->get()->result();

        return $get_data;
    }

    public function get_list_employee($id = null)
    {
        $this->dbhr->select('a.id, a.name');
        $this->dbhr->from('employees a');
        $this->dbhr->where('a.flag_active', 'Y');
        if (!empty($id)) {
            $this->db->where('a.id', $id);
            $get_data = $this->dbhr->get()->row();
        } else {
            $get_data = $this->dbhr->get()->result();
        }


        return $get_data;
    }

    public function render_action_non_kons($item)
    {
        $view_btn = '';
        $print_btn = '';
        if ($this->ENABLE_VIEW) {
            $view_btn = '<a href="' . base_url('spk_penawaran/view_non_kons/' . str_replace('/', '|', $item->id_spk_penawaran)) . '" class="btn btn-sm btn-info" title="View SPK Non Konsultasi"><i class="fa fa-eye"></i></a>';

            $print_btn = '<a href="javascript:void(0);" class="btn btn-sm btn-primary" title="Print SPK Non Konsultasi"><i class="fa fa-print"></i></a>';
        }

        $edit_btn = '';
        if ($this->ENABLE_MANAGE && $item->sts_spk !== '1' && empty($item->approval_sales_sts)) {
            $edit_btn = '<a href="' . base_url('spk_penawaran/edit_non_kons/' . str_replace('/', '|', $item->id_spk_penawaran)) . '" class="btn btn-sm btn-warning" title="Edit SPK Non Konsultasi"><i class="fa fa-pencil"></i></a>';
        }

        $delete_btn = '';
        if ($this->ENABLE_DELETE && $item->sts_spk !== '1' && empty($item->approval_sales_sts)) {
            $delete_btn = '<button type="button" class="btn btn-sm btn-danger del_spk_non_kons" data-id_spk_penawaran="' . $item->id_spk_penawaran . '" title="Delete SPK Non Konsultasi"><i class="fa fa-trash"></i></button>';
        }



        $action = $view_btn . ' ' . $edit_btn . ' ' . $delete_btn . ' ' . $print_btn;

        return $action;
    }

    public function get_spk_non_kons($id_spk_penawaran) {
        $this->db->select('a.*');
        $this->db->from('kons_tr_spk_non_kons a');
        $this->db->where('a.id_spk_penawaran', $id_spk_penawaran);
        $get_data = $this->db->get()->row();

        return $get_data;
    }
}
