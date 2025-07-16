<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/*
 * @author Yunaz
 * @copyright Copyright (c) 2018, Yunaz
 *
 * This is controller for Customer
 */

class Master_tenaga_ahli extends Admin_Controller
{

    protected $viewPermission     = 'Master_Tenaga_Ahli.View';
    protected $addPermission      = 'Master_Tenaga_Ahli.Add';
    protected $managePermission = 'Master_Tenaga_Ahli.Manage';
    protected $deletePermission = 'Master_Tenaga_Ahli.Delete';

    public function __construct()
    {
        parent::__construct();

        $this->load->library(array('upload', 'Image_lib'));
        $this->template->title('Manage Data Supplier');
        $this->template->page_icon('fa fa-table');

        date_default_timezone_set("Asia/Bangkok");
    }

    public function index()
    {
        $get_biaya = $this->db->get_where('kons_master_tenaga_ahli', ['deleted_by' => null])->result();

        $this->template->title('Master Tenaga Ahli');
        $this->template->render('index');
    }

    public function add()
    {
        $this->template->render('add');
    }

    public function edit()
    {
        $id = $this->input->post('id');

        $get_biaya = $this->db->get_where('kons_master_tenaga_ahli', ['id' => $id])->row();

        $this->template->set('data_biaya', $get_biaya);
        $this->template->render('edit');
    }

    public function save_biaya()
    {
        $post = $this->input->post();

        $this->db->trans_begin();

        if ($post['id'] == '') {
            $this->db->insert('kons_master_tenaga_ahli', [
                'nm_biaya' => $post['nm_biaya'],
                'tipe_biaya' => 1,
                'input_by' => $this->auth->user_id(),
                'input_date' => date('Y-m-d H:i:s')
            ]);

            if ($this->db->trans_status() === false) {
                $this->db->trans_rollback();

                $valid = 0;
                $pesan = 'Sorry, saving data is failed !';
            } else {
                $this->db->trans_commit();

                $valid = 1;
                $pesan = 'Saving data is success !';
            }
        } else {
            $this->db->update('kons_master_tenaga_ahli', [
                'nm_biaya' => $post['nm_biaya'],
                'tipe_biaya' => 1,
                'input_by' => $this->auth->user_id(),
                'input_date' => date('Y-m-d H:i:s')
            ], [
                'id' => $post['id']
            ]);

            if ($this->db->trans_status() === false) {
                $this->db->trans_rollback();

                $valid = 0;
                $pesan = 'Sorry, update data is failed !';
            } else {
                $this->db->trans_commit();

                $valid = 1;
                $pesan = 'Update data is success !';
            }
        }

        echo json_encode([
            'status' => $valid,
            'pesan' => $pesan
        ]);
    }

    public function del_biaya()
    {
        $id = $this->input->post('id');

        $this->db->trans_begin();

        $this->db->update('kons_master_tenaga_ahli', ['deleted_by' => $this->auth->user_id(), 'deleted_date' => date('Y-m-d H:i:s')], ['id' => $id]);

        if ($this->db->trans_status() === false) {
            $this->db->trans_rollback();

            $valid = 0;
            $pesan = 'Please try again later !';
        } else {
            $this->db->trans_commit();

            $valid = 1;
            $pesan = 'Data has been deleted !';
        }

        echo json_encode([
            'status' => $valid,
            'pesan' => $pesan
        ]);
    }

    public function get_data_biaya()
    {
        $draw = $this->input->post('draw');
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $search = $this->input->post('search');

        $this->db->select('a.id, a.nm_biaya');
        $this->db->from('kons_master_tenaga_ahli a');
        $this->db->where('a.deleted_by', null);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.nm_biaya', $search['value'], 'both');
            $this->db->group_end();
        }
        $this->db->order_by('a.id', 'desc');
        $this->db->limit($length, $start);

        $get_data_biaya = $this->db->get();

        $hasil = [];

        $no = 1;
        foreach ($get_data_biaya->result() as $item) {

            $edit = '';
            $delete = '';

            if ($this->managePermission) {
                $edit = '<button type="button" class="btn btn-sm btn-warning edit_biaya_modal" data-id="' . $item->id . '" title="Edit Biaya"><i class="fa fa-pencil"></i></button>';
            }

            if ($this->deletePermission) {
                $delete = '<button type="button" class="btn btn-sm btn-sm btn-danger del_biaya" data-id="' . $item->id . '" title="Delete Biaya"><i class="fa fa-trash"></i></button>';
            }

            $buttons = $edit . ' ' . $delete;

            $hasil[] = [
                'no' => $no,
                'nm_biaya' => $item->nm_biaya,
                'option' => $buttons
            ];

            $no++;
        }

        echo json_encode([
            'draw' => intval($draw),
            'recordsTotal' => $get_data_biaya->num_rows(),
            'recordsFiltered' => $get_data_biaya->num_rows(),
            'data' => $hasil
        ]);
    }
}
