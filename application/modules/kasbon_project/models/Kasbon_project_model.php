<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Kasbon_project_model extends BF_Model
{

    public function __construct()
    {
        parent::__construct();

        $this->ENABLE_ADD     = has_permission('Kasbon_Project.Add');
        $this->ENABLE_MANAGE  = has_permission('Kasbon_Project.Manage');
        $this->ENABLE_VIEW    = has_permission('Kasbon_Project.View');
        $this->ENABLE_DELETE  = has_permission('Kasbon_Project.Delete');
    }

    function generate_id_kasbon_subcont($no_tambah)
    {
        $Ym             = date('ym');
        $srcMtr            = "SELECT MAX(id_kasbon_subcont) as maxP FROM kons_tr_kasbon_project_subcont WHERE id_kasbon_subcont LIKE '%/REQ/V/" . date('Y') . "%' ";
        $resultMtr        = $this->db->query($srcMtr)->result_array();
        $angkaUrut2        = $resultMtr[0]['maxP'];
        $urutan2        = (int)substr($angkaUrut2, 0, 4);
        $urutan2 += $no_tambah;
        $urut2            = sprintf('%04s', $urutan2);
        $kode_trans        = $urut2 . '/REQ/V/' . date('Y');

        return $kode_trans;
    }
}
