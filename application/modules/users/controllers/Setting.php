<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/*
 * @author CokesHome
 * @copyright Copyright (c) 2015, CokesHome
 *
 * This is controller for Users Management
 */

class Setting extends Admin_Controller
{

    /**
     * Load the models, library, etc
     *
     *
     */

    //Permissions
    protected $viewPermission   = "Users.View";
    protected $addPermission    = "Users.Add";
    protected $managePermission = "Users.Manage";
    protected $deletePermission = "Users.Delete";

    public function __construct()
    {
        parent::__construct();
        $this->lang->load('users');
        $this->load->model(array(
            'users/users_model',
            'users/groups_model',
            'users/user_groups_model',
            'users/permissions_model',
            'users/user_permissions_model',
            'Cabang/Cabang_model',
        ));

        $this->template->page_icon('fa fa-users');
    }

    public function index()
    {
        $this->auth->restrict($this->viewPermission);

        if (isset($_POST['delete']) && has_permission($this->deletePermission)) {
            $checked = $this->input->post('checked');

            if (is_array($checked) && count($checked)) {
                $result = FALSE;
                $sukses = 0;
                foreach ($checked as $pid) {
                    $result      = $this->users_model->delete($pid);

                    if ($result) {
                        $keterangan = "SUKSES, hapus data user dengan ID : " . $pid;
                        $status     = 1;

                        $sukses++;
                    } else {
                        $keterangan = "GAGAL, hapus data user dengan ID : " . $pid;
                        $status     = 0;
                    }

                    $nm_hak_akses   = $this->deletePermission;
                    $kode_universal = $pid;
                    $jumlah         = 1;
                    $sql            = $this->db->last_query();

                    simpan_aktifitas($nm_hak_akses, $kode_universal, $keterangan, $jumlah, $sql, $status);
                }

                if ($result) {
                    $this->template->set_message(count($sukses) . ' ' . lang('users_del_success') . '.', 'success');
                } else {
                    $this->template->set_message(lang('users_del_fail') . $this->users_model->error, 'error');
                }
            } else {
                $this->template->set_message(lang('users_del_error'), 'error');
            }

            unset($_POST['delete']);
        }

        // Pagination
        $this->load->library('pagination');

        if (isset($_POST['table_search'])) {
            $search = isset($_POST['table_search']) ? $this->input->post('table_search') : '';
        } else {
            $search = isset($_GET['search']) ? $this->input->get('search') : '';
        }

        $filter = "";
        if ($search != "") {
            $filter = "?search=" . $search;
        }

        $search2 = $this->db->escape_str($search);

        $where = "users.deleted = 0 AND users.username <> 'json'
                    AND (`username` LIKE '%$search2%' ESCAPE '!'
                    OR `nm_lengkap` LIKE '%$search2%' ESCAPE '!'
                    OR `users`.`alamat` LIKE '%$search2%' ESCAPE '!'
                    OR `users`.`kota` LIKE '%$search2%' ESCAPE '!'
                    OR `users`.`hp` LIKE '%$search2%' ESCAPE '!'
                   )";

        $total = $this->users_model
            ->where($where)
            ->count_all();

        $offset = $this->input->get('per_page');

        $limit = $this->config->item('list_limit');

        $this->pager['base_url']            = current_url() . $filter;
        $this->pager['total_rows']          = $total;
        $this->pager['per_page']            = $limit;
        $this->pager['page_query_string']   = TRUE;

        $this->pagination->initialize($this->pager);

        $data = $this->users_model->select("users.*")
            ->where($where)
            ->order_by('nm_lengkap', 'ASC')
            ->limit($limit, $offset)->find_all();
        history("View users");
        $this->template->set('results', $data);
        $this->template->set('search', $search);

        $this->template->title(lang('users_manage_title'));
        $this->template->set("numb", $offset + 1);
        $this->template->render('list');
    }

