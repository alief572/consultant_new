<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Consultation_report_model extends BF_Model
{

    public function __construct()
    {
        parent::__construct();

        $this->ENABLE_ADD     = has_permission('Consultation_Report.Add');
        $this->ENABLE_MANAGE  = has_permission('Consultation_Report.Manage');
        $this->ENABLE_VIEW    = has_permission('Consultation_Report.View');
        $this->ENABLE_DELETE  = has_permission('Consultation_Report.Delete');
    }
}
