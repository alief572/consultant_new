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
class SPK_penawaran extends Admin_Controller
{
    //Permission
    protected $viewPermission     = 'SPK_penawaran.View';
    protected $addPermission      = 'SPK_penawaran.Add';
    protected $managePermission = 'SPK_penawaran.Manage';
    protected $deletePermission = 'SPK_penawaran.Delete';

    public function __construct()
    {
        parent::__construct();
        $this->template->title('Quotation');
        $this->template->page_icon('fa fa-cubes');
        $this->load->library('upload');
        $this->load->model(array('Spk_penawaran/Spk_penawaran_model'));
        date_default_timezone_set('Asia/Bangkok');
    }

    public function index()
    {
        $this->auth->restrict($this->viewPermission);
        $this->template->title('SPK');
        $this->template->render('index');
    }

    public function create_spk()
    {
        $this->auth->restrict($this->viewPermission);
        $this->template->title('Create SPK');
        $this->template->render('choose_spk');
    }

    public function view_spk($id_spk_penawaran)
    {
        $id_spk_penawaran = urldecode($id_spk_penawaran);
        $id_spk_penawaran = str_replace('|', '/', $id_spk_penawaran);

        $get_spk_penawaran = $this->db->get_where('kons_tr_spk_penawaran', ['id_spk_penawaran' => $id_spk_penawaran])->row();
        // $get_spk_penawaran_subcont = $this->db->get_where('kons_tr_spk_penawaran_subcont', ['id_spk_penawaran' => $id_spk_penawaran])->result();
        $get_spk_penawaran_payment = $this->db->get_where('kons_tr_spk_penawaran_payment', ['id_spk_penawaran' => $id_spk_penawaran])->result();

        $this->db->select('a.id, a.id_spk_penawaran, a.id_aktifitas, a.nm_aktifitas, a.mandays, a.mandays_rate, a.mandays_tandem, a.mandays_rate_tandem, a.harga_aktifitas, a.total_aktifitas');
        $this->db->from('kons_tr_spk_aktifitas a');
        $this->db->where('a.id_spk_penawaran', $id_spk_penawaran);
        $get_list_spk_aktifitas = $this->db->get()->result();

        $this->db->select('a.*');
        $this->db->from('kons_tr_spk_penawaran_subcont a');
        $this->db->where('a.id_spk_penawaran', $id_spk_penawaran);
        $this->db->order_by('a.id', 'asc');
        $get_spk_penawaran_subcont = $this->db->get()->result();

        // $this->db->select('a.id, a.id_penawaran, a.id_spk_penawaran, a.');

        $get_penawaran = $this->db->get_where('kons_tr_penawaran', ['id_quotation' => $get_spk_penawaran->id_penawaran])->row();

        $this->db->select('a.*, b.nm_pic, b.divisi as jabatan_pic, b.hp as no_hp_pic');
        $this->db->from('customer a');
        $this->db->join('customer_pic b', 'b.id_pic = a.id_pic', 'left');
        $this->db->where('a.nm_customer <>', '');
        $this->db->where('a.id_customer', $get_penawaran->id_customer);
        $get_customer = $this->db->get()->row();

        $this->db->select('a.id, a.name as nm_karyawan');
        $this->db->from(DBHR . '.employees a');
        $this->db->where('a.id', $get_penawaran->id_marketing);
        $get_marketing = $this->db->get()->row();

        $this->db->select('a.id, a.name as nm_karyawan');
        $this->db->from(DBHR . '.employees a');
        $this->db->where('a.flag_active', 'Y');
        $this->db->where('a.company_id', 'COM003');
        $this->db->order_by('a.name', 'ASC');
        $get_all_marketing = $this->db->get()->result();

        $this->db->select('a.nm_paket');
        $this->db->from('kons_master_konsultasi_header a');
        $this->db->where('a.id_konsultasi_h', $get_penawaran->id_paket);
        $get_konsultasi = $this->db->get()->row();

        $this->db->select('a.id, a.name as nama');
        $this->db->from(DBHR . '.divisions a');
        $this->db->where('a.company_id', 'COM003');
        $get_divisi = $this->db->get()->result();

        $this->db->select('a.*');
        $this->db->from('kons_master_aktifitas a');
        $get_all_aktifitas = $this->db->get()->result();

        $detail_informasi_awal = '';
        if ($get_penawaran->tipe_informasi_awal == 'Sales' || $get_penawaran->tipe_informasi_awal == 'Others') {
            $this->db->select('a.name as nm_karyawan');
            $this->db->from(DBHR . '.employees a');
            $this->db->where('a.id', $get_penawaran->detail_informasi_awal);
            $get_marketing_informasi_awal = $this->db->get()->row();

            if (!empty($get_marketing_informasi_awal)) {
                $detail_informasi_awal = $get_marketing_informasi_awal->nm_karyawan;
            }
        } else {
            $detail_informasi_awal = $get_penawaran->detail_informasi_awal;
        }

        $this->db->select('a.*, b.nm_aktifitas');
        $this->db->from('kons_tr_penawaran_aktifitas a');
        $this->db->join('kons_master_aktifitas b', 'b.id_aktifitas = a.id_aktifitas', 'left');
        $this->db->where('a.id_penawaran', $get_penawaran->id_quotation);
        $this->db->order_by('a.id', 'asc');
        $get_aktifitas = $this->db->get()->result();

        $this->db->select('a.*');
        $this->db->from('kons_tr_penawaran_akomodasi a');
        $this->db->where('a.id_penawaran', $get_penawaran->id_quotation);
        $get_akomodasi = $this->db->get()->result();

        $nilai_akomodasi = 0;
        foreach ($get_akomodasi as $item_akomodasi) {
            $nilai_akomodasi += $item_akomodasi->total;
        }

        $this->db->select('a.*');
        $this->db->from('kons_tr_penawaran_others a');
        $this->db->where('a.id_penawaran', $get_penawaran->id_quotation);
        $get_others = $this->db->get()->result();

        $nilai_others = 0;
        foreach ($get_others as $item_others) {
            $nilai_others += $item_others->total_budget;
        }

        $this->db->select('a.*');
        $this->db->from('kons_tr_penawaran_lab a');
        $this->db->where('a.id_penawaran', $get_penawaran->id_quotation);
        $get_lab = $this->db->get()->result();

        $nilai_lab = 0;
        foreach ($get_lab as $item_lab) {
            $nilai_lab += $item_lab->total_budget;
        }

        $nilai_kontrak = 0;
        foreach ($get_aktifitas as $item_aktifitas) {
            $nilai_kontrak += $item_aktifitas->harga_aktifitas;
        }

        $approval_data = [];

        $data = [
            'list_spk_aktifitas' => $get_list_spk_aktifitas,
            'list_spk_penawaran' => $get_spk_penawaran,
            'list_spk_penawaran_subcont' => $get_spk_penawaran_subcont,
            'list_spk_penawaran_payment' => $get_spk_penawaran_payment,
            'list_penawaran' => $get_penawaran,
            'list_customer' => $get_customer,
            'list_marketing' => $get_marketing,
            'list_all_marketing' => $get_all_marketing,
            'list_divisi' => $get_divisi,
            'list_all_aktifitas' => $get_all_aktifitas,
            'detail_informasi_awal' => $detail_informasi_awal,
            'nilai_project' => $get_penawaran->grand_total,
            'nilai_akomodasi' => $nilai_akomodasi,
            'nilai_others' => $nilai_others,
            'nilai_lab' => $nilai_lab,
            'nilai_kontrak' => $nilai_kontrak
        ];

        $this->auth->restrict($this->viewPermission);
        $this->template->title('View SPK');
        $this->template->set($data);
        $this->template->render('view_spk');
    }

