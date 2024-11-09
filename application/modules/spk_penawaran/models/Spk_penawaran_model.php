<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Spk_penawaran_model extends BF_Model
{

    public function __construct()
    {
        parent::__construct();

        $this->ENABLE_ADD     = has_permission('SPK_penawaran.Add');
        $this->ENABLE_MANAGE  = has_permission('SPK_penawaran.Manage');
        $this->ENABLE_VIEW    = has_permission('SPK_penawaran.View');
        $this->ENABLE_DELETE  = has_permission('SPK_penawaran.Delete');
    }

    function generate_id_spk_penawaran()
    {
        $Ym             = date('ym');
        $srcMtr            = "SELECT MAX(id_spk_penawaran) as maxP FROM kons_tr_spk_penawaran WHERE id_spk_penawaran LIKE '%/STM/MKT-SPK/" . int_to_roman(date('m')) . "/" . date('y') . "%' ";
        $resultMtr        = $this->db->query($srcMtr)->result_array();
        $angkaUrut2        = $resultMtr[0]['maxP'];
        $urutan2        = (int)substr($angkaUrut2, 0, 3);
        $urutan2++;
        $urut2            = sprintf('%03s', $urutan2);
        $kode_trans        = $urut2 . '/STM/MKT-SPK/' . int_to_roman(date('m')) . '/' . date('y');

        return $kode_trans;
    }
}
