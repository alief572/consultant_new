<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Employee_model extends BF_Model
{

  public function __construct()
  {
      parent::__construct();
      $this->table_name = 'employee';
      $this->key        = 'id';
      $this->code       = 'id';
  }

 public function get_data($array_where){
    $this->db->select('employee.*, ms_department.nama AS department_name');
    $this->db->from($this->table_name);
    $this->db->join('ms_department', 'ms_department.id = employee.department', 'left');
    if(!empty($array_where)){
      foreach($array_where as $key => $val){
        // Prefix ke tabel employee agar tidak ambigu setelah JOIN.
        if(strpos($key, '.') === FALSE){
          $key = $this->table_name.'.'.$key;
        }
        $this->db->where($key, $val);
      }
    }
    $query = $this->db->get();

    return $query->result();
 }

  public function get_detail($id){
    $this->db->select('employee.*, ms_department.nama AS department_name');
    $this->db->from($this->table_name);
    $this->db->join('ms_department', 'ms_department.id = employee.department', 'left');
    $this->db->where('employee.id', $id);
    $this->db->where('employee.deleted_date', NULL);
    $query = $this->db->get();

    return $query->row();
  }

   function getById($id)
   {
      return $this->db->get_where($this->table_name,array($this->key => $id))->row_array();
   }

}