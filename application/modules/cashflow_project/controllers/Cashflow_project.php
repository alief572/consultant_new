<?php
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

/*
 * @author Harboens
 * @copyright Copyright (c) 2020
 *
 * This is controller for Pengajuan Rutin
 */

$status = array();
class Cashflow_project extends Admin_Controller
{
    //Permission
    protected $viewPermission     = 'Cashflow_Project.View';
    protected $addPermission      = 'Cashflow_Project.Add';
    protected $managePermission = 'Cashflow_Project.Manage';
    protected $deletePermission = 'Cashflow_Project.Delete';

    public function __construct()
    {
        parent::__construct();
        $this->template->title('Cashflow Project');
        $this->template->page_icon('fa fa-cubes');
        $this->load->library('upload');
        $this->load->model(array('Cashflow_project/Cashflow_project_model'));
        date_default_timezone_set('Asia/Bangkok');
    }

    // View Page Function

    public function index()
    {
        $this->auth->restrict($this->viewPermission);
        $this->template->title('Cashflow Project');
        $this->template->render('index');
    }

    public function view_cashflow($id_spk_budgeting) {
        $id_spk_budgeting = urldecode($id_spk_budgeting);
        $id_spk_budgeting = str_replace('|', '/', $id_spk_budgeting);

        $this->db->select('a.*, b.nm_sales, b.waktu_from, b.waktu_to, c.nm_paket as nama_project');
        $this->db->from('kons_tr_spk_budgeting a');
        $this->db->join('kons_tr_spk_penawaran b', 'b.id_spk_penawaran = a.id_spk_penawaran', 'left');
        $this->db->join('kons_master_konsultasi_header c', 'c.id_konsultasi_h = a.id_project', 'left');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $get_budgeting = $this->db->get()->row();

        $this->db->select('IF(SUM(a.mandays_subcont_final * a.mandays_rate_subcont_final) IS NULL, 0, SUM(a.mandays_subcont_final * a.mandays_rate_subcont_final)) as budget_subcont');
        $this->db->from('kons_tr_spk_budgeting_aktifitas a');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $get_budget_subcont = $this->db->get()->row();

        $actual_budget_subcont = 0;
        
        $this->db->select('a.grand_total');
        $this->db->from('kons_tr_kasbon_project_header a');
        $this->db->join('payment_approve b', 'b.no_doc = a.id');
        $this->db->where('a.tipe', 1);
        $this->db->where('a.sts_req_payment', 1);
        $this->db->where('b.status', 2);
        $get_actual_budget_subcont = $this->db->get()->result();
        foreach($get_actual_budget_subcont as $item) {
            $actual_budget_subcont += $item->grand_total;
        }

        $this->db->select('IF(SUM(a.total_final) IS NULL, 0, SUM(a.total_final)) as budget_akomodasi');
        $this->db->from('kons_tr_spk_budgeting_akomodasi a');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $get_budget_akomodasi = $this->db->get()->row();

        $actual_budget_akomodasi = 0;

        $this->db->select('a.grand_total');
        $this->db->from('kons_tr_kasbon_project_header a');
        $this->db->join('payment_approve b', 'b.no_doc = a.id');
        $this->db->where('a.tipe', 2);
        $this->db->where('a.sts_req_payment', 1);
        $this->db->where('b.status', 2);
        $get_actual_budget_akomodasi = $this->db->get()->result();
        foreach($get_actual_budget_akomodasi as $item) {
            $actual_budget_akomodasi += $item->grand_total;
        }

        $this->db->select('IF(SUM(a.budget_tambahan) IS NULL, 0, SUM(a.budget_tambahan)) AS ovb_akomodasi');
        $this->db->from('kons_tr_kasbon_req_ovb_akomodasi_detail a');
        $this->db->join('kons_tr_kasbon_req_ovb_akomodasi_header b', 'b.id_request_ovb = a.id_request_ovb', 'left');
        $this->db->where('b.id_spk_budgeting', $id_spk_budgeting);
        $get_ovb_akomodasi = $this->db->get()->row();

        $this->db->select('a.*, b.nm_biaya, (SELECT SUM(ab.jumlah) FROM kons_tr_kasbon_project_akomodasi aa JOIN payment_approve ab ON ab.no_doc = aa.id_header WHERE aa.id_spk_budgeting = a.id_spk_budgeting AND aa.id_akomodasi  = a.id_akomodasi AND ab.status = 2) as nilai_actual, (SELECT SUM(ab.budget_tambahan) FROM kons_tr_kasbon_req_ovb_akomodasi_detail ab LEFT JOIN kons_tr_kasbon_req_ovb_akomodasi_header ac ON ac.id_request_ovb = ab.id_request_ovb WHERE ac.id_spk_budgeting = a.id_spk_budgeting AND ab.id_item = a.id_item) as nilai_ovb');
        $this->db->from('kons_tr_spk_budgeting_akomodasi a');
        $this->db->join('kons_master_biaya b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $this->db->group_by('a.id');
        $get_akomodasi = $this->db->get()->result();

        $this->db->select('IF(SUM(a.total_final) IS NULL, 0, SUM(a.total_final)) as budget_others');
        $this->db->from('kons_tr_spk_budgeting_others a');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $get_budget_others = $this->db->get()->row();

        $actual_budget_others = 0;

        $this->db->select('a.grand_total');
        $this->db->from('kons_tr_kasbon_project_header a');
        $this->db->join('payment_approve b', 'b.no_doc = a.id');
        $this->db->where('a.tipe', 3);
        $this->db->where('a.sts_req_payment', 1);
        $this->db->where('b.status', 2);
        $get_actual_budget_others = $this->db->get()->result();
        foreach($get_actual_budget_others as $item) {
            $actual_budget_others += $item->grand_total;
        }

        $this->db->select('a.*, b.nm_biaya, (SELECT SUM(ab.jumlah) FROM kons_tr_kasbon_project_others aa JOIN payment_approve ab ON ab.no_doc = aa.id_header WHERE aa.id_spk_budgeting = a.id_spk_budgeting AND aa.id_others  = a.id_others) as nilai_actual');
        $this->db->from('kons_tr_spk_budgeting_others a');
        $this->db->join('kons_master_biaya b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $get_others = $this->db->get()->result();

        $data = [
            'list_budgeting' => $get_budgeting,
            'budget_subcont' => $get_budget_subcont->budget_subcont,
            'actual_budget_subcont' => $actual_budget_subcont,
            'budget_akomodasi' => ($get_budget_akomodasi->budget_akomodasi + $get_ovb_akomodasi->ovb_akomodasi),
            'actual_budget_akomodasi' => $actual_budget_akomodasi,
            'list_akomodasi' => $get_akomodasi,
            'budget_others' => ($get_budget_others->budget_others),
            'actual_budget_others' => $actual_budget_others,
            'list_others' => $get_others
        ];

        $this->template->set($data);
        $this->template->render('view');
    }


    // End Page Function    

    // Get Data Function    

    public function get_data_spk() {
        $this->Cashflow_project_model->get_data_spk();
    }

    // End Data Function

    // Update Data Function

    

    // End Update Data Function
}
