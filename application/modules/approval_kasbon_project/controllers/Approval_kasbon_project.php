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
class Approval_kasbon_project extends Admin_Controller
{
    //Permission
    protected $viewPermission     = 'Approval_Kasbon_Project.View';
    protected $addPermission      = 'Approval_Kasbon_Project.Add';
    protected $managePermission = 'Approval_Kasbon_Project.Manage';
    protected $deletePermission = 'Approval_Kasbon_Project.Delete';

    public function __construct()
    {
        parent::__construct();
        $this->template->title('Approval Kasbon Project');
        $this->template->page_icon('fa fa-cubes');
        $this->load->library('upload');
        $this->load->model(array('Approval_kasbon_project/Approval_kasbon_project_model'));
        date_default_timezone_set('Asia/Bangkok');
    }

    public function index()
    {
        $this->auth->restrict($this->viewPermission);
        $this->template->title('Approval Kasbon Project');
        $this->template->render('index');
    }

    public function get_data_spk()
    {
        $draw = $this->input->post('draw');
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $search = $this->input->post('search');

        $this->db->select('b.*, c.nm_sales');
        $this->db->from('kons_tr_req_kasbon_project a');
        $this->db->join('kons_tr_spk_budgeting b', 'b.id_spk_budgeting = a.id_spk_budgeting', 'left');
        $this->db->join('kons_tr_spk_penawaran c', 'c.id_spk_penawaran = b.id_spk_penawaran', 'left');
        $this->db->where('a.sts', 0);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.id_spk_budgeting', $search['value'], 'both');
            $this->db->or_like('b.nm_customer', $search['value'], 'both');
            $this->db->or_like('c.nm_sales', $search['value'], 'both');
            $this->db->or_like('b.nm_project_leader', $search['value'], 'both');
            $this->db->or_like('b.nm_project', $search['value'], 'both');
            $this->db->group_end();
        }
        $this->db->order_by('a.created_date', 'desc');
        $this->db->limit($length, $start);

        $get_data = $this->db->get();

