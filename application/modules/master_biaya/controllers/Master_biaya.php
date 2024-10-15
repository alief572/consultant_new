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

    public function index() {

        $get_biaya = $this->db->get_where('kons_master_biaya', ['deleted_by' => null])->result();

        $this->template->title('Master Biaya');
        $this->template->render('index');
    }

    public function add() {
        $this->template->render('add');
    }

    public function save_biaya() {
        $post = $this->input->post();

        $this->db->trans_begin();

        if($post['id'] == '') {
            $this->db->insert('kons_master_biaya', [
                'nm_biaya' => $post['nm_biaya'],
                'tipe_biaya' => $post['tipe_biaya'],
            ]);
        } else {

        }
    }
}
