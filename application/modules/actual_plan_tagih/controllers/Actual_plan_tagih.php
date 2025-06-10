<?php
defined('BASEPATH') or exit('No direct script access allowed');


class Actual_plan_tagih extends Admin_Controller
{
    protected $viewPermission     = 'Plan_Tagih.View';
    protected $addPermission      = 'Plan_Tagih.Add';
    protected $managePermission = 'Plan_Tagih.Manage';
    protected $deletePermission = 'Plan_Tagih.Delete';

    public function __construct()
    {
        parent::__construct();
        $this->load->library(array('upload', 'Image_lib'));
        $this->load->model(array(
            'Actual_plan_tagih/Actual_plan_tagih_model'
        ));
        $this->template->title('Actual_plan_tagih');
        $this->template->page_icon('fa fa-building-o');

        date_default_timezone_set('Asia/Bangkok');
    }

    public function index()
    {
        $this->auth->restrict($this->viewPermission);

        $this->template->title('Actual Plan Tagih');
        $this->template->render('index');
    }

    public function add_plan_tagih($id_spk)
    {
        $id_spk = urldecode($id_spk);
        $id_spk = str_replace('|', '/', $id_spk);

        $this->db->select('a.*');
        $this->db->from('kons_tr_spk_penawaran a');
        $this->db->where('a.id_spk_penawaran', $id_spk);
        $get_spk_penawaran = $this->db->get()->row();

        $this->db->select('a.*');
        $this->db->from('kons_tr_spk_penawaran_payment a');
        $this->db->where('a.id_spk_penawaran', $id_spk);
        $this->db->order_by('a.dibuat_tgl', 'asc');
        $get_top_spk_penawaran = $this->db->get()->result();

        $data = [
            'data_spk_penawaran' => $get_spk_penawaran,
            'data_top_spk_penawaran' => $get_top_spk_penawaran
        ];

        $this->template->set($data);
        $this->template->title('Add Plan Tagih');
        $this->template->render('add_plan_tagih');
    }

    public function aktual_tagihan_get()
    {
        $id = $this->input->post('id');
        
        
    }

    public function get_actual_plan_tagih()
    {
        $this->Actual_plan_tagih_model->get_actual_plan_tagih();
    }
}
