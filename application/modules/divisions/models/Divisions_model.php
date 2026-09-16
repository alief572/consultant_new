<?php

class divisions_model extends BF_Model
{

    public function __construct()
    {
        parent::__construct();
        // Your own constructor code

    }

    public function get_data_divisions()
    {
        $draw = (int) $this->input->post('draw');
        $start = (int) $this->input->post('start');
        $length = (int) $this->input->post('length');
        $search = $this->input->post('search');
        $order = $this->input->post('order');
        $search_value = is_array($search) && isset($search['value']) ? trim((string) $search['value']) : '';

        $columns = array(
            0 => 'no',
            1 => 'a.id',
            2 => 'a.name',
            3 => 'b.name',
            4 => 'option'
        );

        // Total tanpa filter.
        $this->db->from('hr_sentral.divisions a');
        $recordsTotal = $this->db->count_all_results();

        // Terapkan search dengan OR agar salah satu kolom cocok sudah tampil.
        $this->db->from('hr_sentral.divisions a');
        $this->db->join('hr_sentral.companies b', 'b.id = a.company_id', 'left');
        if ($search_value !== '') {
            $this->db->group_start();
            $this->db->like('a.id', $search_value);
            $this->db->or_like('a.name', $search_value);
            $this->db->or_like('b.name', $search_value);
            $this->db->group_end();
        }
        $tempdb = clone $this->db;
        $recordsFiltered = $tempdb->count_all_results('', FALSE);

        // Ambil data + ordering + paging.
        $this->db->select('a.id, a.name, a.company_id, b.name as company_name');
        if (is_array($order) && isset($order[0]['column']) && isset($columns[$order[0]['column']])) {
            $colIdx = (int) $order[0]['column'];
            $dir = (isset($order[0]['dir']) && strtolower($order[0]['dir']) === 'desc') ? 'DESC' : 'ASC';
            if ($colIdx === 1 || $colIdx === 2 || $colIdx === 3) {
                $this->db->order_by($columns[$colIdx], $dir);
            } else {
                $this->db->order_by('a.id', 'ASC');
            }
        } else {
            $this->db->order_by('a.id', 'ASC');
        }
        if ($length > 0) {
            $this->db->limit($length, max(0, $start));
        }
        $query = $this->db->get();

        $hasil = [];
        $no = max(0, $start) + 1;
        foreach ($query->result() as $datas) {
            // View-only: hanya tombol detail.
            $button = "<a href='" . site_url('divisions/view/' . rawurlencode($datas->id)) . "' class='btn btn-sm btn-warning' title='Lihat Detail'><i class='fa fa-eye'></i></a>";

            $hasil[] = [
                'no' => $no++,
                'id' => $datas->id,
                'name' => $datas->name,
                'company_name' => $datas->company_name,
                'option' => $button
            ];
        }

        echo json_encode([
            'draw' => $draw,
            'recordsTotal' => (int) $recordsTotal,
            'recordsFiltered' => (int) $recordsFiltered,
            'data' => $hasil
        ]);
    }
}
