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
class Approval_kasbon_overbudget extends Admin_Controller
{
    //Permission
    protected $viewPermission     = 'Approval_Kasbon_Overbudget.View';
    protected $addPermission      = 'Approval_Kasbon_Overbudget.Add';
    protected $managePermission = 'Approval_Kasbon_Overbudget.Manage';
    protected $deletePermission = 'Approval_Kasbon_Overbudget.Delete';

    public function __construct()
    {
        parent::__construct();
        $this->template->title('Quotation');
        $this->template->page_icon('fa fa-cubes');
        $this->load->library('upload');
        $this->load->model('Approval_kasbon_overbudget/Approval_kasbon_overbudget_model');
        date_default_timezone_set('Asia/Bangkok');
    }

    public function index()
    {
        $this->auth->restrict($this->viewPermission);

        $this->template->title('Approval Kasbon Overbudget');
        $this->template->render('index');
    }

    public function detail()
    {
        $post = $this->input->post();

        $id = $post['id'];
        $tipe = $post['tipe'];

        if ($tipe == '1') {
            $this->db->select('a.id, a.id_request_ovb, a.id_aktifitas as id_item, a.nm_aktifitas as nm_item, a.qty_budget_tambahan, a.budget_tambahan, a.pengajuan_budget, a.reason');
            $this->db->from('kons_tr_kasbon_req_ovb_subcont_detail a');
            $this->db->where('a.id_request_ovb', $id);
            $get_data = $this->db->get()->result_array();
        }
        if ($tipe == '2') {
            $this->db->select('a.id, a.id_request_ovb, a.id_item as id_item, a.nm_item as nm_item, a.qty_budget_tambahan, a.budget_tambahan, a.pengajuan_budget, a.reason');
            $this->db->from('kons_tr_kasbon_req_ovb_akomodasi_detail a');
            $this->db->where('a.id_request_ovb', $id);
            $get_data = $this->db->get()->result_array();
        }
        if ($tipe == '3') {
            $this->db->select('a.id, a.id_request_ovb, a.id_aktifitas as id_item, a.nm_item as nm_item, a.qty_budget_tambahan, a.budget_tambahan, a.pengajuan_budget, a.reason');
            $this->db->from('kons_tr_kasbon_req_ovb_others_detail a');
            $this->db->where('a.id_request_ovb', $id);
            $get_data = $this->db->get()->result_array();
        }
        if ($tipe == '4') {
            $this->db->select('a.id, a.id_request_ovb, a.id_item, a.nm_item as nm_item, a.qty_budget_tambahan, a.budget_tambahan, a.pengajuan_budget, a.reason');
            $this->db->from('kons_tr_kasbon_req_ovb_lab_detail a');
            $this->db->where('a.id_request_ovb', $id);
            $get_data = $this->db->get()->result_array();
        }
        if ($tipe == '5') {
            $this->db->select('a.id, a.id_request_ovb, a.id_item, a.nm_item as nm_item, a.qty_budget_tambahan, a.budget_tambahan, a.pengajuan_budget, a.reason');
            $this->db->from('kons_tr_kasbon_req_ovb_subcont_tenaga_ahli_detail a');
            $this->db->where('a.id_request_ovb', $id);
            $get_data = $this->db->get()->result_array();
        }
        if ($tipe == '6') {
            $this->db->select('a.id, a.id_request_ovb, a.id_item, a.nm_item as nm_item, a.qty_budget_tambahan, a.budget_tambahan, a.pengajuan_budget, a.reason');
            $this->db->from('kons_tr_kasbon_req_ovb_subcont_perusahaan_detail a');
            $this->db->where('a.id_request_ovb', $id);
            $get_data = $this->db->get()->result_array();
        }

        $this->template->render('detail_akomodasi', array('list_data' => $get_data));
    }

