<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Divisions extends Admin_Controller
{
	protected $viewPermission   = 'Master_Department.View';

	public function __construct()
	{
		parent::__construct();
		$this->load->model('Divisions/master_model');
		$this->load->model('Divisions/divisions_model');
	}

	public function index()
	{
		$this->auth->restrict($this->viewPermission);
		$data = array(
			'title'			=> 'Indeks Of Divisions',
			'action'		=> 'index'
		);
		history('View Data Divisions');
		$this->template->render('index', $data);
	}
	public function add()
	{
		// Modul view-only: tambah data dinonaktifkan.
		$this->auth->restrict($this->viewPermission);
		if ($this->input->post()) {
			$this->output->set_content_type('application/json')->set_output(json_encode(array(
				'status' => 0,
				'pesan'  => 'Modul Divisions hanya view-only.'
			)));
			return;
		}
		show_404();
	}
	public function edit($id = '')
	{
		// Modul view-only: ubah data dinonaktifkan.
		$this->auth->restrict($this->viewPermission);
		if ($this->input->post()) {
			$this->output->set_content_type('application/json')->set_output(json_encode(array(
				'status' => 0,
				'pesan'  => 'Modul Divisions hanya view-only.'
			)));
			return;
		}
		show_404();
	}

	function delete($id = null)
	{
		// Modul view-only: hapus data dinonaktifkan.
		$this->auth->restrict($this->viewPermission);
		show_404();
	}

	public function view($id = '')
	{
		$this->auth->restrict($this->viewPermission);
		if (empty($id)) {
			show_404();
			return;
		}
		$arr_Where			= '';
		$get_Data			= $this->master_model->getCompanies($arr_Where);
		$detail				= $this->master_model->getData('hr_sentral.divisions', 'id', $id);
		if (empty($detail)) {
			show_404();
			return;
		}
		history('View Data Division ' . $id);
		$data = array(
			'title'			=> 'View Division',
			'action'		=> 'view',
			'data_companies' => $get_Data,
			'row'			=> $detail
		);

		$this->template->render('view', $data);
	}

	public function get_data_divisions()
	{
		$this->auth->restrict($this->viewPermission);
		$this->divisions_model->get_data_divisions();
	}
}
