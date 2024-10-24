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

    public function __construct()
    {
        parent::__construct();
        $this->template->title('Quotation');
        $this->template->page_icon('fa fa-cubes');
        $this->load->library('upload');
        date_default_timezone_set('Asia/Bangkok');
    }

    public function index()
    {
        $this->auth->restrict($this->viewPermission);

        $this->template->title('Quotation List');
        $this->template->render('index');
    }

    public function edit_penawaran($id_penawaran)
    {
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



        $this->db->select('a.*');
        $this->db->from('customer a');
        $this->db->where('a.nm_customer <>', '');
        $this->db->group_by('a.nm_customer');
        $get_customer = $this->db->get()->result();

        $this->db->select('a.*');
        $this->db->from('employee a');
        $this->db->where('a.deleted', 'N');
        $this->db->order_by('a.nm_karyawan', 'asc');
        $get_marketing = $this->db->get()->result();

        $this->db->select('a.*, b.nm_paket');
        $this->db->from('kons_master_konsultasi_header a');
        $this->db->join('kons_master_paket b', 'b.id_paket = a.id_paket', 'left');
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

        $data = [
            'list_penawaran' => $get_penawaran,
            'list_penawaran_aktifitas' => $get_penawaran_aktifitas,
            'list_penawaran_akomodasi' => $get_penawaran_akomodasi,
            'list_penawaran_others' => $get_penawaran_others,
            'list_customers' => $get_customer,
            'list_marketing' => $get_marketing,
            'list_package' => $get_package,
            'list_aktifitas' => $get_aktifitas,
            'list_def_akomodasi' => $get_def_biaya_akomodasi,
            'list_def_others' => $get_def_biaya_others
        ];

        $this->template->title('View Quotation');
        $this->template->set($data);
        $this->template->render('edit_penawaran');
    }

    public function view_penawaran($id_penawaran)
    {

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

        $this->db->select('a.*');
        $this->db->from('customer a');
        $this->db->where('a.nm_customer <>', '');
        $this->db->group_by('a.nm_customer');
        $get_customer = $this->db->get()->result();

        $this->db->select('a.*');
        $this->db->from('employee a');
        $this->db->where('a.deleted', 'N');
        $this->db->order_by('a.nm_karyawan', 'asc');
        $get_marketing = $this->db->get()->result();

        $this->db->select('a.*, b.nm_paket');
        $this->db->from('kons_master_konsultasi_header a');
        $this->db->join('kons_master_paket b', 'b.id_paket = a.id_paket', 'left');
        $get_package = $this->db->get()->result();

        $this->db->select('a.*');
        $this->db->from('kons_master_aktifitas a');
        $get_aktifitas = $this->db->get()->result();

        $data = [
            'list_penawaran' => $get_penawaran,
            'list_penawaran_aktifitas' => $get_penawaran_aktifitas,
            'list_penawaran_akomodasi' => $get_penawaran_akomodasi,
            'list_penawaran_others' => $get_penawaran_others,
            'list_customers' => $get_customer,
            'list_marketing' => $get_marketing,
            'list_package' => $get_package,
            'list_aktifitas' => $get_aktifitas
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

        $this->db->select('a.*');
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

        $get_data = $this->db->get();

        $hasil = [];

        $no = 1;
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
                        <a href="' . base_url('penawaran/view_penawaran/' . $item->id_quotation) . '" class="btn btn-sm btn-info" style="color: #000000">
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
                        <a href="' . base_url('penawaran/edit_penawaran/' . $item->id_quotation) . '" class="btn btn-sm btn-success" style="color: #000000">
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

            if ($this->managePermission && $item->sts_quot == '2' && ($item->sts_deal == null || $item->sts_deal == '')) {
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
                'nm_marketing' => ucfirst($nm_marketing),
                'nm_paket' => $nm_paket,
                'nm_customer' => $nm_customer,
                'grand_total' => number_format($item->grand_total),
                'status_cust' => $status_cust,
                'status_quot' => $status_quot,
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

    public function add_penawaran()
    {
        $this->auth->restrict($this->viewPermission);

        // $get_customer = $this->db->get_where('customers')->result();


        $this->db->select('a.*');
        $this->db->from('customer a');
        $this->db->where('a.nm_customer <>', '');
        $this->db->group_by('a.nm_customer');
        $get_customer = $this->db->get()->result();

        $this->db->select('a.*');
        $this->db->from('employee a');
        $this->db->where('a.deleted', 'N');
        $this->db->order_by('a.nm_karyawan', 'asc');
        $get_marketing = $this->db->get()->result();

        $this->db->select('a.*, b.nm_paket');
        $this->db->from('kons_master_konsultasi_header a');
        $this->db->join('kons_master_paket b', 'b.id_paket = a.id_paket', 'left');
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

        $data = [
            'list_customers' => $get_customer,
            'list_marketing' => $get_marketing,
            'list_package' => $get_package,
            'list_aktifitas' => $get_aktifitas,
            'list_def_akomodasi' => $get_def_biaya_akomodasi,
            'list_def_others' => $get_def_biaya_others
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

            $hasil .= '<td class="text-center">' . $no . '</td>';

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


            $hasil .= '</select>';
            $hasil .= '</td>';

            $hasil .= '<td class="text-center">';
            $hasil .= '<input type="text" class="form-control form-control-sm auto_num text-right input_mandays_' . $no . '" name="dt_act[' . $no . '][mandays]" value="' . $item->mandays . '" onchange="hitung_total_activity()">';
            $hasil .= '</td>';

            $hasil .= '<td class="text-center">';
            $hasil .= '<input type="text" class="form-control form-control-sm auto_num text-right input_mandays_rate_' . $no . '" name="dt_act[' . $no . '][mandays_rate]" value="' . $item->harga_aktifitas . '" onchange="hitung_total_activity()">';
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
            $hasil .= '<input type="text" class="form-control form-control-sm auto_num text-right input_harga_aktifitas_' . $no . '" name="dt_act[' . $no . '][harga_aktifitas]" value="' . ($item->harga_aktifitas * $item->mandays) . '" onchange="hitung_total_activity()" readonly>';
            $hasil .= '</td>';

            $hasil .= '<td class="text-center">';
            $hasil .= '<button type="button" class="btn btn-sm btn-danger del_aktifitas" data-no="' . $no . '"><i class="fa fa-trash"></i></button>';
            $hasil .= '</td>';

            $hasil .= '</tr>';

            $no++;

            $ttl_mandays += $item->mandays;
            $ttl_mandays_rate += $item->harga_aktifitas;
            $ttl_price += ($item->harga_aktifitas * $item->mandays);
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

        $config['upload_path'] = './uploads/proposal_penawaran/';
        $config['allowed_types'] = '*';
        $config['remove_spaces'] = TRUE;
        $config['encrypt_name'] = TRUE;

        $filenames = '';
        $this->upload->initialize($config);
        if ($this->upload->do_upload('upload_proposal')) {
            $uploadData = $this->upload->data();
            $filenames = $uploadData['file_name'];
        } else {
            print_r($this->upload->display_errors());
            exit;
        }

        $check_order = $this->db->get_where('kons_tr_penawaran', ['id_customer' => $post['customer']])->num_rows();
        if ($check_order > 0) {
            $sts_cust = 1;
        } else {
            $sts_cust = 0;
        }

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

        $id_penawaran = generateNoPenawaran();

        $arr_insert = [
            'id_quotation' => $id_penawaran,
            'tgl_quotation' => $post['tgl_quotation'],
            'id_customer' => $post['customer'],
            'id_marketing' => $post['marketing'],
            'nm_pic' => $post['pic'],
            'address' => $post['address'],
            'id_paket' => $post['consultation_package'],
            'upload_proposal' => $filenames,
            'sts_cust' => $sts_cust,
            'sts_quot' => 1,
            'grand_total' => $grand_total,
            'ppn' => $ppn,
            'persen_disc' => str_replace(',', '', $post['persen_disc']),
            'nilai_disc' => str_replace(',', '', $post['nilai_disc']),
            'tipe_informasi_awal' => $tipe_info_awal,
            'detail_informasi_awal' => $detail_info_awal,
            'input_by' => $this->auth->user_id(),
            'input_date' => date('Y-m-d H:i:s')
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
                    'keterangan' => $item_oth['keterangan_others'],
                    'input_by' => $this->auth->user_id(),
                    'input_date' => date('Y-m-d H:i:s')
                ];
            }
        }

        $insert_penawaran = $this->db->insert('kons_tr_penawaran', $arr_insert);
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
        }

        echo json_encode([
            'status' => $valid,
            'msg' => $msg
        ]);
    }

    public function del_penawaran()
    {
        $id_penawaran = $this->input->post('id_penawaran');

        $this->db->trans_begin();

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

        $this->db->delete('kons_tr_penawaran_aktifitas', ['id_penawaran' => $post['id_penawaran']]);
        $this->db->delete('kons_tr_penawaran_akomodasi', ['id_penawaran' => $post['id_penawaran']]);
        $this->db->delete('kons_tr_penawaran_others', ['id_penawaran' => $post['id_penawaran']]);

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

        if ($filenames == '') {
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
                'sts_quot' => 1,
                'sts_deal' => null,
                'updated_by' => $this->auth->user_id(),
                'updated_date' => date('Y-m-d H:i:s')
            ];
        } else {
            $arr_insert = [
                'tgl_quotation' => $post['tgl_quotation'],
                'id_customer' => $post['customer'],
                'id_marketing' => $post['marketing'],
                'nm_pic' => $post['pic'],
                'address' => $post['address'],
                'id_paket' => $post['consultation_package'],
                'upload_proposal' => $filenames,
                'grand_total' => $grand_total,
                'ppn' => $ppn,
                'persen_disc' => str_replace(',', '', $post['persen_disc']),
                'nilai_disc' => str_replace(',', '', $post['nilai_disc']),
                'tipe_informasi_awal' => $tipe_info_awal,
                'detail_informasi_awal' => $detail_info_awal,
                'updated_by' => $this->auth->user_id(),
                'updated_date' => date('Y-m-d H:i:s')
            ];
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
                    'keterangan' => $item_oth['keterangan_others'],
                    'input_by' => $this->auth->user_id(),
                    'input_date' => date('Y-m-d H:i:s')
                ];
            }
        }

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
}
