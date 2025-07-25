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
class Approval_project_budgeting extends Admin_Controller
{
    //Permission
    protected $viewPermission     = 'Approval_Project_Budgeting.View';
    protected $addPermission      = 'Approval_Project_Budgeting.Add';
    protected $managePermission = 'Approval_Project_Budgeting.Manage';
    protected $deletePermission = 'Approval_Project_Budgeting.Delete';

    public function __construct()
    {
        parent::__construct();
        $this->template->title('Quotation');
        $this->template->page_icon('fa fa-cubes');
        $this->load->library('upload');
        $this->load->model(array('Project_budgeting/Project_budgeting_model'));
        date_default_timezone_set('Asia/Bangkok');
    }

    public function index()
    {
        $this->auth->restrict($this->viewPermission);
        $this->template->title('Approval Project Budgeting');
        $this->template->render('index');
    }

    public function get_data_spk()
    {
        $draw = $this->input->post('draw');
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $search = $this->input->post('search');

        $this->db->select('a.*, b.nm_sales, c.nm_paket');
        $this->db->from('kons_tr_spk_budgeting a');
        $this->db->join('kons_tr_spk_penawaran b', 'b.id_spk_penawaran = a.id_spk_penawaran', 'left');
        $this->db->join('kons_master_konsultasi_header c', 'c.id_konsultasi_h = b.id_project', 'left');
        $this->db->where('a.sts <>', 1);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.id_spk_budgeting', $search['value'], 'both');
            $this->db->or_like('a.nm_customer', $search['value'], 'both');
            $this->db->or_like('b.nm_sales', $search['value'], 'both');
            $this->db->or_like('a.nm_project_leader', $search['value'], 'both');
            $this->db->or_like('c.nm_paket', $search['value'], 'both');
            $this->db->group_end();
        }
        $this->db->order_by('a.create_date', 'desc');
        $this->db->limit($length, $start);

        $get_data = $this->db->get();