    public function approval()
    {
        $post = $this->input->post();

        $id = $post['id'];
        $tipe = $post['tipe'];

        if ($tipe == '1') {
            $this->db->select('a.id, a.id_request_ovb, a.id_aktifitas as id_item, a.nm_aktifitas as nm_item, a.qty_budget_tambahan, a.budget_tambahan, a.pengajuan_budget, a.reason');
            $this->db->from('kons_tr_kasbon_req_ovb_subcont_detail a');
            $this->db->where('a.id_request_ovb', $id);
            $get_data = $this->db->get()->result_array();
        }
        if ($tipe == '2') {
            $this->db->select('a.id, a.id_request_ovb, a.id_item as id_item, a.nm_item as nm_item, a.qty_budget_tambahan, a.budget_tambahan, a.pengajuan_budget, a.reason');
            $this->db->from('kons_tr_kasbon_req_ovb_akomodasi_detail a');
            $this->db->where('a.id_request_ovb', $id);
            $get_data = $this->db->get()->result_array();
        }
        if ($tipe == '3') {
            $this->db->select('a.id, a.id_request_ovb, a.id_item as id_item, a.nm_item as nm_item, a.qty_budget_tambahan, a.budget_tambahan, a.pengajuan_budget, a.reason');
            $this->db->from('kons_tr_kasbon_req_ovb_others_detail a');
            $this->db->where('a.id_request_ovb', $id);
            $get_data = $this->db->get()->result_array();
        }
        if ($tipe == '4') {
            $this->db->select('a.id, a.id_request_ovb, a.id_item as id_item, a.nm_item as nm_item, a.qty_budget_tambahan, a.budget_tambahan, a.pengajuan_budget, a.reason');
            $this->db->from('kons_tr_kasbon_req_ovb_lab_detail a');
            $this->db->where('a.id_request_ovb', $id);
            $get_data = $this->db->get()->result_array();
        }
        if ($tipe == '5') {
            $this->db->select('a.id, a.id_request_ovb, a.id_item as id_item, a.nm_item as nm_item, a.qty_budget_tambahan, a.budget_tambahan, a.pengajuan_budget, a.reason');
            $this->db->from('kons_tr_kasbon_req_ovb_subcont_tenaga_ahli_detail a');
            $this->db->where('a.id_request_ovb', $id);
            $get_data = $this->db->get()->result_array();
        }
        if ($tipe == '6') {
            $this->db->select('a.id, a.id_request_ovb, a.id_item as id_item, a.nm_item as nm_item, a.qty_budget_tambahan, a.budget_tambahan, a.pengajuan_budget, a.reason');
            $this->db->from('kons_tr_kasbon_req_ovb_subcont_perusahaan_detail a');
            $this->db->where('a.id_request_ovb', $id);
            $get_data = $this->db->get()->result_array();
        }
        $this->template->render('approval_akomodasi', array('list_data' => $get_data, 'id' => $id));
    }

    public function approve()
    {
        $id = $this->input->post('id');

        $this->db->trans_begin();

        $this->db->update('kons_tr_kasbon_req_ovb_akomodasi_header', array('sts' => 1), array('id_request_ovb' => $id));
        $this->db->update('kons_tr_kasbon_req_ovb_subcont_header', array('sts' => 1), array('id_request_ovb' => $id));
        $this->db->update('kons_tr_kasbon_req_ovb_others_header', array('sts' => 1), array('id_request_ovb' => $id));
        $this->db->update('kons_tr_kasbon_req_ovb_lab_header', array('sts' => 1), array('id_request_ovb' => $id));
        $this->db->update('kons_tr_kasbon_req_ovb_subcont_tenaga_ahli_header', array('sts' => 1), array('id_request_ovb' => $id));
        $this->db->update('kons_tr_kasbon_req_ovb_subcont_perusahaan_header', array('sts' => 1), array('id_request_ovb' => $id));

        if ($this->db->trans_status() === false) {
            $this->db->trans_rollback();

            $valid = 0;
            $msg = 'Please try again later !';
        } else {
            $this->db->trans_commit();

            $valid = 1;
            $msg = 'Overbudget has been Approved !';
        }

        echo json_encode([
            'status' => $valid,
            'msg' => $msg
        ]);
    }

    public function reject()
    {
        $id = $this->input->post('id');
        $reject_reason = $this->input->post('reject_reason');

        $this->db->trans_begin();

        $update_status = $this->db->update('kons_tr_kasbon_req_ovb_akomodasi_header', array('sts' => 2, 'reject_reason' => $reject_reason), array('id_request_ovb' => $id));
        if (!$update_status) {
            $this->db->trans_rollback();

            print_r($this->db->last_query());
            exit;
        }

        if ($this->db->trans_status() === false) {
            $this->db->trans_rollback();

            $valid = 0;
            $msg = 'Please try again later !';
        } else {
            $this->db->trans_commit();

            $valid = 1;
            $msg = 'Overbudget has been Rejected !';
        }

        echo json_encode([
            'status' => $valid,
            'msg' => $msg
        ]);
    }

    public function get_data_overbudget()
    {
        $this->Approval_kasbon_overbudget_model->get_data_overbudget();
    }
}
