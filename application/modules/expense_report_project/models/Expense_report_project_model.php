<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Expense_report_project_model extends BF_Model
{

    public function __construct()
    {
        parent::__construct();

        $this->ENABLE_ADD     = has_permission('Expense_Report_Project.Add');
        $this->ENABLE_MANAGE  = has_permission('Expense_Report_Project.Manage');
        $this->ENABLE_VIEW    = has_permission('Expense_Report_Project.View');
        $this->ENABLE_DELETE  = has_permission('Expense_Report_Project.Delete');
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
}