        $this->db->select('a.*, b.nm_sales, c.nm_paket');
        $this->db->from('kons_tr_spk_budgeting a');
        $this->db->join('kons_tr_spk_penawaran b', 'b.id_spk_penawaran = a.id_spk_penawaran', 'left');
        $this->db->join('kons_master_konsultasi_header c', 'c.id_konsultasi_h = b.id_project', 'left');
        $this->db->where('a.sts <>', 1);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.id_spk_budgeting', $search['value'], 'both');
            $this->db->or_like('a.nm_customer', $search['value'], 'both');
            $this->db->or_like('b.nm_sales', $search['value'], 'both');
            $this->db->or_like('a.nm_project_leader', $search['value'], 'both');
            $this->db->or_like('c.nm_paket', $search['value'], 'both');
            $this->db->group_end();
        }
        $this->db->order_by('a.create_date', 'desc');

        $get_data_all = $this->db->get();

        $hasil = [];

        $no = 1;
        foreach ($get_data->result() as $item) {

            $status = '<button type="button" class="btn btn-sm btn-primary">Waiting Approval</button>';
            if ($item->sts == 2) {
                $status = '<button type="button" class="btn btn-sm btn-danger">Rejected</button>';
            }

            $option = '<a href="' . base_url('approval_project_budgeting/approval/' . urlencode(str_replace('/', '|', $item->id_spk_budgeting))) . '" class="btn btn-sm btn-success" title="Approval"><i class="fa fa-check"></i></a>';


            $hasil[] = [
                'no' => $no,
                'id_spk_budgeting' => $item->id_spk_budgeting,
                'nm_customer' => $item->nm_customer,
                'nm_sales' => ucfirst($item->nm_sales),
                'nm_project_leader' => ucfirst($item->nm_project_leader),
                'nm_project' => $item->nm_paket,
                'reject_reason' => $item->reject_reason,
                'status' => $status,
                'option' => $option
            ];

            $no++;
        }

        echo json_encode([
            'draw' => intval($draw),
            'recordsTotal' => $get_data_all->num_rows(),
            'recordsFiltered' => $get_data_all->num_rows(),
            'data' => $hasil
        ]);
    }

    public function add($id_spk_penawaran)
    {

        $id_spk_penawaran = urldecode($id_spk_penawaran);
        $id_spk_penawaran = str_replace('|', '/', $id_spk_penawaran);

        // $get_spk = $this->db->get_where('kons_tr_spk_penawaran', ['id_spk_penawaran' => $id_spk_penawaran])->row();

        $this->db->select('a.*, c.divisi as jabatan_pic, c.hp as kontak_pic');
        $this->db->from('kons_tr_spk_penawaran a');
        $this->db->join('customer b', 'b.id_customer = a.id_customer', 'left');
        $this->db->join('customer_pic c', 'c.id_pic = b.id_pic', 'left');
        $this->db->where('a.id_spk_penawaran', $id_spk_penawaran);
        $get_spk = $this->db->get()->row();

        $this->db->select('a.*');
        $this->db->from('kons_tr_penawaran a');
        $this->db->where('a.id_quotation', $get_spk->id_penawaran);
        $get_penawaran = $this->db->get()->row();

        $this->db->select('a.*');
        $this->db->from('employee a');
        $this->db->where('a.deleted', 'N');
        $get_all_marketing = $this->db->get()->result();

        $this->db->select('a.*, b.mandays as mandays_def');
        $this->db->from('kons_tr_spk_penawaran_subcont a');
        $this->db->join('kons_master_aktifitas b', 'b.id_aktifitas = a.id_aktifitas', 'left');
        $this->db->where('a.id_spk_penawaran', $id_spk_penawaran);
        $get_aktifitas = $this->db->get()->result();

        $this->db->select('a.*, b.nm_biaya');
        $this->db->from('kons_tr_penawaran_akomodasi a');
        $this->db->join('kons_master_biaya b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_penawaran', $get_spk->id_penawaran);
        $get_akomodasi = $this->db->get()->result();

        $this->db->select('a.*, b.nm_biaya');
        $this->db->from('kons_tr_penawaran_others a');
        $this->db->join('kons_master_biaya b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_penawaran', $get_spk->id_penawaran);
        $get_others = $this->db->get()->result();

        // print_r($this->db->last_query());
        // exit;

        // print_r($get_all_marketing);
        // exit;

        $data = [
            'list_spk_penawaran' => $get_spk,
            'list_all_marketing' => $get_all_marketing,
            'list_aktifitas' => $get_aktifitas,
            'list_akomodasi' => $get_akomodasi,
            'list_others' => $get_others,
            'list_penawaran' => $get_penawaran
        ];

        $this->template->set($data);
        $this->template->title('Create Project Budgeting');
        $this->template->render('add');
    }

    public function approval($id_spk_budgeting)
    {
        $id_spk_budgeting = urldecode($id_spk_budgeting);
        $id_spk_budgeting = str_replace('|', '/', $id_spk_budgeting);

        $this->db->select('a.*');
        $this->db->from('kons_tr_spk_budgeting a');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $get_spk_budgeting = $this->db->get()->row();

        $this->db->select('a.*, c.divisi as jabatan_pic, c.hp as kontak_pic');
        $this->db->from('kons_tr_spk_penawaran a');
        $this->db->join('customer b', 'b.id_customer = a.id_customer', 'left');
        $this->db->join('customer_pic c', 'c.id_pic = b.id_pic', 'left');
        $this->db->where('a.id_spk_penawaran', $get_spk_budgeting->id_spk_penawaran);
        $get_spk = $this->db->get()->row();

        $this->db->select('a.id, a.name as nm_karyawan');
        $this->db->from(DBHR . '.employees a');
        $get_all_marketing = $this->db->get()->result();

        $this->db->select('a.*, c.mandays as mandays_def');
        $this->db->from('kons_tr_spk_budgeting_aktifitas a');
        $this->db->join('kons_tr_spk_penawaran_subcont b', 'b.id = a.id_aktifitas', 'left');
        $this->db->join('kons_master_aktifitas c', 'c.id_aktifitas = b.id_aktifitas', 'left');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $get_spk_budgeting_aktifitas = $this->db->get()->result();

        $this->db->select('a.*, b.nm_biaya');
        $this->db->from('kons_tr_spk_budgeting_akomodasi a');
        $this->db->join('kons_master_biaya b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $get_spk_budgeting_akomodasi = $this->db->get()->result();

        $this->db->select('a.*, b.nm_biaya');
        $this->db->from('kons_tr_spk_budgeting_others a');
        $this->db->join('kons_master_biaya b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $get_spk_budgeting_others = $this->db->get()->result();

        $this->db->select('a.*, b.keterangan');
        $this->db->from('kons_tr_spk_budgeting_lab a');
        $this->db->join('kons_tr_penawaran_lab b', 'b.id_item = a.id_item');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $this->db->where('b.id_penawaran', $get_spk_budgeting->id_penawaran);
        $get_spk_budgeting_lab = $this->db->get()->result();

        $this->db->select('a.*, b.keterangan');
        $this->db->from('kons_tr_spk_budgeting_subcont_tenaga_ahli a');
        $this->db->join('kons_tr_penawaran_subcont_tenaga_ahli b', 'b.id_item = a.id_item');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $this->db->where('b.id_penawaran', $get_spk_budgeting->id_penawaran);
        $get_spk_budgeting_subcont_tenaga_ahli = $this->db->get()->result();

        $this->db->select('a.*, b.keterangan');
        $this->db->from('kons_tr_spk_budgeting_subcont_perusahaan a');
        $this->db->join('kons_tr_penawaran_subcont_perusahaan b', 'b.id_item = a.id_item');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $this->db->where('b.id_penawaran', $get_spk_budgeting->id_penawaran);
        $get_spk_budgeting_subcont_perusahaan = $this->db->get()->result();

        $this->db->select('a.nm_paket');
        $this->db->from('kons_master_konsultasi_header a');
        $this->db->where('a.id_konsultasi_h', $get_spk_budgeting->id_project);
        $get_package = $this->db->get()->row();

        $nm_paket = (!empty($get_package)) ? $get_package->nm_paket : '';

        $data = [
            'id_spk_budgeting' => $id_spk_budgeting,
            'list_spk_penawaran' => $get_spk,
            'list_budgeting' => $get_spk_budgeting,
            'list_all_marketing' => $get_all_marketing,
            'list_budgeting_aktifitas' => $get_spk_budgeting_aktifitas,
            'list_budgeting_akomodasi' => $get_spk_budgeting_akomodasi,
            'list_budgeting_others' => $get_spk_budgeting_others,
            'list_budgeting_lab' => $get_spk_budgeting_lab,
            'list_budgeting_subcont_tenaga_ahli' => $get_spk_budgeting_subcont_tenaga_ahli,
            'list_budgeting_subcont_perusahaan' => $get_spk_budgeting_subcont_perusahaan,
            'nm_paket' => $nm_paket
        ];

        $this->template->set($data);
        $this->template->title('Approval Project Budgeting');
        $this->template->render('approval');
    }

    public function view_budget($id_spk_budgeting)
    {
        $id_spk_budgeting = urldecode($id_spk_budgeting);
        $id_spk_budgeting = str_replace('|', '/', $id_spk_budgeting);

        $this->db->select('a.*');
        $this->db->from('kons_tr_spk_budgeting a');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $get_spk_budgeting = $this->db->get()->row();

        $get_spk = $this->db->get_where('kons_tr_spk_penawaran', ['id_spk_penawaran' => $get_spk_budgeting->id_spk_penawaran])->row();

        $this->db->select('a.*');
        $this->db->from('employee a');
        $this->db->where('a.deleted', 'N');
        $get_all_marketing = $this->db->get()->result();

        $this->db->select('a.*, c.mandays as mandays_def');
        $this->db->from('kons_tr_spk_budgeting_aktifitas a');
        $this->db->join('kons_tr_spk_penawaran_subcont b', 'b.id = a.id_aktifitas', 'left');
        $this->db->join('kons_master_aktifitas c', 'c.id_aktifitas = b.id_aktifitas', 'left');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $get_spk_budgeting_aktifitas = $this->db->get()->result();

        $this->db->select('a.*, b.nm_biaya');
        $this->db->from('kons_tr_spk_budgeting_akomodasi a');
        $this->db->join('kons_master_biaya b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $get_spk_budgeting_akomodasi = $this->db->get()->result();

        $this->db->select('a.*, b.nm_biaya');
        $this->db->from('kons_tr_spk_budgeting_others a');
        $this->db->join('kons_master_biaya b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $get_spk_budgeting_others = $this->db->get()->result();

        $this->db->select('a.nm_paket');
        $this->db->from('kons_master_konsultasi_header a');
        $this->db->where('a.id_konsultasi_h', $get_spk->id_project);
        $get_package = $this->db->get()->row();

        $nm_paket = (!empty($get_package)) ? $get_package->nm_paket : '';

        $data = [
            'list_budgeting' => $get_spk_budgeting,
            'list_all_marketing' => $get_all_marketing,
            'list_budgeting_aktifitas' => $get_spk_budgeting_aktifitas,
            'list_budgeting_akomodasi' => $get_spk_budgeting_akomodasi,
            'list_budgeting_others' => $get_spk_budgeting_others,
            'nm_paket' => $nm_paket
        ];

        $this->template->set($data);
        $this->template->render('view');
    }

    public function save_budgeting()
    {
        $post = $this->input->post();

        $this->db->trans_begin();

        $this->db->select('a.*');
        $this->db->from('kons_tr_spk_penawaran a');
        $this->db->where('a.id_spk_penawaran', $post['id_spk_penawaran']);
        $get_spk_penawaran = $this->db->get()->row();

        $this->db->select('a.*');
        $this->db->from('kons_tr_penawaran a');
        $this->db->where('a.id_quotation', $get_spk_penawaran->id_penawaran);
        $get_penawaran = $this->db->get()->row();

        $id_spk_budgeting = $this->Project_budgeting_model->generate_id_spk_budgeting();

        $data_insert = [
            'id_spk_budgeting' => $id_spk_budgeting,
            'id_spk_penawaran' => $post['id_spk_penawaran'],
            'id_penawaran' => $get_spk_penawaran->id_penawaran,
            'id_customer' => $get_spk_penawaran->id_customer,
            'nm_customer' => $get_spk_penawaran->nm_customer,
            'alamat' => $get_spk_penawaran->address,
            'no_npwp' => $get_spk_penawaran->npwp_cust,
            'nm_pic' => $post['pic'],
            'jabatan_pic' => $post['jabatan_pic'],
            'kontak_pic' => $post['kontak_pic'],
            'id_project' => $get_spk_penawaran->id_project,
            'nm_project' => $get_spk_penawaran->nm_project,
            'id_project_leader' => $get_spk_penawaran->id_project_leader,
            'nm_project_leader' => $get_spk_penawaran->nm_project_leader,
            'id_konsultan_1' => $get_spk_penawaran->id_konsultan_1,
            'nm_konsultan_1' => $get_spk_penawaran->nm_konsultan_1,
            'id_konsultan_2' => $get_spk_penawaran->id_konsultan_2,
            'nm_konsultan_2' => $get_spk_penawaran->nm_konsultan_2,
            'total_mandays' => $post['summary_mandays'],
            'mandays_internal' => $post['summary_mandays_internal'],
            'mandays_tandem' => $post['summary_mandays_tandem'],
            'mandays_subcont' => $post['summary_mandays_subcont'],
            'biaya_konsultasi' => $post['summary_biaya_act'],
            'biaya_tandem' => $post['summary_biaya_tandem'],
            'biaya_subcont' => $post['summary_biaya_subcont'],
            'biaya_akomodasi' => $post['summary_biaya_akomodasi'],
            'biaya_others' => $post['summary_biaya_others'],
            'nilai_kontrak_bersih' => str_replace(',', '', $post['nilai_kontrak_bersih']),
            'mandays_rate' => str_replace(',', '', $post['mandays_rate']),
            'ppn' => $get_penawaran->ppn,
            'grand_total' => $get_penawaran->grand_total,
            'create_by' => $this->auth->user_id(),
            'create_date' => date('Y-m-d H:i:s')
        ];

        $data_insert_konsultasi = [];
        if (isset($post['subcont_final'])) {
            foreach ($post['subcont_final'] as $item) {

                $this->db->select('a.nm_aktifitas, a.mandays, a.mandays_rate, a.mandays_tandem, a.mandays_rate_tandem, a.mandays_subcont, a.price_subcont');
                $this->db->from('kons_tr_spk_penawaran_subcont a');
                $this->db->where('a.id', $item['id']);
                $get_data_subcont = $this->db->get()->row_array();

                $total_aktifitas_estimasi = (($get_data_subcont['mandays_rate'] * $get_data_subcont['mandays']) + ($get_data_subcont['mandays_tandem'] * $get_data_subcont['mandays_rate_tandem']) + ($get_data_subcont['mandays_subcont'] * $get_data_subcont['price_subcont']));

                $total_aktifitas_final = ((str_replace(',', '', $item['mandays_rate']) * str_replace(',', '', $item['mandays'])) + (str_replace(',', '', $item['mandays_tandem']) * str_replace(',', '', $item['mandays_rate_tandem'])) + (str_replace(',', '', $item['mandays_subcont']) * str_replace(',', '', $item['price_subcont'])));

                $data_insert_konsultasi[] = [
                    'id_spk_budgeting' => $id_spk_budgeting,
                    'id_spk_penawaran' => $post['id_spk_penawaran'],
                    'id_penawaran' => $get_spk_penawaran->id_penawaran,
                    'id_aktifitas' => $item['id'],
                    'nm_aktifitas' => $get_data_subcont['nm_aktifitas'],
                    'mandays_estimasi' => $get_data_subcont['mandays'],
                    'mandays_rate_estimasi' => $get_data_subcont['mandays_rate'],
                    'mandays_tandem_estimasi' => $get_data_subcont['mandays_tandem'],
                    'mandays_rate_tandem_estimasi' => $get_data_subcont['mandays_rate_tandem'],
                    'mandays_subcont_estimasi' => $get_data_subcont['mandays_subcont'],
                    'mandays_rate_subcont_estimasi' => $get_data_subcont['price_subcont'],
                    'total_aktifitas_estimasi' => $total_aktifitas_estimasi,
                    'mandays_final' => str_replace(',', '', $item['mandays']),
                    'mandays_rate_final' => str_replace(',', '', $item['mandays_rate']),
                    'mandays_tandem_final' => str_replace(',', '', $item['mandays_tandem']),
                    'mandays_rate_tandem_final' => str_replace(',', '', $item['mandays_rate_tandem']),
                    'mandays_subcont_final' => str_replace(',', '', $item['mandays_subcont']),
                    'mandays_rate_subcont_final' => str_replace(',', '', $item['price_subcont']),
                    'total_aktifitas_final' => $total_aktifitas_final,
                    'create_by' => $this->auth->user_id(),
                    'create_date' => date('Y-m-d H:i:s')
                ];
            }
        }

        $data_insert_akomodasi = [];
        if (isset($post['akomodasi_final'])) {
            foreach ($post['akomodasi_final'] as $item) {

                $this->db->select('a.*');
                $this->db->from('kons_tr_penawaran_akomodasi a');
                $this->db->where('a.id', $item['id_akomodasi']);
                $get_akomodasi = $this->db->get()->row();

                $data_insert_akomodasi[] = [
                    'id_spk_budgeting' => $id_spk_budgeting,
                    'id_spk_penawaran' => $post['id_spk_penawaran'],
                    'id_penawaran' => $get_spk_penawaran->id_penawaran,
                    'id_akomodasi' => $item['id_akomodasi'],
                    'id_item' => $get_akomodasi->id_item,
                    'nm_item' => $get_akomodasi->nm_item,
                    'qty_estimasi' => $get_akomodasi->qty,
                    'price_unit_estimasi' => $get_akomodasi->price_unit,
                    'total_estimasi' => $get_akomodasi->total,
                    'qty_final' => str_replace(',', '', $item['qty']),
                    'price_unit_final' => str_replace(',', '', $item['price_unit']),
                    'total_final' => str_replace(',', '', $item['total']),
                    'keterangan' => $get_akomodasi->keterangan,
                    'create_by' => $this->auth->user_id(),
                    'create_date' => date('Y-m-d H:i:s')
                ];
            }
        }

        $data_insert_others = [];
        if (isset($post['others_final'])) {
            foreach ($post['others_final'] as $item) {

                $this->db->select('a.*');
                $this->db->from('kons_tr_penawaran_others a');
                $this->db->where('a.id', $item['id_others']);
                $get_others = $this->db->get()->row();

                $data_insert_others[] = [
                    'id_spk_budgeting' => $id_spk_budgeting,
                    'id_spk_penawaran' => $post['id_spk_penawaran'],
                    'id_penawaran' => $get_spk_penawaran->id_penawaran,
                    'id_others' => $item['id_others'],
                    'id_item' => $get_others->id_item,
                    'nm_item' => $get_others->nm_item,
                    'qty_estimasi' => $get_others->qty,
                    'price_unit_estimasi' => $get_others->price_unit,
                    'total_estimasi' => $get_others->total,
                    'qty_final' => str_replace(',', '', $item['qty']),
                    'price_unit_final' => str_replace(',', '', $item['price_unit']),
                    'total_final' => str_replace(',', '', $item['total']),
                    'keterangan' => $get_others->keterangan,
                    'create_by' => $this->auth->user_id(),
                    'create_date' => date('Y-m-d H:i:s')
                ];
            }
        }

        $insert_spk_budgeting = $this->db->insert('kons_tr_spk_budgeting', $data_insert);
        if (!$insert_spk_budgeting) {
            print_r($this->db->error($insert_spk_budgeting));
            $this->db->trans_rollback();
            exit;
        }

        $insert_spk_budgeting_aktifitas = $this->db->insert_batch('kons_tr_spk_budgeting_aktifitas', $data_insert_konsultasi);
        if (!$insert_spk_budgeting_aktifitas) {
            print_r($this->db->error($insert_spk_budgeting_aktifitas));
            $this->db->trans_rollback();
            exit;
        }

        $insert_spk_budgeting_akomodasi = $this->db->insert_batch('kons_tr_spk_budgeting_akomodasi', $data_insert_akomodasi);
        if (!$insert_spk_budgeting_akomodasi) {
            print_r($this->db->error($insert_spk_budgeting_akomodasi));
            $this->db->trans_rollback();
            exit;
        }

        $insert_spk_budgeting_others = $this->db->insert_batch('kons_tr_spk_budgeting_others', $data_insert_others);
        if (!$insert_spk_budgeting_others) {
            print_r($this->db->error($insert_spk_budgeting_others));
            $this->db->trans_rollback();
            exit;
        }

        if ($this->db->trans_status() ===  false) {
            $this->db->trans_rollback();
            $valid = 0;
            $pesan = 'Sorry, please try again later !';
        } else {
            $this->db->trans_commit();
            $valid = 1;
            $pesan = 'Success, data has been saved !';
        }

        echo json_encode([
            'status' => $valid,
            'pesan' => $pesan
        ]);
    }

    public function del_spk_budgeting()
    {
        $id = $this->input->post('id');

        $this->db->trans_begin();

        $this->db->delete('kons_tr_spk_budgeting_others', ['id_spk_budgeting' => $id]);
        $this->db->delete('kons_tr_spk_budgeting_akomodasi', ['id_spk_budgeting' => $id]);
        $this->db->delete('kons_tr_spk_budgeting_aktifitas', ['id_spk_budgeting' => $id]);
        $this->db->delete('kons_tr_spk_budgeting', ['id_spk_budgeting' => $id]);

        if ($this->db->trans_status() === false) {
            $this->db->trans_rollback();

            $valid = 0;
            $pesan = 'Sorry, please try again later !';
        } else {
            $this->db->trans_commit();

            $valid = 1;
            $pesan = 'Data has been successfully deleted !';
        }

        echo json_encode([
            'status' => $valid,
            'pesan' => $pesan
        ]);
    }

    public function reject_budget()
    {
        $id_spk_budgeting = $this->input->post('id_spk_budgeting');
        $reject_reason = $this->input->post('reject_reason');

        $this->db->trans_begin();

        $this->db->update('kons_tr_spk_budgeting', ['sts' => 2, 'reject_reason' => $reject_reason], ['id_spk_budgeting' => $id_spk_budgeting]);

        if ($this->db->trans_status() === false) {
            $this->db->trans_rollback();

            $valid = 0;
            $pesan = 'Sorry, please try again later !';
        } else {
            $this->db->trans_commit();

            $valid = 1;
            $pesan = 'Data has been successfully Rejected !';
        }

        echo json_encode([
            'status' => $valid,
            'pesan' => $pesan
        ]);
    }

    public function approve_budget()
    {
        $id_spk_budgeting = $this->input->post('id_spk_budgeting');

        $this->db->trans_begin();

        $this->db->update('kons_tr_spk_budgeting', ['sts' => 1, 'reject_reason' => ''], ['id_spk_budgeting' => $id_spk_budgeting]);

        if ($this->db->trans_status() === false) {
            $this->db->trans_rollback();

            $valid = 0;
            $pesan = 'Sorry, please try again later !';
        } else {
            $this->db->trans_commit();

            $valid = 1;
            $pesan = 'Data has been successfully Approved !';
        }

        echo json_encode([
            'status' => $valid,
            'pesan' => $pesan
        ]);
    }
}
