<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/*
 * @author Harboens
 * @copyright Copyright (c) 2020
 *
 * This is model class for table "Budget Rutin"
 */

class Master_lab_model extends BF_Model
{
    public function __construct()
    {
        $this->ENABLE_ADD     = 'Master_Lab.Add';
        $this->ENABLE_MANAGE  = 'Master_Lab.Manage';
        $this->ENABLE_VIEW    = 'Master_Lab.View';
        $this->ENABLE_DELETE  = 'Master_Lab.Delete';
    }

    public function save_lab()
    {
        $post = $this->input->post();

        $id = (isset($post['id'])) ? $post['id'] : '';
        $isu_lingkungan = $post['isu_lingkungan'];
        $waktu = $post['waktu'];
        $harga_ssc = str_replace(',', '', $post['harga_ssc']);
        $harga_lab = str_replace(',', '', $post['harga_lab']);
        $peraturan = $post['peraturan'];

        $this->db->trans_begin();

        if ($id == '') {
            $data_insert = [
                'isu_lingkungan' => $isu_lingkungan,
                'peraturan' => $peraturan,
                'waktu' => $waktu,
                'harga_ssc' => $harga_ssc,
                'harga_lab' => $harga_lab,
                'created_by' => $this->auth->user_id(),
                'created_date' => date('Y-m-d H:i:s')
            ];

            $insert_lab = $this->db->insert('kons_master_lab', $data_insert);
            if (!$insert_lab) {
                $this->db->trans_rollback();

                print_r($this->db->last_query());
                exit;
            }

            if ($this->db->trans_status() === false) {
                $this->db->trans_rollback();

                $valid = 0;
                $pesan = 'Please try again later !';
            } else {
                $this->db->trans_commit();

                $valid = 1;
                $pesan = 'Data has been saved !';
            }
        } else {
            $data_update = [
                'isu_lingkungan' => $isu_lingkungan,
                'peraturan' => $peraturan,
                'waktu' => $waktu,
                'harga_ssc' => $harga_ssc,
                'harga_lab' => $harga_lab,
                'updated_by' => $this->auth->user_id(),
                'updated_date' => date('Y-m-d H:i:s')
            ];

            $update_lab = $this->db->update('kons_master_lab', $data_update, array('id' => $id));
            if (!$update_lab) {
                $this->db->trans_rollback();

                print_r($this->db->last_query());
                exit;
            }

            if ($this->db->trans_status() === false) {
                $this->db->trans_rollback();

                $valid = 0;
                $pesan = 'Please try again later !';
            } else {
                $this->db->trans_commit();

                $valid = 1;
                $pesan = 'Data has been updated !';
            }
        }

        echo json_encode([
            'status' => $valid,
            'pesan' => $pesan
        ]);
    }

    public function del_lab($id) {
        $this->db->trans_begin();

        $delete_lab = $this->db->update('kons_master_lab', array('deleted_by' => $this->auth->user_id(), 'deleted_date' => date('Y-m-d H:i:s')), array('id' => $id));
        if (!$delete_lab) {
            $this->db->trans_rollback();

            print_r($this->db->last_query());
            exit;
        }

        if ($this->db->trans_status() === false) {
            $this->db->trans_rollback();

            $valid = 0;
            $pesan = 'Please try again later !';
        } else {
            $this->db->trans_commit();

            $valid = 1;
            $pesan = 'Data has been deleted !';
        }

        echo json_encode([
            'status' => $valid,
            'pesan' => $pesan
        ]);
    }

    public function get_data_spec($id)
    {
        $this->db->select('a.id, a.isu_lingkungan, a.peraturan, a.waktu, a.harga_ssc, a.harga_lab');
        $this->db->from('kons_master_lab a');
        $this->db->where('a.id', $id);
        $get_data = $this->db->get()->row();

        return $get_data;
    }

    public function get_data_lab()
    {
        $draw = $this->input->post('draw');
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $search = $this->input->post('search');

        $this->db->select('a.id, a.isu_lingkungan, a.peraturan, a.waktu, a.harga_ssc, a.harga_lab');
        $this->db->from('kons_master_lab a');
        $this->db->where('a.deleted_by', null);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.isu_lingkungan', $search['value'], 'both');
            $this->db->or_like('a.peraturan', $search['value'], 'both');
            $this->db->or_like('a.waktu', $search['value'], 'both');
            $this->db->or_like('a.harga_ssc', $search['value'], 'both');
            $this->db->or_like('a.harga_lab', $search['value'], 'both');
            $this->db->group_end();
        }
        $this->db->order_by('a.id', 'asc');
        $this->db->limit($length, $start);
        $get_data = $this->db->get();

        $this->db->select('a.id, a.isu_lingkungan, a.peraturan, a.waktu, a.harga_ssc, a.harga_lab');
        $this->db->from('kons_master_lab a');
        $this->db->where('a.deleted_by', null);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.isu_lingkungan', $search['value'], 'both');
            $this->db->or_like('a.peraturan', $search['value'], 'both');
            $this->db->or_like('a.waktu', $search['value'], 'both');
            $this->db->or_like('a.harga_ssc', $search['value'], 'both');
            $this->db->or_like('a.harga_lab', $search['value'], 'both');
            $this->db->group_end();
        }
        $this->db->order_by('a.id', 'asc');
        $get_data_all = $this->db->get();

        $hasil = [];

        $no = 0;
        foreach ($get_data->result() as $item) {
            $no++;

            $option = '<button type="button" class="btn btn-sm btn-info view_lab" data-id="' . $item->id . '" title="View Lab"><i class="fa fa-eye"></i></button>';
            $option .= ' <button type="button" class="btn btn-sm btn-warning edit_lab" data-id="' . $item->id . '" title="Edit Lab"><i class="fa fa-pencil"></i></button>';
            $option .= ' <button type="button" class="btn btn-sm btn-danger del_lab" data-id="' . $item->id . '" title="Delete Lab"><i class="fa fa-trash"></i></button>';

            if (!has_permission($this->ENABLE_MANAGE)) {
                $option = '';
            }

            $hasil[] = [
                'no' => $no,
                'isu_lingkungan' => $item->isu_lingkungan,
                'peraturan' => $item->peraturan,
                'waktu' => $item->waktu . ' Jam',
                'harga_ssc' => number_format($item->harga_ssc, 2),
                'harga_lab' => number_format($item->harga_lab, 2),
                'option' => $option
            ];
        }

        echo json_encode([
            'draw' => intval($draw),
            'recordsTotal' => $get_data_all->num_rows(),
            'recordsFiltered' => $get_data_all->num_rows(),
            'data' => $hasil
        ]);
    }
}
