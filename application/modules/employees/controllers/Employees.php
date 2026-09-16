<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Employees extends Admin_Controller
{

	protected $viewPermission   = 'Master_Employee.View';

	public function __construct()
	{
		parent::__construct();
		$this->load->model('Employees/master_model');
		$this->load->model('Employees/employees_model');
	}

	public function index()
	{
		$this->auth->restrict($this->viewPermission);
		$data = array(
			'title'			=> 'Indeks Of Employees',
			'action'		=> 'index',
			'religi'		=> '0'
		);
		history('View Data Employees');
		$this->template->render('index', $data);
	}


	public function add()
	{
		// Modul view-only: tambah data dinonaktifkan.
		$this->auth->restrict($this->viewPermission);
		if ($this->input->post()) {
			$this->output->set_content_type('application/json')->set_output(json_encode(array(
				'status' => 0,
				'pesan'  => 'Modul Employees hanya view-only.'
			)));
			return;
		}
		show_404();
	}

	public function addHisfamily()
	{
		// Modul view-only.
		$this->auth->restrict($this->viewPermission);
		show_404();
	}


	public function family()
	{
		// Modul view-only.
		$this->auth->restrict($this->viewPermission);
		show_404();
	}

	public function listfamily()
	{
		// Modul view-only.
		$this->auth->restrict($this->viewPermission);
		show_404();
	}

	public function addfamily($id = '')
	{
		// Modul view-only.
		$this->auth->restrict($this->viewPermission);
		show_404();
	}


	public function edit($id = '')
	{
		// Modul view-only: ubah data dinonaktifkan.
		$this->auth->restrict($this->viewPermission);
		if ($this->input->post()) {
			$this->output->set_content_type('application/json')->set_output(json_encode(array(
				'status' => 0,
				'pesan'  => 'Modul Employees hanya view-only.'
			)));
			return;
		}
		show_404();
		return;

		if ($this->input->post()) {
			//echo"<pre>";print_r($this->input->post());exit;
			$family					= $this->input->post('family');
			$education				= $this->input->post('education');


			$data					= $this->input->post();
			$data['salary']			= Enkripsi($this->input->post('salary'));
			$data['jabatan']		= Enkripsi($this->input->post('jabatan'));
			$data['pulsa']			= Enkripsi($this->input->post('pulsa'));
			$Arr_Kembali			= array();
			unset($data['id']);
			$data_session			= $this->session->userdata;

			$data['modified_by']	= $data_session['User']['username'];
			$data['modified']		= date('Y-m-d H:i:s');
			$Kode_Emp				= $this->input->post('id');
			$countFamily			= $this->master_model->getCount('family', 'employee_id', $Kode_Emp);
			$Arr_Family				= array();
			if ($this->input->post('det_Family')) {
				$det_Detail			= $this->input->post('det_Family');
				$loop				= 0;
				unset($data['det_Family']);
				foreach ($det_Detail as $key => $vals) {
					$loop++;
					$Arr_Family[$loop]					= $vals;
					$Arr_Family[$loop]['employee_id']	= $Kode_Emp;
					$Arr_Family[$loop]['id']			= $Kode_Emp . '-' . sprintf('%03d', $loop);
					$Arr_Family[$loop]['created_by']	= $data_session['User']['username'];
					$Arr_Family[$loop]['created']		= date('Y-m-d H:i:s');
					$Arr_Family[$loop]['modified_by']	= $data_session['User']['username'];
					$Arr_Family[$loop]['modified']		= date('Y-m-d H:i:s');
				}
			}
			//echo"<pre>";print_r($Arr_Family);exit;


			$countEducation			= $this->master_model->getCount('educational', 'employee_id', $Kode_Emp);
			$Arr_Education				= array();
			if ($this->input->post('det_Education')) {
				$det_DetailE			= $this->input->post('det_Education');
				$loop1				= 0;
				unset($data['det_Education']);
				foreach ($det_DetailE as $key => $values) {
					$loop1++;
					$Arr_Education[$loop1]					= $values;
					$Arr_Education[$loop1]['employee_id']	= $Kode_Emp;
					$Arr_Education[$loop1]['id']			= $Kode_Emp . '-' . sprintf('%03d', $loop1);
					$Arr_Education[$loop1]['created_by']	= $data_session['User']['username'];
					$Arr_Education[$loop1]['created']		= date('Y-m-d H:i:s');
					$Arr_Education[$loop1]['modified_by']	= $data_session['User']['username'];
					$Arr_Education[$loop1]['modified']		= date('Y-m-d H:i:s');
				}
			}

			//echo"<pre>";print_r($Arr_Education);exit; 

			if ($this->employees_model->getUpdate('employees', $data, 'id', $this->input->post('id'))) {
				if ($countFamily > 0) {
					$Qry_Delete		= "DELETE FROM family WHERE employee_id='" . $Kode_Emp . "'";
					$Hasil_Del		= $this->db->query($Qry_Delete);
				}
				if ($countEducation > 0) {
					$Qry_Delete2		= "DELETE FROM educational WHERE employee_id='" . $Kode_Emp . "'";
					$Hasil_Del2		= $this->db->query($Qry_Delete2);
				}
				if ($Arr_Family) {

					$this->db->insert_batch('family', $Arr_Family);
				}

				if ($Arr_Education) {

					$this->db->insert_batch('educational', $Arr_Education);
				}

				$Arr_Kembali		= array(
					'status'		=> 1,
					'pesan'			=> 'Edit Employees Success. Thank you & have a nice day.......'
				);
				history('Edit Data Employees' . $data['name']);
			} else {
				$Arr_Kembali		= array(
					'status'		=> 2,
					'pesan'			=> 'Add Employees failed. Please try again later......'
				);
			}
			echo json_encode($Arr_Kembali);
		} else {

			$arr_Where			= '';
			$get_Data1			= $this->employees_model->getCompanies($arr_Where);
			$get_Data2			= $this->employees_model->getDivisions($arr_Where);
			$get_Data3			= $this->employees_model->getDepartments($arr_Where);
			$get_Data4			= $this->employees_model->getTitles($arr_Where);
			$get_Data5			= $this->employees_model->getPositions($arr_Where);
			$get_Data6			= $this->employees_model->getMarital($arr_Where);
			$get_Data7			= $this->employees_model->getIdfinger($arr_Where);
			$get_Data8			= $this->employees_model->getDivisionsHead($arr_Where);
			$get_Data			= $this->employees_model->getEmployees();
			$Family_Type		= $this->master_model->getArray('hr_sentral.family_category', array(), 'kode', 'category');
			$Education_Type		= $this->master_model->getArray('hr_sentral.education_level', array(), 'kode', 'category');
			$detail				= $this->employees_model->getData('hr_sentral.employees', 'id', $id);
			$detail_family		= $this->master_model->getArray('hr_sentral.family', array('employee_id' => $id));
			$detail_education	= $this->master_model->getArray('hr_sentral.educational', array('employee_id' => $id));
			$data = array(
				'title'			=> 'Edit Employees',
				'action'		=> 'edit',
				'data_Employees' => $get_Data,
				'data_companies' => $get_Data1,
				'data_divisions' => $get_Data2,
				'data_department'  => $get_Data3,
				'data_title'  	=> $get_Data4,
				'data_position'  	=> $get_Data5,
				'data_marital'  	=> $get_Data6,
				'data_idfinger'  	=> $get_Data7,
				'data_divisions_head'  	=> $get_Data8,
				'row'				=> $detail,
				'family_type'		=> $Family_Type,
				'rows_family'		=> $detail_family,
				'education_type'	=> $Education_Type,
				'rows_education'		=> $detail_education
			);

			$this->load->view('Employees/edit', $data);
		}
	}

	public function view($id = '')
	{
		$this->auth->restrict($this->viewPermission);
		if (empty($id)) {
			show_404();
			return;
		}
		$arr_Where			= '';
		$get_Data1			= $this->employees_model->getCompanies($arr_Where);
		$get_Data2			= $this->employees_model->getDivisions($arr_Where);
		$get_Data3			= $this->employees_model->getDepartments($arr_Where);
		$get_Data4			= $this->employees_model->getTitles($arr_Where);
		$get_Data5			= $this->employees_model->getPositions($arr_Where);
		$get_Data6			= $this->employees_model->getMarital($arr_Where);
		$get_Data7			= $this->employees_model->getIdfinger($arr_Where);
		$get_Data8			= $this->employees_model->getDivisionsHead($arr_Where);
		$get_Data			= $this->employees_model->getEmployees();
		$Family_Type		= $this->master_model->getArray('hr_sentral.family_category', array(), 'kode', 'category');
		$Education_Type		= $this->master_model->getArray('hr_sentral.education_level', array(), 'kode', 'category');
		$detail				= $this->employees_model->getData('hr_sentral.employees', 'id', $id);
		$detail_family		= $this->master_model->getArray('hr_sentral.family', array('employee_id' => $id));
		$detail_education	= $this->master_model->getArray('hr_sentral.educational', array('employee_id' => $id));
		if (empty($detail)) {
			show_404();
			return;
		}
		history('View Data Employee ' . $id);
		$data = array(
			'title'			=> 'View Employee',
			'action'		=> 'view',
			'data_Employees' => $get_Data,
			'data_companies' => $get_Data1,
			'data_divisions' => $get_Data2,
			'data_department'  => $get_Data3,
			'data_title'  	=> $get_Data4,
			'data_position'  	=> $get_Data5,
			'data_marital'  	=> $get_Data6,
			'data_idfinger'  	=> $get_Data7,
			'data_divisions_head'  	=> $get_Data8,
			'row'				=> $detail,
			'family_type'		=> $Family_Type,
			'rows_family'		=> $detail_family,
			'education_type'	=> $Education_Type,
			'rows_education'		=> $detail_education
		);

		$this->template->render('view', $data);
	}

	function delete($id = null)
	{
		// Modul view-only: hapus data dinonaktifkan.
		$this->auth->restrict($this->viewPermission);
		show_404();
	}
	function getDetail($kode = '')
	{
		$this->auth->restrict($this->viewPermission);
		$Data_Array		= $this->employees_model->getArray('hr_sentral.divisions', array('company_id' => $kode), 'id', 'name');
		echo json_encode($Data_Array);
	}

	function getDept($kode = '')
	{
		$this->auth->restrict($this->viewPermission);
		$Data_Array		= $this->employees_model->getArray('hr_sentral.departments', array('division_id' => $kode), 'id', 'name');
		echo json_encode($Data_Array);
	}
	function getTitle($kode = '')
	{
		$this->auth->restrict($this->viewPermission);
		$Data_Array		= $this->employees_model->getArray('hr_sentral.titles', array('department_id' => $kode), 'id', 'name');
		echo json_encode($Data_Array);
	}

	public function get_data_employees() {
		$this->auth->restrict($this->viewPermission);
		$this->employees_model->get_data_employees();
	}
}
