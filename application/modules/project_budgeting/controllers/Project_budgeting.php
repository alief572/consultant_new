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
class Project_budgeting extends Admin_Controller
{
    //Permission
    protected $viewPermission     = 'Project_Budgeting.View';
    protected $addPermission      = 'Project_Budgeting.Add';
    protected $managePermission = 'Project_Budgeting.Manage';
    protected $deletePermission = 'Project_Budgeting.Delete';

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
        $this->template->title('Project Budgeting');
        $this->template->render('index');
    }

    public function get_data_spk()
    {
        $draw = $this->input->post('draw');
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $search = $this->input->post('search');

        $status_s = $this->input->post('status');

        $this->db->select('
            a.*, 
            b.grand_total,
            CASE
                WHEN c.id_spk_budgeting IS NULL THEN 1
                WHEN c.sts = "1" THEN 2
                WHEN c.sts = "2" THEN 3
                WHEN c.sts NOT IN ("1","2") THEN 4
            END as status
        ', false);
        $this->db->from('kons_tr_spk_penawaran a');
        $this->db->join('kons_tr_penawaran b', 'b.id_quotation = a.id_penawaran', 'left');
        $this->db->join('kons_tr_spk_budgeting c', 'c.id_spk_penawaran = a.id_spk_penawaran', 'left');
        $this->db->where(1, 1);
        $this->db->where('a.deleted_by', null);
        $this->db->where('a.sts_spk', 1);
        if ($status_s == '1') {
            $this->db->where('c.id_spk_budgeting', null);
        }
        if ($status_s == '2') {
            $this->db->where('c.sts', '1');
        }
        if ($status_s == '3') {
            $this->db->where('c.sts', '2');
        }
        if ($status_s == '4') {
            $this->db->where('c.id_spk_budgeting IS NOT NULL');
            $this->db->where('c.sts <>', '1');
            $this->db->where('c.sts <>', '2');
        }
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->or_like('a.id_spk_penawaran', $search['value'], 'both');
            $this->db->or_like('a.nm_sales', $search['value'], 'both');
            $this->db->or_like('a.nm_project', $search['value'], 'both');
            $this->db->or_like('a.nm_customer', $search['value'], 'both');
            $this->db->or_like('a.nm_project_leader', $search['value'], 'both');
            $this->db->group_end();
        }

        $db_clone = clone $this->db;
        $count_all = $db_clone->count_all_results();

        $this->db->order_by('status', 'asc');
        $this->db->order_by('a.input_date', 'desc');
        $this->db->limit($length, $start);

        $get_data = $this->db->get();

        $hasil = [];

        $no = (1 + $start);
        foreach ($get_data->result() as $item) {

            $status = '<button type="button" class="btn btn-sm btn-warning">Draft</button>';

            $option = '<a href="' . base_url('project_budgeting/add/' . urlencode(str_replace('/', '|', $item->id_spk_penawaran))) . '" class="btn btn-sm " style="background-color: #E100A5; color: white;"><i class="fa fa-arrow-up"></i></a>';

            $check_spk_budgeting = $this->db->get_where('kons_tr_spk_budgeting', ['id_spk_penawaran' => $item->id_spk_penawaran])->result();
            if (count($check_spk_budgeting) > 0) {

                $status = '<button type="button" class="btn btn-sm btn-primary">Waiting Approval</button>';

                if ($check_spk_budgeting[0]->sts == 1) {
                    $status = '<button type="button" class="btn btn-sm btn-success">Approved</button>';
                }
                if ($check_spk_budgeting[0]->sts == 2) {
                    $status = '<button type="button" class="btn btn-sm btn-danger">Rejected</button>';
                }

                $option = '
                    <div class="btn-group">
                        <button
                            type="button"
                            class="btn btn-sm btn-accent text-primary dropdown-toggle"
                            title="Actions"
                            data-toggle="dropdown"
                            id="dropdownMenu' . $no . '"
                            aria-expanded="false">
                            <i class="fa fa-cogs"></i> <span class="caret"></span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right">
                    ';

                if ($this->viewPermission) {
                    $option .= '
                        <div class="col-12" style="margin-top: 0.5rem; margin-left: 0.5rem;">
                            <a href="' . base_url('project_budgeting/view_budget/' . urlencode(str_replace('/', '|', $check_spk_budgeting[0]->id_spk_budgeting))) . '" class="btn btn-sm btn-info" style="color: #000000">
                                <div class="col-12 dropdown-item">
                                <b>
                                    <i class="fa fa-file"></i>
                                </b>
                                </div>
                            </a>
                            <span style="font-weight: 500"> View </span>
                        </div>
                    ';
                }

                if ($this->deletePermission && $check_spk_budgeting[0]->sts !== '1') {
                    $option .= '
                        <div class="col-12" style="margin-top: 0.5rem; margin-left: 0.5rem;">
                            <a href="javascript:void(0);" class="btn btn-sm btn-danger del_spk_budget" style="color: #000000" data-id="' . $check_spk_budgeting[0]->id_spk_budgeting . '">
                                <div class="col-12 dropdown-item">
                                <b>
                                    <i class="fa fa-trash"></i>
                                </b>
                                </div>
                            </a>
                            <span style="font-weight: 500"> Delete </span>
                        </div>
                    ';
                }
                $option .= '</div>';
            }

            $nm_marketing = $item->nm_sales;

            $this->db->select('a.nm_paket');
            $this->db->from('kons_master_konsultasi_header a');
            $this->db->where('a.id_konsultasi_h', $item->id_project);
            $get_package = $this->db->get()->row();

            $nm_paket = (!empty($get_package)) ? $get_package->nm_paket : '';

            $nm_customer = $item->nm_customer;

            // if ($value_show == '1') {
            $hasil[] = [
                'no' => $no,
                'id_spk_penawaran' => $item->id_spk_penawaran,
                'nm_customer' => $item->nm_customer,
                'nm_sales' => ucfirst($item->nm_sales),
                'nm_project_leader' => ucfirst($item->nm_project_leader),
                'nm_project' => $nm_paket,
                'status' => $status,
                'option' => $option
            ];
            $no++;
            // }
        }

        echo json_encode([
            'draw' => intval($draw),
            'recordsTotal' => $count_all,
            'recordsFiltered' => $count_all,
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

        $this->db->select('a.id, a.name as nm_karyawan');
        $this->db->from(DBHR . '.employees a');
        $this->db->where('a.flag_active', 'Y');
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

        $this->db->select('a.id, a.id_penawaran, a.qty, a.price_unit, a.total, a.price_unit_budget, a.total_budget, a.keterangan, b.isu_lingkungan as nm_item');
        $this->db->from('kons_tr_penawaran_lab a');
        $this->db->join('kons_master_lab b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_penawaran', $get_spk->id_penawaran);
        $get_lab = $this->db->get()->result();

        $this->db->select('a.id, a.id_penawaran, a.qty, a.price_unit, a.total, a.price_unit_budget, a.total_budget, a.keterangan, b.nm_biaya as nm_item');
        $this->db->from('kons_tr_penawaran_subcont_tenaga_ahli a');
        $this->db->join('kons_master_tenaga_ahli b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_penawaran', $get_spk->id_penawaran);
        $get_subcont_tenaga_ahli = $this->db->get()->result();

        $this->db->select('a.id, a.id_penawaran, a.qty, a.price_unit, a.total, a.price_unit_budget, a.total_budget, a.keterangan, b.nm_biaya as nm_item');
        $this->db->from('kons_tr_penawaran_subcont_perusahaan a');
        $this->db->join('kons_master_subcont_perusahaan b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_penawaran', $get_spk->id_penawaran);
        $get_subcont_perusahaan = $this->db->get()->result();

        $this->db->select('a.nm_paket');
        $this->db->from('kons_master_konsultasi_header a');
        $this->db->where('a.id_konsultasi_h', $get_spk->id_project);
        $get_package = $this->db->get()->row();

        $nm_paket = (!empty($get_package)) ? $get_package->nm_paket : '';

        $data = [
            'list_spk_penawaran' => $get_spk,
            'list_all_marketing' => $get_all_marketing,
            'list_aktifitas' => $get_aktifitas,
            'list_akomodasi' => $get_akomodasi,
            'list_others' => $get_others,
            'list_penawaran' => $get_penawaran,
            'list_lab' => $get_lab,
            'list_subcont_tenaga_ahli' => $get_subcont_tenaga_ahli,
            'list_subcont_perusahaan' => $get_subcont_perusahaan,
            'nm_paket' => $nm_paket
        ];

        $this->template->set($data);
        $this->template->title('Create Project Budgeting');
        $this->template->render('add');
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

        $this->db->select('a.id, a.name as nm_karyawan');
        $this->db->from(DBHR . '.employees a');
        $this->db->where('a.flag_active', 'Y');
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

        $this->db->from('kons_tr_spk_budgeting_subcont_tenaga_ahli a');
        $this->db->join('kons_tr_penawaran_subcont_tenaga_ahli b', 'b.id_item = a.id_item');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $this->db->where('b.id_penawaran', $get_spk_budgeting->id_penawaran);
        $get_spk_budgeting_subcont_tenaga_ahli = $this->db->get()->result();

        $this->db->from('kons_tr_spk_budgeting_subcont_perusahaan a');
        $this->db->join('kons_tr_penawaran_subcont_perusahaan b', 'b.id_item = a.id_item');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $this->db->where('b.id_penawaran', $get_spk_budgeting->id_penawaran);
        $get_spk_budgeting_subcont_perusahaan = $this->db->get()->result();

        $this->db->select('a.nm_paket');
        $this->db->from('kons_master_konsultasi_header a');
        $this->db->where('a.id_konsultasi_h', $get_spk->id_project);
        $get_package = $this->db->get()->row();

        $nm_paket = (!empty($get_package)) ? $get_package->nm_paket : '';

        $data = [
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
        $this->template->title('Project Budgeting');
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

        $this->db->delete('kons_tr_spk_budgeting', ['id_spk_penawaran' => $post['id_spk_penawaran']]);
        $this->db->delete('kons_tr_spk_budgeting_akomodasi', ['id_spk_penawaran' => $post['id_spk_penawaran']]);
        $this->db->delete('kons_tr_spk_budgeting_aktifitas', ['id_spk_penawaran' => $post['id_spk_penawaran']]);
        $this->db->delete('kons_tr_spk_budgeting_others', ['id_spk_penawaran' => $post['id_spk_penawaran']]);
        $this->db->delete('kons_tr_spk_budgeting_lab', ['id_spk_penawaran' => $post['id_spk_penawaran']]);
        $this->db->delete('kons_tr_spk_budgeting_subcont_tenaga_ahli', ['id_spk_penawaran' => $post['id_spk_penawaran']]);
        $this->db->delete('kons_tr_spk_budgeting_subcont_perusahaan', ['id_spk_penawaran' => $post['id_spk_penawaran']]);

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
            'biaya_lab' => $post['summary_biaya_lab'],
            'biaya_subcont_tenaga_ahli' => $post['summary_biaya_subcont_tenaga_ahli'],
            'biaya_subcont_perusahaan' => $post['summary_biaya_subcont_perusahaan'],
            'nilai_kontrak_bersih' => $get_spk_penawaran->nilai_kontrak_bersih,
            'mandays_rate' => $get_spk_penawaran->mandays_rate,
            'ppn' => $get_penawaran->ppn,
            'grand_total' => $get_penawaran->grand_total,
            'mandays_subcont_before' => $post['ttl_mandays_subcont_before'],
            'biaya_subcont_before' => $post['ttl_subcont_before'],
            'biaya_akomodasi_before' => $post['ttl_total_akomodasi_before'],
            'biaya_others_before' => $post['ttl_total_others_before'],
            'biaya_lab_before' => $post['ttl_total_lab_before'],
            'biaya_subcont_tenaga_ahli_before' => $post['ttl_total_subcont_tenaga_ahli_before'],
            'biaya_subcont_perusahaan_before' => $post['ttl_total_subcont_perusahaan_before'],
            'mandays_subcont_after' => $post['summary_mandays_subcont'],
            'biaya_subcont_after' => $post['summary_biaya_subcont_after'],
            'biaya_akomodasi_after' => $post['summary_biaya_akomodasi_after'],
            'biaya_others_after' => $post['summary_biaya_others_after'],
            'biaya_lab_after' => $post['summary_biaya_lab_after'],
            'biaya_subcont_tenaga_ahli_after' => $post['summary_biaya_subcont_tenaga_ahli_after'],
            'biaya_subcont_perusahaan_after' => $post['summary_biaya_subcont_perusahaan_after'],
            'mandays_subcont_result' => $post['summary_mandays_subcont_result_value'],
            'biaya_subcont_result' => $post['summary_biaya_subcont_result_value'],
            'biaya_akomodasi_result' => $post['summary_biaya_akomodasi_result_value'],
            'biaya_others_result' => $post['summary_biaya_others_result_value'],
            'biaya_lab_result' => $post['summary_biaya_lab_result_value'],
            'biaya_subcont_tenaga_ahli_result' => $post['summary_biaya_subcont_tenaga_ahli_result_value'],
            'biaya_subcont_perusahaan_result' => $post['summary_biaya_subcont_perusahaan_result_value'],
            'create_by' => $this->auth->user_id(),
            'create_date' => date('Y-m-d H:i:s')
        ];

        $data_insert_konsultasi = [];
        if (isset($post['subcont_final'])) {
            foreach ($post['subcont_final'] as $item) {

                $this->db->select('a.nm_aktifitas, a.mandays, a.mandays_rate, a.mandays_tandem, a.mandays_rate_tandem, a.mandays_subcont, a.price_subcont, a.total_subcont');
                $this->db->from('kons_tr_spk_penawaran_subcont a');
                $this->db->where('a.id', $item['id']);
                $get_data_subcont = $this->db->get()->row_array();

                $total_aktifitas_estimasi = $get_data_subcont['total_subcont'];

                $total_aktifitas_final = (str_replace(',', '', $item['mandays_subcont']) * str_replace(',', '', $item['price_subcont']));

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
                    'mandays_final' => $get_data_subcont['mandays'],
                    'mandays_rate_final' => $get_data_subcont['mandays_rate'],
                    'mandays_tandem_final' =>  $get_data_subcont['mandays_tandem'],
                    'mandays_rate_tandem_final' => $get_data_subcont['mandays_rate_tandem'],
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

                $get_item = $this->db->get_where('kons_master_biaya', ['id' => $get_akomodasi->id_item])->row();

                $data_insert_akomodasi[] = [
                    'id_spk_budgeting' => $id_spk_budgeting,
                    'id_spk_penawaran' => $post['id_spk_penawaran'],
                    'id_penawaran' => $get_spk_penawaran->id_penawaran,
                    'id_akomodasi' => $item['id_akomodasi'],
                    'id_item' => $get_akomodasi->id_item,
                    'nm_item' => $get_item->nm_biaya,
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

                $get_item = $this->db->get_where('kons_master_biaya', ['id' => $get_others->id_item])->row();

                $nm_biaya = (!empty($get_item->nm_biaya)) ? $get_item->nm_biaya : '';

                if ($nm_biaya !== '') {
                    $data_insert_others[] = [
                        'id_spk_budgeting' => $id_spk_budgeting,
                        'id_spk_penawaran' => $post['id_spk_penawaran'],
                        'id_penawaran' => $get_spk_penawaran->id_penawaran,
                        'id_others' => $item['id_others'],
                        'id_item' => $get_others->id_item,
                        'nm_item' => $get_item->nm_biaya,
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
        }

        $data_insert_lab = [];
        if (isset($post['lab_final'])) {
            foreach ($post['lab_final'] as $item) {
                $this->db->select('a.*, b.isu_lingkungan');
                $this->db->from('kons_tr_penawaran_lab a');
                $this->db->join('kons_master_lab b', 'b.id = a.id_item', 'left');
                $this->db->where('a.id', $item['id_lab']);
                $get_lab = $this->db->get()->row();

                $data_insert_lab[] = [
                    'id_spk_budgeting' => $id_spk_budgeting,
                    'id_spk_penawaran' => $post['id_spk_penawaran'],
                    'id_penawaran' => $get_spk_penawaran->id_penawaran,
                    'id_lab' => $item['id_lab'],
                    'id_item' => $get_lab->id_item,
                    'nm_item' => $get_lab->isu_lingkungan,
                    'qty_estimasi' => $get_lab->qty,
                    'price_unit_estimasi' => $get_lab->price_unit,
                    'total_estimasi' => $get_lab->total,
                    'qty_final' => str_replace(',', '', $item['qty']),
                    'price_unit_final' => str_replace(',', '', $item['price_unit']),
                    'total_final' => str_replace(',', '', $item['total']),
                    'keterangan' => $get_lab->keterangan,
                    'create_by' => $this->auth->user_id(),
                    'create_date' => date('Y-m-d H:i:s')
                ];
            }
        }

        $data_insert_subcont_tenaga_ahli = [];
        if (isset($post['subcont_tenaga_ahli_final'])) {
            foreach ($post['subcont_tenaga_ahli_final'] as $item) {
                $this->db->select('a.*, b.nm_biaya');
                $this->db->from('kons_tr_penawaran_subcont_tenaga_ahli a');
                $this->db->join('kons_master_tenaga_ahli b', 'b.id = a.id_item', 'left');
                $this->db->where('a.id', $item['id_subcont_tenaga_ahli']);
                $get_subcont_tenaga_ahli = $this->db->get()->row();

                $data_insert_subcont_tenaga_ahli[] = [
                    'id_spk_budgeting' => $id_spk_budgeting,
                    'id_spk_penawaran' => $post['id_spk_penawaran'],
                    'id_penawaran' => $get_spk_penawaran->id_penawaran,
                    'id_subcont' => $item['id_subcont_tenaga_ahli'],
                    'id_item' => $get_subcont_tenaga_ahli->id_item,
                    'nm_item' => $get_subcont_tenaga_ahli->nm_biaya,
                    'qty_estimasi' => $get_subcont_tenaga_ahli->qty,
                    'price_unit_estimasi' => $get_subcont_tenaga_ahli->price_unit,
                    'total_estimasi' => $get_subcont_tenaga_ahli->total,
                    'qty_final' => str_replace(',', '', $item['qty']),
                    'price_unit_final' => str_replace(',', '', $item['price_unit']),
                    'total_final' => str_replace(',', '', $item['total']),
                    'keterangan' => $get_subcont_tenaga_ahli->keterangan,
                    'create_by' => $this->auth->user_id(),
                    'create_date' => date('Y-m-d H:i:s')
                ];
            }
        }

        $data_insert_subcont_perusahaan = [];
        if (isset($post['subcont_perusahaan_final'])) {
            foreach ($post['subcont_perusahaan_final'] as $item) {
                $this->db->select('a.*, b.nm_biaya');
                $this->db->from('kons_tr_penawaran_subcont_perusahaan a');
                $this->db->join('kons_master_subcont_perusahaan b', 'b.id = a.id_item', 'left');
                $this->db->where('a.id', $item['id_subcont_perusahaan']);
                $get_subcont_perusahaan = $this->db->get()->row();

                $data_insert_subcont_perusahaan[] = [
                    'id_spk_budgeting' => $id_spk_budgeting,
                    'id_spk_penawaran' => $post['id_spk_penawaran'],
                    'id_penawaran' => $get_spk_penawaran->id_penawaran,
                    'id_subcont' => $item['id_subcont_perusahaan'],
                    'id_item' => $get_subcont_perusahaan->id_item,
                    'nm_item' => $get_subcont_perusahaan->nm_biaya,
                    'qty_estimasi' => $get_subcont_perusahaan->qty,
                    'price_unit_estimasi' => $get_subcont_perusahaan->price_unit,
                    'total_estimasi' => $get_subcont_perusahaan->total,
                    'qty_final' => str_replace(',', '', $item['qty']),
                    'price_unit_final' => str_replace(',', '', $item['price_unit']),
                    'total_final' => str_replace(',', '', $item['total']),
                    'keterangan' => $get_subcont_perusahaan->keterangan,
                    'create_by' => $this->auth->user_id(),
                    'create_date' => date('Y-m-d H:i:s')
                ];
            }
        }

        $insert_spk_budgeting = $this->db->insert('kons_tr_spk_budgeting', $data_insert);
        if (!$insert_spk_budgeting) {
            print_r('Error 1 | ' . $this->db->last_query());
            $this->db->trans_rollback();
            exit;
        }

        if (!empty($data_insert_konsultasi)) {
            $insert_spk_budgeting_aktifitas = $this->db->insert_batch('kons_tr_spk_budgeting_aktifitas', $data_insert_konsultasi);
            if (!$insert_spk_budgeting_aktifitas) {
                print_r('Error 2 | ' . $this->db->last_query());
                $this->db->trans_rollback();
                exit;
            }
        }

        if (!empty($data_insert_akomodasi)) {
            $insert_spk_budgeting_akomodasi = $this->db->insert_batch('kons_tr_spk_budgeting_akomodasi', $data_insert_akomodasi);
            if (!$insert_spk_budgeting_akomodasi) {
                print_r('Error 3 | ' . $this->db->last_query());
                $this->db->trans_rollback();
                exit;
            }
        }

        if (!empty($data_insert_others)) {
            $insert_spk_budgeting_others = $this->db->insert_batch('kons_tr_spk_budgeting_others', $data_insert_others);
            if (!$insert_spk_budgeting_others) {
                print_r($this->db->last_query());
                $this->db->trans_rollback();
                exit;
            }
        }

        if (!empty($data_insert_lab)) {
            $insert_spk_budgeting_lab = $this->db->insert_batch('kons_tr_spk_budgeting_lab', $data_insert_lab);
            if (!$insert_spk_budgeting_lab) {
                print_r($this->db->last_query());
                $this->db->trans_rollback();
                exit;
            }
        }

        if (!empty($data_insert_subcont_tenaga_ahli)) {
            $insert_spk_budgeting_subcont_tenaga_ahli = $this->db->insert_batch('kons_tr_spk_budgeting_subcont_tenaga_ahli', $data_insert_subcont_tenaga_ahli);
            if (!$insert_spk_budgeting_subcont_tenaga_ahli) {
                print_r($this->db->last_query());
                $this->db->trans_rollback();
                exit;
            }
        }

        if (!empty($data_insert_subcont_perusahaan)) {
            $insert_spk_budgeting_subcont_perusahaan = $this->db->insert_batch('kons_tr_spk_budgeting_subcont_perusahaan', $data_insert_subcont_perusahaan);
            if (!$insert_spk_budgeting_subcont_perusahaan) {
                print_r($this->db->last_query());
                $this->db->trans_rollback();
                exit;
            }
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

        $this->db->delete('kons_tr_spk_budgeting_subcont_perusahaan', ['id_spk_budgeting' => $id]);
        $this->db->delete('kons_tr_spk_budgeting_subcont_tenaga_ahli', ['id_spk_budgeting' => $id]);
        $this->db->delete('kons_tr_spk_budgeting_lab', ['id_spk_budgeting' => $id]);
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
}
