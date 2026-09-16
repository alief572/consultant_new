<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Master_employee extends Admin_Controller
{
	//Permission - modul ini view-only.
	protected $viewPermission   = "Master_Employee.View";

	public function __construct()
	{
		parent::__construct();
		$this->load->model(array(
			'Master_employee/Employee_model'
		));
		$this->template->title('Master Employee');

		date_default_timezone_set("Asia/Bangkok");

		$this->id_user  = $this->auth->user_id();
		$this->datetime = date('Y-m-d H:i:s');
	}

	public function index()
	{
		$this->auth->restrict($this->viewPermission);
		$where = [
			'deleted_date' => NULL
		];
		$listData = $this->Employee_model->get_data($where);

		$data = [
			'result' =>  $listData
		];

		history("View data employee");
		$this->template->set($data);
		$this->template->title('Master Employee');
		$this->template->render('index');
	}

	public function detail($id = null)
	{
		$this->auth->restrict($this->viewPermission);
		if (empty($id)) {
			show_404();
			return;
		}

		$employee = $this->Employee_model->get_detail($id);
		if (empty($employee)) {
			show_404();
			return;
		}

		history("View detail employee " . $id);
		$this->template->set(array('employee' => $employee));
		$this->template->title('Detail Employee');
		$this->template->render('detail');
	}

	public function add($id = null, $tanda = null)
	{
		// Modul view-only: tolak create/update, jaga kompatibilitas link lama.
		$this->auth->restrict($this->viewPermission);
		if ($this->input->post()) {
			$this->output->set_content_type('application/json')->set_output(json_encode(array(
				'pesan'  => 'Modul Employee hanya view-only.',
				'status' => 0
			)));
			return;
		}
		// Link lama .../add/{id}/view dialihkan ke halaman detail baru.
		if (!empty($id)) {
			redirect('master_employee/detail/' . $id);
			return;
		}
		show_404();
	}

	public function delete()
	{
		// Modul view-only: penghapusan dinonaktifkan.
		$this->auth->restrict($this->viewPermission);
		if ($this->input->is_ajax_request()) {
			$this->output->set_content_type('application/json')->set_output(json_encode(array(
				'pesan'  => 'Modul Employee hanya view-only.',
				'status' => 0
			)));
			return;
		}
		show_404();
	}
}
