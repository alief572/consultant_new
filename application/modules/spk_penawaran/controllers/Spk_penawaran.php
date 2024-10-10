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
        $get_spk_penawaran = $this->db->get_where('kons_tr_spk_penawaran', ['id_spk_penawaran' => $id_spk_penawaran])->row();
        $get_spk_penawaran_subcont = $this->db->get_where('kons_tr_spk_penawaran_subcont', ['id_spk_penawaran' => $id_spk_penawaran])->result();
        $get_spk_penawaran_payment = $this->db->get_where('kons_tr_spk_penawaran_payment', ['id_spk_penawaran' => $id_spk_penawaran])->result();

        $get_penawaran = $this->db->get_where('kons_tr_penawaran', ['id_quotation' => $get_spk_penawaran->id_penawaran])->row();

        $this->db->select('a.*');
        $this->db->from('customers a');
        $this->db->where('a.name <>', '');
        $this->db->where('a.id_customer', $get_penawaran->id_customer);
        $get_customer = $this->db->get()->row();

        $this->db->select('a.*');
        $this->db->from('members a');
        $this->db->where('a.nama <>', '');
        $this->db->where('a.id', $get_penawaran->id_marketing);
        $get_marketing = $this->db->get()->row();

        $this->db->select('a.*');
        $this->db->from('members a');
        $this->db->where('a.nama <>', '');
        $get_all_marketing = $this->db->get()->result();

        $this->db->select('b.nm_paket');
        $this->db->from('kons_master_konsultasi_header a');
        $this->db->join('kons_master_paket b', 'b.id_paket = a.id_paket', 'left');
        $this->db->where('a.id_konsultasi_h', $get_penawaran->id_paket);
        $get_konsultasi = $this->db->get()->row();

        $this->db->select('a.id, a.nama');
        $this->db->from('ms_department a');
        $this->db->where('a.deleted_by', null);
        $get_divisi = $this->db->get()->result();

        $this->db->select('a.*');
        $this->db->from('kons_master_aktifitas a');
        $get_all_aktifitas = $this->db->get()->result();

        $detail_informasi_awal = '';
        if ($get_penawaran->tipe_informasi_awal == 'Sales' || $get_penawaran->tipe_informasi_awal == 'Others') {
            $this->db->select('a.*');
            $this->db->from('members a');
            $this->db->where('a.nama <>', '');
            $this->db->where('a.id', $get_penawaran->detail_informasi_awal);
            $get_marketing_informasi_awal = $this->db->get()->row();

            $detail_informasi_awal = $get_marketing_informasi_awal->nama;
        } else {
            $detail_informasi_awal = $get_penawaran->detail_informasi_awal;
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
            'detail_informasi_awal' => $detail_informasi_awal
        ];

        $this->auth->restrict($this->viewPermission);
        $this->template->title('View SPK');
        $this->template->set($data);
        $this->template->render('view_spk');
    }

    public function edit_spk($id_spk_penawaran)
    {
        $get_spk_penawaran = $this->db->get_where('kons_tr_spk_penawaran', ['id_spk_penawaran' => $id_spk_penawaran])->row();
        $get_spk_penawaran_subcont = $this->db->get_where('kons_tr_spk_penawaran_subcont', ['id_spk_penawaran' => $id_spk_penawaran])->result();
        $get_spk_penawaran_payment = $this->db->get_where('kons_tr_spk_penawaran_payment', ['id_spk_penawaran' => $id_spk_penawaran])->result();

        $get_penawaran = $this->db->get_where('kons_tr_penawaran', ['id_quotation' => $get_spk_penawaran->id_penawaran])->row();

        $this->db->select('a.*');
        $this->db->from('customers a');
        $this->db->where('a.name <>', '');
        $this->db->where('a.id_customer', $get_penawaran->id_customer);
        $get_customer = $this->db->get()->row();

        $this->db->select('a.*');
        $this->db->from('members a');
        $this->db->where('a.nama <>', '');
        $this->db->where('a.id', $get_penawaran->id_marketing);
        $get_marketing = $this->db->get()->row();

        $this->db->select('a.*');
        $this->db->from('members a');
        $this->db->where('a.nama <>', '');
        $get_all_marketing = $this->db->get()->result();

        $this->db->select('b.nm_paket');
        $this->db->from('kons_master_konsultasi_header a');
        $this->db->join('kons_master_paket b', 'b.id_paket = a.id_paket', 'left');
        $this->db->where('a.id_konsultasi_h', $get_penawaran->id_paket);
        $get_konsultasi = $this->db->get()->row();

        $this->db->select('a.id, a.nama');
        $this->db->from('ms_department a');
        $this->db->where('a.deleted_by', null);
        $get_divisi = $this->db->get()->result();

        $this->db->select('a.*');
        $this->db->from('kons_master_aktifitas a');
        $get_all_aktifitas = $this->db->get()->result();

        $detail_informasi_awal = '';
        if ($get_penawaran->tipe_informasi_awal == 'Sales' || $get_penawaran->tipe_informasi_awal == 'Others') {
            $this->db->select('a.*');
            $this->db->from('members a');
            $this->db->where('a.nama <>', '');
            $this->db->where('a.id', $get_penawaran->detail_informasi_awal);
            $get_marketing_informasi_awal = $this->db->get()->row();

            $detail_informasi_awal = $get_marketing_informasi_awal->nama;
        } else {
            $detail_informasi_awal = $get_penawaran->detail_informasi_awal;
        }

        $this->db->select('a.*, b.nm_aktifitas');
        $this->db->from('kons_tr_penawaran_aktifitas a');
        $this->db->join('kons_master_aktifitas b', 'b.id_aktifitas = a.id_aktifitas', 'left');
        $this->db->where('a.id_penawaran', $get_penawaran->id_quotation);
        $get_aktifitas = $this->db->get()->result();

        $nilai_kontrak = 0;
        foreach ($get_aktifitas as $item_aktifitas) {
            $nilai_kontrak += $item_aktifitas->harga_aktifitas;
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
            'nilai_project' => $get_penawaran->grand_total,
            'nilai_kontrak' => $nilai_kontrak
        ];

        $this->auth->restrict($this->viewPermission);
        $this->template->title('Edit SPK');
        $this->template->set($data);
        $this->template->render('edit_spk');
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
            $this->db->or_like('a.nm_sales', $search['value'], 'both');
            $this->db->or_like('a.nm_project', $search['value'], 'both');
            $this->db->or_like('a.nm_customer', $search['value'], 'both');
            $this->db->or_like('b.grand_total', $search['value'], 'both');
            $this->db->group_end();
        }

        $get_data = $this->db->get();

        $hasil = [];

        $no = 1;
        foreach ($get_data->result() as $item) {

            $status = '<button type="button" class="btn btn-sm btn-success">NEW</button>';
            $status_spk = '<button type="button" class="btn btn-sm btn-success">NEW</button>';

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
                    <div class="col-12" style="margin-left: 0.5rem">
                        <a href="' . base_url('spk_penawaran/view_spk/' . $item->id_spk_penawaran) . '" class="btn btn-sm btn-info" style="color: #000000">
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

            if ($this->managePermission) {
                $option .= '
                    <div class="col-12" style="margin-top: 0.5rem; margin-left: 0.5rem">
                        <a href="' . base_url('spk_penawaran/edit_spk/' . $item->id_spk_penawaran) . '" class="btn btn-sm btn-success" style="color: #000000">
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

            if ($this->deletePermission) {
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
                        href="#"
                        class="btn btn-sm"
                        style="background-color: #ff0066; color: #000000">
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
                'nm_marketing' => $nm_marketing,
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
            'recordsTotal' => $get_data->num_rows(),
            'recordsFiltered' => $get_data->num_rows(),
            'data' => $hasil
        ]);
    }

    public function get_data_penawaran()
    {
        $draw = $this->input->post('draw');
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $search = $this->input->post('search');

        $this->db->select('a.*');
        $this->db->from('kons_tr_penawaran a');
        $this->db->where(1, 1);
        $this->db->where('a.deleted_by', null);
        $this->db->where('a.id_spk_penawaran', null);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.tgl_quotation', $search['value'], 'both');
            $this->db->or_like('a.nm_marketing', $search['value'], 'both');
            $this->db->or_like('a.nm_paket', $search['value'], 'both');
            $this->db->or_like('a.nm_customer', $search['value'], 'both');
            $this->db->or_like('a.grand_total', $search['value'], 'both');
            $this->db->group_end();
        }

        $get_data = $this->db->get();

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
                <a href="' . base_url('spk_penawaran/add_spk/' . $item->id_quotation) . '" class="btn btn-sm btn-primary"><i class="fa fa-arrow-right"></i></a>
            ';


            $get_marketing = $this->db->get_where('members', ['id' => $item->id_marketing])->row();
            $nm_marketing = (!empty($get_marketing)) ? $get_marketing->nama : '';

            $this->db->select('a.*, b.nm_paket');
            $this->db->from('kons_master_konsultasi_header a');
            $this->db->join('kons_master_paket b', 'b.id_paket = a.id_paket', 'left');
            $this->db->where('a.id_konsultasi_h', $item->id_paket);
            $get_package = $this->db->get()->row();

            $nm_paket = (!empty($get_package)) ? $get_package->nm_paket : '';

            $get_customers = $this->db->get_where('customers', ['id_customer' => $item->id_customer])->row();
            $nm_customer = (!empty($get_customers)) ? $get_customers->name : '';

            $hasil[] = [
                'no' => $no,
                'id_quotation' => $item->id_quotation,
                'tgl_quotation' => $item->tgl_quotation,
                'nm_marketing' => $nm_marketing,
                'nm_paket' => $nm_paket,
                'nm_customer' => $nm_customer,
                'grand_total' => number_format($item->grand_total),
                'option' => $option
            ];

            $no++;
        }

        echo json_encode([
            'draw' => intval($draw),
            'recordsTotal' => $get_data->num_rows(),
            'recordsFiltered' => $get_data->num_rows(),
            'data' => $hasil
        ]);
    }

    public function add_spk($id_quotation)
    {
        $get_penawaran = $this->db->get_where('kons_tr_penawaran', ['id_quotation' => $id_quotation])->row();

        $this->db->select('a.*');
        $this->db->from('customers a');
        $this->db->where('a.name <>', '');
        $this->db->where('a.id_customer', $get_penawaran->id_customer);
        $get_customer = $this->db->get()->row();

        $this->db->select('a.*');
        $this->db->from('members a');
        $this->db->where('a.nama <>', '');
        $this->db->where('a.id', $get_penawaran->id_marketing);
        $get_marketing = $this->db->get()->row();

        $this->db->select('a.*');
        $this->db->from('members a');
        $this->db->where('a.nama <>', '');
        $get_all_marketing = $this->db->get()->result();

        $this->db->select('b.nm_paket');
        $this->db->from('kons_master_konsultasi_header a');
        $this->db->join('kons_master_paket b', 'b.id_paket = a.id_paket', 'left');
        $this->db->where('a.id_konsultasi_h', $get_penawaran->id_paket);
        $get_konsultasi = $this->db->get()->row();

        $this->db->select('a.id, a.nama');
        $this->db->from('ms_department a');
        $this->db->where('a.deleted_by', null);
        $get_divisi = $this->db->get()->result();

        $detail_informasi_awal = '';
        if ($get_penawaran->tipe_informasi_awal == 'Sales' || $get_penawaran->tipe_informasi_awal == 'Others') {
            $this->db->select('a.*');
            $this->db->from('members a');
            $this->db->where('a.nama <>', '');
            $this->db->where('a.id', $get_penawaran->detail_informasi_awal);
            $get_marketing_informasi_awal = $this->db->get()->row();

            $detail_informasi_awal = $get_marketing_informasi_awal->nama;
        } else {
            $detail_informasi_awal = $get_penawaran->detail_informasi_awal;
        }

        $this->db->select('a.*, b.nm_aktifitas');
        $this->db->from('kons_tr_penawaran_aktifitas a');
        $this->db->join('kons_master_aktifitas b', 'b.id_aktifitas = a.id_aktifitas', 'left');
        $this->db->where('a.id_penawaran', $id_quotation);
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
            $nilai_others += $item_others->total;
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
            'nilai_project' => $nilai_project
        ];

        $this->template->set($data);
        $this->template->render('add_spk');
    }

    public function save_spk_penawaran()
    {
        $post = $this->input->post();

        $id_spk_penawaran = $this->Spk_penawaran_model->generate_id_spk_penawaran();

        $get_penawaran = $this->db->get_where('kons_tr_penawaran', ['id_quotation' => $post['id_quotation']])->row();

        $this->db->select('a.id_customer, a.name');
        $this->db->from('customers a');
        $this->db->where('a.id_customer', $get_penawaran->id_customer);
        $get_customer = $this->db->get()->row();

        $this->db->select('a.id, a.nama');
        $this->db->from('members a');
        $this->db->where('a.id', $get_penawaran->id_marketing);
        $get_marketing = $this->db->get()->row();

        $this->db->select('a.*, b.nm_paket');
        $this->db->from('kons_master_konsultasi_header a');
        $this->db->join('kons_master_paket b', 'b.id_paket = a.id_paket', 'left');
        $this->db->where('a.id_konsultasi_h', $get_penawaran->id_paket);
        $get_konsultasi = $this->db->get()->row();

        $get_divisi = $this->db->get_where('ms_department', ['id' => $post['divisi']])->row();

        $this->db->select('a.id, a.nama');
        $this->db->from('members a');
        $this->db->where('a.id', $post['project_leader']);
        $get_project_leader = $this->db->get()->row();

        $this->db->select('a.id, a.nama');
        $this->db->from('members a');
        $this->db->where('a.id', $post['konsultan_1']);
        $get_konsultan_1 = $this->db->get()->row();

        $nm_konsultan_1 = (!empty($get_konsultan_1)) ? $get_konsultan_1->nama : '';

        $this->db->select('a.id, a.nama');
        $this->db->from('members a');
        $this->db->where('a.id', $post['konsultan_2']);
        $get_konsultan_2 = $this->db->get()->row();

        $nm_konsultan_2 = (!empty($get_konsultan_2)) ? $get_konsultan_2->nama : '';

        $this->db->trans_begin();

        $arr_insert = [
            'id_spk_penawaran' => $id_spk_penawaran,
            'id_penawaran' => $post['id_quotation'],
            'id_customer' => $get_penawaran->id_customer,
            'nm_customer' => $get_customer->name,
            'address' => $post['address'],
            'nm_pic' => $post['pic'],
            'tipe_informasi_awal' => $get_penawaran->tipe_informasi_awal,
            'detail_informasi_awal' => $get_penawaran->detail_informasi_awal,
            'waktu_from' => $post['waktu_from'],
            'waktu_to' => $post['waktu_to'],
            'id_sales' => $get_marketing->id,
            'nm_sales' => $get_marketing->nama,
            'upload_proposal' => $get_penawaran->upload_proposal,
            'id_project' => $get_konsultasi->id_konsultasi_h,
            'nm_project' => $get_konsultasi->nm_paket,
            'id_divisi' => $post['divisi'],
            'nm_divisi' => $get_divisi->nama,
            'id_project_leader' => $post['project_leader'],
            'nm_project_leader' => $get_project_leader->nama,
            'id_konsultan_1' => $post['konsultan_1'],
            'nm_konsultan_1' => $nm_konsultan_1,
            'id_konsultan_2' => $post['konsultan_2'],
            'nm_konsultan_2' => $nm_konsultan_2,
            'nilai_kontrak' => ($post['nilai_kontrak'] !== '') ? str_replace(',', '', $post['nilai_kontrak']) : 0,
            'biaya_subcont' => ($post['biaya_subcont'] !== '') ? str_replace(',', '', $post['biaya_subcont']) : 0,
            'nilai_internal' => ($post['nilai_internal'] !== '') ? str_replace(',', '', $post['nilai_internal']) : 0,
            'mandays_rate' => ($post['mandays_rate'] !== '') ? str_replace(',', '', $post['mandays_rate']) : 0,
            'total_mandays' => ($post['total_mandays'] !== '') ? str_replace(',', '', $post['total_mandays']) : 0,
            'mandays_subcont' => ($post['mandays_subcont'] !== '') ? str_replace(',', '', $post['mandays_subcont']) : 0,
            'mandays_internal' => ($post['mandays_internal'] !== '') ? str_replace(',', '', $post['mandays_internal']) : 0,
            'nama_pemberi_informasi_komisi' => $post['nama_pemberi_informasi_komisi'],
            'persentase_pemberi_informasi_komisi' => ($post['persentase_pemberi_informasi_komisi'] !== '') ? str_replace(',', '', $post['persentase_pemberi_informasi_komisi']) : 0,
            'nominal_pemberi_informasi_komisi' => ($post['nominal_pemberi_informasi_komisi'] !== '') ? str_replace(',', '', $post['nominal_pemberi_informasi_komisi']) : 0,
            'nama_sales_komisi' => $post['nama_sales_komisi'],
            'persentase_sales_komisi' => ($post['persentase_sales_komisi'] !== '') ? str_replace(',', '', $post['persentase_sales_komisi']) : 0,
            'nominal_sales_komisi' => ($post['nominal_sales_komisi'] !== '') ? str_replace(',', '', $post['nominal_sales_komisi']) : 0,
            'nama_others_komisi' => $post['nama_others_komisi'],
            'persentase_others_komisi' => ($post['persentase_others_komisi'] !== '') ? str_replace(',', '', $post['persentase_others_komisi']) : 0,
            'nominal_others_komisi' => ($post['nominal_others_komisi'] !== '') ? str_replace(',', '', $post['nominal_others_komisi']) : 0,
            'input_by' => $this->auth->user_id(),
            'input_date' => date('Y-m-d H:i:s')
        ];

        $data_insert_subcont = [];

        if (isset($post['dt'])) {
            foreach ($post['dt'] as $item) {

                $get_aktifitas = $this->db->get_where('kons_master_aktifitas', ['id_aktifitas' => $item['id_aktifitas']])->row();

                $nm_aktifitas = (!empty($get_aktifitas)) ? $get_aktifitas->nm_aktifitas : '';

                $data_insert_subcont[] = [
                    'id_spk_penawaran' => $id_spk_penawaran,
                    'id_aktifitas' => $item['id_aktifitas'],
                    'nm_aktifitas' => $nm_aktifitas,
                    'mandays' => ($item['mandays'] !== '') ? str_replace(',', '', $item['mandays']) : 0,
                    'mandays_subcont' => ($item['mandays_subcont'] !== '') ? str_replace(',', '', $item['mandays_subcont']) : 0,
                    'price_subcont' => ($item['price_subcont'] !== '') ? str_replace(',', '', $item['price_subcont']) : 0,
                    'total_subcont' => ($item['total_subcont'] !== '') ? str_replace(',', '', $item['total_subcont']) : 0,
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
            print_r($this->db->error($insert_spk_penawaran) . ' ' . $this->db->last_query());
            exit;
        }

        $update_penawaran = $this->db->update('kons_tr_penawaran', ['id_spk_penawaran' => $id_spk_penawaran], ['id_quotation' => $post['id_quotation']]);
        if (!$update_penawaran) {
            $this->db->trans_rollback();
            print_r($this->db->error($update_penawaran) . ' ' . $this->db->last_query());
            exit;
        }

        $insert_spk_penawaran_subcont = $this->db->insert_batch('kons_tr_spk_penawaran_subcont', $data_insert_subcont);
        if (!$insert_spk_penawaran_subcont) {
            $this->db->trans_rollback();
            print_r($this->db->error($insert_spk_penawaran_subcont) . ' ' . $this->db->last_query());
            exit;
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

        $get_spk_penawaran = $this->db->get_where('kons_tr_spk_penawaran')->row();

        $get_penawaran = $this->db->get_where('kons_tr_penawaran', ['id_quotation' => $get_spk_penawaran->id_penawaran])->row();

        $this->db->select('a.id_customer, a.name');
        $this->db->from('customers a');
        $this->db->where('a.id_customer', $get_penawaran->id_customer);
        $get_customer = $this->db->get()->row();

        $this->db->select('a.id, a.nama');
        $this->db->from('members a');
        $this->db->where('a.id', $get_penawaran->id_marketing);
        $get_marketing = $this->db->get()->row();

        $this->db->select('a.*, b.nm_paket');
        $this->db->from('kons_master_konsultasi_header a');
        $this->db->join('kons_master_paket b', 'b.id_paket = a.id_paket', 'left');
        $this->db->where('a.id_konsultasi_h', $get_penawaran->id_paket);
        $get_konsultasi = $this->db->get()->row();

        $get_divisi = $this->db->get_where('ms_department', ['id' => $post['divisi']])->row();

        $this->db->select('a.id, a.nama');
        $this->db->from('members a');
        $this->db->where('a.id', $post['project_leader']);
        $get_project_leader = $this->db->get()->row();

        $this->db->select('a.id, a.nama');
        $this->db->from('members a');
        $this->db->where('a.id', $post['konsultan_1']);
        $get_konsultan_1 = $this->db->get()->row();

        $nm_konsultan_1 = (!empty($get_konsultan_1)) ? $get_konsultan_1->nama : '';

        $this->db->select('a.id, a.nama');
        $this->db->from('members a');
        $this->db->where('a.id', $post['konsultan_2']);
        $get_konsultan_2 = $this->db->get()->row();

        $nm_konsultan_2 = (!empty($get_konsultan_2)) ? $get_konsultan_2->nama : '';

        $this->db->trans_begin();

        $this->db->delete('kons_tr_spk_penawaran_subcont', ['id_spk_penawaran' => $id_spk_penawaran]);
        $this->db->delete('kons_tr_spk_penawaran_payment', ['id_spk_penawaran' => $id_spk_penawaran]);

        $arr_insert = [
            'id_customer' => $get_penawaran->id_customer,
            'nm_customer' => $get_customer->name,
            'address' => $post['address'],
            'nm_pic' => $post['pic'],
            'tipe_informasi_awal' => $get_penawaran->tipe_informasi_awal,
            'detail_informasi_awal' => $get_penawaran->detail_informasi_awal,
            'waktu_from' => $post['waktu_from'],
            'waktu_to' => $post['waktu_to'],
            'id_sales' => $get_marketing->id,
            'nm_sales' => $get_marketing->nama,
            'upload_proposal' => $get_penawaran->upload_proposal,
            'id_project' => $get_konsultasi->id_konsultasi_h,
            'nm_project' => $get_konsultasi->nm_paket,
            'id_divisi' => $post['divisi'],
            'nm_divisi' => $get_divisi->nama,
            'id_project_leader' => $post['project_leader'],
            'nm_project_leader' => $get_project_leader->nama,
            'id_konsultan_1' => $post['konsultan_1'],
            'nm_konsultan_1' => $nm_konsultan_1,
            'id_konsultan_2' => $post['konsultan_2'],
            'nm_konsultan_2' => $nm_konsultan_2,
            'nilai_kontrak' => ($post['nilai_kontrak'] !== '') ? str_replace(',', '', $post['nilai_kontrak']) : 0,
            'biaya_subcont' => ($post['biaya_subcont'] !== '') ? str_replace(',', '', $post['biaya_subcont']) : 0,
            'nilai_internal' => ($post['nilai_internal'] !== '') ? str_replace(',', '', $post['nilai_internal']) : 0,
            'mandays_rate' => ($post['mandays_rate'] !== '') ? str_replace(',', '', $post['mandays_rate']) : 0,
            'total_mandays' => ($post['total_mandays'] !== '') ? str_replace(',', '', $post['total_mandays']) : 0,
            'mandays_subcont' => ($post['mandays_subcont'] !== '') ? str_replace(',', '', $post['mandays_subcont']) : 0,
            'mandays_internal' => ($post['mandays_internal'] !== '') ? str_replace(',', '', $post['mandays_internal']) : 0,
            'nama_pemberi_informasi_komisi' => $post['nama_pemberi_informasi_komisi'],
            'persentase_pemberi_informasi_komisi' => ($post['persentase_pemberi_informasi_komisi'] !== '') ? str_replace(',', '', $post['persentase_pemberi_informasi_komisi']) : 0,
            'nominal_pemberi_informasi_komisi' => ($post['nominal_pemberi_informasi_komisi'] !== '') ? str_replace(',', '', $post['nominal_pemberi_informasi_komisi']) : 0,
            'nama_sales_komisi' => $post['nama_sales_komisi'],
            'persentase_sales_komisi' => ($post['persentase_sales_komisi'] !== '') ? str_replace(',', '', $post['persentase_sales_komisi']) : 0,
            'nominal_sales_komisi' => ($post['nominal_sales_komisi'] !== '') ? str_replace(',', '', $post['nominal_sales_komisi']) : 0,
            'nama_others_komisi' => $post['nama_others_komisi'],
            'persentase_others_komisi' => ($post['persentase_others_komisi'] !== '') ? str_replace(',', '', $post['persentase_others_komisi']) : 0,
            'nominal_others_komisi' => ($post['nominal_others_komisi'] !== '') ? str_replace(',', '', $post['nominal_others_komisi']) : 0,
            'edited_by' => $this->auth->user_id(),
            'edited_date' => date('Y-m-d H:i:s')
        ];

        $data_insert_subcont = [];

        if (isset($post['dt'])) {
            foreach ($post['dt'] as $item) {

                $get_aktifitas = $this->db->get_where('kons_master_aktifitas', ['id_aktifitas' => $item['id_aktifitas']])->row();

                $nm_aktifitas = (!empty($get_aktifitas)) ? $get_aktifitas->nm_aktifitas : '';

                $data_insert_subcont[] = [
                    'id_spk_penawaran' => $id_spk_penawaran,
                    'id_aktifitas' => $item['id_aktifitas'],
                    'nm_aktifitas' => $nm_aktifitas,
                    'mandays' => ($item['mandays'] !== '') ? str_replace(',', '', $item['mandays']) : 0,
                    'mandays_subcont' => ($item['mandays_subcont'] !== '') ? str_replace(',', '', $item['mandays_subcont']) : 0,
                    'price_subcont' => ($item['price_subcont'] !== '') ? str_replace(',', '', $item['price_subcont']) : 0,
                    'total_subcont' => ($item['total_subcont'] !== '') ? str_replace(',', '', $item['total_subcont']) : 0,
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

        $insert_spk_penawaran_subcont = $this->db->insert_batch('kons_tr_spk_penawaran_subcont', $data_insert_subcont);
        if (!$insert_spk_penawaran_subcont) {
            $this->db->trans_rollback();
            print_r($this->db->error($insert_spk_penawaran_subcont) . ' ' . $this->db->last_query());
            exit;
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
}