    public function create()
    {
        $this->auth->restrict($this->addPermission);

        if (isset($_POST['save'])) {
            if ($this->save_user()) {
                $this->template->set_message(lang('users_create_success'), 'success');
                redirect('users/setting');
            }
        }

        $cabang = $this->Cabang_model->find_all();
        $department = $this->db->select('a.id, a.name as nama')->from(DBHR . '.divisions a')->where('a.company_id', 'COM003')->get()->result_array();
        $employee = $this->db->select('a.id, a.name as nm_karyawan')->from(DBHR . '.employees a')->where('a.flag_active', 'Y')->get()->result();
        $this->template->set('cabang', $cabang);
        $this->template->set('department', $department);
        $this->template->set('employee', $employee);
        $this->template->title(lang('users_new_title'));
        $this->template->page_icon('fa fa-user');
        $this->template->render('users_form');
    }

    public function edit($id = 0)
    {
        $this->auth->restrict($this->managePermission);

        if ($id == 0 || is_numeric($id) == FALSE) {
            $this->template->set_message(lang('users_invalid_id'), 'error');
            redirect('users/setting');
        }

        if (isset($_POST['save'])) {
            if ($this->save_user("update", $id)) {
                $this->template->set_message(lang('users_edit_success'), 'success');
                redirect('users/setting');
            }
        }

        $data = $this->users_model->find($id);

        if ($data) {
            if ($data->deleted == 1) {
                $this->template->set_message(lang('users_already_deleted'), 'error');
                redirect('users/setting');
            }
        }

        //$cabang = $this->Cabang_model->find_all();
        //$this->template->set('cabang', $cabang);
        $department = $this->db->select('a.id, a.name as nama')->from(DBHR . '.divisions a')->where('a.company_id', 'COM003')->get()->result_array();
        $employee = $this->db->select('a.id, a.name as nm_karyawan')->from(DBHR . '.employees a')->where('a.flag_active', 'Y')->get()->result();
        $this->template->set('department', $department);
        $this->template->set('employee', $employee);
        $this->template->set('data', $data);
        $this->template->title(lang('users_edit_title'));
        $this->template->page_icon('fa fa-user');
        $this->template->render('users_form');
    }

    public function permission($id = 0)
    {
        $this->auth->restrict($this->managePermission);

        if ($id == 0 || is_numeric($id) == FALSE || $id == 1) {
            $this->template->set_message(lang('users_invalid_id'), 'error');
            redirect('users/setting');
        }

        if (isset($_POST['save'])) {
            if ($this->save_permission($id)) {
                $this->template->set_message(lang('users_permission_edit_success'), 'success');
            }
        }

        //User data
        $data = $this->users_model->find($id);

        if ($data) {
            if ($data->deleted == 1) {
                $this->template->set_message(lang('users_already_deleted'), 'error');
                redirect('users/setting');
            }
        }
        //All Permission
        $permissions        = $this->db->select('a.*, b.title AS nama_menu, b.id')->order_by('b.order', 'asc')->join('menus b', 'a.id_permission=b.permission_id', 'left')->get_where('permissions a', array('status' => '1', 'parent_id' => '0'))->result_array();
        $permissions_detail = $this->db->select('a.*, b.title AS nama_menu, b.parent_id, b.id')->order_by('b.order', 'asc')->join('menus b', 'a.id_permission=b.permission_id', 'left')->get_where('permissions a', array('status' => '1', 'parent_id !=' => '0'))->result_array();
        $permissopn_action  = $this->db->order_by('id_permission', 'asc')->get_where('permissions', array('id_menu !=' => NULL))->result_array();
        $auth_permissions   = $this->get_auth_permission($id);


        $ArrPermissionDetail = [];
        foreach ($permissions_detail as $key => $value) {
            $ArrPermissionDetail[$value['parent_id']][] = $value;
        }

        $ArrActionPers = [];
        foreach ($permissopn_action as $key => $value) {
            $ArrActionPers[$value['id_menu']][] = $value;
        }

        // echo "<pre>";
        // print_r($ArrActionPers);
        // exit;

        $this->template->set('data', $data);
        // $this->template->set('header', $header);
        // $this->template->set('permissions', $rows);
        $this->template->set('permissions', $permissions);
        $this->template->set('ArrPermissionDetail', $ArrPermissionDetail);
        $this->template->set('ArrActionPers', $ArrActionPers);
        $this->template->set('auth_permissions', $auth_permissions);

        $this->template->title(lang('users_edit_perm_title'));
        $this->template->page_icon('fa fa-shield');
        $this->template->render('user_permissions');
    }