        $this->db->select('b.*, c.nm_sales');
        $this->db->from('kons_tr_req_kasbon_project a');
        $this->db->join('kons_tr_spk_budgeting b', 'b.id_spk_budgeting = a.id_spk_budgeting', 'left');
        $this->db->join('kons_tr_spk_penawaran c', 'c.id_spk_penawaran = b.id_spk_penawaran', 'left');
        $this->db->where('a.sts', 0);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.id_spk_budgeting', $search['value'], 'both');
            $this->db->or_like('b.nm_customer', $search['value'], 'both');
            $this->db->or_like('c.nm_sales', $search['value'], 'both');
            $this->db->or_like('b.nm_project_leader', $search['value'], 'both');
            $this->db->or_like('b.nm_project', $search['value'], 'both');
            $this->db->group_end();
        }
        $this->db->order_by('a.created_date', 'desc');

        $get_data_all = $this->db->get();

        $hasil = [];

        $no = 1;
        foreach ($get_data->result() as $item) {

            $status = '<button type="button" class="btn btn-sm btn-primary">Waiting Approval</button>';
            if ($item->sts == 2) {
                $status = '<button type="button" class="btn btn-sm btn-danger">Rejected</button>';
            }

            $option = '<a href="' . base_url('approval_kasbon_project/approval_kasbon/' . urlencode(str_replace('/', '|', $item->id_spk_budgeting))) . '" class="btn btn-sm btn-primary" title="Approval Kasbon"><i class="fa fa-arrow-up"></i></a>';


            $hasil[] = [
                'no' => $no,
                'id_spk_penawaran' => $item->id_spk_penawaran,
                'nm_customer' => $item->nm_customer,
                'nm_sales' => ucfirst($item->nm_sales),
                'nm_project_leader' => ucfirst($item->nm_project_leader),
                'nm_project' => $item->nm_project,
                'option' => $option
            ];

            $no++;
        }

        echo json_encode([
            'draw' => intval($draw),
            'recordsTotal' => $get_data_all->num_rows(),
            'recordsFiltered' => $get_data_all->num_rows(),
            'data' => $hasil
        ]);
    }

    public function approval_kasbon($id_spk_budgeting)
    {
        $id_spk_budgeting = urldecode($id_spk_budgeting);
        $id_spk_budgeting = str_replace('|', '/', $id_spk_budgeting);

        $this->db->select('a.*, b.nm_sales, b.waktu_from, b.waktu_to');
        $this->db->from('kons_tr_spk_budgeting a');
        $this->db->join('kons_tr_spk_penawaran b', 'b.id_spk_penawaran = a.id_spk_penawaran', 'left');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $get_budgeting = $this->db->get()->row();

        $this->db->select('a.*');
        $this->db->from('kons_tr_kasbon_project_subcont a');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $this->db->where('a.sts', null);
        $get_kasbon_subcont = $this->db->get()->result();

        $this->db->select('a.*, b.nm_biaya');
        $this->db->from('kons_tr_kasbon_project_akomodasi a');
        $this->db->join('kons_master_biaya b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $this->db->where('a.sts', null);
        $get_kasbon_akomodasi = $this->db->get()->result();

        $this->db->select('a.*, b.nm_biaya');
        $this->db->from('kons_tr_kasbon_project_others a');
        $this->db->join('kons_master_biaya b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $this->db->where('a.sts', null);
        $get_kasbon_others = $this->db->get()->result();

        $this->db->select('a.*, b.nm_biaya');
        $this->db->from('kons_tr_kasbon_req_ovb_akomodasi_detail a');
        $this->db->join('kons_master_biaya b', 'b.id = a.id_item', 'left');
        $this->db->join('kons_tr_kasbon_req_ovb_akomodasi_header c', 'c.id_request_ovb = a.id_request_ovb');
        $this->db->where('c.id_spk_budgeting', $id_spk_budgeting);
        $this->db->where('c.sts', null);
        $get_ovb_akomodasi = $this->db->get()->result();

        $data = [
            'list_budgeting' => $get_budgeting,
            'list_kasbon_subcont' => $get_kasbon_subcont,
            'list_kasbon_akomodasi' => $get_kasbon_akomodasi,
            'list_kasbon_others' => $get_kasbon_others,
            'list_ovb_akomodasi' => $get_ovb_akomodasi
        ];

        $this->template->set($data);
        $this->template->render('approval_kasbon');
    }

    public function reject_kasbon()
    {
        $id_spk_budgeting = $this->input->post('id_spk_budgeting');
        $reject_reason = $this->input->post('reject_reason');

        $this->db->trans_begin();

        $update_req = $this->db->update('kons_tr_req_kasbon_project', ['sts' => 2, 'reject_reason' => $reject_reason], ['id_spk_budgeting' => $id_spk_budgeting]);
        if (!$update_req) {
            $this->db->trans_rollback();

            print_r($this->db->error($update_req));
            exit;
        }

        if ($this->db->trans_status() === false) {
            $this->db->trans_rollback();

            $valid = 0;
            $pesan = 'Please try again later !';
        } else {
            $this->db->trans_commit();

            $valid = 1;
            $pesan = 'Data has been rejected !';
        }

        echo json_encode([
            'status' => $valid,
            'pesan' => $pesan
        ]);
    }

    public function approve_kasbon()
    {
        $id_spk_budgeting = $this->input->post('id_spk_budgeting');

        $this->db->trans_begin();

        $update_req = $this->db->update('kons_tr_kasbon_project_header', ['sts' => 1], ['id_spk_budgeting' => $id_spk_budgeting]);
        if (!$update_req) {
            $this->db->trans_rollback();

            print_r($this->db->error($update_req));
            exit;
        }

        $update_req = $this->db->update('kons_tr_req_kasbon_project', ['sts' => 1], ['id_spk_budgeting' => $id_spk_budgeting]);
        if (!$update_req) {
            $this->db->trans_rollback();

            print_r($this->db->error($update_req));
            exit;
        }

        $update_req_subcont = $this->db->update('kons_tr_kasbon_project_subcont', ['sts' => 1], ['id_spk_budgeting' => $id_spk_budgeting]);
        if (!$update_req_subcont) {
            $this->db->trans_rollback();

            print_r($this->db->error($update_req_subcont));
            exit;
        }

        $update_req_akomodasi = $this->db->update('kons_tr_kasbon_project_akomodasi', ['sts' => 1], ['id_spk_budgeting' => $id_spk_budgeting]);
        if (!$update_req_akomodasi) {
            $this->db->trans_rollback();

            print_r($this->db->error($update_req_akomodasi));
            exit;
        }

        $update_req_akomodasi = $this->db->update('kons_tr_kasbon_project_akomodasi', ['sts' => 1], ['id_spk_budgeting' => $id_spk_budgeting]);
        if (!$update_req_akomodasi) {
            $this->db->trans_rollback();

            print_r($this->db->error($update_req_akomodasi));
            exit;
        }

        $update_req_others = $this->db->update('kons_tr_kasbon_project_others', ['sts' => 1], ['id_spk_budgeting' => $id_spk_budgeting]);
        if (!$update_req_others) {
            $this->db->trans_rollback();

            print_r($this->db->error($update_req_others));
            exit;
        }

        $update_req_ovb_akomodasi = $this->db->update('kons_tr_kasbon_req_ovb_akomodasi_header a', ['sts' => 1], ['id_spk_budgeting' => $id_spk_budgeting]);
        if (!$update_req_ovb_akomodasi) {
            $this->db->trans_rollback();

            print_r($this->db->error($update_req_ovb_akomodasi));
            exit;
        }

        if ($this->db->trans_status() === false) {
            $this->db->trans_rollback();

            $valid = 0;
            $pesan = 'Please try again later !';
        } else {
            $this->db->trans_commit();

            $valid = 1;
            $pesan = 'Data has been approved !';
        }

        echo json_encode([
            'status' => $valid,
            'pesan' => $pesan
        ]);
    }
}
