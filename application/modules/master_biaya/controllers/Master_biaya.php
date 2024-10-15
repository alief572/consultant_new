<?php

/**
 * ------------------------------------------------------------------------
 * Class Name : Master Biaya
 * ------------------------------------------------------------------------
 *
 * @author     DandoRidwanto
 * @copyright  2018
 *
 * Last Update : Monday, 23 June 2018
 *
 */
// awd
class Master_biaya extends Admin_Controller
{
    protected $viewPermission     = 'Master_Biaya.View';
    protected $addPermission      = 'Master_Biaya.Add';
    protected $managePermission = 'Master_Biaya.Manage';
    protected $deletePermission = 'Master_Biaya.Delete';

    function __construct()
    {
        parent::__construct();
        $this->output->set_header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
        $this->output->set_header("Cache-Control: no-store, no-cache, must-revalidate");
        $this->output->set_header("Cache-Control: post-check=0, pre-check=0", false);
        $this->output->set_header("Pragma: no-cache");
    }

    public function index()
    {

        $get_biaya = $this->db->get_where('kons_master_biaya', ['deleted_by' => null])->result();

        $this->template->title('Master Biaya');
        $this->template->render('index');
    }

    public function add()
    {
        $this->template->render('add');
    }

    public function save_biaya()
    {
        $post = $this->input->post();

        $this->db->trans_begin();

        if ($post['id'] == '') {
            $this->db->insert('kons_master_biaya', [
                'nm_biaya' => $post['nm_biaya'],
                'tipe_biaya' => $post['tipe_biaya'],
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
            $this->db->update('kons_master_biaya', [
                'nm_biaya' => $post['nm_biaya'],
                'tipe_biaya' => $post['tipe_biaya'],
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

    public function get_data_biaya()
    {
        $draw = $this->input->post('draw');
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $search = $this->input->post('search');

        $this->db->select('a.nm_biaya, IF(a.tipe_biaya = 1, "Akomodasi", "Others") as tipe');
        $this->db->from('kons_master_biaya a');
        $this->db->where(1, 1);
        if(!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.nm_biaya', $search['value'], 'both');
            $this->db->or_like('IF(a.tipe_biaya = 1, "Akomodasi", "Others")', $search['value'], 'both');
            $this->db->group_end();
        }
        $this->db->order_by('a.id', 'desc');

        $get_data_biaya = $this->db->get()->result();

        $hasil = [];

        $no = 1;
        foreach($get_data_biaya as $item) {

            $edit = '';
            $delete = '';
            $hasil[] = [
                'no' => $no,
                'nm_biaya' => $item->nm_biaya,
                'tipe' => $item->tipe,
                'option' => 
            ];

            $no++;
        }
    }
}
