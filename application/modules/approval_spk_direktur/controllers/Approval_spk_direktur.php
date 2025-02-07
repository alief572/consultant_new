<?php
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

$status = array();
class Approval_spk_direktur extends Admin_Controller
{
    //Permission
    protected $viewPermission     = 'Direktur.View';
    protected $addPermission      = 'Direktur.Add';
    protected $managePermission = 'Direktur.Manage';
    protected $deletePermission = 'Direktur.Delete';

    public function __construct()
    {
        parent::__construct();
        $this->template->title('Approval SPK Level 1');
        $this->template->page_icon('fa fa-cubes');
        $this->load->library('upload');
        // $this->load->model(array('Approval_spk_penawaran/Approval_spk_penawaran_model'));
        date_default_timezone_set('Asia/Bangkok');

        $this->is_admin = $this->auth->is_admin();
    }

    public function index()
    {
        $this->auth->restrict($this->viewPermission);
        $this->template->title('Approval SPK Direktur');
        $this->template->render('index');
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
        $this->db->order_by('a.name', 'asc');
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
            $this->db->select('a.id, a.name as nm_karyawan');
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

        $nilai_kontrak = 0;
        foreach ($get_aktifitas as $item_aktifitas) {
            $nilai_kontrak += $item_aktifitas->harga_aktifitas;
        }

        $this->db->select('a.*');
        $this->db->from('users a');
        $this->db->where('a.id_user', $this->auth->user_id());
        $get_user = $this->db->get()->row();

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
            'nilai_kontrak' => $nilai_kontrak,
            'data_user' => $get_user
        ];

