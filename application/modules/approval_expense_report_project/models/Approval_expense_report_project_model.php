<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Approval_expense_report_project_model extends BF_Model
{

    public function __construct()
    {
        parent::__construct();

        $this->ENABLE_ADD     = has_permission('Approval_expense_Report_Project.Add');
        $this->ENABLE_MANAGE  = has_permission('Approval_expense_Report_Project.Manage');
        $this->ENABLE_VIEW    = has_permission('Approval_expense_Report_Project.View');
        $this->ENABLE_DELETE  = has_permission('Approval_expense_Report_Project.Delete');
    }

    function generate_id_expense_report_header()
    {
        $Ym             = date('ym');
        $srcMtr            = "SELECT MAX(id) as maxP FROM kons_tr_expense_report_project_header WHERE id LIKE '%/EXP/H/" . date('Y') . "%' ";
        $resultMtr        = $this->db->query($srcMtr)->result_array();
        $angkaUrut2        = $resultMtr[0]['maxP'];
        $urutan2        = (int)substr($angkaUrut2, 0, 4);
        $urutan2++;
        $urut2            = sprintf('%04s', $urutan2);
        $kode_trans        = $urut2 . '/EXP/H/' . date('Y');

        return $kode_trans;
    }

    function GetAutoGenerate($tipe)
	{
		$newcode = '';
		$data = $this->db->get_where(DBSF.'.ms_generate', array('tipe' => $tipe))->row();
		if ($data !== false) {
			if (stripos($data->info, 'YEAR', 0) !== false) {
				if ($data->info3 != date("Y")) {
					$years = date("Y");
					$number = 1;
					$newnumber = sprintf('%0' . $data->info4 . 'd', $number);
				} else {
					$years = $data->info3;
					$number = ($data->info2 + 1);
					$newnumber = sprintf('%0' . $data->info4 . 'd', $number);
				}
				$newcode = str_ireplace('XXXX', $newnumber, $data->info);
				$newcode = str_ireplace('YEAR', $years, $newcode);
				$newdata = array('info2' => $number, 'info3' => $years);
			} else {
				$number = ($data->info2 + 1);
				$newnumber = sprintf('%0' . $data->info4 . 'd', $number);
				$newcode = str_ireplace('XXXX', $newnumber, $data->info);
				$newdata = array('info2' => $number);
			}
			$this->db->update(DBSF.'.ms_generate', $newdata, array('tipe' => $tipe));
			return $newcode;
		} else {
			return false;
		}
	}
}
