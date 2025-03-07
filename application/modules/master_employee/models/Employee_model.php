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
  if(!empty($array_where)){
    $query = $this->db->get_where($this->table_name, $array_where);
  }
      else{
    $query = $this->db->get($this->table_name);
  }
  
  return $query->result();
}

  function getById($id)
  {
     return $this->db->get_where($this->table_name,array($code => $id))->row_array();
  }

}