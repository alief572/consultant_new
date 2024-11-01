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

    function generate_id_spk_budgeting()
    {
        $Ym             = date('ym');
        $srcMtr            = "SELECT MAX(id_spk_penawaran) as maxP FROM kons_tr_spk_penawaran WHERE id_spk_penawaran LIKE '%SPK-BUDGET/" . date('y') . "/" . date('m') . "%' ";
        $resultMtr        = $this->db->query($srcMtr)->result_array();
        $angkaUrut2        = $resultMtr[0]['maxP'];
        $urutan2        = (int)substr($angkaUrut2, 0, 3);
        $urutan2++;
        $urut2            = sprintf('%03s', $urutan2);
        $kode_trans        = "SPK-BUDGET/" . date('y') . "/" . date('m') . "/" . $urut2;

        return $kode_trans;
    }
}