        $this->auth->restrict($this->viewPermission);
        $this->template->title('View SPK Direktur');
        $this->template->set($data);
        $this->template->render('view_spk');
    }

    public function approval_spk($id_spk_penawaran)
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
        $this->db->order_by('a.name', 'asc');
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
            $this->db->select('a.id, a.name as nm_karyawan');
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

        $nilai_kontrak = 0;
        foreach ($get_aktifitas as $item_aktifitas) {
            $nilai_kontrak += $item_aktifitas->harga_aktifitas;
        }

        $this->db->select('a.*');
        $this->db->from('users a');
        $this->db->where('a.id_user', $this->auth->user_id());
        $get_user = $this->db->get()->row();

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
            'nilai_kontrak' => $nilai_kontrak,
            'data_user' => $get_user
        ];

        $this->auth->restrict($this->viewPermission);
        $this->template->title('Approval SPK Direktur');
        $this->template->set($data);
        $this->template->render('approval_spk');
    }

    public function get_data_spk()
    {
        $draw = $this->input->post('draw');
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $search = $this->input->post('search');

        $this->db->select('a.*');
        $this->db->from('users a');
        $this->db->where('a.id_user', $this->auth->user_id());
        $get_user = $this->db->get()->row();

        $this->db->select('a.*, b.grand_total');
        $this->db->from('kons_tr_spk_penawaran a');
        $this->db->join('kons_tr_penawaran b', 'b.id_quotation = a.id_penawaran', 'left');
        $this->db->where('a.deleted_by', null);
        $this->db->where('a.sts_spk', null);
        $this->db->where('a.approval_manager_sales', 1);

        $this->db->group_start();
        $this->db->like('a.id_spk_penawaran', $search['value'], 'both');
        $this->db->or_like('a.nm_sales', $search['value'], 'both');
        $this->db->or_like('a.nm_project', $search['value'], 'both');
        $this->db->or_like('a.nm_customer', $search['value'], 'both');
        $this->db->or_like('b.grand_total', $search['value'], 'both');
        $this->db->group_end();

        $this->db->order_by('a.input_date', 'desc');
        $this->db->limit($length, $start);

        $get_data = $this->db->get();

        $this->db->select('a.*, b.grand_total');
        $this->db->from('kons_tr_spk_penawaran a');
        $this->db->join('kons_tr_penawaran b', 'b.id_quotation = a.id_penawaran', 'left');
        $this->db->where('a.deleted_by', null);
        $this->db->where('a.sts_spk', null);
        $this->db->where('a.approval_manager_sales', 1);

        $this->db->group_start();
        $this->db->like('a.id_spk_penawaran', $search['value'], 'both');
        $this->db->or_like('a.nm_sales', $search['value'], 'both');
        $this->db->or_like('a.nm_project', $search['value'], 'both');
        $this->db->or_like('a.nm_customer', $search['value'], 'both');
        $this->db->or_like('b.grand_total', $search['value'], 'both');
        $this->db->group_end();

        $this->db->order_by('a.input_date', 'desc');

        $get_data_all = $this->db->get();

        // print_r($this->is_admin);
        // echo '<br><br>';
        // print_r($this->db->last_query());
        // exit;

        $hasil = [];

        $no = 1;
        foreach ($get_data->result() as $item) {

            $status = '<span class="btn btn-sm btn-success" style="width: 100% !important;">New</span>';
            $status_spk = '<span class="btn btn-sm btn-primary" style="width: 100% !important;">Waiting Approval</span>';

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
                $status_spk = '<span class="btn btn-sm btn-success" style="width: 100% !important;">Approved</span>';
            }
            if ($item->sts_spk == '0') {
                $status_spk = '<span class="btn btn-sm btn-danger" style="width: 100% !important;">Rejected</span>';
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
                        <a href="' . base_url('approval_spk_direktur/view_spk/' . urlencode(str_replace('/', '|', $item->id_spk_penawaran))) . '" class="btn btn-sm btn-info" style="color: #000000">
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

                $valid = 1;

                if ($valid == 1) {
                    $option .= '
                    <div class="col-12" style="margin-top: 0.5rem; margin-left: 0.5rem">
                        <a href="' . base_url('approval_spk_direktur/approval_spk/' . urlencode(str_replace('/', '|', $item->id_spk_penawaran))) . '" class="btn btn-sm btn-success" style="color: #000000">
                            <div class="col-12 dropdown-item">
                            <b>
                                <i class="fa fa-check"></i>
                            </b>
                            </div>
                        </a>
                        <span style="font-weight: 500"> Approval </span>
                    </div>
                ';
                }
            }
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
            'recordsTotal' => $get_data_all->num_rows(),
            'recordsFiltered' => $get_data_all->num_rows(),
            'data' => $hasil
        ]);
    }

    public function reject_spk()
    {
        $post = $this->input->post();

        $id_spk_penawaran = $post['id_spk_penawaran'];
        $reject_reason = $post['reject_reason'];

        $get_user = $this->db->get_where('users', array('id_user' => $this->auth->user_id()))->row();

        $get_spk = $this->db->get_where('kons_tr_spk_penawaran', array('id_spk_penawaran' => $id_spk_penawaran))->row();

        $this->db->trans_begin();

        $data_arr = [
            'reject_level2_by' => $this->auth->user_id(),
            'reject_level2_date' => date('Y-m-d H:i:s'),
            'reject_level2_reason' => $reject_reason,
            'approval_level2_sts' => null,
            'approval_level2_by' => null,
            'approval_level2_date' => null,
            'reject_reason' => $reject_reason
        ];

        $update_reject_spk = $this->db->update('kons_tr_spk_penawaran', $data_arr, ['id_spk_penawaran' => $id_spk_penawaran]);

        if ($this->db->trans_status() === false || empty($data_arr)) {
            $this->db->trans_rollback();
            $valid = 0;
            $pesan = 'Please try again later !';
        } else {
            $this->db->trans_commit();
            $valid = 1;
            $pesan = 'Data has been rejected !';
        }

        echo json_encode([
            'status' => $valid,
            'pesan' => $pesan
        ]);
    }

    public function approve_spk()
    {
        $post = $this->input->post();

        $id_spk_penawaran = $post['id_spk_penawaran'];

        $get_user = $this->db->get_where('users', array('id_user' => $this->auth->user_id()))->row();

        $get_spk = $this->db->get_where('kons_tr_spk_penawaran', array('id_spk_penawaran' => $id_spk_penawaran))->row();

        $this->db->trans_begin();

        $data_arr = [
            'reject_level2_by' => null,
            'reject_level2_date' => null,
            'reject_level2_reason' => null,
            'approval_level2_sts' => 1,
            'approval_level2_by' => $this->auth->user_id(),
            'approval_level2_date' => date('Y-m-d H:i:s'),
            'sts_spk' => 1
        ];

        $update_approve_spk = $this->db->update('kons_tr_spk_penawaran', $data_arr, ['id_spk_penawaran' => $id_spk_penawaran]);

        if ($this->db->trans_status() === false || empty($data_arr)) {
            $this->db->trans_rollback();
            $valid = 0;
            $pesan = 'Please try again later !';
        } else {
            $this->db->trans_commit();
            $valid = 1;
            $pesan = 'Data has been Approved !';
        }

        echo json_encode([
            'status' => $valid,
            'pesan' => $pesan
        ]);
    }
}
