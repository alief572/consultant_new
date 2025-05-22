<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}


class Penawaran extends Admin_Controller
{
    public function fill_lab()
    {

        $arr_insert_lab = [];

        $this->db->select('a.*');
        $this->db->from('kons_tr_spk_budgeting a');
        $this->db->join('kons_tr_penawaran_lab b', 'b.id_penawaran = a.id_penawaran');
        $this->db->group_by('a.id_penawaran');
        $get_budgeting = $this->db->get()->result();

        foreach ($get_budgeting as $item) :
            $get_penawaran_lab = $this->db->get_where('kons_tr_penawaran_lab a', array('id_penawaran' => $item->id_penawaran))->result();
            foreach ($get_penawaran_lab as $item_lab) :
                $get_budgeting_lab =  $this->db->get_where('kons_tr_spk_budgeting_lab', array('id_lab' => $item_lab->id))->row();
                if (count($get_budgeting_lab) < 1) {

                    $get_lab = $this->db->get_where('kons_master_lab', array('id' => $item_lab->id_item))->row();

                    $nm_item = (!empty($get_lab)) ? $get_lab->isu_lingkungan : '';

                    $arr_insert_lab[] = [
                        'id_spk_penawaran' => $item->id_spk_penawaran,
                        'id_spk_budgeting' => $item->id_spk_budgeting,
                        'id_penawaran' => $item->id_penawaran,
                        'id_lab' => $item_lab->id,
                        'id_item' => $item_lab->id_item,
                        'nm_item' => $nm_item,
                        
                    ];
                }
            endforeach;
        endforeach;
    }
}
