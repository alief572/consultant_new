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
class Project_budgeting extends Admin_Controller
{
    //Permission
    protected $viewPermission     = 'Project_Budgeting.View';
    protected $addPermission      = 'Project_Budgeting.Add';
    protected $managePermission = 'Project_Budgeting.Manage';
    protected $deletePermission = 'Project_Budgeting.Delete';

    public function __construct()
    {
        parent::__construct();
        $this->template->title('Quotation');
        $this->template->page_icon('fa fa-cubes');
        $this->load->library('upload');
        $this->load->model(array('Spk_penawaran/Spk_penawaran_model'));
        date_default_timezone_set('Asia/Bangkok');
    }

    public function index()
    {
        $this->auth->restrict($this->viewPermission);
        $this->template->title('Project Budgeting');
        $this->template->render('index');
    }

    public function get_data_spk()
    {
        $draw = $this->input->post('draw');
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $search = $this->input->post('search');

        $this->db->select('a.*, b.grand_total');
        $this->db->from('kons_tr_spk_penawaran a');
        $this->db->join('kons_tr_penawaran b', 'b.id_quotation = a.id_penawaran', 'left');
        $this->db->where(1, 1);
        $this->db->where('a.deleted_by', null);
        $this->db->where('a.sts_spk', 1);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->or_like('a.id_spk_penawaran', $search['value'], 'both');
            $this->db->or_like('a.nm_sales', $search['value'], 'both');
            $this->db->or_like('a.nm_project', $search['value'], 'both');
            $this->db->or_like('a.nm_customer', $search['value'], 'both');
            $this->db->or_like('a.nm_project_leader', $search['value'], 'both');
            $this->db->group_end();
        }
        $this->db->order_by('a.input_date', 'desc');
        $this->db->limit($length, $start);

        $get_data = $this->db->get();

        $this->db->select('a.*, b.grand_total');
        $this->db->from('kons_tr_spk_penawaran a');
        $this->db->join('kons_tr_penawaran b', 'b.id_quotation = a.id_penawaran', 'left');
        $this->db->where(1, 1);
        $this->db->where('a.deleted_by', null);
        $this->db->where('a.sts_spk', 1);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->or_like('a.id_spk_penawaran', $search['value'], 'both');
            $this->db->or_like('a.nm_sales', $search['value'], 'both');
            $this->db->or_like('a.nm_project', $search['value'], 'both');
            $this->db->or_like('a.nm_customer', $search['value'], 'both');
            $this->db->or_like('a.nm_project_leader', $search['value'], 'both');
            $this->db->group_end();
        }
        $this->db->order_by('a.input_date', 'desc');

        $get_data_all = $this->db->get();

        $hasil = [];

        $no = 1;
        foreach ($get_data->result() as $item) {

            $status = '<button type="button" class="btn btn-sm btn-success">NEW</button>';
            $status_spk = '<button type="button" class="btn btn-sm btn-primary">Waiting Approval</button>';

            $get_penawaran = $this->db->get_where('kons_tr_penawaran', ['id_quotation' => $item->id_penawaran])->row();
            if ($get_penawaran->sts_cust == 0) {
                $status = '
                    <span class="btn btn-sm btn-warning" style="width: 100% !important;">
                        <b>New</b>
                    </span>
                ';
            } else {
                $status = '
                    <span class="btn btn-sm btn-info" style="width: 100% !important;">
                        <b>Repeat</b>
                    </span>
                ';
            }

            if ($item->sts_spk == '1') {
                $status_spk = '<button type="button" class="btn btn-sm btn-success">Approved</button>';
            }
            if ($item->sts_spk == '0') {
                $status_spk = '<button type="button" class="btn btn-sm btn-danger">Rejected</button>';
            }

            $option = '<a href="'.base_url('project_budgeting/add/'. urlencode(str_replace('/','|',$item->id_spk_penawaran))).'" class="btn btn-sm " style="background-color: #E100A5; color: white;"><i class="fa fa-arrow-up"></i></a>';

            $nm_marketing = $item->nm_sales;

            $nm_paket = $item->nm_project;

            $nm_customer = $item->nm_customer;

            $hasil[] = [
                'no' => $no,
                'id_spk_penawaran' => $item->id_spk_penawaran,
                'nm_customer' => $item->nm_customer,
                'nm_sales' => $item->nm_sales,
                'nm_project_leader' => $item->nm_project_leader,
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

    public function add($id_spk_penawaran)
    {

        $id_spk_penawaran = urldecode($id_spk_penawaran);
        $id_spk_penawaran = str_replace('|', '/', $id_spk_penawaran);

        // $get_spk = $this->db->get_where('kons_tr_spk_penawaran', ['id_spk_penawaran' => $id_spk_penawaran])->row();

        $this->db->select('a.*, c.divisi as jabatan_pic, c.hp as kontak_pic');
        $this->db->from('kons_tr_spk_penawaran a');
        $this->db->join('customer b', 'b.id_customer = a.id_customer', 'left');
        $this->db->join('customer_pic c', 'c.id_pic = b.id_pic', 'left');
        $this->db->where('a.id_spk_penawaran', $id_spk_penawaran);
        $get_spk = $this->db->get()->row();

        $this->db->select('a.*');
        $this->db->from('kons_tr_penawaran a');
        $this->db->where('a.id_quotation', $get_spk->id_penawaran);
        $get_penawaran = $this->db->get()->row();

        $this->db->select('a.*');
        $this->db->from('employee a');
        $this->db->where('a.deleted', 'N');
        $get_all_marketing = $this->db->get()->result();

        $this->db->select('a.*, b.mandays as mandays_def');
        $this->db->from('kons_tr_spk_penawaran_subcont a');
        $this->db->join('kons_master_aktifitas b', 'b.id_aktifitas = a.id_aktifitas', 'left');
        $this->db->where('a.id_spk_penawaran', $id_spk_penawaran);
        $get_aktifitas = $this->db->get()->result();

        $this->db->select('a.*, b.nm_biaya');
        $this->db->from('kons_tr_penawaran_akomodasi a');
        $this->db->join('kons_master_biaya b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_penawaran', $get_spk->id_penawaran);
        $get_akomodasi = $this->db->get()->result();

        $this->db->select('a.*, b.nm_biaya');
        $this->db->from('kons_tr_penawaran_others a');
        $this->db->join('kons_master_biaya b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_penawaran', $get_spk->id_penawaran);
        $get_others = $this->db->get()->result();

        // print_r($this->db->last_query());
        // exit;

        // print_r($get_all_marketing);
        // exit;
        
        $data = [
            'list_spk_penawaran' => $get_spk,
            'list_all_marketing' => $get_all_marketing,
            'list_aktifitas' => $get_aktifitas,
            'list_akomodasi' => $get_akomodasi,
            'list_others' => $get_others,
            'list_penawaran' => $get_penawaran
        ];

        $this->template->set($data);
        $this->template->title('Create Project Budgeting');
        $this->template->render('add');
    }

    public function save_budgeting() {
        $post = $this->input->post();

        $this->db->trans_begin();

        $this->db->select('a.*');
        $this->db->from('kons_tr_spk_penawaran a');
        $this->db->where('a.id_spk_penawaran', $post['id_spk_penawaran']);
        $get_spk_penawaran = $this->db->get()->row();

        $id_spk_budgeting = $this->Project_budgeting_model->generate_id_spk_budgeting();

        $data_insert = [
            'id_spk_budgeting' => $id_spk_budgeting,
            'id_spk_penawaran' => $post['id_spk_penawaran'],
            'id_penawaran' => $get_spk_penawaran->id_penawaran
        ];
    }
}