    public function edit_spk($id_spk_penawaran)
    {
        $id_spk_penawaran = urldecode($id_spk_penawaran);
        $id_spk_penawaran = str_replace('|', '/', $id_spk_penawaran);

        $get_spk_penawaran = $this->db->get_where('kons_tr_spk_penawaran', ['id_spk_penawaran' => $id_spk_penawaran])->row();
        // $get_spk_penawaran_subcont = $this->db->get_where('kons_tr_spk_penawaran_subcont', ['id_spk_penawaran' => $id_spk_penawaran])->result();
        $get_spk_penawaran_payment = $this->db->get_where('kons_tr_spk_penawaran_payment', ['id_spk_penawaran' => $id_spk_penawaran])->result();

        $this->db->select('a.id, a.id_spk_penawaran, a.id_aktifitas, a.nm_aktifitas, a.mandays, a.mandays_rate, a.mandays_tandem, a.mandays_rate_tandem, a.harga_aktifitas, a.total_aktifitas');
        $this->db->from('kons_tr_spk_aktifitas a');
        $this->db->where('a.id_spk_penawaran', $id_spk_penawaran);
        $get_list_spk_aktifitas = $this->db->get()->result();

        $this->db->select('a.*');
        $this->db->from('kons_tr_spk_penawaran_subcont a');
        $this->db->where('a.id_spk_penawaran', $id_spk_penawaran);
        $this->db->order_by('a.id', 'asc');
        $get_spk_penawaran_subcont = $this->db->get()->result();

        // $this->db->select('a.id, a.id_penawaran, a.id_spk_penawaran, a.');

        $get_penawaran = $this->db->get_where('kons_tr_penawaran', ['id_quotation' => $get_spk_penawaran->id_penawaran])->row();

        $this->db->select('a.*, b.nm_pic, b.divisi as jabatan_pic, b.hp as no_hp_pic');
        $this->db->from('customer a');
        $this->db->join('customer_pic b', 'b.id_pic = a.id_pic', 'left');
        $this->db->where('a.nm_customer <>', '');
        $this->db->where('a.id_customer', $get_penawaran->id_customer);
        $get_customer = $this->db->get()->row();

        $this->db->select('a.id, a.name as nm_karyawan');
        $this->db->from(DBHR . '.employees a');
        $this->db->where('a.id', $get_penawaran->id_marketing);
        $get_marketing = $this->db->get()->row();

        $this->db->select('a.id, a.name as nm_karyawan');
        $this->db->from(DBHR . '.employees a');
        $this->db->where('a.flag_active', 'Y');
        $this->db->where('a.company_id', 'COM003');
        $this->db->order_by('a.name', 'ASC');
        $get_all_marketing = $this->db->get()->result();

        $this->db->select('a.nm_paket');
        $this->db->from('kons_master_konsultasi_header a');
        $this->db->where('a.id_konsultasi_h', $get_penawaran->id_paket);
        $get_konsultasi = $this->db->get()->row();

        $this->db->select('a.id, a.name as nama');
        $this->db->from(DBHR . '.divisions a');
        $this->db->where('a.company_id', 'COM003');
        $get_divisi = $this->db->get()->result();

        $this->db->select('a.*');
        $this->db->from('kons_master_aktifitas a');
        $get_all_aktifitas = $this->db->get()->result();

        $detail_informasi_awal = '';
        if ($get_penawaran->tipe_informasi_awal == 'Sales' || $get_penawaran->tipe_informasi_awal == 'Others') {
            $this->db->select('a.name as nm_karyawan');
            $this->db->from(DBHR . '.employees a');
            $this->db->where('a.id', $get_penawaran->detail_informasi_awal);
            $get_marketing_informasi_awal = $this->db->get()->row();

            if (!empty($get_marketing_informasi_awal)) {
                $detail_informasi_awal = $get_marketing_informasi_awal->nm_karyawan;
            }
        } else {
            $detail_informasi_awal = $get_penawaran->detail_informasi_awal;
        }

        $this->db->select('a.*, b.nm_aktifitas');
        $this->db->from('kons_tr_penawaran_aktifitas a');
        $this->db->join('kons_master_aktifitas b', 'b.id_aktifitas = a.id_aktifitas', 'left');
        $this->db->where('a.id_penawaran', $get_penawaran->id_quotation);
        $this->db->order_by('a.id', 'asc');
        $get_aktifitas = $this->db->get()->result();

        $this->db->select('a.*');
        $this->db->from('kons_tr_penawaran_akomodasi a');
        $this->db->where('a.id_penawaran', $get_penawaran->id_quotation);
        $get_akomodasi = $this->db->get()->result();

        $nilai_akomodasi = 0;
        foreach ($get_akomodasi as $item_akomodasi) {
            $nilai_akomodasi += $item_akomodasi->total;
        }

        $this->db->select('a.*');
        $this->db->from('kons_tr_penawaran_others a');
        $this->db->where('a.id_penawaran', $get_penawaran->id_quotation);
        $get_others = $this->db->get()->result();

        $nilai_others = 0;
        foreach ($get_others as $item_others) {
            $nilai_others += $item_others->total_budget;
        }

        $this->db->select('a.*');
        $this->db->from('kons_tr_penawaran_lab a');
        $this->db->where('a.id_penawaran', $get_penawaran->id_quotation);
        $get_lab = $this->db->get()->result();

        $nilai_lab = 0;
        foreach ($get_lab as $item_lab) {
            $nilai_lab += $item_lab->total_budget;
        }

        $nilai_kontrak = 0;
        foreach ($get_aktifitas as $item_aktifitas) {
            $nilai_kontrak += $item_aktifitas->harga_aktifitas;
        }

        $data = [
            'list_spk_aktifitas' => $get_list_spk_aktifitas,
            'list_spk_penawaran' => $get_spk_penawaran,
            'list_spk_penawaran_subcont' => $get_spk_penawaran_subcont,
            'list_spk_penawaran_payment' => $get_spk_penawaran_payment,
            'list_penawaran' => $get_penawaran,
            'list_customer' => $get_customer,
            'list_marketing' => $get_marketing,
            'list_all_marketing' => $get_all_marketing,
            'list_divisi' => $get_divisi,
            'list_all_aktifitas' => $get_all_aktifitas,
            'detail_informasi_awal' => $detail_informasi_awal,
            'nilai_project' => $get_penawaran->grand_total,
            'nilai_akomodasi' => $nilai_akomodasi,
            'nilai_others' => $nilai_others,
            'nilai_lab' => $nilai_lab,
            'nilai_kontrak' => $nilai_kontrak
        ];

        $this->auth->restrict($this->viewPermission);
        $this->template->title('Edit SPK');
        $this->template->set($data);
        $this->template->render('edit_spk');
    }

    public function print_spk($id_spk_penawaran)
    {
        $id_spk_penawaran = urldecode($id_spk_penawaran);
        $id_spk_penawaran = str_replace('|', '/', $id_spk_penawaran);

        $get_spk_penawaran = $this->db->get_where('kons_tr_spk_penawaran', ['id_spk_penawaran' => $id_spk_penawaran])->row();
        // $get_spk_penawaran_subcont = $this->db->get_where('kons_tr_spk_penawaran_subcont', ['id_spk_penawaran' => $id_spk_penawaran])->result();
        $get_spk_penawaran_payment = $this->db->get_where('kons_tr_spk_penawaran_payment', ['id_spk_penawaran' => $id_spk_penawaran])->result();

        $this->db->select('a.*');
        $this->db->from('kons_tr_spk_penawaran_subcont a');
        $this->db->where('a.id_spk_penawaran', $id_spk_penawaran);
        $this->db->order_by('a.id', 'asc');
        $get_spk_penawaran_subcont = $this->db->get()->result();

        $get_penawaran = $this->db->get_where('kons_tr_penawaran', ['id_quotation' => $get_spk_penawaran->id_penawaran])->row();

        $this->db->select('a.*, b.nm_pic, b.divisi as jabatan_pic, b.hp as no_hp_pic');
        $this->db->from('customer a');
        $this->db->join('customer_pic b', 'b.id_pic = a.id_pic', 'left');
        $this->db->where('a.nm_customer <>', '');
        $this->db->where('a.id_customer', $get_penawaran->id_customer);
        $get_customer = $this->db->get()->row();

        $this->db->select('a.id, a.name as nm_karyawan');
        $this->db->from(DBHR . '.employees a');
        $this->db->where('a.id', $get_penawaran->id_marketing);
        $get_marketing = $this->db->get()->row();

        $this->db->select('a.id, a.name as nm_karyawan');
        $this->db->from(DBHR . '.employees a');
        $this->db->where('a.flag_active', 'Y');
        $this->db->where('a.company_id', 'COM003');
        $this->db->order_by('a.name', 'ASC');
        $get_all_marketing = $this->db->get()->result();

        $this->db->select('a.nm_paket');
        $this->db->from('kons_master_konsultasi_header a');
        $this->db->where('a.id_konsultasi_h', $get_penawaran->id_paket);
        $get_konsultasi = $this->db->get()->row();

        $this->db->select('a.id, a.name as nama');
        $this->db->from(DBHR . '.divisions a');
        $this->db->where('a.company_id', 'COM003');
        $get_divisi = $this->db->get()->result();

        $this->db->select('a.*');
        $this->db->from('kons_master_aktifitas a');
        $get_all_aktifitas = $this->db->get()->result();

        $detail_informasi_awal = '';
        if ($get_penawaran->tipe_informasi_awal == 'Sales' || $get_penawaran->tipe_informasi_awal == 'Others') {
            $this->db->select('a.name as nm_karyawan');
            $this->db->from(DBHR . '.employees a');
            $this->db->where('a.id', $get_penawaran->detail_informasi_awal);
            $get_marketing_informasi_awal = $this->db->get()->row();

            if (!empty($get_marketing_informasi_awal)) {
                $detail_informasi_awal = $get_marketing_informasi_awal->nm_karyawan;
            }
        } else {
            $detail_informasi_awal = $get_penawaran->detail_informasi_awal;
        }

        $this->db->select('a.*, b.nm_biaya');
        $this->db->from('kons_tr_penawaran_akomodasi a');
        $this->db->join('kons_master_biaya b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_penawaran', $get_spk_penawaran->id_penawaran);
        $get_akomodasi = $this->db->get()->result();

        $this->db->select('a.*, b.nm_biaya');
        $this->db->from('kons_tr_penawaran_others a');
        $this->db->join('kons_master_biaya b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_penawaran', $get_spk_penawaran->id_penawaran);
        $get_others = $this->db->get()->result();

        $ttl_mandays_subcont = 0;
        $ttl_tandem = 0;
        foreach ($get_spk_penawaran_subcont as $item) {
            $ttl_mandays_subcont += $item->mandays_subcont;
            $ttl_tandem += ($item->mandays_tandem * $item->mandays_rate_tandem);
        }

        $data = [
            'list_spk_penawaran' => $get_spk_penawaran,
            'list_spk_penawaran_subcont' => $get_spk_penawaran_subcont,
            'list_spk_penawaran_payment' => $get_spk_penawaran_payment,
            'list_penawaran' => $get_penawaran,
            'list_customer' => $get_customer,
            'list_marketing' => $get_marketing,
            'list_all_marketing' => $get_all_marketing,
            'list_divisi' => $get_divisi,
            'list_all_aktifitas' => $get_all_aktifitas,
            'detail_informasi_awal' => $detail_informasi_awal,
            'list_akomodasi' => $get_akomodasi,
            'list_others' => $get_others,
            'ttl_mandays_subcont' => $ttl_mandays_subcont,
            'ttl_tandem' => $ttl_tandem
        ];

        // ob_clean();
        // ob_start();
        $this->auth->restrict($this->managePermission);
        $this->load->view('print_spk', $data);
        // $html = ob_get_contents();

        // require_once('./assets/html2pdf/html2pdf/html2pdf.class.php');
        // $html2pdf = new HTML2PDF('P', 'A4', 'en', true, 'UTF-8', array(0, 0, 0, 0));
        // $html2pdf->pdf->SetDisplayMode('fullpage');
        // $html2pdf->WriteHTML($html);
        // ob_end_clean();
        // $html2pdf->Output('Penawaran.pdf', 'I');
    }