    protected function save_permission($id_user = 0)
    {
        if ($id_user == 0 || $id_user == "") {
            $this->template->set_message(lang('users_invalid_id'), 'error');
            return FALSE;
        }

        $id_permissions = $this->input->post('id_permissions');

        $insert_data = array();
        if ($id_permissions) {
            foreach ($id_permissions as $key => $idp) {
                $insert_data[] = array(
                    'id_user' => $id_user,
                    'id_permission' => $idp
                );
            }
        }

        //Delete Fisrt All Previous user permission
        $result = $this->user_permissions_model->delete_where(array('id_user' => $id_user));

        //Insert New one
        if ($insert_data) {
            $result = $this->user_permissions_model->insert_batch($insert_data);
        }

        if ($result === FALSE) {
            $this->template->set_message(lang('users_permission_edit_fail'), 'error');
            return FALSE;
        }

        unset($_POST['save']);

        return $result;
    }

    protected function get_auth_permission($id = 0)
    {
        $role_permissions = $this->users_model->select("permissions.*")
            ->join("user_groups", "users.id_user = user_groups.id_user")
            ->join("group_permissions", "user_groups.id_group = group_permissions.id_group")
            ->join("permissions", "group_permissions.id_permission = permissions.id_permission")
            ->where("users.id_user", $id)
            ->find_all();

        $user_permissions = $this->users_model->select("permissions.*")
            ->join("user_permissions", "users.id_user = user_permissions.id_user")
            ->join("permissions", "user_permissions.id_permission = permissions.id_permission")
            ->where("users.id_user", $id)
            ->find_all();

        $merge = array();
        if ($role_permissions) {
            foreach ($role_permissions as $key => $rp) {
                if (!isset($merge[$rp->id_permission])) {
                    $rp->is_role_permission = 1;
                    $merge[$rp->id_permission] = $rp;
                }
            }
        }

        if ($user_permissions) {
            foreach ($user_permissions as $key => $up) {
                if (!isset($merge[$up->id_permission])) {
                    $up->is_role_permission = 0;
                    $merge[$up->id_permission] = $up;
                }
            }
        }

        return $merge;
    }

