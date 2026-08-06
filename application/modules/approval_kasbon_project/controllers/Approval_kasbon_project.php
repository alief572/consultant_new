<?php
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

/*
 * @author Harboens
 * @copyright Copyright (c) 2020
 *
 * This is controller for Pengajuan Rutin
 */

$status = array();
class Approval_kasbon_project extends Admin_Controller
{
    //Permission
    protected $viewPermission     = 'Approval_Kasbon_Project.View';
    protected $addPermission      = 'Approval_Kasbon_Project.Add';
    protected $managePermission = 'Approval_Kasbon_Project.Manage';
    protected $deletePermission = 'Approval_Kasbon_Project.Delete';

    protected $otherdb;

    public function __construct()
    {
        parent::__construct();
        $this->template->title('Approval Kasbon Project');
        $this->template->page_icon('fa fa-cubes');
        $this->load->library('upload');
        $this->load->model(array('Approval_kasbon_project/Approval_kasbon_project_model'));
        date_default_timezone_set('Asia/Bangkok');

        $this->otherdb = $this->load->database('sendigs_finance', TRUE);
    }

    public function index()
    {
        $this->auth->restrict($this->viewPermission);
        $this->template->title('Approval Pengajuan');
        $this->template->render('index');
    }

    public function get_data_spk()
    {
        $draw = $this->input->post('draw');
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $search = $this->input->post('search');

        $this->db->select('b.*, a.id, c.nm_sales, d.nm_paket');
        $this->db->from('kons_tr_kasbon_project_header a');
        $this->db->join('kons_tr_spk_budgeting b', 'b.id_spk_budgeting = a.id_spk_budgeting', 'left');
        $this->db->join('kons_tr_spk_penawaran c', 'c.id_spk_penawaran = b.id_spk_penawaran', 'left');
        $this->db->join('kons_master_konsultasi_header d', 'd.id_konsultasi_h = c.id_project', 'left');
        $this->db->where('a.deleted_at IS NULL');
        $this->db->where('a.sts_reject IS NULL');
        $this->db->group_start();
        $this->db->where('a.sts', '');
        $this->db->or_where('a.sts', null);
        $this->db->group_end();
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.id_spk_budgeting', $search['value'], 'both');
            $this->db->or_like('a.id', $search['value'], 'both');
            $this->db->or_like('c.id_spk_penawaran', $search['value'], 'both');
            $this->db->or_like('b.nm_customer', $search['value'], 'both');
            $this->db->or_like('c.nm_sales', $search['value'], 'both');
            $this->db->or_like('b.nm_project_leader', $search['value'], 'both');
            $this->db->or_like('b.nm_project', $search['value'], 'both');
            $this->db->group_end();
        }
        $this->db->group_by('a.id');
        $this->db->order_by('a.created_date', 'desc');

        $db_clone = clone $this->db;
        $count_all = $db_clone->count_all_results();

        $this->db->limit($length, $start);

        $get_data = $this->db->get();

        $hasil = [];

        $no = 1;
        foreach ($get_data->result() as $item) {

            $status = '<div class="badge bg-blue">Waiting Approval</div>';
            if ($item->sts == 2) {
                $status = '<div class="badge bg-red">Rejected</div>';
            }

            $option = '<a href="' . base_url('approval_kasbon_project/approval_kasbon/' . urlencode(str_replace('/', '|', $item->id))) . '" class="btn btn-sm btn-primary" title="Approval Kasbon"><i class="fa fa-arrow-up"></i></a>';

            $this->db->select('a.*');
            $this->db->from('kons_tr_kasbon_project_header a');
            $this->db->where('a.id', $item->id);
            $get_header_kasbon = $this->db->get()->row();

            $keterangan = (!empty($get_header_kasbon)) ? $get_header_kasbon->deskripsi : '';
            $tipe = '';
            $tipe_pengajuan = '';
            if (!empty($get_header_kasbon)) {
                if ($get_header_kasbon->tipe == '1') {
                    $tipe = '<div class="badge bg-blue">Subcont</div>';
                }
                if ($get_header_kasbon->tipe == '2') {
                    $tipe = '<div class="badge bg-yellow">Akomodasi</div>';
                }
                if ($get_header_kasbon->tipe == '3') {
                    $tipe = '<div class="badge bg-gray">Others</div>';
                }
                if ($get_header_kasbon->tipe == '4') {
                    $tipe = '<div class="badge bg-green">Lab</div>';
                }
                if ($get_header_kasbon->tipe == '5') {
                    $tipe = '<div class="badge bg-red">Subcont Tenaga Ahli</div>';
                }
                if ($get_header_kasbon->tipe == '6') {
                    $tipe = '<div class="badge bg-purple">Subcont Perusahaan</div>';
                }

                if ($get_header_kasbon->metode_pembayaran == '1') {
                    $tipe_pengajuan = '<div class="badge bg-green">Kasbon</div>';
                }
                if ($get_header_kasbon->metode_pembayaran == '2') {
                    $tipe_pengajuan = '<div class="badge bg-yellow">Direct Payment</div>';
                }
                if ($get_header_kasbon->metode_pembayaran == '3') {
                    $tipe_pengajuan = '<div class="badge bg-red">PO</div>';
                }
            }
            $nominal = (!empty($get_header_kasbon)) ? $get_header_kasbon->grand_total : 0;


            $hasil[] = [
                'no' => $no,
                'id_spk_penawaran' => $item->id_spk_penawaran,
                'id_kasbon' => $item->id,
                'nm_customer' => $item->nm_customer,
                'nm_sales' => ucfirst($item->nm_sales),
                'nm_project_leader' => ucfirst($item->nm_project_leader),
                'nm_project' => $item->nm_paket,
                'keterangan' => $keterangan,
                'tipe' => $tipe,
                'tipe_pembayaran' => $tipe_pengajuan,
                'nominal' => number_format($nominal),
                'option' => $option
            ];

            $no++;
        }

