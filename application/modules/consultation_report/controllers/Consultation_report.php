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
class Consultation_report extends Admin_Controller
{
    //Permission
    protected $viewPermission     = 'Consultation_Report.View';
    protected $addPermission      = 'Consultation_Report.Add';
    protected $managePermission = 'Consultation_Report.Manage';
    protected $deletePermission = 'Consultation_Report.Delete';

    public function __construct()
    {
        parent::__construct();
        $this->template->title('Quotation');
        $this->template->page_icon('fa fa-cubes');
        $this->load->library('upload');
        $this->load->model(array('Consultation_report/Consultation_report_model'));
        date_default_timezone_set('Asia/Bangkok');
    }

    public function index()
    {
        $this->auth->restrict($this->viewPermission);
        $this->template->title('Consultation Report');
        $this->template->render('index');
    }
}