    protected function save_user($type = 'insert', $id = 0)
    {
        if ($type == "insert") {

            $extra_rule = "|unique[users.username]";
            $rule_email = "|unique[users.email]";
        } else {
            $_POST['id_user'] = $id;
            $extra_rule = "|unique[users.username, users.id_user]";
            $rule_email = "|unique[users.email, users.id_user]";
        }

        $this->form_validation->set_rules('username', 'lang:users_username', 'required' . $extra_rule);
        if ($type == "insert") {
            $this->form_validation->set_rules('password', 'lang:users_password', 'required');
            $this->form_validation->set_rules('re-password', 'lang:users_repassword', 'required|matches[password]');
        } else {
            if (!empty($_POST['password'])) {
                $extra_rule = "|unique[users.username]";
                $this->form_validation->set_rules('password', 'lang:users_password', 'required');
                $this->form_validation->set_rules('re-password', 'lang:users_repassword', 'required|matches[password]');
            }
        }

        $this->form_validation->set_rules('email', 'lang:users_email', 'required|valid_email' . $rule_email);
        $this->form_validation->set_rules('nm_lengkap', 'lang:users_nm_lengkap', 'required');
        $this->form_validation->set_rules('alamat', 'lang:users_alamat', 'required');
        $this->form_validation->set_rules('kota', 'lang:users_kota', 'required');
        $this->form_validation->set_rules('hp', 'lang:users_hp', 'required');
        $this->form_validation->set_rules('st_aktif', 'lang:users_st_aktif', 'required');

        if ($this->form_validation->run($this) === FALSE) {
            $this->template->set_message(validation_errors(), 'error');
            return FALSE;
        }

        $username   = $this->input->post('username');
        $password   = $this->input->post('password');
        $email      = $this->input->post('email');
        $nm_lengkap = $this->input->post('nm_lengkap');
        $alamat     = $this->input->post('alamat');
        $kota       = $this->input->post('kota');
        $hp         = $this->input->post('hp');
        $st_aktif   = $this->input->post('st_aktif');
        $kdcab      = $this->input->post('kdcab');
        $department_id    = $this->input->post('department_id');
        $employee_id    = $this->input->post('employee_id');

        /**
         * This code will benchmark your server to determine how high of a cost you can
         * afford. You want to set the highest cost that you can without slowing down
         * you server too much. 8-10 is a good baseline, and more is good if your servers
         * are fast enough. The code below aims for ≤ 50 milliseconds stretching time,
         * which is a good baseline for systems handling interactive logins.
         */
        $timeTarget = 0.05; // 50 milliseconds

        $cost = 8;
        do {
            $cost++;
            $start = microtime(true);
            password_hash("test", PASSWORD_BCRYPT, ["cost" => $cost]);
            $end = microtime(true);
        } while (($end - $start) < $timeTarget);
        //End finding cost

        $options = [
            'cost' => 12
        ];


        $password = password_hash($password, PASSWORD_DEFAULT);

        if ($type == 'insert') {
            $data_insert = array(
                'username' => $username,
                'password' => $password,
                'email'    => $email,
                'nm_lengkap' => $nm_lengkap,
                'alamat'   => $alamat,
                'kota'     => $kota,
                'hp'       => $hp,
                'ip'        => $this->input->ip_address(),
                'st_aktif' => $st_aktif,
                'kdcab'     => $kdcab,
                'department_id'    => $department_id,
                'employee_id' => $employee_id
            );

            $result = $this->users_model->insert($data_insert);

            if ($result) {
                //Get Default user group
                $dt_group = $this->groups_model->find_by(array('st_default' => 1));
                if ($dt_group) {
                    $id_group = $dt_group->id_group;

                    $insert_group = array(
                        'id_user' => $result,
                        'id_group' => $id_group
                    );

                    $this->user_groups_model->insert($insert_group);
                }

                return TRUE;
            } else {
                $this->template->set_message(lang('users_create_fail') . $this->users_model->error, 'error');
                return FALSE;
            }
        } else {
            $data_insert = array(
                'username' => $username,
                'email'    => $email,
                'nm_lengkap' => $nm_lengkap,
                'alamat'   => $alamat,
                'kota'     => $kota,
                'hp'       => $hp,
                'ip'        => $this->input->ip_address(),
                'st_aktif' => $st_aktif,
                'kdcab'     => $kdcab,
                'department_id'    => $department_id,
                'employee_id' => $employee_id
            );
            if (isset($_POST['password'])) {
                $data_insert['password'] = $password;
            }

            $result = $this->users_model->update($id, $data_insert);

            if ($result) {
                return TRUE;
            } else {
                $this->template->set_message(lang('users_edit_fail') . $this->users_model->error, 'error');
                return FALSE;
            }
        }
    }

    public function default_select($val)
    {
        return $val == "" ? FALSE : TRUE;
    }

    public function getArray($table, $WHERE = array(), $keyArr = '', $valArr = '')
    {
        if ($WHERE) {
            $query = $this->db->get_where($table, $WHERE);
        } else {
            $query = $this->db->get($table);
        }
        $dataArr    = $query->result_array();

        if (!empty($keyArr)) {
            $Arr_Data    = array();
            foreach ($dataArr as $key => $val) {
                $nilai_id                    = $val[$keyArr];
                if (!empty($valArr)) {
                    $nilai_val                = $val[$valArr];
                    $Arr_Data[$nilai_id]    = $nilai_val;
                } else {
                    $Arr_Data[$nilai_id]    = $val;
                }
            }

            return $Arr_Data;
        } else {
            return $dataArr;
        }
    }
}