        echo json_encode([
            'draw' => intval($draw),
            'recordsTotal' => $count_all,
            'recordsFiltered' => $count_all,
            'data' => $hasil
        ]);
    }

    public function approval_kasbon($id_kasbon)
    {
        $id_kasbon = urldecode($id_kasbon);
        $id_kasbon = str_replace('|', '/', $id_kasbon);

        $get_header = $this->db->get_where('kons_tr_kasbon_project_header', ['id' => $id_kasbon, 'deleted_at' => NULL])->row();

        if (empty($get_header)) {
            $this->session->set_flashdata('alert_data', '<div class="alert alert-warning" id="flash-message">Data tidak ditemukan</div>');
            redirect(site_url('approval_kasbon_project'));
            return;
        }

        $id_spk_budgeting = $get_header->id_spk_budgeting;

        $this->db->select('a.*, b.nm_sales, b.waktu_from, b.waktu_to, c.nm_paket');
        $this->db->from('kons_tr_spk_budgeting a');
        $this->db->join('kons_tr_spk_penawaran b', 'b.id_spk_penawaran = a.id_spk_penawaran', 'left');
        $this->db->join('kons_master_konsultasi_header c', 'c.id_konsultasi_h = a.id_project', 'left');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $get_budgeting = $this->db->get()->row();

        $this->db->select('a.*');
        $this->db->from('kons_tr_kasbon_project_subcont a');
        $this->db->where('a.id_header', $id_kasbon);
        $this->db->where('a.sts', null);
        $this->db->where('a.custom_subcont', '0');
        $get_kasbon_subcont = $this->db->get()->result();

        $this->db->from('kons_tr_kasbon_project_subcont a');
        $this->db->where('a.id_header', $id_kasbon);
        $this->db->where('a.sts', null);
        $this->db->where('a.custom_subcont', '1');
        $get_kasbon_subcont_custom = $this->db->get()->result();

        // ----------------------------------------------------
        // Tipe 2: AKOMODASI
        // ----------------------------------------------------
        $this->db->select('a.*, b.nm_biaya');
        $this->db->from('kons_tr_kasbon_project_akomodasi a');
        $this->db->join('kons_master_biaya b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_header', $id_kasbon);
        $this->db->where('a.sts', null);
        $get_kasbon_akomodasi_submitted = $this->db->get()->result();

        $submitted_akomodasi = [];
        foreach ($get_kasbon_akomodasi_submitted as $item) {
            $submitted_akomodasi[$item->id_akomodasi] = $item;
        }

        $this->db->select('a.id_akomodasi, SUM(a.qty_pengajuan) as ttl_qty_pengajuan, SUM(a.total_pengajuan) as ttl_total_pengajuan');
        $this->db->from('kons_tr_kasbon_project_akomodasi a');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $this->db->where('a.id_header !=', $id_kasbon);
        $this->db->where('a.deleted_at IS NULL');
        $this->db->group_by('a.id_akomodasi');
        $get_prior_akomodasi = $this->db->get()->result();

        $prior_akomodasi_map = [];
        foreach ($get_prior_akomodasi as $p) {
            $prior_akomodasi_map[$p->id_akomodasi] = $p;
        }

        $this->db->select('b.id_detail, SUM(b.budget_tambahan) as total_budget_tambahan, SUM(b.qty_budget_tambahan) as ttl_qty_tambahan');
        $this->db->from('kons_tr_kasbon_req_ovb_akomodasi_header a');
        $this->db->join('kons_tr_kasbon_req_ovb_akomodasi_detail b', 'b.id_request_ovb = a.id_request_ovb');
        $this->db->where('a.tipe', 2);
        $this->db->where('a.sts', 1);
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $this->db->group_by('b.id_detail');
        $get_ovb_akomodasi_agg = $this->db->get()->result();

        $ovb_akomodasi_map = [];
        foreach ($get_ovb_akomodasi_agg as $o) {
            $ovb_akomodasi_map[$o->id_detail] = $o;
        }

        $this->db->select('a.*, b.nm_biaya');
        $this->db->from('kons_tr_spk_budgeting_akomodasi a');
        $this->db->join('kons_master_biaya b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $get_budgeting_akomodasi = $this->db->get()->result();

        $get_kasbon_akomodasi = [];
        $processed_akomodasi_ids = [];

        foreach ($get_budgeting_akomodasi as $b_item) {
            $item_id = $b_item->id;
            $processed_akomodasi_ids[] = $item_id;

            if (isset($submitted_akomodasi[$item_id])) {
                $get_kasbon_akomodasi[] = $submitted_akomodasi[$item_id];
            } else {
                $prior_qty = isset($prior_akomodasi_map[$item_id]) ? (float)$prior_akomodasi_map[$item_id]->ttl_qty_pengajuan : 0;
                $prior_total = isset($prior_akomodasi_map[$item_id]) ? (float)$prior_akomodasi_map[$item_id]->ttl_total_pengajuan : 0;

                $ovb_qty = isset($ovb_akomodasi_map[$item_id]) ? (float)$ovb_akomodasi_map[$item_id]->ttl_qty_tambahan : 0;
                $ovb_total = isset($ovb_akomodasi_map[$item_id]) ? (float)$ovb_akomodasi_map[$item_id]->total_budget_tambahan : 0;
                $ovb_nominal = ($ovb_qty > 0) ? ($ovb_total / $ovb_qty) : 0;

                $qty_estimasi = (float)$b_item->qty_final;
                $price_unit_estimasi = (float)$b_item->price_unit_final;
                $total_budget_estimasi = (float)$b_item->total_final;

                $qty_terpakai = $prior_qty;
                $nominal_terpakai = $price_unit_estimasi;
                $total_terpakai = $prior_total;

                $qty_overbudget = $ovb_qty;
                $nominal_overbudget = $ovb_nominal;
                $total_overbudget = $ovb_total;

                $sisa_budget = ($total_budget_estimasi - $total_terpakai + $total_overbudget);
                $aktual_terpakai = $qty_terpakai;

                $obj = new stdClass();
                $obj->id_header = $id_kasbon;
                $obj->id_spk_budgeting = $id_spk_budgeting;
                $obj->id_spk_penawaran = $b_item->id_spk_penawaran;
                $obj->id_penawaran = $b_item->id_penawaran;
                $obj->id_akomodasi = $item_id;
                $obj->id_item = $b_item->id_item;
                $obj->nm_item = $b_item->nm_item;
                $obj->nm_biaya = !empty($b_item->nm_biaya) ? $b_item->nm_biaya : $b_item->nm_item;
                $obj->qty_pengajuan = 0;
                $obj->nominal_pengajuan = 0;
                $obj->total_pengajuan = 0;
                $obj->qty_estimasi = $qty_estimasi;
                $obj->price_unit_estimasi = $price_unit_estimasi;
                $obj->total_budget_estimasi = $total_budget_estimasi;
                $obj->qty_budget_tambahan = $ovb_qty;
                $obj->budget_tambahan = $ovb_total;
                $obj->aktual_terpakai = $aktual_terpakai;
                $obj->sisa_budget = $sisa_budget;
                $obj->qty_terpakai = $qty_terpakai;
                $obj->nominal_terpakai = $nominal_terpakai;
                $obj->total_terpakai = $total_terpakai;
                $obj->qty_overbudget = $qty_overbudget;
                $obj->nominal_overbudget = $nominal_overbudget;
                $obj->total_overbudget = $total_overbudget;
                $obj->custom_akomodasi = 0;

                $get_kasbon_akomodasi[] = $obj;
            }
        }

        foreach ($submitted_akomodasi as $item_id => $s_item) {
            if (!in_array($item_id, $processed_akomodasi_ids)) {
                $get_kasbon_akomodasi[] = $s_item;
            }
        }

        // ----------------------------------------------------
        // Tipe 3: OTHERS
        // ----------------------------------------------------
        $this->db->select('a.*, IF(a.custom_others = 1, a.nm_item, b.nm_biaya) as nm_biaya');
        $this->db->from('kons_tr_kasbon_project_others a');
        $this->db->join('kons_master_biaya b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_header', $id_kasbon);
        $this->db->where('a.sts', null);
        $get_kasbon_others_submitted = $this->db->get()->result();

        $submitted_others = [];
        foreach ($get_kasbon_others_submitted as $item) {
            $submitted_others[$item->id_others] = $item;
        }

        $this->db->select('a.id_others, SUM(a.qty_pengajuan) as ttl_qty_pengajuan, SUM(a.total_pengajuan) as ttl_total_pengajuan');
        $this->db->from('kons_tr_kasbon_project_others a');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $this->db->where('a.id_header !=', $id_kasbon);
        $this->db->where('a.deleted_at IS NULL');
        $this->db->group_by('a.id_others');
        $get_prior_others = $this->db->get()->result();

        $prior_others_map = [];
        foreach ($get_prior_others as $p) {
            $prior_others_map[$p->id_others] = $p;
        }

        $this->db->select('b.id_detail, SUM(b.budget_tambahan) as total_budget_tambahan, SUM(b.qty_budget_tambahan) as ttl_qty_tambahan');
        $this->db->from('kons_tr_kasbon_req_ovb_others_header a');
        $this->db->join('kons_tr_kasbon_req_ovb_others_detail b', 'b.id_request_ovb = a.id_request_ovb');
        $this->db->where('a.tipe', 3);
        $this->db->where('a.sts', 1);
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $this->db->group_by('b.id_detail');
        $get_ovb_others_agg = $this->db->get()->result();

        $ovb_others_map = [];
        foreach ($get_ovb_others_agg as $o) {
            $ovb_others_map[$o->id_detail] = $o;
        }

        $this->db->select('a.*, b.nm_biaya');
        $this->db->from('kons_tr_spk_budgeting_others a');
        $this->db->join('kons_master_biaya b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $get_budgeting_others = $this->db->get()->result();

        $get_kasbon_others = [];
        $processed_others_ids = [];

        foreach ($get_budgeting_others as $b_item) {
            $item_id = $b_item->id;
            $processed_others_ids[] = $item_id;

            if (isset($submitted_others[$item_id])) {
                $get_kasbon_others[] = $submitted_others[$item_id];
            } else {
                $prior_qty = isset($prior_others_map[$item_id]) ? (float)$prior_others_map[$item_id]->ttl_qty_pengajuan : 0;
                $prior_total = isset($prior_others_map[$item_id]) ? (float)$prior_others_map[$item_id]->ttl_total_pengajuan : 0;

                $ovb_qty = isset($ovb_others_map[$item_id]) ? (float)$ovb_others_map[$item_id]->ttl_qty_tambahan : 0;
                $ovb_total = isset($ovb_others_map[$item_id]) ? (float)$ovb_others_map[$item_id]->total_budget_tambahan : 0;
                $ovb_nominal = ($ovb_qty > 0) ? ($ovb_total / $ovb_qty) : 0;

                $qty_estimasi = (float)$b_item->qty_final;
                $price_unit_estimasi = (float)$b_item->price_unit_final;
                $total_budget_estimasi = (float)$b_item->total_final;

                $qty_terpakai = $prior_qty;
                $nominal_terpakai = $price_unit_estimasi;
                $total_terpakai = $prior_total;

                $qty_overbudget = $ovb_qty;
                $nominal_overbudget = $ovb_nominal;
                $total_overbudget = $ovb_total;

                $sisa_budget = ($total_budget_estimasi - $total_terpakai + $total_overbudget);
                $aktual_terpakai = $qty_terpakai;

                $obj = new stdClass();
                $obj->id_header = $id_kasbon;
                $obj->id_spk_budgeting = $id_spk_budgeting;
                $obj->id_spk_penawaran = $b_item->id_spk_penawaran;
                $obj->id_penawaran = $b_item->id_penawaran;
                $obj->id_others = $item_id;
                $obj->id_item = $b_item->id_item;
                $obj->nm_item = $b_item->nm_item;
                $obj->nm_biaya = !empty($b_item->nm_biaya) ? $b_item->nm_biaya : $b_item->nm_item;
                $obj->qty_pengajuan = 0;
                $obj->nominal_pengajuan = 0;
                $obj->total_pengajuan = 0;
                $obj->qty_estimasi = $qty_estimasi;
                $obj->price_unit_estimasi = $price_unit_estimasi;
                $obj->total_budget_estimasi = $total_budget_estimasi;
                $obj->qty_budget_tambahan = $ovb_qty;
                $obj->budget_tambahan = $ovb_total;
                $obj->aktual_terpakai = $aktual_terpakai;
                $obj->sisa_budget = $sisa_budget;
                $obj->qty_terpakai = $qty_terpakai;
                $obj->nominal_terpakai = $nominal_terpakai;
                $obj->total_terpakai = $total_terpakai;
                $obj->qty_overbudget = $qty_overbudget;
                $obj->nominal_overbudget = $nominal_overbudget;
                $obj->total_overbudget = $total_overbudget;
                $obj->custom_others = 0;

                $get_kasbon_others[] = $obj;
            }
        }

        foreach ($submitted_others as $item_id => $s_item) {
            if (!in_array($item_id, $processed_others_ids)) {
                $get_kasbon_others[] = $s_item;
            }
        }

        // ----------------------------------------------------
        // Tipe 4: LAB
        // ----------------------------------------------------
        $this->db->select('a.*, IF(a.custom_lab = 1, a.nm_item, b.isu_lingkungan) as nm_biaya');
        $this->db->from('kons_tr_kasbon_project_lab a');
        $this->db->join('kons_master_lab b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_header', $id_kasbon);
        $this->db->where('a.sts', null);
        $get_kasbon_lab_submitted = $this->db->get()->result();

        $submitted_lab = [];
        foreach ($get_kasbon_lab_submitted as $item) {
            $submitted_lab[$item->id_lab] = $item;
        }

        $this->db->select('a.id_lab, SUM(a.qty_pengajuan) as ttl_qty_pengajuan, SUM(a.total_pengajuan) as ttl_total_pengajuan');
        $this->db->from('kons_tr_kasbon_project_lab a');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $this->db->where('a.id_header !=', $id_kasbon);
        $this->db->where('a.deleted_at IS NULL');
        $this->db->group_by('a.id_lab');
        $get_prior_lab = $this->db->get()->result();

        $prior_lab_map = [];
        foreach ($get_prior_lab as $p) {
            $prior_lab_map[$p->id_lab] = $p;
        }

        $this->db->select('b.id_detail, SUM(b.budget_tambahan) as total_budget_tambahan, SUM(b.qty_budget_tambahan) as ttl_qty_tambahan');
        $this->db->from('kons_tr_kasbon_req_ovb_lab_header a');
        $this->db->join('kons_tr_kasbon_req_ovb_lab_detail b', 'b.id_request_ovb = a.id_request_ovb');
        $this->db->where('a.tipe', 4);
        $this->db->where('a.sts', 1);
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $this->db->group_by('b.id_detail');
        $get_ovb_lab_agg = $this->db->get()->result();

        $ovb_lab_map = [];
        foreach ($get_ovb_lab_agg as $o) {
            $ovb_lab_map[$o->id_detail] = $o;
        }

        $this->db->select('a.*, b.isu_lingkungan as nm_biaya');
        $this->db->from('kons_tr_spk_budgeting_lab a');
        $this->db->join('kons_master_lab b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $get_budgeting_lab = $this->db->get()->result();

        $get_kasbon_lab = [];
        $processed_lab_ids = [];

        foreach ($get_budgeting_lab as $b_item) {
            $item_id = $b_item->id;
            $processed_lab_ids[] = $item_id;

            if (isset($submitted_lab[$item_id])) {
                $get_kasbon_lab[] = $submitted_lab[$item_id];
            } else {
                $prior_qty = isset($prior_lab_map[$item_id]) ? (float)$prior_lab_map[$item_id]->ttl_qty_pengajuan : 0;
                $prior_total = isset($prior_lab_map[$item_id]) ? (float)$prior_lab_map[$item_id]->ttl_total_pengajuan : 0;

                $ovb_qty = isset($ovb_lab_map[$item_id]) ? (float)$ovb_lab_map[$item_id]->ttl_qty_tambahan : 0;
                $ovb_total = isset($ovb_lab_map[$item_id]) ? (float)$ovb_lab_map[$item_id]->total_budget_tambahan : 0;
                $ovb_nominal = ($ovb_qty > 0) ? ($ovb_total / $ovb_qty) : 0;

                $qty_estimasi = (float)$b_item->qty_final;
                $price_unit_estimasi = (float)$b_item->price_unit_final;
                $total_budget_estimasi = (float)$b_item->total_final;

                $qty_terpakai = $prior_qty;
                $nominal_terpakai = $price_unit_estimasi;
                $total_terpakai = $prior_total;

                $qty_overbudget = $ovb_qty;
                $nominal_overbudget = $ovb_nominal;
                $total_overbudget = $ovb_total;

                $sisa_budget = ($total_budget_estimasi - $total_terpakai + $total_overbudget);
                $aktual_terpakai = $qty_terpakai;

                $obj = new stdClass();
                $obj->id_header = $id_kasbon;
                $obj->id_spk_budgeting = $id_spk_budgeting;
                $obj->id_spk_penawaran = $b_item->id_spk_penawaran;
                $obj->id_penawaran = $b_item->id_penawaran;
                $obj->id_lab = $item_id;
                $obj->id_item = $b_item->id_item;
                $obj->nm_item = $b_item->nm_item;
                $obj->nm_biaya = !empty($b_item->nm_biaya) ? $b_item->nm_biaya : $b_item->nm_item;
                $obj->qty_pengajuan = 0;
                $obj->nominal_pengajuan = 0;
                $obj->total_pengajuan = 0;
                $obj->qty_estimasi = $qty_estimasi;
                $obj->price_unit_estimasi = $price_unit_estimasi;
                $obj->total_budget_estimasi = $total_budget_estimasi;
                $obj->qty_budget_tambahan = $ovb_qty;
                $obj->budget_tambahan = $ovb_total;
                $obj->aktual_terpakai = $aktual_terpakai;
                $obj->sisa_budget = $sisa_budget;
                $obj->qty_terpakai = $qty_terpakai;
                $obj->nominal_terpakai = $nominal_terpakai;
                $obj->total_terpakai = $total_terpakai;
                $obj->qty_overbudget = $qty_overbudget;
                $obj->nominal_overbudget = $nominal_overbudget;
                $obj->total_overbudget = $total_overbudget;
                $obj->custom_lab = 0;

                $get_kasbon_lab[] = $obj;
            }
        }

        foreach ($submitted_lab as $item_id => $s_item) {
            if (!in_array($item_id, $processed_lab_ids)) {
                $get_kasbon_lab[] = $s_item;
            }
        }

        // ----------------------------------------------------
        // Tipe 5: SUBCONT TENAGA AHLI
        // ----------------------------------------------------
        $this->db->select('a.*, IF(a.custom_subcont_tenaga_ahli = 1, a.nm_item, b.nm_biaya) as nm_biaya');
        $this->db->from('kons_tr_kasbon_project_subcont_tenaga_ahli a');
        $this->db->join('kons_master_tenaga_ahli b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_header', $id_kasbon);
        $this->db->where('a.sts', null);
        $get_kasbon_subcont_tenaga_ahli_submitted = $this->db->get()->result();

        $submitted_subcont_tenaga_ahli = [];
        foreach ($get_kasbon_subcont_tenaga_ahli_submitted as $item) {
            $submitted_subcont_tenaga_ahli[$item->id_subcont] = $item;
        }

        $this->db->select('a.id_subcont, SUM(a.qty_pengajuan) as ttl_qty_pengajuan, SUM(a.total_pengajuan) as ttl_total_pengajuan');
        $this->db->from('kons_tr_kasbon_project_subcont_tenaga_ahli a');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $this->db->where('a.id_header !=', $id_kasbon);
        $this->db->where('a.deleted_at IS NULL');
        $this->db->group_by('a.id_subcont');
        $get_prior_subcont_tenaga_ahli = $this->db->get()->result();

        $prior_subcont_tenaga_ahli_map = [];
        foreach ($get_prior_subcont_tenaga_ahli as $p) {
            $prior_subcont_tenaga_ahli_map[$p->id_subcont] = $p;
        }

        $this->db->select('b.id_detail, SUM(b.budget_tambahan) as total_budget_tambahan, SUM(b.qty_budget_tambahan) as ttl_qty_tambahan');
        $this->db->from('kons_tr_kasbon_req_ovb_subcont_tenaga_ahli_header a');
        $this->db->join('kons_tr_kasbon_req_ovb_subcont_tenaga_ahli_detail b', 'b.id_request_ovb = a.id_request_ovb');
        $this->db->where('a.tipe', 5);
        $this->db->where('a.sts', 1);
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $this->db->group_by('b.id_detail');
        $get_ovb_subcont_tenaga_ahli_agg = $this->db->get()->result();

        $ovb_subcont_tenaga_ahli_map = [];
        foreach ($get_ovb_subcont_tenaga_ahli_agg as $o) {
            $ovb_subcont_tenaga_ahli_map[$o->id_detail] = $o;
        }

        $this->db->select('a.*, b.nm_biaya');
        $this->db->from('kons_tr_spk_budgeting_subcont_tenaga_ahli a');
        $this->db->join('kons_master_tenaga_ahli b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $get_budgeting_subcont_tenaga_ahli = $this->db->get()->result();

        $get_kasbon_subcont_tenaga_ahli = [];
        $processed_subcont_tenaga_ahli_ids = [];

        foreach ($get_budgeting_subcont_tenaga_ahli as $b_item) {
            $item_id = $b_item->id;
            $processed_subcont_tenaga_ahli_ids[] = $item_id;

            if (isset($submitted_subcont_tenaga_ahli[$item_id])) {
                $get_kasbon_subcont_tenaga_ahli[] = $submitted_subcont_tenaga_ahli[$item_id];
            } else {
                $prior_qty = isset($prior_subcont_tenaga_ahli_map[$item_id]) ? (float)$prior_subcont_tenaga_ahli_map[$item_id]->ttl_qty_pengajuan : 0;
                $prior_total = isset($prior_subcont_tenaga_ahli_map[$item_id]) ? (float)$prior_subcont_tenaga_ahli_map[$item_id]->ttl_total_pengajuan : 0;

                $ovb_qty = isset($ovb_subcont_tenaga_ahli_map[$item_id]) ? (float)$ovb_subcont_tenaga_ahli_map[$item_id]->ttl_qty_tambahan : 0;
                $ovb_total = isset($ovb_subcont_tenaga_ahli_map[$item_id]) ? (float)$ovb_subcont_tenaga_ahli_map[$item_id]->total_budget_tambahan : 0;
                $ovb_nominal = ($ovb_qty > 0) ? ($ovb_total / $ovb_qty) : 0;

                $qty_estimasi = (float)$b_item->qty_final;
                $price_unit_estimasi = (float)$b_item->price_unit_final;
                $total_budget_estimasi = (float)$b_item->total_final;

                $qty_terpakai = $prior_qty;
                $nominal_terpakai = $price_unit_estimasi;
                $total_terpakai = $prior_total;

                $qty_overbudget = $ovb_qty;
                $nominal_overbudget = $ovb_nominal;
                $total_overbudget = $ovb_total;

                $sisa_budget = ($total_budget_estimasi - $total_terpakai + $total_overbudget);
                $aktual_terpakai = $qty_terpakai;

                $obj = new stdClass();
                $obj->id_header = $id_kasbon;
                $obj->id_spk_budgeting = $id_spk_budgeting;
                $obj->id_spk_penawaran = $b_item->id_spk_penawaran;
                $obj->id_penawaran = $b_item->id_penawaran;
                $obj->id_subcont = $item_id;
                $obj->id_item = $b_item->id_item;
                $obj->nm_item = $b_item->nm_item;
                $obj->nm_biaya = !empty($b_item->nm_biaya) ? $b_item->nm_biaya : $b_item->nm_item;
                $obj->qty_pengajuan = 0;
                $obj->nominal_pengajuan = 0;
                $obj->total_pengajuan = 0;
                $obj->qty_estimasi = $qty_estimasi;
                $obj->price_unit_estimasi = $price_unit_estimasi;
                $obj->total_budget_estimasi = $total_budget_estimasi;
                $obj->qty_budget_tambahan = $ovb_qty;
                $obj->budget_tambahan = $ovb_total;
                $obj->aktual_terpakai = $aktual_terpakai;
                $obj->sisa_budget = $sisa_budget;
                $obj->qty_terpakai = $qty_terpakai;
                $obj->nominal_terpakai = $nominal_terpakai;
                $obj->total_terpakai = $total_terpakai;
                $obj->qty_overbudget = $qty_overbudget;
                $obj->nominal_overbudget = $nominal_overbudget;
                $obj->total_overbudget = $total_overbudget;
                $obj->custom_subcont_tenaga_ahli = 0;

                $get_kasbon_subcont_tenaga_ahli[] = $obj;
            }
        }

        foreach ($submitted_subcont_tenaga_ahli as $item_id => $s_item) {
            if (!in_array($item_id, $processed_subcont_tenaga_ahli_ids)) {
                $get_kasbon_subcont_tenaga_ahli[] = $s_item;
            }
        }

        // ----------------------------------------------------
        // Tipe 6: SUBCONT PERUSAHAAN
        // ----------------------------------------------------
        $this->db->select('a.*, IF(a.custom_subcont_perusahaan = 1, a.nm_item, b.nm_biaya) as nm_biaya');
        $this->db->from('kons_tr_kasbon_project_subcont_perusahaan a');
        $this->db->join('kons_master_subcont_perusahaan b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_header', $id_kasbon);
        $this->db->where('a.sts', null);
        $get_kasbon_subcont_perusahaan_submitted = $this->db->get()->result();

        $submitted_subcont_perusahaan = [];
        foreach ($get_kasbon_subcont_perusahaan_submitted as $item) {
            $submitted_subcont_perusahaan[$item->id_subcont] = $item;
        }

        $this->db->select('a.id_subcont, SUM(a.qty_pengajuan) as ttl_qty_pengajuan, SUM(a.total_pengajuan) as ttl_total_pengajuan');
        $this->db->from('kons_tr_kasbon_project_subcont_perusahaan a');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $this->db->where('a.id_header !=', $id_kasbon);
        $this->db->where('a.deleted_at IS NULL');
        $this->db->group_by('a.id_subcont');
        $get_prior_subcont_perusahaan = $this->db->get()->result();

        $prior_subcont_perusahaan_map = [];
        foreach ($get_prior_subcont_perusahaan as $p) {
            $prior_subcont_perusahaan_map[$p->id_subcont] = $p;
        }

        $this->db->select('b.id_detail, SUM(b.budget_tambahan) as total_budget_tambahan, SUM(b.qty_budget_tambahan) as ttl_qty_tambahan');
        $this->db->from('kons_tr_kasbon_req_ovb_subcont_perusahaan_header a');
        $this->db->join('kons_tr_kasbon_req_ovb_subcont_perusahaan_detail b', 'b.id_request_ovb = a.id_request_ovb');
        $this->db->where('a.tipe', 6);
        $this->db->where('a.sts', 1);
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $this->db->group_by('b.id_detail');
        $get_ovb_subcont_perusahaan_agg = $this->db->get()->result();

        $ovb_subcont_perusahaan_map = [];
        foreach ($get_ovb_subcont_perusahaan_agg as $o) {
            $ovb_subcont_perusahaan_map[$o->id_detail] = $o;
        }

        $this->db->select('a.*, b.nm_biaya');
        $this->db->from('kons_tr_spk_budgeting_subcont_perusahaan a');
        $this->db->join('kons_master_subcont_perusahaan b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $get_budgeting_subcont_perusahaan = $this->db->get()->result();

        $get_kasbon_subcont_perusahaan = [];
        $processed_subcont_perusahaan_ids = [];

        foreach ($get_budgeting_subcont_perusahaan as $b_item) {
            $item_id = $b_item->id;
            $processed_subcont_perusahaan_ids[] = $item_id;

            if (isset($submitted_subcont_perusahaan[$item_id])) {
                $get_kasbon_subcont_perusahaan[] = $submitted_subcont_perusahaan[$item_id];
            } else {
                $prior_qty = isset($prior_subcont_perusahaan_map[$item_id]) ? (float)$prior_subcont_perusahaan_map[$item_id]->ttl_qty_pengajuan : 0;
                $prior_total = isset($prior_subcont_perusahaan_map[$item_id]) ? (float)$prior_subcont_perusahaan_map[$item_id]->ttl_total_pengajuan : 0;

                $ovb_qty = isset($ovb_subcont_perusahaan_map[$item_id]) ? (float)$ovb_subcont_perusahaan_map[$item_id]->ttl_qty_tambahan : 0;
                $ovb_total = isset($ovb_subcont_perusahaan_map[$item_id]) ? (float)$ovb_subcont_perusahaan_map[$item_id]->total_budget_tambahan : 0;
                $ovb_nominal = ($ovb_qty > 0) ? ($ovb_total / $ovb_qty) : 0;

                $qty_estimasi = (float)$b_item->qty_final;
                $price_unit_estimasi = (float)$b_item->price_unit_final;
                $total_budget_estimasi = (float)$b_item->total_final;

                $qty_terpakai = $prior_qty;
                $nominal_terpakai = $price_unit_estimasi;
                $total_terpakai = $prior_total;

                $qty_overbudget = $ovb_qty;
                $nominal_overbudget = $ovb_nominal;
                $total_overbudget = $ovb_total;

                $sisa_budget = ($total_budget_estimasi - $total_terpakai + $total_overbudget);
                $aktual_terpakai = $qty_terpakai;

                $obj = new stdClass();
                $obj->id_header = $id_kasbon;
                $obj->id_spk_budgeting = $id_spk_budgeting;
                $obj->id_spk_penawaran = $b_item->id_spk_penawaran;
                $obj->id_penawaran = $b_item->id_penawaran;
                $obj->id_subcont = $item_id;
                $obj->id_item = $b_item->id_item;
                $obj->nm_item = $b_item->nm_item;
                $obj->nm_biaya = !empty($b_item->nm_biaya) ? $b_item->nm_biaya : $b_item->nm_item;
                $obj->qty_pengajuan = 0;
                $obj->nominal_pengajuan = 0;
                $obj->total_pengajuan = 0;
                $obj->qty_estimasi = $qty_estimasi;
                $obj->price_unit_estimasi = $price_unit_estimasi;
                $obj->total_budget_estimasi = $total_budget_estimasi;
                $obj->qty_budget_tambahan = $ovb_qty;
                $obj->budget_tambahan = $ovb_total;
                $obj->aktual_terpakai = $aktual_terpakai;
                $obj->sisa_budget = $sisa_budget;
                $obj->qty_terpakai = $qty_terpakai;
                $obj->nominal_terpakai = $nominal_terpakai;
                $obj->total_terpakai = $total_terpakai;
                $obj->qty_overbudget = $qty_overbudget;
                $obj->nominal_overbudget = $nominal_overbudget;
                $obj->total_overbudget = $total_overbudget;
                $obj->custom_subcont_perusahaan = 0;

                $get_kasbon_subcont_perusahaan[] = $obj;
            }
        }

        foreach ($submitted_subcont_perusahaan as $item_id => $s_item) {
            if (!in_array($item_id, $processed_subcont_perusahaan_ids)) {
                $get_kasbon_subcont_perusahaan[] = $s_item;
            }
        }

        $this->db->select('a.*, b.nm_biaya');
        $this->db->from('kons_tr_kasbon_req_ovb_akomodasi_detail a');
        $this->db->join('kons_master_biaya b', 'b.id = a.id_item', 'left');
        $this->db->join('kons_tr_kasbon_req_ovb_akomodasi_header c', 'c.id_request_ovb = a.id_request_ovb');
        $this->db->where('c.id_spk_budgeting', $id_spk_budgeting);
        $this->db->where('c.sts', '1');
        $get_ovb_akomodasi = $this->db->get()->result();

        $this->db->select('a.id_aktifitas, a.qty_budget_tambahan, a.budget_tambahan, a.pengajuan_budget');
        $this->db->from('kons_tr_kasbon_req_ovb_subcont_detail a');
        $this->db->join('kons_tr_kasbon_req_ovb_subcont_header b', 'b.id_request_ovb = a.id_request_ovb', 'left');
        $this->db->where('b.id_spk_budgeting', $id_spk_budgeting);
        $this->db->where('b.sts', '1');
        $get_ovb_subcont = $this->db->get()->result();

        $data_overbudget_subcont = [];
        foreach ($get_ovb_subcont as $item_ovb_subcont) :
            $data_overbudget_subcont[$item_ovb_subcont->id_aktifitas] = [
                'qty_budget_tambahan' => $item_ovb_subcont->qty_budget_tambahan,
                'budget_tambahan' => $item_ovb_subcont->budget_tambahan,
                'pengajuan_budget' => $item_ovb_subcont->pengajuan_budget
            ];
        endforeach;

        $this->db->select('a.qty_budget_tambahan, a.budget_tambahan, a.pengajuan_budget, c.id_others');
        $this->db->from('kons_tr_kasbon_req_ovb_others_detail a');
        $this->db->join('kons_tr_kasbon_req_ovb_others_header b', 'b.id_request_ovb = a.id_request_ovb', 'left');
        $this->db->join('kons_tr_spk_budgeting_others c', 'c.id = a.id_detail');
        $this->db->where('b.id_spk_budgeting', $id_spk_budgeting);
        $this->db->where('b.sts', '1');
        $get_ovb_others = $this->db->get()->result();

        $data_overbudget_others = [];
        foreach ($get_ovb_others as $item_ovb_others) :
            $data_overbudget_others[$item_ovb_others->id_others] = [
                'qty_budget_tambahan' => $item_ovb_others->qty_budget_tambahan,
                'budget_tambahan' => $item_ovb_others->budget_tambahan,
                'pengajuan_budget' => $item_ovb_others->pengajuan_budget
            ];
        endforeach;

        $this->db->select('a.qty_budget_tambahan, a.budget_tambahan, a.pengajuan_budget, c.id_lab');
        $this->db->from('kons_tr_kasbon_req_ovb_lab_detail a');
        $this->db->join('kons_tr_kasbon_req_ovb_lab_header b', 'b.id_request_ovb = a.id_request_ovb', 'left');
        $this->db->join('kons_tr_spk_budgeting_lab c', 'c.id = a.id_detail');
        $this->db->where('b.id_spk_budgeting', $id_spk_budgeting);
        $this->db->where('b.sts', '1');
        $get_ovb_lab = $this->db->get()->result();

        $data_overbudget_lab = [];
        foreach ($get_ovb_lab as $item_ovb_lab) :
            $data_overbudget_lab[$item_ovb_lab->id_lab] = [
                'qty_budget_tambahan' => $item_ovb_lab->qty_budget_tambahan,
                'budget_tambahan' => $item_ovb_lab->budget_tambahan,
                'pengajuan_budget' => $item_ovb_lab->pengajuan_budget
            ];
        endforeach;

        $this->db->select('a.qty_budget_tambahan, a.budget_tambahan, a.pengajuan_budget, c.id_subcont');
        $this->db->from('kons_tr_kasbon_req_ovb_subcont_tenaga_ahli_detail a');
        $this->db->join('kons_tr_kasbon_req_ovb_subcont_tenaga_ahli_header b', 'b.id_request_ovb = a.id_request_ovb', 'left');
        $this->db->join('kons_tr_spk_budgeting_subcont_tenaga_ahli c', 'c.id = a.id_detail');
        $this->db->where('b.id_spk_budgeting', $id_spk_budgeting);
        $this->db->where('b.sts', '1');
        $get_ovb_subcont_tenaga_ahli = $this->db->get()->result();

        $data_overbudget_subcont_tenaga_ahli = [];
        foreach ($get_ovb_subcont_tenaga_ahli as $item_ovb_subcont_tenaga_ahli) :
            $data_overbudget_subcont_tenaga_ahli[$item_ovb_subcont_tenaga_ahli->id_subcont] = [
                'qty_budget_tambahan' => $item_ovb_subcont_tenaga_ahli->qty_budget_tambahan,
                'budget_tambahan' => $item_ovb_subcont_tenaga_ahli->budget_tambahan,
                'pengajuan_budget' => $item_ovb_subcont_tenaga_ahli->pengajuan_budget
            ];
        endforeach;

        $this->db->select('a.qty_budget_tambahan, a.budget_tambahan, a.pengajuan_budget, c.id_subcont');
        $this->db->from('kons_tr_kasbon_req_ovb_subcont_perusahaan_detail a');
        $this->db->join('kons_tr_kasbon_req_ovb_subcont_perusahaan_header b', 'b.id_request_ovb = a.id_request_ovb', 'left');
        $this->db->join('kons_tr_spk_budgeting_subcont_perusahaan c', 'c.id = a.id_detail');
        $this->db->where('b.id_spk_budgeting', $id_spk_budgeting);
        $this->db->where('b.sts', '1');
        $get_ovb_subcont_perusahaan = $this->db->get()->result();

        $data_overbudget_subcont_perusahaan = [];
        foreach ($get_ovb_subcont_perusahaan as $item_ovb_subcont_perusahaan) :
            $data_overbudget_subcont_perusahaan[$item_ovb_subcont_perusahaan->id_subcont] = [
                'qty_budget_tambahan' => $item_ovb_subcont_perusahaan->qty_budget_tambahan,
                'budget_tambahan' => $item_ovb_subcont_perusahaan->budget_tambahan,
                'pengajuan_budget' => $item_ovb_subcont_perusahaan->pengajuan_budget
            ];
        endforeach;

        $get_header = $this->db->get_where('kons_tr_kasbon_project_header', ['id' => $id_kasbon, 'deleted_at' => NULL])->row();

        $data = [
            'id_kasbon' => $id_kasbon,
            'id_spk_budgeting' => $id_spk_budgeting,
            'tipe' => $get_header->tipe,
            'header' => $get_header,
            'list_budgeting' => $get_budgeting,
            'list_kasbon_subcont' => $get_kasbon_subcont,
            'list_kasbon_subcont_custom' => $get_kasbon_subcont_custom,
            'list_kasbon_akomodasi' => $get_kasbon_akomodasi,
            'list_kasbon_others' => $get_kasbon_others,
            'list_kasbon_lab' => $get_kasbon_lab,
            'list_kasbon_subcont_tenaga_ahli' => $get_kasbon_subcont_tenaga_ahli,
            'list_kasbon_subcont_perusahaan' => $get_kasbon_subcont_perusahaan,
            'list_ovb_akomodasi' => $get_ovb_akomodasi,
            'data_overbudget_subcont' => $data_overbudget_subcont,
            'data_overbudget_others' => $data_overbudget_others,
            'data_overbudget_lab' => $data_overbudget_lab,
            'data_overbudget_subcont_tenaga_ahli' => $data_overbudget_subcont_tenaga_ahli,
            'data_overbudget_subcont_perusahaan' => $data_overbudget_subcont_perusahaan
        ];

        $metode_pembayaran = '';
        if ($get_header->metode_pembayaran == '1') {
            $metode_pembayaran = 'Kasbon';
        }
        if ($get_header->metode_pembayaran == '2') {
            $metode_pembayaran = 'Direct Payment';
        }
        if ($get_header->metode_pembayaran == '3') {
            $metode_pembayaran = 'PO';
        }

        $this->template->set($data);
        $this->template->title('Approval Pengajuan ' . $metode_pembayaran);
        $this->template->render('approval_kasbon');
    }

    public function reject_kasbon()
    {
        // 1. Ambil input
        $id_kasbon     = $this->input->post('id_kasbon');
        $reject_reason = $this->input->post('reject_reason');

        // Validasi dasar: pastikan ID ada
        if (!$id_kasbon) {
            echo json_encode(['status' => 0, 'pesan' => 'ID Kasbon tidak ditemukan!']);
            return;
        }

        // 2. Mulai Transaksi
        $this->db->trans_begin();

        try {
            $data_update = [
                'sts'           => 2,
                'reject_reason' => $reject_reason,
                'rejected_by'   => $this->auth->user_id(),
                'rejected_date' => date('Y-m-d H:i:s'),
                'updated_at'    => date('Y-m-d H:i:s')
            ];

            // Jalankan update
            $this->db->update('kons_tr_req_kasbon_project', $data_update, [
                'id_kasbon' => $id_kasbon,
                'sts'       => 0 // Memastikan hanya data 'pending' yang bisa direject
            ]);

            $data_update_pengajuan = [
                'sts_reject'    => 1,
                'reject_reason' => $reject_reason,
                'rejected_by'   => $this->auth->user_id(),
                'rejected_date' => date('Y-m-d H:i:s')
            ];

            $this->db->update('kons_tr_kasbon_project_header', $data_update_pengajuan, [
                'id' => $id_kasbon
            ]);

            // // Cek apakah ada baris yang beneran ter-update
            // if ($this->db->affected_rows() == 0) {
            //     throw new Exception("Data tidak ditemukan atau sudah diproses sebelumnya.");
            // }

            $this->db->trans_commit();
            $valid = 1;
            $pesan = 'Kasbon berhasil direject!';

            echo json_encode([
                'status' => $valid,
                'pesan'  => $pesan
            ]);
        } catch (Exception $e) {
            $this->db->trans_rollback();
            echo json_encode(['status' => 0, 'pesan' => $e->getMessage()]);
        }

        // // 3. Final Check Transaksi
        // if ($this->db->trans_status() === FALSE) {
        //     $this->db->trans_rollback();
        //     $valid = 0;
        //     $pesan = 'Gagal menolak kasbon, silakan coba lagi nanti.';
        // } else {
        //     $this->db->trans_commit();
        //     $valid = 1;
        //     $pesan = 'Kasbon berhasil direject!';
        // }

        // echo json_encode([
        //     'status' => $valid,
        //     'pesan'  => $pesan
        // ]);
    }

    public function approve_kasbon()
    {
        $id_kasbon = $this->input->post('id_kasbon');

        $get_header_kasbon = $this->db->get_where('kons_tr_kasbon_project_header', array('id' => $id_kasbon))->row();

        $get_user = $this->db->get_where('users', array('id_user' => $get_header_kasbon->created_by))->row();

        $nm_user = (!empty($get_user)) ? $get_user->nm_lengkap : '';

        $get_direktur_user = $this->db->get_where('users', array('id_user' => 48))->row();

        $data_insert_req_payment = [
            'no_doc' => $id_kasbon,
            'nama' => $nm_user,
            'tgl_doc' => date('Y-m-d'),
            'keperluan' => $get_header_kasbon->deskripsi,
            'tipe' => 'kasbon',
            'jumlah' => $get_header_kasbon->grand_total,
            'status' => 0,
            'created_by' => $get_user->username,
            'created_on' => date('Y-m-d H:i:s'),
            'ids' => $id_kasbon,
            'currency' => 'IDR'
        ];

        // $no_doc = '';
        // $newcode = '';
        // $data = $this->db->get_where(DBSF . '.ms_generate', array('tipe' => 'format_kasbon'))->row();
        // if ($data !== false) {
        //     if (stripos($data->info, 'YEAR', 0) !== false) {
        //         if ($data->info3 != date("Y")) {
        //             $years = date("Y");
        //             $number = 1;
        //             $newnumber = sprintf('%0' . $data->info4 . 'd', $number);
        //         } else {
        //             $years = $data->info3;
        //             $number = ($data->info2 + 1);
        //             $newnumber = sprintf('%0' . $data->info4 . 'd', $number);
        //         }
        //         $newcode = str_ireplace('XXXX', $newnumber, $data->info);
        //         $newcode = str_ireplace('YEAR', $years, $newcode);
        //         $newdata = array('info2' => $number, 'info3' => $years);
        //     } else {
        //         $number = ($data->info2 + 1);
        //         $newnumber = sprintf('%0' . $data->info4 . 'd', $number);
        //         $newcode = str_ireplace('XXXX', $newnumber, $data->info);
        //         $newdata = array('info2' => $number);
        //     }
        //     $this->db->update(DBSF . '.ms_generate', $newdata, array('tipe' => 'format_kasbon'));

        //     $no_doc = $newcode;
        // } else {
        //     return false;
        // }

        $project = '';
        if ($get_header_kasbon->tipe == '1') :
            $project = 'Subcont';
        endif;
        if ($get_header_kasbon->tipe == '2') :
            $project = 'Akomodasi';
        endif;
        if ($get_header_kasbon->tipe == '3') :
            $project = 'Others';
        endif;
        if ($get_header_kasbon->tipe == '4') :
            $project = 'Lab';
        endif;
        if ($get_header_kasbon->tipe == '5') :
            $project = 'Subcont Tenaga Ahli';
        endif;
        if ($get_header_kasbon->tipe == '6') :
            $project = 'Subcont Perusahaan';
        endif;

        // $data_insert_sendigs_kasbon = [
        //     'no_doc' => $no_doc,
        //     'tgl_doc' => date('Y-m-d'),
        //     'departement' => '',
        //     'nama' => $nm_user,
        //     'jumlah_kasbon' => $get_header_kasbon->grand_total,
        //     'keperluan' => $get_header_kasbon->deskripsi,
        //     'doc_file' => $get_header_kasbon->dokument_link,
        //     'status' => 1,
        //     'created_by' => $nm_user,
        //     'created_on' => date('Y-m-d H:i:s'),
        //     'bank_id' => $get_header_kasbon->bank,
        //     'accnumber' => $get_header_kasbon->bank_number,
        //     'accname' => $get_header_kasbon->bank_account,
        //     'project' => $project,
        //     'approved_by' => $get_direktur_user->nm_lengkap,
        //     'approved_on' => date('Y-m-d H:i:s'),
        //     'keterangan' => $get_header_kasbon->deskripsi,
        //     'metode_pembayaran' => 1,
        //     'project_consultant' => 1,
        //     'no_kasbon_consultant' => $id_kasbon
        // ];

        $this->db->trans_begin();

        // if ($get_header_kasbon->metode_pembayaran == '1') {
        //     $insert_sendigs_kasbon = $this->otherdb->insert('tr_kasbon', $data_insert_sendigs_kasbon);
        //     if (!$insert_sendigs_kasbon) {
        //         $this->db->trans_rollback();

        //         print_r($this->db->last_query());
        //         exit;
        //     }
        // }

        // INSERT DIRECT PAYMENT
        // if ($get_header_kasbon->metode_pembayaran == '2') {

        //     $no_doc = $id_kasbon;

        //     $data_insert_direct_payment_sendigs = [
        //         'no_doc' => $no_doc,
        //         'tgl_doc' => date('Y-m-d'),
        //         'ids' => $id_kasbon,
        //         'id_spk_budgeting' => $get_header_kasbon->id_spk_budgeting,
        //         'id_spk_penawaran' => $get_header_kasbon->id_spk_penawaran,
        //         'id_penawaran' => $get_header_kasbon->id_penawaran,
        //         'tipe' => $get_header_kasbon->tipe,
        //         'deskripsi' => $get_header_kasbon->deskripsi,
        //         'grand_total' => $get_header_kasbon->grand_total,
        //         'bank' => $get_header_kasbon->bank,
        //         'bank_number' => $get_header_kasbon->bank_number,
        //         'bank_account' => $get_header_kasbon->bank_account,
        //         'metode_pembayaran' => 1,
        //         'sts' => 1,
        //         'created_by' => $this->auth->user_id(),
        //         'created_date' => date('Y-m-d H:i:s')
        //     ];

        //     $insert_direct_payment_sendigs = $this->otherdb->insert('tr_direct_payment', $data_insert_direct_payment_sendigs);
        //     if (!$insert_direct_payment_sendigs) {
        //         $this->db->trans_rollback();

        //         print_r($this->db->last_query());
        //         exit;
        //     }
        // }

        // if ($get_header_kasbon->metode_pembayaran == '3') {
        // }

        $get_created_kasbon = $this->db->get_where('users', ['id_user' => $get_header_kasbon->created_by])->row();
        $nm_user = (!empty($get_created_kasbon)) ? $get_created_kasbon->nm_lengkap : '';

        $arr_insert_req_payment = [
            'no_doc' => $get_header_kasbon->id,
            'nama' => $nm_user,
            'tgl_doc' => $get_header_kasbon->tgl,
            'keperluan' => $get_header_kasbon->deskripsi,
            'tipe' => 'kasbon',
            'jumlah' => $get_header_kasbon->grand_total,
            'status' => 0,
            'created_by' => $nm_user,
            'created_on' => date('Y-m-d H:i:s'),
            'ids' => $get_header_kasbon->id,
            'currency' => 'IDR'
        ];

        $insert_request_payment = $this->db->insert('request_payment', $arr_insert_req_payment);
        if (!$insert_request_payment) {
            $this->db->trans_rollback();

            print_r($this->db->last_query());
            exit;
        }

        $update_req = $this->db->update('kons_tr_kasbon_project_header', [
            'sts' => 1,
            'approved_by' => $this->auth->user_id(),
            'approved_date' => date('Y-m-d H:i:s')
        ], ['id' => $id_kasbon]);
        if (!$update_req) {
            $this->db->trans_rollback();

            print_r($this->db->last_query());
            exit;
        }

        $update_req = $this->db->update('kons_tr_req_kasbon_project', ['sts' => 1], ['id_kasbon' => $id_kasbon, 'sts' => 0]);
        if (!$update_req) {
            $this->db->trans_rollback();

            print_r($this->db->last_query());
            exit;
        }

        $update_req_header = $this->db->update('kons_tr_kasbon_project_header', [
            'sts' => 1,
            'approved_by' => $this->auth->user_id(),
            'approved_date' => date('Y-m-d H:i:s')
        ], ['id' => $id_kasbon]);
        if (!$update_req_header) {
            $this->db->trans_rollback();

            print_r($this->db->last_query());
            exit;
        }

        $update_req_subcont = $this->db->update('kons_tr_kasbon_project_subcont', ['sts' => 1], ['id_header' => $id_kasbon]);
        if (!$update_req_subcont) {
            $this->db->trans_rollback();

            print_r($this->db->last_query());
            exit;
        }

        $update_req_akomodasi = $this->db->update('kons_tr_kasbon_project_akomodasi', ['sts' => 1], ['id_header' => $id_kasbon]);
        if (!$update_req_akomodasi) {
            $this->db->trans_rollback();

            print_r($this->db->last_query());
            exit;
        }

        $update_req_others = $this->db->update('kons_tr_kasbon_project_others', ['sts' => 1], ['id_header' => $id_kasbon]);
        if (!$update_req_others) {
            $this->db->trans_rollback();

            print_r($this->db->last_query());
            exit;
        }

        $update_req_lab = $this->db->update('kons_tr_kasbon_project_lab', ['sts' => 1], ['id_header' => $id_kasbon]);
        if (!$update_req_lab) {
            $this->db->trans_rollback();

            print_r($this->db->last_query());
            exit;
        }

        $update_req_subcont_tenaga_ahli = $this->db->update('kons_tr_kasbon_project_subcont_tenaga_ahli', ['sts' => 1], ['id_header' => $id_kasbon]);
        if (!$update_req_subcont_tenaga_ahli) {
            $this->db->trans_rollback();

            print_r($this->db->last_query());
            exit;
        }

        $update_req_subcont_perusahaan = $this->db->update('kons_tr_kasbon_project_subcont_perusahaan', ['sts' => 1], ['id_header' => $id_kasbon]);
        if (!$update_req_subcont_perusahaan) {
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
            $pesan = 'Data has been approved !';
        }

        echo json_encode([
            'status' => $valid,
            'pesan' => $pesan
        ]);
    }
}
