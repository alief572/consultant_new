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
class Master_lab extends Admin_Controller
{
    //Permission
    protected $viewPermission     = 'Master_Lab.View';
    protected $addPermission      = 'Master_Lab.Add';
    protected $managePermission = 'Master_Lab.Manage';
    protected $deletePermission = 'Master_Lab.Delete';

    public function __construct()
    {
        parent::__construct();
        $this->template->title('Master Lab');
        $this->template->page_icon('fa fa-cubes');
        $this->load->library('upload');
        date_default_timezone_set('Asia/Bangkok');
    }

    public function index()
    {
        $this->auth->restrict($this->viewPermission);
        $this->template->title('Master Lab');
        $this->template->render('index');
    }

    public function add_data() {
        $this->template->render('add_data_lab');
    }
}
