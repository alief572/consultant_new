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
class Penawaran extends Admin_Controller
{
    //Permission
    protected $viewPermission     = 'Penawaran.View';
    protected $addPermission      = 'Penawaran.Add';
    protected $managePermission = 'Penawaran.Manage';
    protected $deletePermission = 'Penawaran.Delete';

    protected $is_admin;

    protected $dbhr;

    public function __construct()
    {
        parent::__construct();
        $this->template->title('Quotation');
        $this->template->page_icon('fa fa-cubes');
        $this->load->library('upload');
        $this->load->model('Penawaran/Penawaran_model');
        date_default_timezone_set('Asia/Bangkok');

        $this->is_admin = $this->auth->is_admin();

        $this->dbhr = $this->load->database('dbhr', true);
    }

    public function index()
    {
        $this->auth->restrict($this->viewPermission);

        $this->template->title('Quotation List');
        $this->template->render('index');
    }

    public function edit_penawaran($id_penawaran)
    {
        $id_penawaran = urldecode($id_penawaran);
        $id_penawaran = str_replace('|', '/', $id_penawaran);
        // print_r($id_penawaran);
        // exit;

        $get_penawaran = $this->db->get_where('kons_tr_penawaran', ['id_quotation' => $id_penawaran])->row();

        $this->db->select('a.*, b.nm_aktifitas as nama_aktifitas, COUNT(c.id_chk_point) AS jml_check_point');
        $this->db->from('kons_tr_penawaran_aktifitas a');
        $this->db->join('kons_master_aktifitas b', 'b.id_aktifitas = a.id_aktifitas', 'left');
        $this->db->join('kons_master_check_point c', 'c.id_aktifitas = a.id_aktifitas', 'left');
        $this->db->where('a.id_penawaran', $id_penawaran);
        $this->db->group_by('a.id');
        $this->db->order_by('a.id', 'asc');
        $get_penawaran_aktifitas = $this->db->get()->result();

        $get_penawaran_akomodasi = $this->db->get_where('kons_tr_penawaran_akomodasi', ['id_penawaran' => $id_penawaran])->result();
        $get_penawaran_others = $this->db->get_where('kons_tr_penawaran_others', ['id_penawaran' => $id_penawaran])->result();
        $get_penawaran_lab = $this->db->get_where('kons_tr_penawaran_lab', ['id_penawaran' => $id_penawaran])->result();
        $get_penawaran_subcont_tenaga_ahli = $this->db->get_where('kons_tr_penawaran_subcont_tenaga_ahli', ['id_penawaran' => $id_penawaran])->result();
        $get_penawaran_subcont_perusahaan = $this->db->get_where('kons_tr_penawaran_subcont_perusahaan', ['id_penawaran' => $id_penawaran])->result();

        $this->db->select('a.*');
        $this->db->from('customer a');
        $this->db->where('a.nm_customer <>', '');
        $this->db->group_by('a.nm_customer');
        $get_customer = $this->db->get()->result();

        // $this->db->select('a.*');
        // $this->db->from('employee a');
        // $this->db->where('a.deleted', 'N');
        // $this->db->order_by('a.nm_karyawan', 'asc');
        // $get_marketing = $this->db->get()->result();

        $this->db->select('a.id, a.name as nm_karyawan');
        $this->db->from(DBHR . '.employees a');
        $this->db->where_in('a.id', ['EMP0010', 'EMP0029', 'EMP0031', 'EMP0170', 'EMP0246', 'EMP0035', 'EMP0001', 'EMP0257', 'EMP0173']);
        $get_marketing = $this->db->get()->result();

        $this->db->select('a.id, a.name as nm_karyawan');
        $this->db->from(DBHR . '.employees a');
        $this->db->where_in('a.company_id', ['COM003', 'COM006', 'COM012']);
        $this->db->where('a.flag_active', 'Y');
        $get_employees = $this->db->get()->result();

        $this->db->select('a.*');
        $this->db->from('kons_master_konsultasi_header a');
        $get_package = $this->db->get()->result();

        $this->db->select('a.*');
        $this->db->from('kons_master_aktifitas a');
        $get_aktifitas = $this->db->get()->result();

        $this->db->select('a.*');
        $this->db->from('kons_master_biaya a');
        $this->db->where('a.tipe_biaya', 1);
        $this->db->where('a.deleted_by', null);
        $get_def_biaya_akomodasi = $this->db->get()->result();

        $this->db->select('a.*');
        $this->db->from('kons_master_biaya a');
        $this->db->where('a.tipe_biaya', 2);
        $this->db->where('a.deleted_by', null);
        $get_def_biaya_others = $this->db->get()->result();

        $this->db->select('a.*');
        $this->db->from('kons_master_lab a');
        $this->db->where('a.deleted_by', null);
        $get_def_biaya_lab = $this->db->get()->result();

        $this->db->select('a.*');
        $this->db->from('kons_master_tenaga_ahli a');
        $this->db->where('a.deleted_by', null);
        $get_def_biaya_tenaga_ahli = $this->db->get()->result();

        $this->db->select('a.*');
        $this->db->from('kons_master_subcont_perusahaan a');
        $this->db->where('a.deleted_by', null);
        $get_def_biaya_subcont_perusahaan = $this->db->get()->result();


        $this->db->select('a.id, a.name as nama');
        $this->db->from(DBHR . '.divisions a');
        $this->db->where_not_in('a.company_id', ['COM004', 'COM005']);
        $get_divisi = $this->db->get()->result();

        $this->db->select('a.*');
        $this->db->from('kons_tr_company a');
        $get_company = $this->db->get()->result();

        $data = [
            'list_penawaran' => $get_penawaran,
            'list_penawaran_aktifitas' => $get_penawaran_aktifitas,
            'list_penawaran_akomodasi' => $get_penawaran_akomodasi,
            'list_penawaran_others' => $get_penawaran_others,
            'list_penawaran_lab' => $get_penawaran_lab,
            'list_penawaran_subcont_tenaga_ahli' => $get_penawaran_subcont_tenaga_ahli,
            'list_penawaran_subcont_perusahaan' => $get_penawaran_subcont_perusahaan,
            'list_customers' => $get_customer,
            'list_marketing' => $get_marketing,
            'list_package' => $get_package,
            'list_aktifitas' => $get_aktifitas,
            'list_def_akomodasi' => $get_def_biaya_akomodasi,
            'list_def_others' => $get_def_biaya_others,
            'list_def_lab' => $get_def_biaya_lab,
            'list_def_tenaga_ahli' => $get_def_biaya_tenaga_ahli,
            'list_def_subcont_perusahaan' => $get_def_biaya_subcont_perusahaan,
            'list_divisi' => $get_divisi,
            'list_employees' => $get_employees,
            'list_company' => $get_company
        ];

        $this->template->title('Edit Quotation');
        $this->template->set($data);
        $this->template->render('edit_penawaran');
    }

