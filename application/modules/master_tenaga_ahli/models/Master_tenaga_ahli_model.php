<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/*
 * @author Harboens
 * @copyright Copyright (c) 2020
 *
 * This is model class for table "Budget Rutin"
 */

class Master_tenaga_ahli_model extends BF_Model
{
    protected $ENABLE_ADD;
    protected $ENABLE_MANAGE;
    protected $ENABLE_VIEW;
    protected $ENABLE_DELETE;

    protected $gl;

    public function __construct()
    {
        $this->ENABLE_ADD     = 'Master_Tenaga_Ahli.Add';
        $this->ENABLE_MANAGE  = 'Master_Tenaga_Ahli.Manage';
        $this->ENABLE_VIEW    = 'Master_Tenaga_Ahli.View';
        $this->ENABLE_DELETE  = 'Master_Tenaga_Ahli.Delete';

        $this->gl = $this->load->database('gl_sendigs', true);
    }

    public function get_data_biaya()
    {
        $draw = $this->input->post('draw');
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $search = $this->input->post('search');

        $this->db->select('a.id, a.nm_biaya, a.no_coa, a.nm_coa');
        $this->db->from('kons_master_tenaga_ahli a');
        $this->db->where('a.deleted_by', null);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.nm_biaya', $search['value'], 'both');
            $this->db->group_end();
        }
        $this->db->order_by('a.id', 'desc');
        $this->db->limit($length, $start);

        $get_data_biaya = $this->db->get();

        $hasil = [];

        $no = 1;
        foreach ($get_data_biaya->result() as $item) {

            $edit = '';
            $delete = '';

            if (has_permission($this->ENABLE_MANAGE)) {
                $edit = '<button type="button" class="btn btn-sm btn-warning edit_biaya_modal" data-id="' . $item->id . '" title="Edit Biaya"><i class="fa fa-pencil"></i></button>';
            }

            if (has_permission($this->ENABLE_DELETE)) {
                $delete = '<button type="button" class="btn btn-sm btn-sm btn-danger del_biaya" data-id="' . $item->id . '" title="Delete Biaya"><i class="fa fa-trash"></i></button>';
            }

            $buttons = $edit . ' ' . $delete;

            $coa = '';
            if ($item->no_coa !== null && $item->nm_coa !== null) {
                $coa = '(' . $item->no_coa . ') - ' . $item->nm_coa;
            }

            $hasil[] = [
                'no' => $no,
                'nm_biaya' => $item->nm_biaya,
                'coa' => $coa,
                'option' => $buttons
            ];

            $no++;
        }

        echo json_encode([
            'draw' => intval($draw),
            'recordsTotal' => $get_data_biaya->num_rows(),
            'recordsFiltered' => $get_data_biaya->num_rows(),
            'data' => $hasil
        ]);
    }

    public function get_coa_all()
    {
        $this->gl->select('a.no_perkiraan, a.nama as nm_coa');
        $this->gl->from('coa_master a');
        $get_coa = $this->gl->get();

        return $get_coa->result();
    }
}
