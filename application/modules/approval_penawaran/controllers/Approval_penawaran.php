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
class Approval_penawaran extends Admin_Controller
{
    //Permission
    protected $viewPermission     = 'Approval_penawaran.View';
    protected $addPermission      = 'Approval_penawaran.Add';
    protected $managePermission = 'Approval_penawaran.Manage';
    protected $deletePermission = 'Approval_penawaran.Delete';

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

        $this->template->title('Approval Quotation');
        $this->template->render('index');
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
        $this->db->where_in('a.company_id', ['COM003', 'COM006', 'COM012']);
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

    public function approval($id_penawaran)
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
        $this->db->where_in('a.company_id', ['COM003', 'COM006', 'COM012']);
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

        $this->template->title('Approval Quotation');
        $this->template->set($data);
        $this->template->render('approval_penawaran');
    }

    public function get_data_penawaran()
    {
        $draw = $this->input->post('draw');
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $search = $this->input->post('search');

        $this->db->select('a.*, c.name as nama_marketing');
        $this->db->from('kons_tr_penawaran a');
        $this->db->join('customer b', 'b.id_customer = a.id_customer', 'left');
        $this->db->join(DBHR . '.employees c', 'c.id = a.id_marketing', 'left');
        $this->db->join('kons_master_konsultasi_header d', 'd.id_konsultasi_h = a.id_paket', 'left');
        $this->db->where('a.deleted_by', null);
        $this->db->where('a.sts_quot', 1);
        $this->db->where('a.sts_deal', null);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.tgl_quotation', $search['value'], 'both');
            $this->db->or_like('a.id_quotation', $search['value'], 'both');
            $this->db->or_like('c.name', $search['value'], 'both');
            $this->db->or_like('d.nm_paket', $search['value'], 'both');
            $this->db->or_like('b.nm_customer', $search['value'], 'both');
            $this->db->or_like('a.grand_total', str_replace(',', '', $search['value']), 'both');
            $this->db->group_end();
        }
        $this->db->order_by('a.input_date', 'desc');
        $this->db->limit($length, $start);

        $get_data = $this->db->get();

        $this->db->select('a.*, c.name as nama_marketing');
        $this->db->from('kons_tr_penawaran a');
        $this->db->join('customer b', 'b.id_customer = a.id_customer', 'left');
        $this->db->join(DBHR . '.employees c', 'c.id = a.id_marketing', 'left');
        $this->db->join('kons_master_konsultasi_header d', 'd.id_konsultasi_h = a.id_paket', 'left');
        $this->db->where('a.deleted_by', null);
        $this->db->where('a.sts_quot', 1);
        $this->db->where('a.sts_deal', null);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.tgl_quotation', $search['value'], 'both');
            $this->db->or_like('a.id_quotation', $search['value'], 'both');
            $this->db->or_like('c.name', $search['value'], 'both');
            $this->db->or_like('d.nm_paket', $search['value'], 'both');
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
                        <a href="' . base_url('approval_penawaran/view_penawaran/' . urlencode(str_replace('/', '|', $item->id_quotation))) . '" class="btn btn-sm btn-info" style="color: #000000">
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
                        <a href="' . base_url('approval_penawaran/approval/' . urlencode(str_replace('/', '|', $item->id_quotation))) . '" class="btn btn-sm btn-success" style="color: #000000" >
                            <div class="col-12 dropdown-item">
                            <b>
                                <i class="fa fa-edit"></i>
                            </b>
                            </div>
                        </a>
                        <span style="font-weight: 500"> Approve </span>
                    </div>
                ';
            }

            $option .= '</div>';


            $get_marketing = $this->db->get_where('employee', ['id' => $item->id_marketing])->row();
            $nm_marketing = (!empty($get_marketing)) ? $get_marketing->nm_karyawan : '';

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
                'nm_marketing' => ucfirst($item->nama_marketing),
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
            'recordsTotal' => $get_data_all->num_rows(),
            'recordsFiltered' => $get_data_all->num_rows(),
            'data' => $hasil
        ]);
    }

    public function approve_penawaran()
    {
        $id_penawaran = $this->input->post('id_penawaran');

        $this->db->trans_begin();

        $update_sts_penawaran = $this->db->update('kons_tr_penawaran', ['sts_quot' => 2], ['id_quotation' => $id_penawaran]);

        if ($this->db->trans_status() === false) {
            $this->db->trans_rollback();
            $valid = 0;
            $pesan = "Please try again later !";
        } else {
            $this->db->trans_commit();
            $valid = 1;
            $pesan = "Data has been approved !";
        }

        echo json_encode([
            'status' => $valid,
            'pesan' => $pesan
        ]);
    }

    public function reject_penawaran()
    {
        $id_penawaran = $this->input->post('id_penawaran');
        $reject_reason = $this->input->post('reject_reason');

        $this->db->trans_begin();

        $update_sts_penawaran = $this->db->update('kons_tr_penawaran', ['sts_quot' => 0, 'reject_reason' => $reject_reason], ['id_quotation' => $id_penawaran]);

        if ($this->db->trans_status() === false) {
            $this->db->trans_rollback();
            $valid = 0;
            $pesan = "Please try again later !";
        } else {
            $this->db->trans_commit();
            $valid = 1;
            $pesan = "Data has been rejected !";
        }

        echo json_encode([
            'status' => $valid,
            'pesan' => $pesan
        ]);
    }
}