    public function get_data_spk()
    {

        $draw = $this->input->post('draw');
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $search = $this->input->post('search');

        $this->db->select('a.*, b.grand_total');
        $this->db->from('kons_tr_spk_penawaran a');
        $this->db->join('kons_tr_penawaran b', 'b.id_quotation = a.id_penawaran', 'left');
        $this->db->where(1, 1);
        $this->db->where('a.deleted_by', null);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->or_like('a.id_spk_penawaran', $search['value'], 'both');
            $this->db->or_like('a.nm_sales', $search['value'], 'both');
            $this->db->or_like('a.nm_project', $search['value'], 'both');
            $this->db->or_like('a.nm_customer', $search['value'], 'both');
            $this->db->or_like('b.grand_total', $search['value'], 'both');
            $this->db->group_end();
        }
        $this->db->order_by('a.input_date', 'desc');
        $this->db->limit($length, $start);

        $get_data = $this->db->get();

        $this->db->select('a.*, b.grand_total');
        $this->db->from('kons_tr_spk_penawaran a');
        $this->db->join('kons_tr_penawaran b', 'b.id_quotation = a.id_penawaran', 'left');
        $this->db->where(1, 1);
        $this->db->where('a.deleted_by', null);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->or_like('a.id_spk_penawaran', $search['value'], 'both');
            $this->db->or_like('a.nm_sales', $search['value'], 'both');
            $this->db->or_like('a.nm_project', $search['value'], 'both');
            $this->db->or_like('a.nm_customer', $search['value'], 'both');
            $this->db->or_like('b.grand_total', $search['value'], 'both');
            $this->db->group_end();
        }
        $this->db->order_by('a.input_date', 'desc');

        $get_data_all = $this->db->get();

        $hasil = [];

        $no = 1;
        foreach ($get_data->result() as $item) {

            $status = '<button type="button" class="btn btn-sm btn-success">NEW</button>';
            $status_spk = '<button type="button" class="btn btn-sm btn-primary">Waiting Approval</button>';

            $get_penawaran = $this->db->get_where('kons_tr_penawaran', ['id_quotation' => $item->id_penawaran])->row();
            if ($get_penawaran->sts_cust == 0) {
                $status = '
                    <span class="btn btn-sm btn-warning" style="width: 100% !important;">
                        <b>New</b>
                    </span>
                ';
            } else {
                $status = '
                    <span class="btn btn-sm btn-info" style="width: 100% !important;">
                        <b>Repeat</b>
                    </span>
                ';
            }

            if ($item->sts_spk == '1') {
                $status_spk = '<button type="button" class="btn btn-sm btn-success">Approved</button>';
            }
            if ($item->sts_spk == '0') {
                $status_spk = '<button type="button" class="btn btn-sm btn-danger">Rejected</button>';
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

            if (has_permission($this->viewPermission)) {
                $option .= '
                    <div class="col-12" style="margin-left: 0.5rem">
                        <a href="' . base_url('spk_penawaran/view_spk/' . urlencode(str_replace('/', '|', $item->id_spk_penawaran))) . '" class="btn btn-sm btn-info" style="color: #000000">
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

            if (has_permission($this->managePermission)) {
                $option .= '
                    <div class="col-12" style="margin-top: 0.5rem; margin-left: 0.5rem">
                        <a href="' . base_url('spk_penawaran/edit_spk/' . urlencode(str_replace('/', '|', $item->id_spk_penawaran))) . '" class="btn btn-sm btn-success" style="color: #000000">
                            <div class="col-12 dropdown-item">
                            <b>
                                <i class="fa fa-edit"></i>
                            </b>
                            </div>
                        </a>
                        <span style="font-weight: 500"> Revisi </span>
                    </div>
                ';
            }

            if (has_permission($this->deletePermission)) {
                $option .= '
                    <div class="col-12" style="margin-top: 0.5rem; margin-left: 0.5rem">
                        <a href="#" class="btn btn-sm btn-danger del_spk" style="color: #000000" data-id_spk_penawaran="' . $item->id_spk_penawaran . '">
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

            $option .= '
                <div class="col-12" style="margin-top: 0.5rem; margin-left: 0.5rem">
                    <a
                        href="' . base_url('spk_penawaran/print_spk/' . urlencode(str_replace('/', '|', $item->id_spk_penawaran))) . '"
                        class="btn btn-sm"
                        style="background-color: #ff0066; color: #000000" target="_blank">
                        <div class="col-12 dropdown-item">
                        <b>
                            <i class="fa fa-print"></i>
                        </b>
                        </div>
                    </a>
                    <span style="font-weight: 500"> Print </span>
                </div>
            ';
            $option .= '</div>';

            $nm_marketing = $item->nm_sales;

            $nm_paket = $item->nm_project;

            $nm_customer = $item->nm_customer;

            $hasil[] = [
                'no' => $no,
                'id_spk_penawaran' => $item->id_spk_penawaran,
                'nm_marketing' => ucfirst($nm_marketing),
                'nm_paket' => $nm_paket,
                'nm_customer' => $nm_customer,
                'grand_total' => number_format($item->grand_total),
                'status' => $status,
                'status_spk' => $status_spk,
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

    public function get_data_penawaran()
    {
        $draw = $this->input->post('draw');
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $search = $this->input->post('search');

        $this->db->select('a.*, c.nama');
        $this->db->from('kons_tr_penawaran a');
        $this->db->join('customer b', 'b.id_customer = a.id_customer', 'left');
        $this->db->join('members c', 'c.id = a.id_marketing', 'left');
        $this->db->join('kons_master_konsultasi_header d', 'd.id_konsultasi_h = a.id_paket', 'left');
        $this->db->join('kons_master_paket e', 'e.id_paket = d.id_paket', 'left');
        $this->db->where(1, 1);
        $this->db->where('a.deleted_by', null);
        $this->db->group_start();
        $this->db->where('a.id_spk_penawaran', null);
        $this->db->or_where('a.id_spk_penawaran', '');
        $this->db->group_end();
        $this->db->where('a.sts_deal', 1);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.tgl_quotation', $search['value'], 'both');
            $this->db->or_like('c.nama', $search['value'], 'both');
            $this->db->or_like('e.nm_paket', $search['value'], 'both');
            $this->db->or_like('b.nm_customer', $search['value'], 'both');
            $this->db->or_like('a.grand_total', str_replace(',', '', $search['value']), 'both');
            $this->db->group_end();
        }
        $this->db->order_by('a.input_date', 'desc');
        $this->db->limit($length, $start);

        $get_data = $this->db->get();

        $this->db->select('a.*, c.nama');
        $this->db->from('kons_tr_penawaran a');
        $this->db->join('customer b', 'b.id_customer = a.id_customer', 'left');
        $this->db->join('members c', 'c.id = a.id_marketing', 'left');
        $this->db->join('kons_master_konsultasi_header d', 'd.id_konsultasi_h = a.id_paket', 'left');
        $this->db->join('kons_master_paket e', 'e.id_paket = d.id_paket', 'left');
        $this->db->where(1, 1);
        $this->db->where('a.deleted_by', null);
        $this->db->group_start();
        $this->db->where('a.id_spk_penawaran', null);
        $this->db->or_where('a.id_spk_penawaran', '');
        $this->db->group_end();
        $this->db->where('a.sts_deal', 1);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.tgl_quotation', $search['value'], 'both');
            $this->db->or_like('c.nama', $search['value'], 'both');
            $this->db->or_like('e.nm_paket', $search['value'], 'both');
            $this->db->or_like('b.nm_customer', $search['value'], 'both');
            $this->db->or_like('a.grand_total', str_replace(',', '', $search['value']), 'both');
            $this->db->group_end();
        }
        $this->db->order_by('a.input_date', 'desc');

        $get_data_all = $this->db->get();

        $hasil = [];

        $no = 1;
        foreach ($get_data->result() as $item) {

            if ($item->sts_cust == 0) {
                $status_cust = '
                    <span class="btn btn-sm btn-success" style="width: 100% !important;">
                        <b>NEW</b>
                    </span>
                ';
            } else {
                $status_cust = '
                    <span class="btn btn-sm btn-primary" style="width: 100% !important;">
                        <b>REPEAT</b>
                    </span>
                ';
            }

            if ($item->sts_quot == 1) {
                $status_quot = '
                    <span class="btn btn-sm btn-primary" style="width: 100% !important;">
                        <b>Waiting Approval</b>
                    </span>
                ';
            }
            if ($item->sts_quot == 2) {
                $status_quot = '
                    <span class="btn btn-sm btn-success" style="width: 100% !important;">
                        <b>Approved</b>
                    </span>
                ';
            }
            if ($item->sts_quot == 0) {
                $status_quot = '
                    <span class="btn btn-sm btn-danger" style="width: 100% !important;">
                        <b>Rejected</b>
                    </span>
                ';
            }

            $option = '
                <a href="' . base_url('spk_penawaran/add_spk/' . urlencode(str_replace('/', '|', $item->id_quotation))) . '" class="btn btn-sm btn-primary"><i class="fa fa-arrow-right"></i></a>
            ';


            $get_marketing = $this->db->get_where('employee', ['id' => $item->id_marketing])->row();
            $nm_marketing = (!empty($get_marketing)) ? $get_marketing->nm_karyawan : '';

            $this->db->select('a.*, b.nm_paket');
            $this->db->from('kons_master_konsultasi_header a');
            $this->db->join('kons_master_paket b', 'b.id_paket = a.id_paket', 'left');
            $this->db->where('a.id_konsultasi_h', $item->id_paket);
            $get_package = $this->db->get()->row();

            $nm_paket = (!empty($get_package)) ? $get_package->nm_paket : '';

            $get_customers = $this->db->get_where('customer', ['id_customer' => $item->id_customer])->row();
            $nm_customer = (!empty($get_customers)) ? $get_customers->nm_customer : '';

            $hasil[] = [
                'no' => $no,
                'id_quotation' => $item->id_quotation,
                'tgl_quotation' => $item->tgl_quotation,
                'nm_marketing' => ucfirst($item->nama),
                'nm_paket' => $nm_paket,
                'nm_customer' => $nm_customer,
                'grand_total' => number_format($item->grand_total),
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

    public function add_spk($id_quotation)
    {

        $id_quotation = urldecode($id_quotation);
        $id_quotation = str_replace('|', '/', $id_quotation);

        $get_penawaran = $this->db->get_where('kons_tr_penawaran', ['id_quotation' => $id_quotation])->row();

        $this->db->select('a.*, b.nm_pic, b.divisi as jabatan_pic, b.hp as no_hp_pic');
        $this->db->from('customer a');
        $this->db->join('customer_pic b', 'b.id_pic = a.id_pic', 'left');
        $this->db->where('a.nm_customer <>', '');
        $this->db->where('a.id_customer', $get_penawaran->id_customer);
        $get_customer = $this->db->get()->row();

        // $this->db->select('a.*');
        // $this->db->from('employee a');
        // $this->db->where('a.deleted', 'N');
        // $this->db->where('a.id', $get_penawaran->id_marketing);
        // $get_marketing = $this->db->get()->row();

        $this->db->select('a.id, a.name as nm_karyawan');
        $this->db->from(DBHR . '.employees a');
        $this->db->where('a.id', $get_penawaran->id_marketing);
        $get_marketing = $this->db->get()->row();

        $this->db->select('a.id, a.name as nm_karyawan');
        $this->db->from(DBHR . '.employees a');
        $this->db->where('a.flag_active', 'Y');
        $this->db->where('a.company_id', 'COM003');
        $this->db->order_by('a.name', 'ASC');
        $get_all_marketing = $this->db->get()->result();

        $this->db->select('a.nm_paket');
        $this->db->from('kons_master_konsultasi_header a');
        $this->db->where('a.id_konsultasi_h', $get_penawaran->id_paket);
        $get_konsultasi = $this->db->get()->row();

        $this->db->select('a.id, a.name as nama');
        $this->db->from(DBHR . '.divisions a');
        $this->db->where('a.company_id', 'COM003');
        $get_divisi = $this->db->get()->result();

        $detail_informasi_awal = '';
        if ($get_penawaran->tipe_informasi_awal == 'Sales' || $get_penawaran->tipe_informasi_awal == 'Others') {
            $this->db->select('a.name as nm_karyawan');
            $this->db->from(DBHR . '.employees a');
            $this->db->where('a.id', $get_penawaran->detail_informasi_awal);
            $get_marketing_informasi_awal = $this->db->get()->row();

            if (!empty($get_marketing_informasi_awal)) {
                $detail_informasi_awal = $get_marketing_informasi_awal->nm_karyawan;
            }
        } else {
            $detail_informasi_awal = $get_penawaran->detail_informasi_awal;
        }

        $this->db->select('a.*, b.nm_aktifitas');
        $this->db->from('kons_tr_penawaran_aktifitas a');
        $this->db->join('kons_master_aktifitas b', 'b.id_aktifitas = a.id_aktifitas', 'left');
        $this->db->where('a.id_penawaran', $id_quotation);
        $this->db->order_by('a.id', 'asc');
        $get_aktifitas = $this->db->get()->result();

        $nilai_kontrak = 0;
        foreach ($get_aktifitas as $item_aktifitas) {
            $nilai_kontrak += $item_aktifitas->harga_aktifitas;
        }

        $this->db->select('a.*');
        $this->db->from('kons_master_aktifitas a');
        $get_all_aktifitas = $this->db->get()->result();

        $this->db->select('a.*');
        $this->db->from('kons_tr_penawaran_akomodasi a');
        $this->db->where('a.id_penawaran', $id_quotation);
        $get_akomodasi = $this->db->get()->result();

        $nilai_akomodasi = 0;
        foreach ($get_akomodasi as $item_akomodasi) {
            $nilai_akomodasi += $item_akomodasi->total;
        }

        $this->db->select('a.*');
        $this->db->from('kons_tr_penawaran_others a');
        $this->db->where('a.id_penawaran', $id_quotation);
        $get_others = $this->db->get()->result();

        $nilai_others = 0;
        foreach ($get_others as $item_others) {
            $nilai_others += $item_others->total_budget;
        }

        $this->db->select('a.*');
        $this->db->from('kons_tr_penawaran_lab a');
        $this->db->where('a.id_penawaran', $id_quotation);
        $get_lab = $this->db->get()->result();

        $nilai_lab = 0;
        foreach($get_lab as $item_lab) {
            $nilai_lab += $item_lab->total_budget;
        }

        $nilai_project = $get_penawaran->grand_total;

        $data = [
            'list_penawaran' => $get_penawaran,
            'list_customer' => $get_customer,
            'list_marketing' => $get_marketing,
            'list_all_marketing' => $get_all_marketing,
            'list_divisi' => $get_divisi,
            'list_aktifitas' => $get_aktifitas,
            'list_all_aktifitas' => $get_all_aktifitas,
            'detail_informasi_awal' => $detail_informasi_awal,
            'nm_paket' => $get_konsultasi->nm_paket,
            'nilai_kontrak' => $nilai_kontrak,
            'nilai_project' => $nilai_project,
            'nilai_akomodasi' => $nilai_akomodasi,
            'nilai_others' => $nilai_others,
            'nilai_lab' => $nilai_lab
        ];

        $this->template->set($data);
        $this->template->title('Add SPK');
        $this->template->render('add_spk');
    }

    public function save_spk_penawaran()
    {
        $post = $this->input->post();

        $id_spk_penawaran = $this->Spk_penawaran_model->generate_id_spk_penawaran();

        $get_penawaran = $this->db->get_where('kons_tr_penawaran', ['id_quotation' => $post['id_quotation']])->row();

        $this->db->select('a.id, a.id_aktifitas, a.mandays, a.mandays_rate, a.bobot, a.mandays_tandem, a.mandays_rate_tandem, a.harga_aktifitas, a.total_aktifitas, b.nm_aktifitas as aktifitas_nm');
        $this->db->from('kons_tr_penawaran_aktifitas a');
        $this->db->join('kons_master_aktifitas b', 'b.id_aktifitas = a.id_aktifitas', 'left');
        $this->db->where('a.id_penawaran', $post['id_quotation']);
        $get_penawaran_aktifitas = $this->db->get()->result();

        $this->db->select('a.id_customer, a.nm_customer');
        $this->db->from('customer a');
        $this->db->where('a.id_customer', $get_penawaran->id_customer);
        $get_customer = $this->db->get()->row();

        $id_customer = (!empty($get_customer)) ? $get_customer->id_customer : '';
        $nm_customer = (!empty($get_customer)) ? $get_customer->nm_customer : '';

        $this->db->select('a.id, a.name as nm_karyawan');
        $this->db->from(DBHR . '.employees a');
        $this->db->where('a.id', $get_penawaran->id_marketing);
        $get_marketing = $this->db->get()->row();

        $id_marketing = (!empty($get_marketing)) ? $get_marketing->id : '';
        $nm_marketing = (!empty($get_marketing)) ? $get_marketing->nm_karyawan : '';

        $this->db->select('a.*, b.nm_paket');
        $this->db->from('kons_master_konsultasi_header a');
        $this->db->join('kons_master_paket b', 'b.id_paket = a.id_paket', 'left');
        $this->db->where('a.id_konsultasi_h', $get_penawaran->id_paket);
        $get_konsultasi = $this->db->get()->row();

        $get_divisi = $this->db->get_where(DBHR.'.divisions', ['id' => $post['divisi']])->row();

        $id_divisi = (!empty($get_divisi)) ? $get_divisi->id : '';
        $nm_divisi = (!empty($get_divisi)) ? $get_divisi->name : '';

        $this->db->select('a.id, a.name as nm_karyawan');
        $this->db->from(DBHR . '.employees a');
        $this->db->where('a.id', $post['project_leader']);
        $get_project_leader = $this->db->get()->row();

        $id_project_leader = (!empty($get_project_leader)) ? $get_project_leader->id : '';
        $nm_project_leader = (!empty($get_project_leader)) ? $get_project_leader->nm_karyawan : '';

        $this->db->select('a.id, a.name as nm_karyawan');
        $this->db->from(DBHR . '.employees a');
        $this->db->where('a.id', $post['konsultan_1']);
        $get_konsultan_1 = $this->db->get()->row();

        $id_konsultan_1 = (!empty($get_konsultan_1)) ? $get_konsultan_1->id : '';
        $nm_konsultan_1 = (!empty($get_konsultan_1)) ? $get_konsultan_1->nm_karyawan : '';

        $this->db->select('a.id, a.name as nm_karyawan');
        $this->db->from(DBHR . '.employees a');
        $this->db->where('a.id', $post['konsultan_2']);
        $get_konsultan_2 = $this->db->get()->row();

        $id_konsultan_2 = (!empty($get_konsultan_2)) ? $get_konsultan_2->id : '';
        $nm_konsultan_2 = (!empty($get_konsultan_2)) ? $get_konsultan_2->nm_karyawan : '';

        $tipe_info_awal_eks = (isset($post['informasi_awal_eksternal'])) ? $post['informasi_awal_eksternal'] : null;

        $detail_info_awal_eks = '';
        $cp_info_awal_eks = '';
        if (isset($post['informasi_awal_eksternal'])) {
            $detail_info_awal_eks = $post['informasi_awal_eksternal_detail_' . $tipe_info_awal_eks];
            $cp_info_awal_eks = $post['informasi_awal_eksternal_cp_' . $tipe_info_awal_eks];
        }

        $this->db->trans_begin();

        $arr_insert = [
            'id_spk_penawaran' => $id_spk_penawaran,
            'id_penawaran' => $post['id_quotation'],
            'id_customer' => $id_customer,
            'nm_customer' => $nm_customer,
            'address' => $post['alamat'],
            'npwp_cust' => $post['no_npwp'],
            'nm_pic' => $post['pic'],
            'tipe_informasi_awal' => $get_penawaran->tipe_informasi_awal,
            'detail_informasi_awal' => $get_penawaran->detail_informasi_awal,
            'waktu_from' => $post['waktu_from'],
            'waktu_to' => $post['waktu_to'],
            'id_sales' => $id_marketing,
            'nm_sales' => $nm_marketing,
            'upload_proposal' => $get_penawaran->upload_proposal,
            'id_project' => $get_konsultasi->id_konsultasi_h,
            'nm_project' => $get_konsultasi->nm_paket,
            'id_divisi' => $id_divisi,
            'nm_divisi' => $nm_divisi,
            'id_project_leader' => $id_project_leader,
            'nm_project_leader' => $nm_project_leader,
            'id_konsultan_1' => $post['konsultan_1'],
            'nm_konsultan_1' => $nm_konsultan_1,
            'id_konsultan_2' => $post['konsultan_2'],
            'nm_konsultan_2' => $nm_konsultan_2,
            'nilai_kontrak' => ($post['nilai_kontrak'] !== '') ? str_replace(',', '', $post['nilai_kontrak']) : 0,
            'biaya_subcont' => ($post['biaya_subcont'] !== '') ? str_replace(',', '', $post['biaya_subcont']) : 0,
            'biaya_akomodasi' => ($post['biaya_akomodasi'] !== '') ? str_replace(',', '', $post['biaya_akomodasi']) : 0,
            'biaya_others' => ($post['biaya_others'] !== '') ? str_replace(',', '', $post['biaya_others']) : 0,
            'biaya_tandem' => ($post['biaya_tandem'] !== '') ? str_replace(',', '', $post['biaya_tandem']) : 0,
            'biaya_lab' => ($post['biaya_lab'] !== '') ? str_replace(',', '', $post['biaya_lab']) : 0,
            'nilai_kontrak_bersih' => ($post['nilai_kontrak_bersih'] !== '') ? str_replace(',', '', $post['nilai_kontrak_bersih']) : 0,
            'mandays_rate' => ($post['mandays_rate'] !== '') ? str_replace(',', '', $post['mandays_rate']) : 0,
            'total_mandays' => ($post['total_mandays'] !== '') ? str_replace(',', '', $post['total_mandays']) : 0,
            'mandays_subcont' => ($post['mandays_subcont'] !== '') ? str_replace(',', '', $post['mandays_subcont']) : 0,
            'mandays_internal' => ($post['total_mandays'] !== '') ? str_replace(',', '', $post['total_mandays']) : 0,
            'nm_pemberi_informasi_1_komisi' => $post['nm_pemberi_informasi_1_komisi'],
            'persen_pemberi_informasi_1_komisi' => ($post['persentase_pemberi_informasi_1_komisi'] !== '') ? str_replace(',', '', $post['persentase_pemberi_informasi_1_komisi']) : 0,
            'nominal_pemberi_informasi_1_komisi' => ($post['nominal_pemberi_informasi_1_komisi'] !== '') ? str_replace(',', '', $post['nominal_pemberi_informasi_1_komisi']) : 0,
            'nm_pemberi_informasi_2_komisi' => $post['nm_pemberi_informasi_2_komisi'],
            'persen_pemberi_informasi_2_komisi' => ($post['persentase_pemberi_informasi_2_komisi'] !== '') ? str_replace(',', '', $post['persentase_pemberi_informasi_2_komisi']) : 0,
            'nominal_pemberi_informasi_2_komisi' => ($post['nominal_pemberi_informasi_2_komisi'] !== '') ? str_replace(',', '', $post['nominal_pemberi_informasi_2_komisi']) : 0,
            'nm_sales_1_komisi' => $post['nm_sales_1_komisi'],
            'persen_sales_1_komisi' => ($post['persentase_sales_1_komisi'] !== '') ? str_replace(',', '', $post['persentase_sales_1_komisi']) : 0,
            'nominal_sales_1_komisi' => ($post['nominal_sales_1_komisi'] !== '') ? str_replace(',', '', $post['nominal_sales_1_komisi']) : 0,
            'nm_sales_2_komisi' => $post['nm_sales_2_komisi'],
            'persen_sales_2_komisi' => ($post['persentase_sales_2_komisi'] !== '') ? str_replace(',', '', $post['persentase_sales_2_komisi']) : 0,
            'nominal_sales_2_komisi' => ($post['nominal_sales_2_komisi'] !== '') ? str_replace(',', '', $post['nominal_sales_2_komisi']) : 0,
            'isu_khusus' => $post['isu_khusus'],
            'tipe_info_awal_eks' => $tipe_info_awal_eks,
            'detail_info_awal_eks' => $detail_info_awal_eks,
            'cp_info_awal_eks' => $cp_info_awal_eks,
            'input_by' => $this->auth->user_id(),
            'input_date' => date('Y-m-d H:i:s')
        ];

        $data_insert_aktifitas = [];
        if (!empty($get_penawaran_aktifitas)) {
            foreach ($get_penawaran_aktifitas as $item) {

                $data_insert_aktifitas[] = [
                    'id_penawaran' => $post['id_quotation'],
                    'id_spk_penawaran' => $id_spk_penawaran,
                    'id_aktifitas' => $item->id_aktifitas,
                    'nm_aktifitas' => $item->aktifitas_nm,
                    'bobot' => $item->bobot,
                    'mandays' => $item->mandays,
                    'mandays_rate' => $item->mandays_rate,
                    'mandays_tandem' => $item->mandays_tandem,
                    'mandays_rate_tandem' => $item->mandays_rate_tandem,
                    'harga_aktifitas' => $item->harga_aktifitas,
                    'total_aktifitas' => $item->total_aktifitas,
                    'input_by' => $this->auth->user_id(),
                    'input_date' => date('Y-m-d H:i:s')
                ];
            }
        }

        $data_insert_subcont = [];

        if (isset($post['subcont'])) {
            foreach ($post['subcont'] as $item) {
                $data_insert_subcont[] = [
                    'id_spk_penawaran' => $id_spk_penawaran,
                    'nm_aktifitas' => $item['subcont_new'],
                    'mandays_subcont' => $item['subcont_new_mandays'],
                    'price_subcont' => $item['subcont_new_rate'],
                    'total_subcont' => $item['subcont_new_price'],
                    'dibuat_oleh' => $this->auth->user_id(),
                    'dibuat_tgl' => date('Y-m-d H:i:s')
                ];
            }
        }

        $data_insert_payment = [];

        if (isset($post['pt'])) {
            foreach ($post['pt'] as $item) {
                $data_insert_payment[] = [
                    'id_spk_penawaran' => $id_spk_penawaran,
                    'term_payment' => $item['term_payment'],
                    'persen_payment' => ($item['persen_payment'] !== '') ? str_replace(',', '', $item['persen_payment']) : 0,
                    'nominal_payment' => ($item['nominal_payment'] !== '') ? str_replace(',', '', $item['nominal_payment']) : 0,
                    'desc_payment' => $item['desc_payment'],
                    'dibuat_oleh' => $this->auth->user_id(),
                    'dibuat_tgl' => date('Y-m-d H:i:s')
                ];
            }
        }

        $insert_spk_penawaran = $this->db->insert('kons_tr_spk_penawaran', $arr_insert);
        if (!$insert_spk_penawaran) {
            $this->db->trans_rollback();
            print_r($this->db->last_query());
            exit;
        }

        $update_penawaran = $this->db->update('kons_tr_penawaran', ['id_spk_penawaran' => $id_spk_penawaran], ['id_quotation' => $post['id_quotation']]);
        if (!$update_penawaran) {
            $this->db->trans_rollback();
            print_r($this->db->error($update_penawaran) . ' ' . $this->db->last_query());
            exit;
        }

        if (!empty($data_insert_aktifitas)) {
            $insert_aktifitas = $this->db->insert_batch('kons_tr_spk_aktifitas', $data_insert_aktifitas);
            if (!$insert_aktifitas) {
                $this->db->trans_rollback();

                print_r($this->db->error($insert_aktifitas) . ' ' . $this->db->last_query());
                exit;
            }
        }

        // print_r($data_insert_subcont);

        if (!empty($data_insert_subcont)) {
            $insert_spk_penawaran_subcont = $this->db->insert_batch('kons_tr_spk_penawaran_subcont', $data_insert_subcont);
            if (!$insert_spk_penawaran_subcont) {
                $this->db->trans_rollback();
                print_r($this->db->last_query());
                exit;
            }
        }

        $insert_spk_penawaran_payment = $this->db->insert_batch('kons_tr_spk_penawaran_payment', $data_insert_payment);
        if (!$insert_spk_penawaran_payment) {
            $this->db->trans_rollback();
            print_r($this->db->error($insert_spk_penawaran_payment) . ' ' . $this->db->last_query());
            exit;
        }

        if ($this->db->trans_status() === false) {
            $this->db->trans_rollback();
            $valid = 0;
            $msg = 'Please try again later !';
        } else {
            $this->db->trans_commit();
            $valid = 1;
            $msg = 'Data has been successfully saved !';
        }

        echo json_encode([
            'status' => $valid,
            'msg' => $msg
        ]);
    }

    public function update_spk_penawaran()
    {
        $post = $this->input->post();

        $id_spk_penawaran = $post['id_spk_penawaran'];

        $get_spk_penawaran = $this->db->get_where('kons_tr_spk_penawaran', ['id_spk_penawaran' => $id_spk_penawaran])->row();

        $get_penawaran = $this->db->get_where('kons_tr_penawaran', ['id_quotation' => $get_spk_penawaran->id_penawaran])->row();

        $this->db->select('a.id, a.id_aktifitas, a.mandays, a.mandays_rate, a.mandays_tandem, a.mandays_rate_tandem, a.harga_aktifitas, a.total_aktifitas, b.nm_aktifitas as aktifitas_nm');
        $this->db->from('kons_tr_penawaran_aktifitas a');
        $this->db->join('kons_master_aktifitas b', 'b.id_aktifitas = a.id_aktifitas', 'left');
        $this->db->where('a.id_penawaran', $get_spk_penawaran->id_penawaran);
        $get_penawaran_aktifitas = $this->db->get()->result();

        $this->db->select('a.id_customer, a.nm_customer');
        $this->db->from('customer a');
        $this->db->where('a.id_customer', $get_penawaran->id_customer);
        $get_customer = $this->db->get()->row();

        $this->db->select('a.id, a.name as nm_karyawan');
        $this->db->from(DBHR . '.employees a');
        $this->db->where('a.id', $get_penawaran->id_marketing);
        $get_marketing = $this->db->get()->row();

        $this->db->select('a.*, b.nm_paket');
        $this->db->from('kons_master_konsultasi_header a');
        $this->db->join('kons_master_paket b', 'b.id_paket = a.id_paket', 'left');
        $this->db->where('a.id_konsultasi_h', $get_penawaran->id_paket);
        $get_konsultasi = $this->db->get()->row();

        $get_divisi = $this->db->get_where(DBHR.'.divisions', ['id' => $post['divisi']])->row();

        $nm_divisi = (!empty($get_divisi)) ? $get_divisi->name : '';

        $this->db->select('a.id, a.name as nm_karyawan');
        $this->db->from(DBHR . '.employees a');
        $this->db->where('a.id', $post['project_leader']);
        $get_project_leader = $this->db->get()->row();

        $nm_project_leader = (!empty($get_project_leader)) ? $get_project_leader->nm_karyawan : '';

        $this->db->select('a.id, a.name as nm_karyawan');
        $this->db->from(DBHR . '.employees a');
        $this->db->where('a.id', $post['konsultan_1']);
        $get_konsultan_1 = $this->db->get()->row();

        $nm_konsultan_1 = (!empty($get_konsultan_1)) ? $get_konsultan_1->nm_karyawan : '';

        $this->db->select('a.id, a.name as nm_karyawan');
        $this->db->from(DBHR . '.employees a');
        $this->db->where('a.id', $post['konsultan_2']);
        $get_konsultan_2 = $this->db->get()->row();

        $nm_konsultan_2 = (!empty($get_konsultan_2)) ? $get_konsultan_2->nm_karyawan : '';

        $this->db->trans_begin();

        $this->db->delete('kons_tr_spk_aktifitas', ['id_spk_penawaran' => $id_spk_penawaran]);
        $this->db->delete('kons_tr_spk_penawaran_subcont', ['id_spk_penawaran' => $id_spk_penawaran]);
        $this->db->delete('kons_tr_spk_penawaran_payment', ['id_spk_penawaran' => $id_spk_penawaran]);

        $tipe_info_awal_eks = (isset($post['informasi_awal_eksternal'])) ? $post['informasi_awal_eksternal'] : null;

        $detail_info_awal_eks = '';
        $cp_info_awal_eks = '';
        if (isset($post['informasi_awal_eksternal'])) {
            $detail_info_awal_eks = $post['informasi_awal_eksternal_detail_' . $tipe_info_awal_eks];
            $cp_info_awal_eks = $post['informasi_awal_eksternal_cp_' . $tipe_info_awal_eks];
        }

        $arr_insert = [
            'id_customer' => $get_customer->id_customer,
            'nm_customer' => $get_customer->nm_customer,
            'address' => $post['address'],
            'nm_pic' => $post['pic'],
            'tipe_informasi_awal' => $get_penawaran->tipe_informasi_awal,
            'detail_informasi_awal' => $get_penawaran->detail_informasi_awal,
            'waktu_from' => $post['waktu_from'],
            'waktu_to' => $post['waktu_to'],
            'id_sales' => $get_marketing->id,
            'nm_sales' => $get_marketing->nm_karyawan,
            'upload_proposal' => $get_penawaran->upload_proposal,
            'id_project' => $get_konsultasi->id_konsultasi_h,
            'nm_project' => $get_konsultasi->nm_paket,
            'id_divisi' => $post['divisi'],
            'nm_divisi' => $nm_divisi,
            'id_project_leader' => $post['project_leader'],
            'nm_project_leader' => $nm_project_leader,
            'id_konsultan_1' => $post['konsultan_1'],
            'nm_konsultan_1' => $nm_konsultan_1,
            'id_konsultan_2' => $post['konsultan_2'],
            'nm_konsultan_2' => $nm_konsultan_2,
            'nilai_kontrak' => ($post['nilai_kontrak'] !== '') ? str_replace(',', '', $post['nilai_kontrak']) : 0,
            'biaya_subcont' => ($post['biaya_subcont'] !== '') ? str_replace(',', '', $post['biaya_subcont']) : 0,
            'biaya_akomodasi' => ($post['biaya_akomodasi'] !== '') ? str_replace(',', '', $post['biaya_akomodasi']) : 0,
            'biaya_others' => ($post['biaya_others'] !== '') ? str_replace(',', '', $post['biaya_others']) : 0,
            'nilai_kontrak_bersih' => ($post['nilai_kontrak_bersih'] !== '') ? str_replace(',', '', $post['nilai_kontrak_bersih']) : 0,
            'mandays_rate' => ($post['mandays_rate'] !== '') ? str_replace(',', '', $post['mandays_rate']) : 0,
            'total_mandays' => ($post['total_mandays'] !== '') ? str_replace(',', '', $post['total_mandays']) : 0,
            'mandays_subcont' => ($post['mandays_subcont'] !== '') ? str_replace(',', '', $post['mandays_subcont']) : 0,
            'mandays_internal' => ($post['mandays_internal'] !== '') ? str_replace(',', '', $post['mandays_internal']) : 0,
            'nm_pemberi_informasi_1_komisi' => $post['nm_pemberi_informasi_1_komisi'],
            'persen_pemberi_informasi_1_komisi' => ($post['persentase_pemberi_informasi_1_komisi'] !== '') ? str_replace(',', '', $post['persentase_pemberi_informasi_1_komisi']) : 0,
            'nominal_pemberi_informasi_1_komisi' => ($post['nominal_pemberi_informasi_1_komisi'] !== '') ? str_replace(',', '', $post['nominal_pemberi_informasi_1_komisi']) : 0,
            'nm_pemberi_informasi_2_komisi' => $post['nm_pemberi_informasi_2_komisi'],
            'persen_pemberi_informasi_2_komisi' => ($post['persentase_pemberi_informasi_2_komisi'] !== '') ? str_replace(',', '', $post['persentase_pemberi_informasi_2_komisi']) : 0,
            'nominal_pemberi_informasi_2_komisi' => ($post['nominal_pemberi_informasi_2_komisi'] !== '') ? str_replace(',', '', $post['nominal_pemberi_informasi_2_komisi']) : 0,
            'nm_sales_1_komisi' => $post['nm_sales_1_komisi'],
            'persen_sales_1_komisi' => ($post['persentase_sales_1_komisi'] !== '') ? str_replace(',', '', $post['persentase_sales_1_komisi']) : 0,
            'nominal_sales_1_komisi' => ($post['nominal_sales_1_komisi'] !== '') ? str_replace(',', '', $post['nominal_sales_1_komisi']) : 0,
            'nm_sales_2_komisi' => $post['nm_sales_2_komisi'],
            'persen_sales_2_komisi' => ($post['persentase_sales_2_komisi'] !== '') ? str_replace(',', '', $post['persentase_sales_2_komisi']) : 0,
            'nominal_sales_2_komisi' => ($post['nominal_sales_2_komisi'] !== '') ? str_replace(',', '', $post['nominal_sales_2_komisi']) : 0,
            'isu_khusus' => $post['isu_khusus'],
            'tipe_info_awal_eks' => $tipe_info_awal_eks,
            'detail_info_awal_eks' => $detail_info_awal_eks,
            'cp_info_awal_eks' => $cp_info_awal_eks,
            'reject_project_leader_sts' => null,
            'reject_konsultan_1_sts' => null,
            'reject_konsultan_2_sts' => null,
            'reject_sales_sts' => null,
            'edited_by' => $this->auth->user_id(),
            'edited_date' => date('Y-m-d H:i:s')
        ];

        $data_insert_aktifitas = [];
        if (!empty($get_penawaran_aktifitas)) {
            foreach ($get_penawaran_aktifitas as $item) {

                $data_insert_aktifitas[] = [
                    'id_penawaran' => $get_spk_penawaran->id_penawaran,
                    'id_spk_penawaran' => $id_spk_penawaran,
                    'id_aktifitas' => $item->id_aktifitas,
                    'nm_aktifitas' => $item->aktifitas_nm,
                    'mandays' => $item->mandays,
                    'mandays_rate' => $item->mandays_rate,
                    'mandays_tandem' => $item->mandays_tandem,
                    'mandays_rate_tandem' => $item->mandays_rate_tandem,
                    'harga_aktifitas' => $item->harga_aktifitas,
                    'total_aktifitas' => $item->total_aktifitas,
                    'input_by' => $this->auth->user_id(),
                    'input_date' => date('Y-m-d H:i:s')
                ];
            }
        }

        $data_insert_subcont = [];

        if (isset($post['subcont'])) {
            foreach ($post['subcont'] as $item) {
                $data_insert_subcont[] = [
                    'id_spk_penawaran' => $id_spk_penawaran,
                    'nm_aktifitas' => $item['subcont_new'],
                    'mandays_subcont' => $item['subcont_new_mandays'],
                    'price_subcont' => $item['subcont_new_rate'],
                    'total_subcont' => $item['subcont_new_price'],
                    'dibuat_oleh' => $this->auth->user_id(),
                    'dibuat_tgl' => date('Y-m-d H:i:s')
                ];
            }
        }

        $data_insert_payment = [];

        if (isset($post['pt'])) {
            foreach ($post['pt'] as $item) {
                $data_insert_payment[] = [
                    'id_spk_penawaran' => $id_spk_penawaran,
                    'term_payment' => $item['term_payment'],
                    'persen_payment' => ($item['persen_payment'] !== '') ? str_replace(',', '', $item['persen_payment']) : 0,
                    'nominal_payment' => ($item['nominal_payment'] !== '') ? str_replace(',', '', $item['nominal_payment']) : 0,
                    'desc_payment' => $item['desc_payment'],
                    'dibuat_oleh' => $this->auth->user_id(),
                    'dibuat_tgl' => date('Y-m-d H:i:s')
                ];
            }
        }

        $update_spk_penawaran = $this->db->update('kons_tr_spk_penawaran', $arr_insert, ['id_spk_penawaran' => $id_spk_penawaran]);
        if (!$update_spk_penawaran) {
            $this->db->trans_rollback();
            print_r($this->db->error($update_spk_penawaran) . ' ' . $this->db->last_query());
            exit;
        }

        $insert_aktifitas = $this->db->insert_batch('kons_tr_spk_aktifitas', $data_insert_aktifitas);
        if (!$insert_aktifitas) {
            $this->db->trans_rollback();
            print_r($this->db->error($insert_aktifitas) . ' ' . $this->db->last_query());
            exit;
        }

        if (!empty($data_insert_subcont)) {
            $insert_spk_penawaran_subcont = $this->db->insert_batch('kons_tr_spk_penawaran_subcont', $data_insert_subcont);
            if (!$insert_spk_penawaran_subcont) {
                $this->db->trans_rollback();
                print_r($this->db->error($insert_spk_penawaran_subcont) . ' ' . $this->db->last_query());
                exit;
            }
        }

        $insert_spk_penawaran_payment = $this->db->insert_batch('kons_tr_spk_penawaran_payment', $data_insert_payment);
        if (!$insert_spk_penawaran_payment) {
            $this->db->trans_rollback();
            print_r($this->db->error($insert_spk_penawaran_payment) . ' ' . $this->db->last_query());
            exit;
        }

        if ($this->db->trans_status() === false) {
            $this->db->trans_rollback();
            $valid = 0;
            $msg = 'Please try again later !';
        } else {
            $this->db->trans_commit();
            $valid = 1;
            $msg = 'Data has been successfully saved !';
        }

        echo json_encode([
            'status' => $valid,
            'msg' => $msg
        ]);
    }

    public function del_spk()
    {
        $id_spk_penawaran = $this->input->post('id_spk_penawaran');

        $this->db->trans_begin();

        $this->db->update('kons_tr_penawaran', ['id_spk_penawaran' => null], ['id_spk_penawaran' => $id_spk_penawaran]);
        $this->db->delete('kons_tr_spk_penawaran_payment', ['id_spk_penawaran' => $id_spk_penawaran]);
        $this->db->delete('kons_tr_spk_penawaran_subcont', ['id_spk_penawaran' => $id_spk_penawaran]);
        $this->db->delete('kons_tr_spk_penawaran', ['id_spk_penawaran' => $id_spk_penawaran]);
        $this->db->delete('kons_tr_spk_aktifitas', ['id_spk_penawaran' => $id_spk_penawaran]);

        if ($this->db->trans_status() === false) {
            $this->db->trans_rollback();
            $valid = 0;
            $msg = 'Please try again later !';
        } else {
            $this->db->trans_commit();
            $valid = 1;
            $msg = 'Data has been successfully deleted !';
        }

        echo json_encode([
            'status' => $valid,
            'msg' => $msg
        ]);
    }

    public function one_time()
    {

        $get_spk_divisi = $this->db->select('a.id_divisi, a.nm_divisi')->from('kons_tr_spk_penawaran a')->where('a.id_divisi <>', '')->where('a.id_divisi <>', null)->get()->result();

        // foreach($get_spk_divisi as $item) {
        //     $id_divisi_hris = '';
        //     if($item->id_divisi == '')
        // }

        // $get_spk_project_leader = $this->db->select('a.id_project_leader, a.nm_project_leader')->from('kons_tr_spk_penawaran a')->where('a.id_project_leader <>', '')->not_like('a.id_project_leader', 'EMP', 'both')->get()->result();

        // foreach($get_spk_project_leader as $item) {
        //     $id_employees_hris = '';

        //     if($item->id_project_leader == '166') {
        //         $id_employees_hris = 'EMP0213';
        //     }
        //     if($item->id_project_leader == '169') {
        //         $id_employees_hris = 'EMP0187';
        //     }
        //     if($item->id_project_leader == '170') {
        //         $id_employees_hris = 'EMP0121';
        //     }
        //     if($item->id_project_leader == '172') {
        //         $id_employees_hris = 'EMP0011';
        //     }
        //     if($item->id_project_leader == '173') {
        //         $id_employees_hris = 'EMP0018';
        //     }
        //     if($item->id_project_leader == '174') {
        //         $id_employees_hris = 'EMP0005';
        //     }
        //     if($item->id_project_leader == '175') {
        //         $id_employees_hris = 'EMP0090';
        //     }
        //     if($item->id_project_leader == '176') {
        //         $id_employees_hris = 'EMP0001';
        //     }
        //     if($item->id_project_leader == '183') {
        //         $id_employees_hris = 'EMP0207';
        //     }

        //     if($id_employees_hris !== '') {
        //         $get_hris_employees = $this->db->get_where(DBHR.'.employees', ['id' => $id_employees_hris])->row();
        //         if(!empty($get_hris_employees)) {
        //             $this->db->update('kons_tr_spk_penawaran', ['id_project_leader' => $id_employees_hris, 'nm_project_leader' => $get_hris_employees->name], ['id_project_leader' => $item->id_project_leader]);
        //         }
        //     }
        // }

        // $get_spk_konsultan_1 = $this->db->select('a.id_konsultan_1, a.nm_konsultan_1')->from('kons_tr_spk_penawaran a')->where('a.id_konsultan_1 <>', '')->not_like('a.id_konsultan_1', 'EMP', 'both')->get()->result();

        // foreach($get_spk_konsultan_1 as $item) {
        //     $id_employees_hris = '';

        //     if($item->id_konsultan_1 == '166') {
        //         $id_employees_hris = 'EMP0213';
        //     }
        //     if($item->id_konsultan_1 == '169') {
        //         $id_employees_hris = 'EMP0187';
        //     }
        //     if($item->id_konsultan_1 == '170') {
        //         $id_employees_hris = 'EMP0121';
        //     }
        //     if($item->id_konsultan_1 == '172') {
        //         $id_employees_hris = 'EMP0011';
        //     }
        //     if($item->id_konsultan_1 == '173') {
        //         $id_employees_hris = 'EMP0018';
        //     }
        //     if($item->id_konsultan_1 == '174') {
        //         $id_employees_hris = 'EMP0005';
        //     }
        //     if($item->id_konsultan_1 == '175') {
        //         $id_employees_hris = 'EMP0090';
        //     }
        //     if($item->id_konsultan_1 == '176') {
        //         $id_employees_hris = 'EMP0001';
        //     }
        //     if($item->id_konsultan_1 == '183') {
        //         $id_employees_hris = 'EMP0207';
        //     }

        //     if($id_employees_hris !== '') {
        //         $get_hris_employees = $this->db->get_where(DBHR.'.employees', ['id' => $id_employees_hris])->row();
        //         if(!empty($get_hris_employees)) {
        //             $this->db->update('kons_tr_spk_penawaran', ['id_konsultan_1' => $id_employees_hris, 'nm_konsultan_1' => $get_hris_employees->name], ['id_konsultan_1' => $item->id_konsultan_1]);
        //         }
        //     }
        // }

        // $get_spk_konsultan_2 = $this->db->select('a.id_konsultan_2, a.nm_konsultan_2')->from('kons_tr_spk_penawaran a')->where('a.id_konsultan_2 <>', '')->not_like('a.id_konsultan_2', 'EMP', 'both')->get()->result();

        // foreach($get_spk_konsultan_2 as $item) {
        //     $id_employees_hris = '';

        //     if($item->id_konsultan_2 == '166') {
        //         $id_employees_hris = 'EMP0213';
        //     }
        //     if($item->id_konsultan_2 == '169') {
        //         $id_employees_hris = 'EMP0187';
        //     }
        //     if($item->id_konsultan_2 == '170') {
        //         $id_employees_hris = 'EMP0121';
        //     }
        //     if($item->id_konsultan_2 == '172') {
        //         $id_employees_hris = 'EMP0011';
        //     }
        //     if($item->id_konsultan_2 == '173') {
        //         $id_employees_hris = 'EMP0018';
        //     }
        //     if($item->id_konsultan_2 == '174') {
        //         $id_employees_hris = 'EMP0005';
        //     }
        //     if($item->id_konsultan_2 == '175') {
        //         $id_employees_hris = 'EMP0090';
        //     }
        //     if($item->id_konsultan_2 == '176') {
        //         $id_employees_hris = 'EMP0001';
        //     }
        //     if($item->id_konsultan_2 == '183') {
        //         $id_employees_hris = 'EMP0207';
        //     }

        //     if($id_employees_hris !== '') {
        //         $get_hris_employees = $this->db->get_where(DBHR.'.employees', ['id' => $id_employees_hris])->row();
        //         if(!empty($get_hris_employees)) {
        //             $this->db->update('kons_tr_spk_penawaran', ['id_konsultan_2' => $id_employees_hris, 'nm_konsultan_2' => $get_hris_employees->name], ['id_konsultan_2' => $item->id_konsultan_2]);
        //         }
        //     }
        // }

        if ($this->db->trans_status() === false) {
            $this->db->trans_rollback();

            $valid = 0;
            $msg = 'Please try again later !';
        } else {
            $this->db->trans_commit();

            $valid = 1;
            $msg = 'One time query has been successful !';
        }

        echo json_encode([
            'status' => $valid,
            'msg' => $msg
        ]);
    }

    public function detail_sum()
    {
        if (isset($_POST['id_spk_penawaran'])) {
            $id_spk_penawaran = $this->input->post('id_spk_penawaran');
            $type = $this->input->post('type');

            $get_spk_penawaran = $this->db->get_where('kons_tr_spk_penawaran', array('id_spk_penawaran' => $id_spk_penawaran))->row();

            if ($type == 'akomodasi') {
                $this->db->select('a.id, a.qty, a.price_unit, a.total, a.keterangan, b.nm_biaya');
                $this->db->from('kons_tr_penawaran_akomodasi a');
                $this->db->join('kons_master_biaya b', 'b.id = a.id_item');
                $this->db->where('a.id_penawaran', $get_spk_penawaran->id_penawaran);
                $get_akomodasi = $this->db->get()->result();

                $data = [
                    'list_akomodasi' => $get_akomodasi
                ];

                $this->template->set($data);
                $this->template->render('detail_akomodasi');
            }
            if ($type == 'others') {
                $this->db->select('a.id, a.qty, a.price_unit, a.total, a.keterangan, b.nm_biaya');
                $this->db->from('kons_tr_penawaran_others a');
                $this->db->join('kons_master_biaya b', 'b.id = a.id_item');
                $this->db->where('a.id_penawaran', $get_spk_penawaran->id_penawaran);
                $get_others = $this->db->get()->result();

                $data = [
                    'list_others' => $get_others
                ];

                $this->template->set($data);
                $this->template->render('detail_others');
            }
        } else {
            $id_penawaran = $this->input->post('id_penawaran');
            $type = $this->input->post('type');

            if ($type == 'akomodasi') {
                $this->db->select('a.id, a.qty, a.price_unit, a.total, a.keterangan, b.nm_biaya');
                $this->db->from('kons_tr_penawaran_akomodasi a');
                $this->db->join('kons_master_biaya b', 'b.id = a.id_item');
                $this->db->where('a.id_penawaran', $id_penawaran);
                $get_akomodasi = $this->db->get()->result();

                $data = [
                    'list_akomodasi' => $get_akomodasi
                ];

                $this->template->set($data);
                $this->template->render('detail_akomodasi');
            }
            if ($type == 'others') {
                $this->db->select('a.id, a.qty, a.price_unit, a.total, a.keterangan, b.nm_biaya');
                $this->db->from('kons_tr_penawaran_others a');
                $this->db->join('kons_master_biaya b', 'b.id = a.id_item');
                $this->db->where('a.id_penawaran', $id_penawaran);
                $get_others = $this->db->get()->result();

                $data = [
                    'list_others' => $get_others
                ];

                $this->template->set($data);
                $this->template->render('detail_others');
            }
        }
    }
}