    public function view_penawaran($id_penawaran)
    {
        $id_penawaran = urldecode($id_penawaran);
        $id_penawaran = str_replace('|', '/', $id_penawaran);

        $get_penawaran = $this->db->get_where('kons_tr_penawaran', ['id_quotation' => $id_penawaran])->row();

        $this->db->select('a.*, b.nm_aktifitas as nama_aktifitas, COUNT(c.id_chk_point) AS jml_check_point');
        $this->db->from('kons_tr_penawaran_aktifitas a');
        $this->db->join('kons_master_aktifitas b', 'b.id_aktifitas = a.id_aktifitas', 'left');
        $this->db->join('kons_master_check_point c', 'c.id_aktifitas = a.id_aktifitas', 'left');
        $this->db->where('a.id_penawaran', $id_penawaran);
        $this->db->group_by('a.id');
        $this->db->order_by('a.id', 'asc');
        $get_penawaran_aktifitas = $this->db->get()->result();

        $this->db->select('a.*, b.nm_biaya');
        $this->db->from('kons_tr_penawaran_akomodasi a');
        $this->db->join('kons_master_biaya b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_penawaran', $id_penawaran);
        $get_penawaran_akomodasi = $this->db->get()->result();

        $this->db->select('a.*, b.nm_biaya');
        $this->db->from('kons_tr_penawaran_others a');
        $this->db->join('kons_master_biaya b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_penawaran', $id_penawaran);
        $get_penawaran_others = $this->db->get()->result();

        $this->db->select('a.*, b.isu_lingkungan');
        $this->db->from('kons_tr_penawaran_lab a');
        $this->db->join('kons_master_lab b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_penawaran', $id_penawaran);
        $get_penawaran_lab = $this->db->get()->result();

        $this->db->select('a.*, b.nm_biaya');
        $this->db->from('kons_tr_penawaran_subcont_tenaga_ahli a');
        $this->db->join('kons_master_tenaga_ahli b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_penawaran', $id_penawaran);
        $get_penawaran_subcont_tenaga_ahli = $this->db->get()->result();

        $this->db->select('a.*, b.nm_biaya');
        $this->db->from('kons_tr_penawaran_subcont_perusahaan a');
        $this->db->join('kons_master_subcont_perusahaan b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_penawaran', $id_penawaran);
        $get_penawaran_subcont_perusahaan = $this->db->get()->result();

        $this->db->select('a.*');
        $this->db->from('customer a');
        $this->db->where('a.nm_customer <>', '');
        $this->db->group_by('a.nm_customer');
        $get_customer = $this->db->get()->result();

        // $this->db->select('a.*');
        // $this->db->from('employee a');
        // $this->db->where('a.deleted', 'N');
        // $this->db->order_by('a.nm_karyawan', 'asc');
        // $get_marketing = $this->db->get()->result();

        $this->db->select('a.id, a.name as nm_karyawan');
        $this->db->from(DBHR . '.employees a');
        $this->db->where_in('a.id', ['EMP0010', 'EMP0029', 'EMP0031', 'EMP0170', 'EMP0246', 'EMP0035', 'EMP0001', 'EMP0257', 'EMP0173']);
        $get_marketing = $this->db->get()->result();

        $this->db->select('a.id, a.name as nm_karyawan');
        $this->db->from(DBHR . '.employees a');
        $this->db->where_in('a.company_id', ['COM003', 'COM006', 'COM012']);
        $this->db->where('a.flag_active', 'Y');
        $get_employees = $this->db->get()->result();

        $this->db->select('a.*');
        $this->db->from('kons_master_konsultasi_header a');
        $get_package = $this->db->get()->result();

        $this->db->select('a.*');
        $this->db->from('kons_master_aktifitas a');
        $get_aktifitas = $this->db->get()->result();

        $this->db->select('a.id, a.name as nama');
        $this->db->from(DBHR . '.divisions a');
        $this->db->where_not_in('a.company_id', ['COM004', 'COM005']);
        $get_divisi = $this->db->get()->result();

        $this->db->select('a.*');
        $this->db->from('kons_tr_company a');
        $get_company = $this->db->get()->result();

        $data = [
            'list_penawaran' => $get_penawaran,
            'list_penawaran_aktifitas' => $get_penawaran_aktifitas,
            'list_penawaran_akomodasi' => $get_penawaran_akomodasi,
            'list_penawaran_others' => $get_penawaran_others,
            'list_penawaran_lab' => $get_penawaran_lab,
            'list_penawaran_subcont_tenaga_ahli' => $get_penawaran_subcont_tenaga_ahli,
            'list_penawaran_subcont_perusahaan' => $get_penawaran_subcont_perusahaan,
            'list_customers' => $get_customer,
            'list_marketing' => $get_marketing,
            'list_package' => $get_package,
            'list_aktifitas' => $get_aktifitas,
            'list_divisi' => $get_divisi,
            'list_employees' => $get_employees,
            'list_company' => $get_company
        ];

        $this->template->title('View Quotation');
        $this->template->set($data);
        $this->template->render('view_penawaran');
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
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.id_quotation', $search['value'], 'both');
            $this->db->or_like('a.tgl_quotation', $search['value'], 'both');
            $this->db->or_like('c.nama', $search['value'], 'both');
            $this->db->or_like('e.nm_paket', $search['value'], 'both');
            $this->db->or_like('b.nm_customer', $search['value'], 'both');
            $this->db->or_like('a.grand_total', str_replace(',', '', $search['value']), 'both');
            $this->db->group_end();
        }
        $this->db->group_by('a.id_quotation');
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
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.id_quotation', $search['value'], 'both');
            $this->db->or_like('a.tgl_quotation', $search['value'], 'both');
            $this->db->or_like('c.nama', $search['value'], 'both');
            $this->db->or_like('e.nm_paket', $search['value'], 'both');
            $this->db->or_like('b.nm_customer', $search['value'], 'both');
            $this->db->or_like('a.grand_total', str_replace(',', '', $search['value']), 'both');
            $this->db->group_end();
        }
        $this->db->group_by('a.id_quotation');

        $get_data_all = $this->db->get();

        $hasil = [];

        $no = ($start + 1);
        foreach ($get_data->result() as $item) {

            if ($item->sts_cust == 0) {
                $status_cust = '
                    <span class="btn btn-sm btn-warning" style="width: 100% !important;">
                        <b>New</b>
                    </span>
                ';
            } else {
                $status_cust = '
                    <span class="btn btn-sm btn-info" style="width: 100% !important;">
                        <b>Repeat</b>
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
                        <a href="' . base_url('penawaran/view_penawaran/' . urlencode(str_replace('/', '|', $item->id_quotation))) . '" class="btn btn-sm btn-info" style="color: #000000">
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

            if ($this->managePermission && ($item->sts_deal == null || $item->sts_deal == '')) {
                $option .= '
                    <div class="col-12" style="margin-top: 0.5rem; margin-left: 0.5rem">
                        <a href="' . base_url('penawaran/edit_penawaran/' . urlencode(str_replace('/', '|', $item->id_quotation))) . '" class="btn btn-sm btn-success" style="color: #000000">
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

            if ($this->deletePermission && ($item->sts_deal == null || $item->sts_deal == '')) {
                $option .= '
                    <div class="col-12" style="margin-top: 0.5rem; margin-left: 0.5rem">
                        <a href="javascript:void(0);" class="btn btn-sm btn-danger del_penawaran" style="color: #000000" data-id_penawaran="' . $item->id_quotation . '">
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

            if ($this->managePermission && $item->sts_quot == '2' && ($item->sts_deal == null || $item->sts_deal == '') && ($this->auth->user_id() == '92' || $this->is_admin)) {
                $option .= '
                    <div class="col-12" style="margin-top: 0.5rem; margin-left: 0.5rem">
                        <a href="javascript:void(0);" class="btn btn-sm btn-warning deal_penawaran" style="color: #000000" data-id_penawaran="' . $item->id_quotation . '">
                            <div class="col-12 dropdown-item">
                            <b>
                                <i class="fa fa-check"></i>
                            </b>
                            </div>
                        </a>
                        <span style="font-weight: 500"> Deal </span>
                    </div>
                ';
            }

            $option .= '
                <div class="col-12" style="margin-top: 0.5rem; margin-left: 0.5rem">
                    <a
                        href="javascript:void(0);"
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


            $get_marketing = $this->dbhr->get_where('employees', ['id' => $item->id_marketing])->row();
            $nm_marketing = (!empty($get_marketing)) ? $get_marketing->name : '';

            $this->db->select('a.*');
            $this->db->from('kons_master_konsultasi_header a');
            $this->db->where('a.id_konsultasi_h', $item->id_paket);
            $get_package = $this->db->get()->row();

            $nm_paket = (!empty($get_package)) ? $get_package->nm_paket : '';

            $get_customers = $this->db->get_where('customer', ['id_customer' => $item->id_customer])->row();
            $nm_customer = (!empty($get_customers)) ? $get_customers->nm_customer : '';

            $hasil[] = [
                'no' => $no,
                'id_quotation' => $item->id_quotation,
                'tgl_quotation' => $item->tgl_quotation,
                'nm_marketing' => ucfirst($nm_marketing),
                'nm_paket' => $nm_paket,
                'nm_customer' => $nm_customer,
                'grand_total' => number_format($item->grand_total),
                'revisi' => $item->revisi,
                'status_cust' => $status_cust,
                'status_quot' => $status_quot,
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

    public function add_penawaran()
    {
        $this->auth->restrict($this->viewPermission);

        // $get_customer = $this->db->get_where('customers')->result();


        $this->db->select('a.*');
        $this->db->from('customer a');
        $this->db->where('a.nm_customer <>', '');
        $this->db->group_by('a.nm_customer');
        $get_customer = $this->db->get()->result();

        // $this->db->select('a.*');
        // $this->db->from('employee a');
        // $this->db->where('a.deleted', 'N');
        // $this->db->order_by('a.nm_karyawan', 'asc');
        // $get_marketing = $this->db->get()->result();

        $this->db->select('a.id, a.name as nm_karyawan');
        $this->db->from(DBHR . '.employees a');
        $this->db->where_in('a.id', ['EMP0010', 'EMP0029', 'EMP0031', 'EMP0170', 'EMP0246', 'EMP0035', 'EMP0001', 'EMP0257', 'EMP0173']);
        $get_marketing = $this->db->get()->result();

        $this->db->select('a.id, a.name as nm_karyawan');
        $this->db->from(DBHR . '.employees a');
        $this->db->where_in('a.company_id', ['COM003', 'COM006', 'COM012']);
        $this->db->where('a.flag_active', 'Y');
        $get_employees = $this->db->get()->result();

        $this->db->select('a.*');
        $this->db->from('kons_master_konsultasi_header a');
        $get_package = $this->db->get()->result();

        $this->db->select('a.*');
        $this->db->from('kons_master_aktifitas a');
        $get_aktifitas = $this->db->get()->result();

        $this->db->select('a.*');
        $this->db->from('kons_master_biaya a');
        $this->db->where('a.tipe_biaya', 1);
        $this->db->where('a.deleted_by', null);
        $get_def_biaya_akomodasi = $this->db->get()->result();

        $this->db->select('a.*');
        $this->db->from('kons_master_biaya a');
        $this->db->where('a.tipe_biaya', 2);
        $this->db->where('a.deleted_by', null);
        $get_def_biaya_others = $this->db->get()->result();

        $this->db->select('a.id, a.isu_lingkungan, a.peraturan, a.waktu, a.harga_ssc, a.harga_lab');
        $this->db->from('kons_master_lab a');
        $this->db->where('a.deleted_by', null);
        $get_def_biaya_lab = $this->db->get()->result();

        $this->db->select('a.*');
        $this->db->from('kons_master_tenaga_ahli a');
        $this->db->where('a.tipe_biaya', 1);
        $this->db->where('a.deleted_by', null);
        $get_def_subcont_tenaga_ahli = $this->db->get()->result();

        $this->db->select('a.*');
        $this->db->from('kons_master_subcont_perusahaan a');
        $this->db->where('a.tipe_biaya', 1);
        $this->db->where('a.deleted_by', null);
        $get_def_subcont_perusahaan = $this->db->get()->result();

        $this->db->select('a.id, a.name as nama');
        $this->db->from(DBHR . '.divisions a');
        $this->db->where_not_in('a.company_id', ['COM004', 'COM005']);
        $get_divisi = $this->db->get()->result();

        $this->db->select('a.*');
        $this->db->from('kons_tr_company a');
        $get_company = $this->db->get()->result();

        $data = [
            'list_customers' => $get_customer,
            'list_marketing' => $get_marketing,
            'list_package' => $get_package,
            'list_aktifitas' => $get_aktifitas,
            'list_def_akomodasi' => $get_def_biaya_akomodasi,
            'list_def_others' => $get_def_biaya_others,
            'list_def_lab' => $get_def_biaya_lab,
            'list_def_subcont_tenaga_ahli' => $get_def_subcont_tenaga_ahli,
            'list_def_subcont_perusahaan' => $get_def_subcont_perusahaan,
            'list_divisi' => $get_divisi,
            'list_employees' => $get_employees,
            'list_company' => $get_company
        ];

        $this->template->title('Create Quotation');
        $this->template->set($data);
        $this->template->render('add_penawaran');
    }

    public function change_customer()
    {
        $id_customer = $this->input->post('id_customer');

        $this->db->select('a.alamat as address, b.nm_pic as contact');
        $this->db->from('customer a');
        $this->db->join('customer_pic b', 'b.id_pic = a.id_pic', 'left');
        $this->db->where('a.id_customer', $id_customer);
        $get_cust = $this->db->get()->row();

        if (!empty($get_cust)) {
            $valid = 1;

            $contact = $get_cust->contact;
            $address = $get_cust->address;
        } else {
            $valid = 1;

            $contact = '';
            $address = '';
        }

        echo json_encode([
            'status' => $valid,
            'contact' => $contact,
            'address' => $address
        ]);
    }

    public function change_package()
    {
        $id_package = $this->input->post('id_package');

        // $get_konsultasi_detail = $this->db->get_where('kons_master_konsultasi_detail', ['id_konsultasi_h' => $id_package])->order_by('id_konsultasi_d', 'asc')->result();

        $this->db->select('a.*');
        $this->db->from('kons_master_konsultasi_detail a');
        $this->db->where('a.id_konsultasi_h', $id_package);
        $this->db->order_by('a.id_konsultasi_d', 'asc');
        $get_konsultasi_detail = $this->db->get()->result();

        $hasil = '';

        $ttl_mandays = 0;
        $ttl_mandays_rate = 0;
        $ttl_price = 0;

        $no = 1;
        foreach ($get_konsultasi_detail as $item) {

            $get_check_point = $this->db->get_where('kons_master_check_point', ['id_aktifitas' => $item->id_aktifitas]);

            $hasil .= '<tr class="tr_aktifitas_' . $no . '">';

            $hasil .= '<td class="text-center tr_no">' . $no . '</td>';

            $hasil .= '<td class="text-left">';
            $hasil .= '<select class="form-control form-control-sm change_aktifitas select_nm_aktifitas_' . $no . '" name="dt_act[' . $no . '][nm_aktifitas]" style="max-width: 500px;" data-no="' . $no . '">';

            $hasil .= '<option value="">- Select Activity Name -</option>';

            $this->db->select('a.*');
            $this->db->from('kons_master_aktifitas a');
            $get_aktifitas = $this->db->get();

            foreach ($get_aktifitas->result() as $item_aktifitas) {
                $selected = '';
                if ($item_aktifitas->id_aktifitas == $item->id_aktifitas) {
                    $selected = 'selected';
                }

                $hasil .= '<option value="' . $item_aktifitas->id_aktifitas . '" ' . $selected . '>' . $item_aktifitas->nm_aktifitas . '</option>';
            }

            $mandays = $item->mandays;
            $mandays_rate = ($item->mandays >= 1) ? ($item->harga_aktifitas / $item->mandays) : ($item->harga_aktifitas);
            $total = ($item->mandays >= 1) ? ($mandays_rate * $item->mandays) : ($item->harga_aktifitas * $item->mandays);

            $hasil .= '</select>';
            $hasil .= '</td>';

            $hasil .= '<td class="text-center">';
            $hasil .= '<input type="text" class="form-control form-control-sm auto_num text-right input_mandays_' . $no . '" name="dt_act[' . $no . '][mandays]" value="' . $item->mandays . '" onchange="hitung_total_activity()">';
            $hasil .= '</td>';

            $hasil .= '<td class="text-center">';
            $hasil .= '<input type="hidden" name="dt_act[' . $no . '][min_mandays_rate]" value="' . $mandays_rate . '">';
            $hasil .= '<input type="text" class="form-control form-control-sm auto_num text-right input_mandays_rate_' . $no . '" name="dt_act[' . $no . '][mandays_rate]" value="' . $mandays_rate . '" onchange="hitung_total_activity()">';
            $hasil .= '</td>';

            $hasil .= '<td class="text-center">';
            $hasil .= '<input type="text" class="form-control form-control-sm auto_num text-right input_mandays_subcont_' . $no . '" name="dt_act[' . $no . '][mandays_subcont]" value="" onchange="hitung_total_activity()">';
            $hasil .= '</td>';

            $hasil .= '<td class="text-center">';
            $hasil .= '<input type="text" class="form-control form-control-sm auto_num text-right input_mandays_rate_subcont_' . $no . '" name="dt_act[' . $no . '][mandays_rate_subcont]" value="" onchange="hitung_total_activity()">';
            $hasil .= '</td>';

            $hasil .= '<td class="text-center">';
            $hasil .= '<input type="text" class="form-control form-control-sm auto_num text-right input_mandays_tandem_' . $no . '" name="dt_act[' . $no . '][mandays_tandem]" value="" onchange="hitung_total_activity()">';
            $hasil .= '</td>';

            $hasil .= '<td class="text-center">';
            $hasil .= '<input type="text" class="form-control form-control-sm auto_num text-right input_mandays_rate_tandem_' . $no . '" name="dt_act[' . $no . '][mandays_rate_tandem]" value="" onchange="hitung_total_activity()">';
            $hasil .= '</td>';


            $hasil .= '<td class="text-right">';
            $hasil .= '<input type="text" class="form-control form-control-sm auto_num text-right input_harga_aktifitas_' . $no . '" name="dt_act[' . $no . '][harga_aktifitas]" value="' . $total . '" onchange="hitung_total_activity()" readonly>';
            $hasil .= '</td>';

            $hasil .= '<td class="text-center">';
            $hasil .= '<button type="button" class="btn btn-sm btn-danger del_aktifitas" data-no="' . $no . '"><i class="fa fa-trash"></i></button>';
            $hasil .= '</td>';

            $hasil .= '</tr>';

            $no++;

            $ttl_mandays += $mandays;
            $ttl_mandays_rate += $mandays_rate;
            $ttl_price += $total;
        }

        echo json_encode([
            'hasil' => $hasil,
            'no' => $no,
            'ttl_mandays' => $ttl_mandays,
            'ttl_mandays_rate' => $ttl_mandays_rate,
            'ttl_price' => $ttl_price
        ]);
    }

    public function change_aktifitas()
    {
        $id_aktifitas = $this->input->post('id_aktifitas');

        $bobot = 0;
        $mandays = 0;
        $price = 0;
        $check_point = 0;
        $mandays_rate = 0;

        $get_aktifitas = $this->db->get_where('kons_master_aktifitas', ['id_aktifitas' => $id_aktifitas])->row();
        if (!empty($get_aktifitas)) {
            $bobot = $get_aktifitas->bobot;
            $mandays = $get_aktifitas->mandays;
            $price = $get_aktifitas->harga_aktifitas;
            $mandays_rate = $get_aktifitas->harga_aktifitas;
        }

        $get_check_point = $this->db->get_where('kons_master_check_point', ['id_aktifitas' => $id_aktifitas])->num_rows();
        $check_point = $get_check_point;

        echo json_encode([
            'mandays' => $mandays,
            'mandays_rate' => $mandays_rate,
            'price' => ($mandays * $mandays_rate)
        ]);
    }

    public function hitung_ttl_check_point()
    {
        $id_aktifitas = $this->input->post('id_aktifitas');

        $this->db->select('a.*');
        $this->db->from('kons_master_check_point a');
        $this->db->where_in('a.id_aktifitas', $id_aktifitas);
        $get_check_point = $this->db->get()->num_rows();

        echo $get_check_point;
    }

    public function save_penawaran()
    {
        $post = $this->input->post();
        // print_r($post);
        // exit;

        $this->db->trans_begin();

        $valid = 1;
        $msg = '';

        $filenames = '';
        $filenames_tahapan = '';
        $filenames_po = '';

        $config['upload_path'] = './uploads/proposal_penawaran/';
        $config['allowed_types'] = '*';
        $config['remove_spaces'] = TRUE;
        $config['encrypt_name'] = TRUE;

        $this->upload->initialize($config);
        if ($this->upload->do_upload('upload_proposal')) {
            $uploadData = $this->upload->data();
            $filenames = $uploadData['file_name'];
        }

        $config_tahapan['upload_path'] = './uploads/tahapan_penawaran/';
        $config_tahapan['allowed_types'] = '*';
        $config_tahapan['remove_spaces'] = TRUE;
        $config_tahapan['encrypt_name'] = TRUE;

        $this->upload->initialize($config_tahapan);
        if ($this->upload->do_upload('upload_tahapan')) {
            $uploadData_tahapan = $this->upload->data();
            $filenames_tahapan = $uploadData_tahapan['file_name'];
        }

        $config_po['upload_path'] = './uploads/po_penawaran/';
        $config_po['allowed_types'] = '*';
        $config_po['remove_spaces'] = TRUE;
        $config_po['encrypt_name'] = TRUE;

        $this->upload->initialize($config_po);
        if ($this->upload->do_upload('upload_po')) {
            $uploadData_po = $this->upload->data();
            $filenames_po = $uploadData_po['file_name'];
        }

        $sts_cust = $post['sts_cust'];

        $grand_total = $post['grand_total'];

        $ppn = 0;
        if (isset($post['include_ppn'])) {
            $ppn = 1;
        }

        $tipe_info_awal = '';
        $detail_info_awal = '';

        if (isset($post['check_info_awal_sales'])) {
            $tipe_info_awal = 'Sales';
            $detail_info_awal = $post['informasi_awal_sales'];
        }
        if (isset($post['check_info_awal_medsos'])) {
            $tipe_info_awal = 'Medsos';
            $detail_info_awal = $post['informasi_awal_medsos'];
        }
        if (isset($post['check_info_awal_others'])) {
            $tipe_info_awal = 'Others';
            $detail_info_awal = $post['informasi_awal_others'];
        }

        $employee_code = $post['employee_code'];

        $tipe_penawaran = '';
        if (isset($post['check_info_awal_sales'])) {
            $tipe_penawaran = 'STM/';
        }
        if (isset($post['check_info_awal_medsos'])) {
            $tipe_penawaran = 'STM/IC-MKT/';
        }
        if (isset($post['check_info_awal_others'])) {
            $tipe_penawaran = 'STM/INT/';
        }

        $id_penawaran = generateNoPenawaran($employee_code, $tipe_penawaran);
        $id_history = $this->Penawaran_model->generate_history_id();

        $company = $post['company'];
        $nm_company = $post['nm_company'];

        $arr_insert = [
            'id_quotation' => $id_penawaran,
            'tipe_penawaran' => $tipe_penawaran,
            'tgl_quotation' => $post['tgl_quotation'],
            'id_customer' => $post['customer'],
            'id_marketing' => $post['marketing'],
            'nm_pic' => $post['pic'],
            'address' => $post['address'],
            'id_paket' => $post['consultation_package'],
            'upload_proposal' => $filenames,
            'upload_tahapan' => $filenames_tahapan,
            'upload_po' => $filenames_po,
            'sts_cust' => $sts_cust,
            'sts_quot' => 1,
            'grand_total' => $grand_total,
            'ppn' => $ppn,
            'persen_disc' => str_replace(',', '', $post['persen_disc']),
            'nilai_disc' => str_replace(',', '', $post['nilai_disc']),
            'tipe_informasi_awal' => $tipe_info_awal,
            'detail_informasi_awal' => $detail_info_awal,
            'id_divisi' => $post['divisi'],
            'nm_divisi' => $post['nm_divisi'],
            'total_mandays' => $post['ttl_total_mandays'],
            'mandays_subcont' => $post['ttl_mandays_subcont'],
            'mandays_tandem' => $post['ttl_mandays_tandem'],
            'mandays_internal' => $post['ttl_total_mandays'],
            'mandays_rate' => $post['ttl_mandays_rate'],
            'input_by' => $this->auth->user_id(),
            'input_date' => date('Y-m-d H:i:s'),
            'company' => $company,
            'nm_company' => $nm_company
        ];

        $arr_insert_act = [];

        if (isset($post['dt_act'])) {
            foreach ($post['dt_act'] as $item_act) {
                $arr_insert_act[] = [
                    'id_penawaran' => $id_penawaran,
                    'id_aktifitas' => $item_act['nm_aktifitas'],
                    'mandays' => str_replace(',', '',  $item_act['mandays']),
                    'mandays_rate' => str_replace(',', '',  $item_act['mandays_rate']),
                    'mandays_subcont' => str_replace(',', '',  $item_act['mandays_subcont']),
                    'mandays_rate_subcont' => str_replace(',', '',  $item_act['mandays_rate_subcont']),
                    'mandays_tandem' => str_replace(',', '',  $item_act['mandays_tandem']),
                    'mandays_rate_tandem' => str_replace(',', '',  $item_act['mandays_rate_tandem']),
                    'harga_aktifitas' => str_replace(',', '',  $item_act['harga_aktifitas']),
                    'total_aktifitas' => str_replace(',', '',  $item_act['harga_aktifitas']),
                    'input_by' => $this->auth->user_id(),
                    'input_date' => date('Y-m-d H:i:s')
                ];
            }
        }

        $arr_insert_ako = [];
        if (isset($post['dt_ako'])) {
            foreach ($post['dt_ako'] as $item_ako) {
                $arr_insert_ako[] = [
                    'id_penawaran' => $id_penawaran,
                    'id_item' => $item_ako['id_akomodasi'],
                    'qty' => str_replace(',', '', $item_ako['qty_akomodasi']),
                    'price_unit' => str_replace(',', '', $item_ako['harga_akomodasi']),
                    'total' => str_replace(',', '', $item_ako['total_akomodasi']),
                    'keterangan' => $item_ako['keterangan_akomodasi'],
                    'input_by' => $this->auth->user_id(),
                    'input_date' => date('Y-m-d H:i:s')
                ];
            }
        }

        $arr_insert_oth = [];
        if (isset($post['dt_oth'])) {
            foreach ($post['dt_oth'] as $item_oth) {
                $arr_insert_oth[] = [
                    'id_penawaran' => $id_penawaran,
                    'id_item' => $item_oth['id_others'],
                    'qty' => str_replace(',', '', $item_oth['qty_others']),
                    'price_unit' => str_replace(',', '', $item_oth['harga_others']),
                    'total' => str_replace(',', '', $item_oth['total_others']),
                    'price_unit_budget' => str_replace(',', '', $item_oth['harga_others_budget']),
                    'total_budget' => (str_replace(',', '', $item_oth['total_budget_others'])),
                    'keterangan' => $item_oth['keterangan_others'],
                    'input_by' => $this->auth->user_id(),
                    'input_date' => date('Y-m-d H:i:s')
                ];
            }
        }

        $arr_insert_lab = [];
        if (isset($post['dt_lab'])) {
            foreach ($post['dt_lab'] as $item_lab) {
                $arr_insert_lab[] = [
                    'id_penawaran' => $id_penawaran,
                    'id_item' => $item_lab['id_lab'],
                    'qty' => str_replace(',', '', $item_lab['qty_lab']),
                    'price_unit' => str_replace(',', '', $item_lab['harga_lab']),
                    'total' => str_replace(',', '', $item_lab['total_lab']),
                    'price_unit_budget' => str_replace(',', '', $item_lab['harga_lab_budget']),
                    'total_budget' => (str_replace(',', '', $item_lab['total_lab_budget'])),
                    'keterangan' => $item_lab['keterangan_lab'],
                    'input_by' => $this->auth->user_id(),
                    'input_date' => date('Y-m-d H:i:s')
                ];
            }
        }

        $arr_insert_subcont_tenaga_ahli = [];
        if (isset($post['dt_subcont_tenaga_ahli'])) {
            foreach ($post['dt_subcont_tenaga_ahli'] as $item_subcont_tenaga_ahli) {
                $arr_insert_subcont_tenaga_ahli[] = [
                    'id_penawaran' => $id_penawaran,
                    'id_item' => $item_subcont_tenaga_ahli['id_subcont_tenaga_ahli'],
                    'qty' => str_replace(',', '', $item_subcont_tenaga_ahli['qty_subcont_tenaga_ahli']),
                    'price_unit' => str_replace(',', '', $item_subcont_tenaga_ahli['harga_subcont_tenaga_ahli']),
                    'total' => str_replace(',', '', $item_subcont_tenaga_ahli['total_subcont_tenaga_ahli']),
                    'price_unit_budget' => str_replace(',', '', $item_subcont_tenaga_ahli['harga_subcont_tenaga_ahli_budget']),
                    'total_budget' => (str_replace(',', '', $item_subcont_tenaga_ahli['total_subcont_tenaga_ahli_budget'])),
                    'keterangan' => $item_subcont_tenaga_ahli['keterangan_subcont_tenaga_ahli'],
                    'input_by' => $this->auth->user_id(),
                    'input_date' => date('Y-m-d H:i:s')
                ];
            }
        }

        $arr_insert_subcont_perusahaan = [];
        if (isset($post['dt_subcont_perusahaan'])) {
            foreach ($post['dt_subcont_perusahaan'] as $item_subcont_perusahaan) {
                $arr_insert_subcont_perusahaan[] = [
                    'id_penawaran' => $id_penawaran,
                    'id_item' => $item_subcont_perusahaan['id_subcont_perusahaan'],
                    'qty' => str_replace(',', '', $item_subcont_perusahaan['qty_subcont_perusahaan']),
                    'price_unit' => str_replace(',', '', $item_subcont_perusahaan['harga_subcont_perusahaan']),
                    'total' => str_replace(',', '', $item_subcont_perusahaan['total_subcont_perusahaan']),
                    'price_unit_budget' => str_replace(',', '', $item_subcont_perusahaan['harga_subcont_perusahaan_budget']),
                    'total_budget' => (str_replace(',', '', $item_subcont_perusahaan['total_subcont_perusahaan_budget'])),
                    'keterangan' => $item_subcont_perusahaan['keterangan_subcont_perusahaan'],
                    'input_by' => $this->auth->user_id(),
                    'input_date' => date('Y-m-d H:i:s')
                ];
            }
        }

        if ($valid == 1) {
            $insert_penawaran = $this->db->insert('kons_tr_penawaran', $arr_insert);
            if (!$insert_penawaran) {
                $this->db->trans_rollback();
                print_r('error_insert 1');
                print_r($this->db->last_query());
                exit;
            } else {
                $arr_insert_history_penawaran = [
                    'id_history' => $id_history,
                    'id_quotation' => $id_penawaran,
                    'tipe_penawaran' => $tipe_penawaran,
                    'tgl_quotation' => $post['tgl_quotation'],
                    'id_customer' => $post['customer'],
                    'id_marketing' => $post['marketing'],
                    'nm_pic' => $post['pic'],
                    'address' => $post['address'],
                    'id_paket' => $post['consultation_package'],
                    'upload_proposal' => $filenames,
                    'upload_tahapan' => $filenames_tahapan,
                    'upload_po' => $filenames_po,
                    'sts_cust' => $sts_cust,
                    'sts_quot' => 1,
                    'grand_total' => $grand_total,
                    'ppn' => $ppn,
                    'persen_disc' => str_replace(',', '', $post['persen_disc']),
                    'nilai_disc' => str_replace(',', '', $post['nilai_disc']),
                    'tipe_informasi_awal' => $tipe_info_awal,
                    'detail_informasi_awal' => $detail_info_awal,
                    'id_divisi' => $post['divisi'],
                    'nm_divisi' => $post['nm_divisi'],
                    'total_mandays' => $post['ttl_total_mandays'],
                    'mandays_subcont' => $post['ttl_mandays_subcont'],
                    'mandays_tandem' => $post['ttl_mandays_tandem'],
                    'mandays_internal' => $post['ttl_total_mandays'],
                    'mandays_rate' => $post['ttl_mandays_rate'],
                    'input_by' => $this->auth->user_id(),
                    'input_date' => date('Y-m-d H:i:s')
                ];

                $insert_history_penawaran = $this->db->insert('kons_tr_penawaran_history', $arr_insert_history_penawaran);
                if (!$insert_history_penawaran) {
                    print_r($this->db->error($insert_history_penawaran));
                    exit;
                }
            }
            $insert_penawaran_aktifitas = $this->db->insert_batch('kons_tr_penawaran_aktifitas', $arr_insert_act);
            if (!$insert_penawaran_aktifitas) {
                $this->db->trans_rollback();
                print_r('error_insert 2');
                print_r($this->db->error($insert_penawaran_aktifitas));
                exit;
            } else {
                if (isset($post['dt_act'])) {
                    $arr_insert_history_act = [];
                    foreach ($post['dt_act'] as $item_act) {
                        $arr_insert_history_act[] = [
                            'id_history' => $id_history,
                            'id_penawaran' => $id_penawaran,
                            'id_aktifitas' => $item_act['nm_aktifitas'],
                            'mandays' => str_replace(',', '',  $item_act['mandays']),
                            'mandays_rate' => str_replace(',', '',  $item_act['mandays_rate']),
                            'mandays_subcont' => str_replace(',', '',  $item_act['mandays_subcont']),
                            'mandays_rate_subcont' => str_replace(',', '',  $item_act['mandays_rate_subcont']),
                            'mandays_tandem' => str_replace(',', '',  $item_act['mandays_tandem']),
                            'mandays_rate_tandem' => str_replace(',', '',  $item_act['mandays_rate_tandem']),
                            'harga_aktifitas' => str_replace(',', '',  $item_act['harga_aktifitas']),
                            'total_aktifitas' => str_replace(',', '',  $item_act['harga_aktifitas']),
                            'input_by' => $this->auth->user_id(),
                            'input_date' => date('Y-m-d H:i:s')
                        ];
                    }

                    $insert_history_act = $this->db->insert_batch('kons_tr_penawaran_aktifitas_history', $arr_insert_history_act);
                    if (!$insert_history_act) {
                        print_r($this->db->error($insert_history_act));
                        exit;
                    }
                }
            }

            if (!empty($arr_insert_ako)) {
                $insert_penawaran_akomodasi = $this->db->insert_batch('kons_tr_penawaran_akomodasi', $arr_insert_ako);
                if (!$insert_penawaran_akomodasi) {
                    $this->db->trans_rollback();
                    print_r('error_insert 3');
                    print_r($this->db->error($insert_penawaran_aktifitas));
                    exit;
                } else {
                    if (isset($post['dt_ako'])) {
                        $arr_insert_history_akomodasi = [];
                        foreach ($post['dt_ako'] as $item_ako) {
                            $arr_insert_history_akomodasi[] = [
                                'id_history' => $id_history,
                                'id_penawaran' => $id_penawaran,
                                'id_item' => $item_ako['id_akomodasi'],
                                'qty' => str_replace(',', '', $item_ako['qty_akomodasi']),
                                'price_unit' => str_replace(',', '', $item_ako['harga_akomodasi']),
                                'total' => str_replace(',', '', $item_ako['total_akomodasi']),
                                'keterangan' => $item_ako['keterangan_akomodasi'],
                                'input_by' => $this->auth->user_id(),
                                'input_date' => date('Y-m-d H:i:s')
                            ];
                        }

                        $insert_history_ako = $this->db->insert_batch('kons_tr_penawaran_akomodasi_history', $arr_insert_history_akomodasi);
                        if (!$insert_history_ako) {
                            print_r($this->db->error($insert_history_ako));
                            exit;
                        }
                    }
                }
            }

            if (!empty($arr_insert_oth)) {
                $insert_penawaran_others = $this->db->insert_batch('kons_tr_penawaran_others', $arr_insert_oth);
                if (!$insert_penawaran_others) {
                    $this->db->trans_rollback();
                    print_r('error_insert 4');
                    print_r($this->db->error($insert_penawaran_others));
                    exit;
                } else {
                    if (isset($post['dt_oth'])) {
                        $arr_insert_history_others = [];
                        foreach ($post['dt_oth'] as $item_oth) {
                            $arr_insert_history_others[] = [
                                'id_history' => $id_history,
                                'id_penawaran' => $id_penawaran,
                                'id_item' => $item_oth['id_others'],
                                'qty' => str_replace(',', '', $item_oth['qty_others']),
                                'price_unit' => str_replace(',', '', $item_oth['harga_others']),
                                'total' => str_replace(',', '', $item_oth['total_others']),
                                'price_unit_budget' => str_replace(',', '', $item_oth['harga_others_budget']),
                                'total_budget' => (str_replace(',', '', $item_oth['total_budget_others'])),
                                'keterangan' => $item_oth['keterangan_others'],
                                'input_by' => $this->auth->user_id(),
                                'input_date' => date('Y-m-d H:i:s')
                            ];
                        }

                        $insert_history_oth = $this->db->insert_batch('kons_tr_penawaran_others_history', $arr_insert_history_others);
                        if (!$insert_history_oth) {
                            print_r($this->db->error($insert_history_oth));
                            exit;
                        }
                    }
                }
            }

            if (!empty($arr_insert_lab)) {
                $insert_penawaran_lab = $this->db->insert_batch('kons_tr_penawaran_lab', $arr_insert_lab);
                if (!$insert_penawaran_lab) {
                    $this->db->trans_rollback();
                    print_r('error_insert 4');
                    print_r($this->db->error($insert_penawaran_lab));
                    exit;
                } else {
                    if (isset($post['dt_lab'])) {
                        $arr_insert_history_lab = [];
                        foreach ($post['dt_lab'] as $item_lab) {
                            $arr_insert_history_lab[] = [
                                'id_history' => $id_history,
                                'id_penawaran' => $id_penawaran,
                                'id_item' => $item_lab['id_lab'],
                                'qty' => str_replace(',', '', $item_lab['qty_lab']),
                                'price_unit' => str_replace(',', '', $item_lab['harga_lab']),
                                'total' => str_replace(',', '', $item_lab['total_lab']),
                                'price_unit_budget' => str_replace(',', '', $item_lab['harga_lab_budget']),
                                'total_budget' => (str_replace(',', '', $item_lab['total_lab_budget'])),
                                'keterangan' => $item_lab['keterangan_lab'],
                                'input_by' => $this->auth->user_id(),
                                'input_date' => date('Y-m-d H:i:s')
                            ];
                        }

                        $insert_history_lab = $this->db->insert_batch('kons_tr_penawaran_lab_history', $arr_insert_history_lab);
                        if (!$insert_history_lab) {
                            print_r($this->db->error($insert_history_lab));
                            exit;
                        }
                    }
                }
            }

            if (!empty($arr_insert_subcont_tenaga_ahli)) {
                $insert_penawaran_subcont_tenaga_ahli = $this->db->insert_batch('kons_tr_penawaran_subcont_tenaga_ahli', $arr_insert_subcont_tenaga_ahli);
                if (!$insert_penawaran_subcont_tenaga_ahli) {
                    $this->db->trans_rollback();
                    print_r('error_insert 4');
                    print_r($this->db->error($insert_penawaran_subcont_tenaga_ahli));
                    exit;
                } else {
                    if (isset($post['dt_subcont_tenaga_ahli'])) {
                        $arr_insert_history_subcont_tenaga_ahli = [];
                        foreach ($post['dt_subcont_tenaga_ahli'] as $item_subcont_tenaga_ahli) {
                            $arr_insert_history_subcont_tenaga_ahli[] = [
                                'id_history' => $id_history,
                                'id_penawaran' => $id_penawaran,
                                'id_item' => $item_subcont_tenaga_ahli['id_subcont_tenaga_ahli'],
                                'qty' => str_replace(',', '', $item_subcont_tenaga_ahli['qty_subcont_tenaga_ahli']),
                                'price_unit' => str_replace(',', '', $item_subcont_tenaga_ahli['harga_subcont_tenaga_ahli']),
                                'total' => str_replace(',', '', $item_subcont_tenaga_ahli['total_subcont_tenaga_ahli']),
                                'price_unit_budget' => str_replace(',', '', $item_subcont_tenaga_ahli['harga_subcont_tenaga_ahli_budget']),
                                'total_budget' => (str_replace(',', '', $item_subcont_tenaga_ahli['total_subcont_tenaga_ahli_budget'])),
                                'keterangan' => $item_subcont_tenaga_ahli['keterangan_subcont_tenaga_ahli'],
                                'input_by' => $this->auth->user_id(),
                                'input_date' => date('Y-m-d H:i:s')
                            ];
                        }

                        $insert_history_subcont_tenaga_ahli = $this->db->insert_batch('kons_tr_penawaran_subcont_tenaga_ahli_history', $arr_insert_history_subcont_tenaga_ahli);
                        if (!$insert_history_subcont_tenaga_ahli) {
                            print_r($this->db->error($insert_history_subcont_tenaga_ahli));
                            exit;
                        }
                    }
                }
            }

            if (!empty($arr_insert_subcont_perusahaan)) {
                $insert_penawaran_subcont_perusahaan = $this->db->insert_batch('kons_tr_penawaran_subcont_perusahaan', $arr_insert_subcont_perusahaan);
                if (!$insert_penawaran_subcont_perusahaan) {
                    $this->db->trans_rollback();
                    print_r('error_insert 4');
                    print_r($this->db->error($insert_penawaran_subcont_perusahaan));
                    exit;
                } else {
                    if (isset($post['dt_subcont_perusahaan'])) {
                        $arr_insert_history_subcont_perusahaan = [];
                        foreach ($post['dt_subcont_perusahaan'] as $item_subcont_perusahaan) {
                            $arr_insert_history_subcont_perusahaan[] = [
                                'id_history' => $id_history,
                                'id_penawaran' => $id_penawaran,
                                'id_item' => $item_subcont_perusahaan['id_subcont_perusahaan'],
                                'qty' => str_replace(',', '', $item_subcont_perusahaan['qty_subcont_perusahaan']),
                                'price_unit' => str_replace(',', '', $item_subcont_perusahaan['harga_subcont_perusahaan']),
                                'total' => str_replace(',', '', $item_subcont_perusahaan['total_subcont_perusahaan']),
                                'price_unit_budget' => str_replace(',', '', $item_subcont_perusahaan['harga_subcont_perusahaan_budget']),
                                'total_budget' => (str_replace(',', '', $item_subcont_perusahaan['total_subcont_perusahaan_budget'])),
                                'keterangan' => $item_subcont_perusahaan['keterangan_subcont_perusahaan'],
                                'input_by' => $this->auth->user_id(),
                                'input_date' => date('Y-m-d H:i:s')
                            ];
                        }

                        $insert_history_subcont_perusahaan = $this->db->insert_batch('kons_tr_penawaran_subcont_perusahaan_history', $arr_insert_history_subcont_perusahaan);
                        if (!$insert_history_subcont_perusahaan) {
                            print_r($this->db->error($insert_history_subcont_perusahaan));
                            exit;
                        }
                    }
                }
            }

            if ($this->db->trans_status() === false) {
                $this->db->trans_rollback();
                $valid = 0;
                $msg = 'Please try again later !';
            } else {
                $this->db->trans_commit();
                $valid = 1;
                $msg = 'Data has been successfully saved !';

                $this->Penawaran_model->history_penawaran($id_penawaran);
            }
        } else {
            $this->db->trans_rollback();
        }
        // print_r($this->db->last_query());
        // exit;

        echo json_encode([
            'status' => $valid,
            'msg' => $msg
        ]);
    }

    public function del_penawaran()
    {
        $id_penawaran = $this->input->post('id_penawaran');

        $this->db->trans_begin();

        $this->db->delete('kons_tr_penawaran_subcont_perusahaan', ['id_penawaran' => $id_penawaran]);
        $this->db->delete('kons_tr_penawaran_subcont_tenaga_ahli', ['id_penawaran' => $id_penawaran]);
        $this->db->delete('kons_tr_penawaran_others', ['id_penawaran' => $id_penawaran]);
        $this->db->delete('kons_tr_penawaran_aktifitas', ['id_penawaran' => $id_penawaran]);
        $this->db->delete('kons_tr_penawaran_akomodasi', ['id_penawaran' => $id_penawaran]);
        $this->db->delete('kons_tr_penawaran', ['id_quotation' => $id_penawaran]);

        if ($this->db->trans_status() === false) {
            $this->db->trans_rollback();
            $valid = 0;
            $msg = 'Please try again later !';
        } else {
            $this->db->trans_commit();
            $valid = 1;
            $msg = 'Data has been deleted !';
        }

        echo json_encode([
            'status' => $valid,
            'msg' => $msg
        ]);
    }

    public function update_penawaran()
    {
        $post = $this->input->post();

        $this->db->trans_begin();

        $id_penawaran = $post['id_penawaran'];

        $this->db->delete('kons_tr_penawaran_aktifitas', ['id_penawaran' => $post['id_penawaran']]);
        $this->db->delete('kons_tr_penawaran_akomodasi', ['id_penawaran' => $post['id_penawaran']]);
        $this->db->delete('kons_tr_penawaran_others', ['id_penawaran' => $post['id_penawaran']]);
        $this->db->delete('kons_tr_penawaran_lab', ['id_penawaran' => $post['id_penawaran']]);
        $this->db->delete('kons_tr_penawaran_subcont_tenaga_ahli', ['id_penawaran' => $post['id_penawaran']]);
        $this->db->delete('kons_tr_penawaran_subcont_perusahaan', ['id_penawaran' => $post['id_penawaran']]);

        $config['upload_path'] = './uploads/proposal_penawaran/';
        $config['allowed_types'] = '*';
        $config['remove_spaces'] = TRUE;
        $config['encrypt_name'] = TRUE;

        $filenames = '';
        $this->upload->initialize($config);
        if ($this->upload->do_upload('upload_proposal')) {
            $uploadData = $this->upload->data();
            $filenames = $uploadData['file_name'];
        }

        $config2['upload_path'] = './uploads/tahapan_penawaran/';
        $config2['allowed_types'] = '*';
        $config2['remove_spaces'] = TRUE;
        $config2['encrypt_name'] = TRUE;

        $filenames2 = '';
        $this->upload->initialize($config2);
        if ($this->upload->do_upload('upload_tahapan')) {
            $uploadData = $this->upload->data();
            $filenames2 = $uploadData['file_name'];
        }

        $config_po['upload_path'] = './uploads/po_penawaran/';
        $config_po['allowed_types'] = '*';
        $config_po['remove_spaces'] = TRUE;
        $config_po['encrypt_name'] = TRUE;

        $filenames_po = '';
        $this->upload->initialize($config_po);
        if ($this->upload->do_upload('upload_po')) {
            $uploadData_po = $this->upload->data();
            $filenames_po = $uploadData_po['file_name'];
        }


        $grand_total = $post['grand_total'];

        $ppn = 0;
        if (isset($post['include_ppn'])) {
            $ppn = 1;
        }

        $id_penawaran = $post['id_penawaran'];

        $tipe_info_awal = '';
        $detail_info_awal = '';

        if (isset($post['check_info_awal_sales'])) {
            $tipe_info_awal = 'Sales';
            $detail_info_awal = $post['informasi_awal_sales'];
        }
        if (isset($post['check_info_awal_medsos'])) {
            $tipe_info_awal = 'Medsos';
            $detail_info_awal = $post['informasi_awal_medsos'];
        }
        if (isset($post['check_info_awal_others'])) {
            $tipe_info_awal = 'Others';
            $detail_info_awal = $post['informasi_awal_others'];
        }

        $company = $post['company'];
        $nm_company = $post['nm_company'];

        $arr_insert = [
            'tgl_quotation' => $post['tgl_quotation'],
            'id_customer' => $post['customer'],
            'id_marketing' => $post['marketing'],
            'nm_pic' => $post['pic'],
            'address' => $post['address'],
            'id_paket' => $post['consultation_package'],
            'grand_total' => $grand_total,
            'ppn' => $ppn,
            'persen_disc' => str_replace(',', '', $post['persen_disc']),
            'nilai_disc' => str_replace(',', '', $post['nilai_disc']),
            'grand_total' => $post['grand_total'],
            'tipe_informasi_awal' => $tipe_info_awal,
            'detail_informasi_awal' => $detail_info_awal,
            'id_divisi' => $post['divisi'],
            'nm_divisi' => $post['nm_divisi'],
            'total_mandays' => $post['ttl_total_mandays'],
            'mandays_subcont' => $post['ttl_mandays_subcont'],
            'mandays_tandem' => $post['ttl_mandays_tandem'],
            'mandays_internal' => $post['ttl_total_mandays'],
            'mandays_rate' => $post['ttl_mandays_rate'],
            'sts_quot' => 1,
            'sts_deal' => null,
            'revisi' => ($post['revisi'] + 1),
            'company' => $company,
            'nm_company' => $nm_company,
            'updated_by' => $this->auth->user_id(),
            'updated_date' => date('Y-m-d H:i:s')
        ];

        if ($filenames !== '') {
            $arr_insert = array_merge($arr_insert, ['upload_proposal' => $filenames]);
        }
        if ($filenames2 !== '') {
            $arr_insert = array_merge($arr_insert, ['upload_tahapan' => $filenames2]);
        }
        if ($filenames_po !== '') {
            $arr_insert = array_merge($arr_insert, ['upload_po' => $filenames_po]);
        }

        $arr_insert_act = [];

        if (isset($post['dt_act'])) {
            foreach ($post['dt_act'] as $item_act) {
                $arr_insert_act[] = [
                    'id_penawaran' => $id_penawaran,
                    'id_aktifitas' => $item_act['nm_aktifitas'],
                    'mandays' => str_replace(',', '',  $item_act['mandays']),
                    'mandays_rate' => str_replace(',', '',  $item_act['mandays_rate']),
                    'mandays_subcont' => str_replace(',', '',  $item_act['mandays_subcont']),
                    'mandays_rate_subcont' => str_replace(',', '',  $item_act['mandays_rate_subcont']),
                    'mandays_tandem' => str_replace(',', '',  $item_act['mandays_tandem']),
                    'mandays_rate_tandem' => str_replace(',', '',  $item_act['mandays_rate_tandem']),
                    'harga_aktifitas' => str_replace(',', '',  $item_act['harga_aktifitas']),
                    'total_aktifitas' => str_replace(',', '',  $item_act['harga_aktifitas']),
                    'input_by' => $this->auth->user_id(),
                    'input_date' => date('Y-m-d H:i:s')
                ];
            }
        }

        $arr_insert_ako = [];
        if (isset($post['dt_ako'])) {
            foreach ($post['dt_ako'] as $item_ako) {
                $arr_insert_ako[] = [
                    'id_penawaran' => $id_penawaran,
                    'id_item' => $item_ako['id_akomodasi'],
                    'qty' => str_replace(',', '', $item_ako['qty_akomodasi']),
                    'price_unit' => str_replace(',', '', $item_ako['harga_akomodasi']),
                    'total' => str_replace(',', '', $item_ako['total_akomodasi']),
                    'keterangan' => $item_ako['keterangan_akomodasi'],
                    'input_by' => $this->auth->user_id(),
                    'input_date' => date('Y-m-d H:i:s')
                ];
            }
        }

        $arr_insert_oth = [];
        if (isset($post['dt_oth'])) {
            foreach ($post['dt_oth'] as $item_oth) {
                $arr_insert_oth[] = [
                    'id_penawaran' => $id_penawaran,
                    'id_item' => $item_oth['id_others'],
                    'qty' => str_replace(',', '', $item_oth['qty_others']),
                    'price_unit' => str_replace(',', '', $item_oth['harga_others']),
                    'total' => str_replace(',', '', $item_oth['total_others']),
                    'price_unit_budget' => str_replace(',', '', $item_oth['harga_others_budget']),
                    'total_budget' => str_replace(',', '', $item_oth['total_budget_others']),
                    'keterangan' => $item_oth['keterangan_others'],
                    'input_by' => $this->auth->user_id(),
                    'input_date' => date('Y-m-d H:i:s')
                ];
            }
        }

        $arr_insert_lab = [];
        if (isset($post['dt_lab'])) {
            foreach ($post['dt_lab'] as $item_lab) {
                $arr_insert_lab[] = [
                    'id_penawaran' => $id_penawaran,
                    'id_item' => $item_lab['id_lab'],
                    'qty' => str_replace(',', '', $item_lab['qty_lab']),
                    'price_unit' => str_replace(',', '', $item_lab['harga_lab']),
                    'total' => str_replace(',', '', $item_lab['total_lab']),
                    'price_unit_budget' => str_replace(',', '', $item_lab['harga_lab_budget']),
                    'total_budget' => str_replace(',', '', $item_lab['total_lab_budget']),
                    'keterangan' => $item_lab['keterangan_lab'],
                    'input_by' => $this->auth->user_id(),
                    'input_date' => date('Y-m-d H:i:s')
                ];
            }
        }

        $arr_insert_subcont_tenaga_ahli = [];
        if (isset($post['dt_subcont_tenaga_ahli'])) {
            foreach ($post['dt_subcont_tenaga_ahli'] as $item_subcont_tenaga_ahli) {
                $arr_insert_subcont_tenaga_ahli[] = [
                    'id_penawaran' => $id_penawaran,
                    'id_item' => $item_subcont_tenaga_ahli['id_subcont_tenaga_ahli'],
                    'qty' => str_replace(',', '', $item_subcont_tenaga_ahli['qty_subcont_tenaga_ahli']),
                    'price_unit' => str_replace(',', '', $item_subcont_tenaga_ahli['harga_subcont_tenaga_ahli']),
                    'total' => str_replace(',', '', $item_subcont_tenaga_ahli['total_subcont_tenaga_ahli']),
                    'price_unit_budget' => str_replace(',', '', $item_subcont_tenaga_ahli['harga_subcont_tenaga_ahli_budget']),
                    'total_budget' => str_replace(',', '', $item_subcont_tenaga_ahli['total_subcont_tenaga_ahli_budget']),
                    'keterangan' => $item_subcont_tenaga_ahli['keterangan_subcont_tenaga_ahli'],
                    'input_by' => $this->auth->user_id(),
                    'input_date' => date('Y-m-d H:i:s')
                ];
            }
        }

        $arr_insert_subcont_perusahaan = [];
        if (isset($post['dt_subcont_perusahaan'])) {
            foreach ($post['dt_subcont_perusahaan'] as $item_subcont_perusahaan) {
                $arr_insert_subcont_perusahaan[] = [
                    'id_penawaran' => $id_penawaran,
                    'id_item' => $item_subcont_perusahaan['id_subcont_perusahaan'],
                    'qty' => str_replace(',', '', $item_subcont_perusahaan['qty_subcont_perusahaan']),
                    'price_unit' => str_replace(',', '', $item_subcont_perusahaan['harga_subcont_perusahaan']),
                    'total' => str_replace(',', '', $item_subcont_perusahaan['total_subcont_perusahaan']),
                    'price_unit_budget' => str_replace(',', '', $item_subcont_perusahaan['harga_subcont_perusahaan_budget']),
                    'total_budget' => str_replace(',', '', $item_subcont_perusahaan['total_subcont_perusahaan_budget']),
                    'keterangan' => $item_subcont_perusahaan['keterangan_subcont_perusahaan'],
                    'input_by' => $this->auth->user_id(),
                    'input_date' => date('Y-m-d H:i:s')
                ];
            }
        }

        $id_history = $this->Penawaran_model->generate_history_id();

        $insert_penawaran = $this->db->update('kons_tr_penawaran', $arr_insert, ['id_quotation' => $id_penawaran]);
        if (!$insert_penawaran) {
            $this->db->trans_rollback();
            print_r('error_insert 1');
            print_r($this->db->last_query());
            exit;
        }
        $insert_penawaran_aktifitas = $this->db->insert_batch('kons_tr_penawaran_aktifitas', $arr_insert_act);
        if (!$insert_penawaran_aktifitas) {
            $this->db->trans_rollback();
            print_r('error_insert 2');
            print_r($this->db->error($insert_penawaran_aktifitas));
            exit;
        }

        if (!empty($arr_insert_ako)) {
            $insert_penawaran_akomodasi = $this->db->insert_batch('kons_tr_penawaran_akomodasi', $arr_insert_ako);
            if (!$insert_penawaran_akomodasi) {
                $this->db->trans_rollback();
                print_r('error_insert 3');
                print_r($this->db->error($insert_penawaran_aktifitas));
                exit;
            }
        }

        if (!empty($arr_insert_oth)) {
            $insert_penawaran_others = $this->db->insert_batch('kons_tr_penawaran_others', $arr_insert_oth);
            if (!$insert_penawaran_others) {
                $this->db->trans_rollback();
                print_r('error_insert 4');
                print_r($this->db->error($insert_penawaran_others));
                exit;
            }
        }

        if (!empty($arr_insert_lab)) {
            $insert_penawaran_lab = $this->db->insert_batch('kons_tr_penawaran_lab', $arr_insert_lab);
            if (!$insert_penawaran_lab) {
                $this->db->trans_rollback();
                print_r('error_insert 5');
                print_r($this->db->error($insert_penawaran_lab));
                exit;
            }
        }

        if (!empty($arr_insert_subcont_tenaga_ahli)) {
            $insert_penawaran_subcont_tenaga_ahli = $this->db->insert_batch('kons_tr_penawaran_subcont_tenaga_ahli', $arr_insert_subcont_tenaga_ahli);
            if (!$insert_penawaran_subcont_tenaga_ahli) {
                $this->db->trans_rollback();
                print_r('error_insert 6');
                print_r($this->db->error($insert_penawaran_subcont_tenaga_ahli));
                exit;
            }
        }

        if (!empty($arr_insert_subcont_perusahaan)) {
            $insert_penawaran_subcont_perusahaan = $this->db->insert_batch('kons_tr_penawaran_subcont_perusahaan', $arr_insert_subcont_perusahaan);
            if (!$insert_penawaran_subcont_perusahaan) {
                $this->db->trans_rollback();
                print_r('error_insert 7');
                print_r($this->db->error($insert_penawaran_subcont_perusahaan));
                exit;
            }
        }

        // print_r($this->db->last_query());
        // exit;

        if ($this->db->trans_status() === false) {
            $this->db->trans_rollback();
            $valid = 0;
            $msg = 'Please try again later !';
        } else {
            $this->db->trans_commit();
            $valid = 1;
            $msg = 'Data has been successfully saved !';

            $this->Penawaran_model->history_penawaran($id_penawaran);
        }

        echo json_encode([
            'status' => $valid,
            'msg' => $msg,
        ]);
    }

    public function deal_penawaran()
    {
        $id_penawaran = $this->input->post('id_penawaran');

        $this->db->trans_begin();

        $this->db->update('kons_tr_penawaran', ['sts_deal' => 1], ['id_quotation' => $id_penawaran]);

        if ($this->db->trans_status() === false) {
            $this->db->trans_rollback();
            $valid = 0;
            $msg = 'Please try again later !';
        } else {
            $this->db->trans_commit();
            $valid = 1;
            $msg = 'Quotation status has changed to Deal !';
        }

        echo json_encode([
            'status' => $valid,
            'msg' => $msg,
        ]);
    }

    public function get_list_def_akomodasi()
    {
        $this->db->select('a.*');
        $this->db->from('kons_master_biaya a');
        $this->db->where('a.tipe_biaya', 1);
        $get_data = $this->db->get()->result();

        $hasil = '';

        foreach ($get_data as $item) {
            $hasil .= '<option value="' . $item->id . '">' . $item->nm_biaya . '</option>';
        }

        echo json_encode([
            'hasil' => $hasil
        ]);
    }

    public function get_nm_divisi()
    {
        $post = $this->input->post();

        $id_divisi = $post['id_divisi'];

        $get_divisi = $this->db->get_where('ms_department', ['id' => $id_divisi])->row();

        $nm_divisi = (!empty($get_divisi)) ? $get_divisi->nama : '';

        echo json_encode([
            'nm_divisi' => $nm_divisi
        ]);
    }

    public function change_lab()
    {
        $id_lab = $this->input->post('id_lab');

        $get_lab = $this->db->get_where('kons_master_lab', array('id' => $id_lab))->row();

        $harga_ssc = (!empty($get_lab)) ? $get_lab->harga_ssc : 0;
        $harga_lab = (!empty($get_lab)) ? $get_lab->harga_lab : 0;

        echo json_encode([
            'harga_ssc' => $harga_ssc,
            'harga_lab' => $harga_lab
        ]);
    }

    public function check_sts_customer()
    {
        $cust = $this->input->post('cust');

        $get_penawaran_cust = $this->db->get_where('kons_tr_penawaran', array('id_customer' => $cust))->result();

        if (count($get_penawaran_cust) > 0) {
            $sts_cust = 1;
        } else {
            $sts_cust = 0;
        }

        echo json_encode([
            'sts_cust' => $sts_cust
        ]);
    }

    public function get_initials()
    {
        $sales = $this->input->post('sales');
        $get_sales = $this->dbhr->get_where('employees', ['id' => $sales])->row();

        $employee_code = '';
        if (!empty($get_sales)) {
            $employee_code = get_initials($get_sales->name);
        }

        echo json_encode([
            'initial_sales' => $employee_code
        ]);
    }

    public function get_company()
    {
        $company = $this->input->post('company');

        $get_company_nm = $this->db->get_where('kons_tr_company', ['id' => $company])->row();

        $nm_company = '';
        if (!empty($get_company_nm)) {
            $nm_company = $get_company_nm->nm_company;
        }

        echo json_encode([
            'company_nm' => $nm_company
        ]);
    }
}
