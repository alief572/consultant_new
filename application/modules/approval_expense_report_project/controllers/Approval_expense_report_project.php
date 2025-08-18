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
class Approval_expense_report_project extends Admin_Controller
{
    //Permission
    protected $viewPermission     = 'Approval_Expense_Report_Project.View';
    protected $addPermission      = 'Approval_Expense_Report_Project.Add';
    protected $managePermission = 'Approval_Expense_Report_Project.Manage';
    protected $deletePermission = 'Approval_Expense_Report_Project.Delete';

    protected $otherdb;

    public function __construct()
    {
        parent::__construct();
        $this->template->title('Expense Report Project');
        $this->template->page_icon('fa fa-cubes');
        $this->load->library('upload');
        $this->load->model(array('Approval_expense_report_project/Approval_expense_report_project_model'));
        date_default_timezone_set('Asia/Bangkok');

        $this->otherdb = $this->load->database('sendigs_finance', TRUE);
    }

    // View Page Function

    public function index()
    {
        $this->auth->restrict($this->viewPermission);
        $this->template->title('Approval Expense Report Project');
        $this->template->render('index');
    }

    public function req_app($id_header)
    {
        $id_header = urldecode($id_header);
        $id_header = str_replace('|', '/', $id_header);

        $this->db->select('a.*');
        $this->db->from('kons_tr_expense_report_project_header a');
        $this->db->where('a.id_header', $id_header);
        $get_header = $this->db->get()->row();

        $this->db->select('a.*');
        $this->db->from('kons_tr_expense_report_bukti_pengembalian a');
        $this->db->where('a.id_header_expense', $get_header->id);
        $get_bukti_pengembalian = $this->db->get()->result();

        $this->db->select('a.*');
        $this->db->from('kons_tr_bukti_penggunaan_expense a');
        $this->db->where('a.id_header_expense', $get_header->id);
        $get_bukti_penggunaan = $this->db->get()->result();

        $get_kasbon_header = $this->db->get_where('kons_tr_kasbon_project_header a', ['a.id' => $id_header])->row();

        $datalist_item = [];
        $datalist_item_expense = [];

        if ($get_kasbon_header->tipe == 1) {
            $this->db->select('a.*');
            $this->db->from('kons_tr_spk_budgeting_aktifitas a');
            $this->db->where('a.id_spk_budgeting', $get_kasbon_header->id_spk_budgeting);
            $this->db->order_by('a.id_aktifitas', 'asc');
            $get_list_subcont = $this->db->get()->result();

            $no = 0;
            foreach ($get_list_subcont as $item) {
                $no++;

                $qty_kasbon = 0;
                $nominal_kasbon = 0;
                $total_kasbon = 0;

                $this->db->select('a.*');
                $this->db->from('kons_tr_kasbon_project_subcont a');
                $this->db->where('a.id_header', $id_header);
                $this->db->where('a.id_aktifitas', $item->id_aktifitas);
                $get_kasbon = $this->db->get()->row();
                if (!empty($get_kasbon)) {
                    $qty_kasbon = $get_kasbon->qty_pengajuan;
                    $nominal_kasbon = $get_kasbon->nominal_pengajuan;
                    $total_kasbon = $get_kasbon->total_pengajuan;
                }

                $datalist_item[] = [
                    'no' => $no,
                    'id_detail_kasbon' => $item->id,
                    'nm_item' => $item->nm_aktifitas,
                    'qty_kasbon' => $qty_kasbon,
                    'nominal_kasbon' => $nominal_kasbon,
                    'total_kasbon' => $total_kasbon
                ];
            }

            $this->db->select('a.*');
            $this->db->from('kons_tr_expense_report_project_detail a');
            $this->db->where('a.id_header_kasbon', $id_header);
            $get_expense_detail = $this->db->get()->result();

            $no = 1;
            foreach ($get_expense_detail as $item) {
                $qty_expense = ($item->qty_expense >= 1) ? $item->qty_expense : 1;
                $datalist_item_expense[$item->id_detail_kasbon] = [
                    'id' => $item->id,
                    'id_detail_kasbon' => $item->id_detail_kasbon,
                    'tipe' => $item->tipe,
                    'qty_expense' => $item->qty_expense,
                    'nominal_expense' => $item->nominal_expense,
                    'keterangan' => $item->keterangan,
                    'total_expense' => ($qty_expense * $item->nominal_expense)
                ];
            }
        }

        if ($get_kasbon_header->tipe == 2) {
            $this->db->select('a.*, b.nm_biaya');
            $this->db->from('kons_tr_spk_budgeting_akomodasi a');
            $this->db->join('kons_master_biaya b', 'b.id = a.id_item', 'left');
            $this->db->where('a.id_spk_budgeting', $get_kasbon_header->id_spk_budgeting);
            $this->db->order_by('a.id_item', 'asc');
            $get_list_akomodasi = $this->db->get()->result();

            $no = 0;
            foreach ($get_list_akomodasi as $item) {
                $no++;

                $qty_kasbon = 0;
                $nominal_kasbon = 0;
                $total_kasbon = 0;

                $this->db->select('a.*');
                $this->db->from('kons_tr_kasbon_project_akomodasi a');
                $this->db->where('a.id_header', $id_header);
                $this->db->where('a.id_akomodasi', $item->id_akomodasi);
                $get_kasbon = $this->db->get()->row();
                if (!empty($get_kasbon)) {
                    $qty_kasbon = $get_kasbon->qty_pengajuan;
                    $nominal_kasbon = $get_kasbon->nominal_pengajuan;
                    $total_kasbon = $get_kasbon->total_pengajuan;
                }

                $datalist_item[] = [
                    'no' => $no,
                    'id_detail_kasbon' => $item->id,
                    'nm_item' => $item->nm_biaya,
                    'qty_kasbon' => $qty_kasbon,
                    'nominal_kasbon' => $nominal_kasbon,
                    'total_kasbon' => $total_kasbon
                ];
            }

            $this->db->select('a.*');
            $this->db->from('kons_tr_expense_report_project_detail a');
            $this->db->where('a.id_header_kasbon', $id_header);
            $get_expense_detail = $this->db->get()->result();

            $no = 1;
            foreach ($get_expense_detail as $item) {
                $qty_expense = ($item->qty_expense >= 1) ? $item->qty_expense : 1;
                $datalist_item_expense[$item->id_detail_kasbon] = [
                    'id' => $item->id,
                    'id_detail_kasbon' => $item->id_detail_kasbon,
                    'tipe' => $item->tipe,
                    'qty_expense' => $item->qty_expense,
                    'nominal_expense' => $item->nominal_expense,
                    'keterangan' => $item->keterangan,
                    'total_expense' => ($qty_expense * $item->nominal_expense)
                ];
            }
        }

        if ($get_kasbon_header->tipe == 3) {
            $this->db->select('a.*, b.nm_biaya');
            $this->db->from('kons_tr_spk_budgeting_others a');
            $this->db->join('kons_master_biaya b', 'b.id = a.id_item', 'left');
            $this->db->where('a.id_spk_budgeting', $get_kasbon_header->id_spk_budgeting);
            $this->db->order_by('a.id_item', 'asc');
            $get_list_others = $this->db->get()->result();

            $no = 0;
            foreach ($get_list_others as $item) {
                $no++;

                $qty_kasbon = 0;
                $nominal_kasbon = 0;
                $total_kasbon = 0;

                $this->db->select('a.*');
                $this->db->from('kons_tr_kasbon_project_others a');
                $this->db->where('a.id_header', $id_header);
                $this->db->where('a.id_others', $item->id_others);
                $get_kasbon = $this->db->get()->row();
                if (!empty($get_kasbon)) {
                    $qty_kasbon = $get_kasbon->qty_pengajuan;
                    $nominal_kasbon = $get_kasbon->nominal_pengajuan;
                    $total_kasbon = $get_kasbon->total_pengajuan;
                }

                $datalist_item[] = [
                    'no' => $no,
                    'id_detail_kasbon' => $item->id,
                    'nm_item' => $item->nm_biaya,
                    'qty_kasbon' => $qty_kasbon,
                    'nominal_kasbon' => $nominal_kasbon,
                    'total_kasbon' => $total_kasbon
                ];
            }

            $this->db->select('a.*');
            $this->db->from('kons_tr_expense_report_project_detail a');
            $this->db->where('a.id_header_kasbon', $id_header);
            $get_expense_detail = $this->db->get()->result();

            $no = 1;
            foreach ($get_expense_detail as $item) {
                $qty_expense = ($item->qty_expense >= 1) ? $item->qty_expense : 1;
                $datalist_item_expense[$item->id_detail_kasbon] = [
                    'id' => $item->id,
                    'id_detail_kasbon' => $item->id_detail_kasbon,
                    'tipe' => $item->tipe,
                    'qty_expense' => $item->qty_expense,
                    'nominal_expense' => $item->nominal_expense,
                    'keterangan' => $item->keterangan,
                    'total_expense' => ($qty_expense * $item->nominal_expense)
                ];
            }
        }

        if ($get_kasbon_header->tipe == 4) {
            $this->db->select('a.*, b.isu_lingkungan as nm_biaya');
            $this->db->from('kons_tr_spk_budgeting_lab a');
            $this->db->join('kons_master_lab b', 'b.id = a.id_item', 'left');
            $this->db->where('a.id_spk_budgeting', $get_kasbon_header->id_spk_budgeting);
            $this->db->order_by('a.id_item', 'asc');
            $get_list_lab = $this->db->get()->result();

            $no = 0;
            foreach ($get_list_lab as $item) {
                $no++;

                $qty_kasbon = 0;
                $nominal_kasbon = 0;
                $total_kasbon = 0;

                $this->db->select('a.*');
                $this->db->from('kons_tr_kasbon_project_lab a');
                $this->db->where('a.id_header', $id_header);
                $this->db->where('a.id_lab', $item->id_lab);
                $get_kasbon = $this->db->get()->row();
                if (!empty($get_kasbon)) {
                    $qty_kasbon = $get_kasbon->qty_pengajuan;
                    $nominal_kasbon = $get_kasbon->nominal_pengajuan;
                    $total_kasbon = $get_kasbon->total_pengajuan;
                }

                $datalist_item[] = [
                    'no' => $no,
                    'id_detail_kasbon' => $item->id,
                    'nm_item' => $item->nm_biaya,
                    'qty_kasbon' => $qty_kasbon,
                    'nominal_kasbon' => $nominal_kasbon,
                    'total_kasbon' => $total_kasbon
                ];
            }

            $this->db->select('a.*');
            $this->db->from('kons_tr_expense_report_project_detail a');
            $this->db->where('a.id_header_kasbon', $id_header);
            $get_expense_detail = $this->db->get()->result();

            $no = 1;
            foreach ($get_expense_detail as $item) {
                $qty_expense = ($item->qty_expense >= 1) ? $item->qty_expense : 1;
                $datalist_item_expense[$item->id_detail_kasbon] = [
                    'id' => $item->id,
                    'id_detail_kasbon' => $item->id_detail_kasbon,
                    'tipe' => $item->tipe,
                    'qty_expense' => $item->qty_expense,
                    'nominal_expense' => $item->nominal_expense,
                    'keterangan' => $item->keterangan,
                    'total_expense' => ($qty_expense * $item->nominal_expense)
                ];
            }
        }

        if ($get_kasbon_header->tipe == 5) {
            $this->db->select('a.*, b.nm_biaya as nm_biaya');
            $this->db->from('kons_tr_spk_budgeting_subcont_tenaga_ahli a');
            $this->db->join('kons_master_tenaga_ahli b', 'b.id = a.id_item', 'left');
            $this->db->where('a.id_spk_budgeting', $get_kasbon_header->id_spk_budgeting);
            $this->db->order_by('a.id_item', 'asc');
            $get_list_subcont_tenaga_ahli = $this->db->get()->result();

            $no = 0;
            foreach ($get_list_subcont_tenaga_ahli as $item) {
                $no++;

                $qty_kasbon = 0;
                $nominal_kasbon = 0;
                $total_kasbon = 0;

                $this->db->select('a.*');
                $this->db->from('kons_tr_kasbon_project_subcont_tenaga_ahli a');
                $this->db->where('a.id_header', $id_header);
                $this->db->where('a.id_subcont', $item->id_subcont);
                $get_kasbon = $this->db->get()->row();
                if (!empty($get_kasbon)) {
                    $qty_kasbon = $get_kasbon->qty_pengajuan;
                    $nominal_kasbon = $get_kasbon->nominal_pengajuan;
                    $total_kasbon = $get_kasbon->total_pengajuan;
                }

                $datalist_item[] = [
                    'no' => $no,
                    'id_detail_kasbon' => $item->id,
                    'nm_item' => $item->nm_biaya,
                    'qty_kasbon' => $qty_kasbon,
                    'nominal_kasbon' => $nominal_kasbon,
                    'total_kasbon' => $total_kasbon
                ];
            }

            $this->db->select('a.*');
            $this->db->from('kons_tr_expense_report_project_detail a');
            $this->db->where('a.id_header_kasbon', $id_header);
            $get_expense_detail = $this->db->get()->result();

            $no = 1;
            foreach ($get_expense_detail as $item) {
                $qty_expense = ($item->qty_expense >= 1) ? $item->qty_expense : 1;
                $datalist_item_expense[$item->id_detail_kasbon] = [
                    'id' => $item->id,
                    'id_detail_kasbon' => $item->id_detail_kasbon,
                    'tipe' => $item->tipe,
                    'qty_expense' => $item->qty_expense,
                    'nominal_expense' => $item->nominal_expense,
                    'keterangan' => $item->keterangan,
                    'total_expense' => ($qty_expense * $item->nominal_expense)
                ];
            }
        }

        if ($get_kasbon_header->tipe == 6) {
            $this->db->select('a.*, b.nm_biaya as nm_biaya');
            $this->db->from('kons_tr_spk_budgeting_subcont_perusahaan a');
            $this->db->join('kons_master_subcont_perusahaan b', 'b.id = a.id_item', 'left');
            $this->db->where('a.id_spk_budgeting', $get_kasbon_header->id_spk_budgeting);
            $this->db->order_by('a.id_item', 'asc');
            $get_list_subcont_perusahaan = $this->db->get()->result();

            $no = 0;
            foreach ($get_list_subcont_perusahaan as $item) {
                $no++;

                $qty_kasbon = 0;
                $nominal_kasbon = 0;
                $total_kasbon = 0;

                $this->db->select('a.*');
                $this->db->from('kons_tr_kasbon_project_subcont_perusahaan a');
                $this->db->where('a.id_header', $id_header);
                $this->db->where('a.id_subcont', $item->id_subcont);
                $get_kasbon = $this->db->get()->row();
                if (!empty($get_kasbon)) {
                    $qty_kasbon = $get_kasbon->qty_pengajuan;
                    $nominal_kasbon = $get_kasbon->nominal_pengajuan;
                    $total_kasbon = $get_kasbon->total_pengajuan;
                }

                $datalist_item[] = [
                    'no' => $no,
                    'id_detail_kasbon' => $item->id,
                    'nm_item' => $item->nm_biaya,
                    'qty_kasbon' => $qty_kasbon,
                    'nominal_kasbon' => $nominal_kasbon,
                    'total_kasbon' => $total_kasbon
                ];
            }

            $this->db->select('a.*');
            $this->db->from('kons_tr_expense_report_project_detail a');
            $this->db->where('a.id_header_kasbon', $id_header);
            $get_expense_detail = $this->db->get()->result();

            $no = 1;
            foreach ($get_expense_detail as $item) {
                $qty_expense = ($item->qty_expense >= 1) ? $item->qty_expense : 1;
                $datalist_item_expense[$item->id_detail_kasbon] = [
                    'id' => $item->id,
                    'id_detail_kasbon' => $item->id_detail_kasbon,
                    'tipe' => $item->tipe,
                    'qty_expense' => $item->qty_expense,
                    'nominal_expense' => $item->nominal_expense,
                    'keterangan' => $item->keterangan,
                    'total_expense' => ($qty_expense * $item->nominal_expense)
                ];
            }
        }

        $data = [
            'header' => $get_header,
            'list_bukti_pengembalian' => $get_bukti_pengembalian,
            'list_bukti_penggunaan' => $get_bukti_penggunaan,
            'datalist_item' => $datalist_item,
            'datalist_item_expense' => $datalist_item_expense,
            'id_spk_budgeting' => $get_kasbon_header->id_spk_budgeting,
            'id_header' => $id_header,
            'id_spk_penawaran' => $get_kasbon_header->id_spk_penawaran,
            'id_penawaran' => $get_kasbon_header->id_penawaran,
            'tipe' => $get_kasbon_header->tipe
        ];

        $this->template->set($data);
        $this->template->render('request_approval');
    }

    public function add_expense_subcont($id_header)
    {
        $id_header = urldecode($id_header);
        $id_header = str_replace('|', '/', $id_header);

        $get_kasbon_header = $this->db->get_where('kons_tr_kasbon_project_header a', ['a.id' => $id_header])->row();

        $datalist_item = [];

        if ($get_kasbon_header->tipe == 1) {
            $this->db->select('a.*');
            $this->db->from('kons_tr_spk_budgeting_aktifitas a');
            $this->db->where('a.id_spk_budgeting', $get_kasbon_header->id_spk_budgeting);
            $this->db->order_by('a.id_aktifitas', 'asc');
            $get_list_subcont = $this->db->get()->result();

            $no = 0;
            foreach ($get_list_subcont as $item) {
                $no++;

                $qty_kasbon = 0;
                $nominal_kasbon = 0;

                $this->db->select('a.*');
                $this->db->from('kons_tr_kasbon_project_subcont a');
                $this->db->where('a.id_header', $id_header);
                $this->db->where('a.id_aktifitas', $item->id_aktifitas);
                $get_kasbon = $this->db->get()->row();
                if (!empty($get_kasbon)) {
                    $qty_kasbon = $get_kasbon->qty_pengajuan;
                    $nominal_kasbon = $get_kasbon->nominal_pengajuan;
                }

                $datalist_item[] = [
                    'no' => $no,
                    'id_detail_kasbon' => $item->id,
                    'nm_item' => $item->nm_aktifitas,
                    'qty_kasbon' => $qty_kasbon,
                    'nominal_kasbon' => $nominal_kasbon
                ];
            }
        }

        if ($get_kasbon_header->tipe == 2) {
            $this->db->select('a.*, b.nm_biaya');
            $this->db->from('kons_tr_spk_budgeting_akomodasi a');
            $this->db->join('kons_master_biaya b', 'b.id = a.id_item', 'left');
            $this->db->where('a.id_spk_budgeting', $get_kasbon_header->id_spk_budgeting);
            $this->db->order_by('a.id_item', 'asc');
            $get_list_akomodasi = $this->db->get()->result();

            $no = 0;
            foreach ($get_list_akomodasi as $item) {
                $no++;

                $qty_kasbon = 0;
                $nominal_kasbon = 0;

                $this->db->select('a.*');
                $this->db->from('kons_tr_kasbon_project_akomodasi a');
                $this->db->where('a.id_header', $id_header);
                $this->db->where('a.id_item', $item->id_item);
                $get_kasbon = $this->db->get()->row();
                if (!empty($get_kasbon)) {
                    $qty_kasbon = $get_kasbon->qty_pengajuan;
                    $nominal_kasbon = $get_kasbon->nominal_pengajuan;
                }

                $datalist_item[] = [
                    'no' => $no,
                    'id_detail_kasbon' => $item->id,
                    'nm_item' => $item->nm_biaya,
                    'qty_kasbon' => $qty_kasbon,
                    'nominal_kasbon' => $nominal_kasbon
                ];
            }
        }

        if ($get_kasbon_header->tipe == 3) {
            $this->db->select('a.*, b.nm_biaya');
            $this->db->from('kons_tr_spk_budgeting_others a');
            $this->db->join('kons_master_biaya b', 'b.id = a.id_item', 'left');
            $this->db->where('a.id_spk_budgeting', $get_kasbon_header->id_spk_budgeting);
            $this->db->order_by('a.id_item', 'asc');
            $get_list_others = $this->db->get()->result();

            $no = 0;
            foreach ($get_list_others as $item) {
                $no++;

                $qty_kasbon = 0;
                $nominal_kasbon = 0;

                $this->db->select('a.*');
                $this->db->from('kons_tr_kasbon_project_others a');
                $this->db->where('a.id_header', $id_header);
                $this->db->where('a.id_item', $item->id_item);
                $get_kasbon = $this->db->get()->row();
                if (!empty($get_kasbon)) {
                    $qty_kasbon = $get_kasbon->qty_pengajuan;
                    $nominal_kasbon = $get_kasbon->nominal_pengajuan;
                }

                $datalist_item[] = [
                    'no' => $no,
                    'id_detail_kasbon' => $item->id,
                    'nm_item' => $item->nm_biaya,
                    'qty_kasbon' => $qty_kasbon,
                    'nominal_kasbon' => $nominal_kasbon
                ];
            }
        }

        $data = [
            'datalist_item' => $datalist_item,
            'id_spk_budgeting' => $get_kasbon_header->id_spk_budgeting,
            'id_header' => $id_header,
            'id_spk_penawaran' => $get_kasbon_header->id_spk_penawaran,
            'id_penawaran' => $get_kasbon_header->id_penawaran,
            'tipe' => $get_kasbon_header->tipe
        ];

        $this->template->set($data);
        $this->template->render('add_expense_subcont');
    }

    public function edit_expense_subcont($id_header)
    {
        $id_header = urldecode($id_header);
        $id_header = str_replace('|', '/', $id_header);

        $this->db->select('a.*');
        $this->db->from('kons_tr_expense_report_project_header a');
        $this->db->where('a.id_header', $id_header);
        $get_header = $this->db->get()->row();

        $this->db->select('a.*');
        $this->db->from('kons_tr_expense_report_bukti_pengembalian a');
        $this->db->where('a.id_header_expense', $get_header->id);
        $get_bukti_pengembalian = $this->db->get()->result();

        $get_kasbon_header = $this->db->get_where('kons_tr_kasbon_project_header a', ['a.id' => $id_header])->row();

        $datalist_item = [];
        $datalist_item_expense = [];

        if ($get_kasbon_header->tipe == 1) {
            $this->db->select('a.*');
            $this->db->from('kons_tr_spk_budgeting_aktifitas a');
            $this->db->where('a.id_spk_budgeting', $get_kasbon_header->id_spk_budgeting);
            $this->db->order_by('a.id_aktifitas', 'asc');
            $get_list_subcont = $this->db->get()->result();

            $no = 0;
            foreach ($get_list_subcont as $item) {
                $no++;

                $qty_kasbon = 0;
                $nominal_kasbon = 0;

                $this->db->select('a.*');
                $this->db->from('kons_tr_kasbon_project_subcont a');
                $this->db->where('a.id_header', $id_header);
                $this->db->where('a.id_aktifitas', $item->id_aktifitas);
                $get_kasbon = $this->db->get()->row();
                if (!empty($get_kasbon)) {
                    $qty_kasbon = $get_kasbon->qty_pengajuan;
                    $nominal_kasbon = $get_kasbon->nominal_pengajuan;
                }

                $datalist_item[] = [
                    'no' => $no,
                    'id_detail_kasbon' => $item->id,
                    'nm_item' => $item->nm_aktifitas,
                    'qty_kasbon' => $qty_kasbon,
                    'nominal_kasbon' => $nominal_kasbon
                ];
            }

            $this->db->select('a.*');
            $this->db->from('kons_tr_expense_report_project_detail a');
            $this->db->where('a.id_header_kasbon', $id_header);
            $get_expense_detail = $this->db->get()->result();

            $no = 1;
            foreach ($get_expense_detail as $item) {
                $datalist_item_expense[$item->id_detail_kasbon] = [
                    'id' => $item->id,
                    'id_detail_kasbon' => $item->id_detail_kasbon,
                    'tipe' => $item->tipe,
                    'qty_expense' => $item->qty_expense,
                    'nominal_expense' => $item->nominal_expense
                ];
            }
        }

        if ($get_kasbon_header->tipe == 2) {
            $this->db->select('a.*, b.nm_biaya');
            $this->db->from('kons_tr_spk_budgeting_akomodasi a');
            $this->db->join('kons_master_biaya b', 'b.id = a.id_item', 'left');
            $this->db->where('a.id_spk_budgeting', $get_kasbon_header->id_spk_budgeting);
            $this->db->order_by('a.id_item', 'asc');
            $get_list_akomodasi = $this->db->get()->result();

            $no = 0;
            foreach ($get_list_akomodasi as $item) {
                $no++;

                $qty_kasbon = 0;
                $nominal_kasbon = 0;

                $this->db->select('a.*');
                $this->db->from('kons_tr_kasbon_project_akomodasi a');
                $this->db->where('a.id_header', $id_header);
                $this->db->where('a.id_item', $item->id_item);
                $get_kasbon = $this->db->get()->row();
                if (!empty($get_kasbon)) {
                    $qty_kasbon = $get_kasbon->qty_pengajuan;
                    $nominal_kasbon = $get_kasbon->nominal_pengajuan;
                }

                $datalist_item[] = [
                    'no' => $no,
                    'id_detail_kasbon' => $item->id,
                    'nm_item' => $item->nm_biaya,
                    'qty_kasbon' => $qty_kasbon,
                    'nominal_kasbon' => $nominal_kasbon
                ];
            }

            $this->db->select('a.*');
            $this->db->from('kons_tr_expense_report_project_detail a');
            $this->db->where('a.id_header_kasbon', $id_header);
            $get_expense_detail = $this->db->get()->result();

            $no = 1;
            foreach ($get_expense_detail as $item) {
                $datalist_item_expense[$item->id_detail_kasbon] = [
                    'id' => $item->id,
                    'id_detail_kasbon' => $item->id_detail_kasbon,
                    'tipe' => $item->tipe,
                    'qty_expense' => $item->qty_expense,
                    'nominal_expense' => $item->nominal_expense
                ];
            }
        }

        if ($get_kasbon_header->tipe == 3) {
            $this->db->select('a.*, b.nm_biaya');
            $this->db->from('kons_tr_spk_budgeting_others a');
            $this->db->join('kons_master_biaya b', 'b.id = a.id_item', 'left');
            $this->db->where('a.id_spk_budgeting', $get_kasbon_header->id_spk_budgeting);
            $this->db->order_by('a.id_item', 'asc');
            $get_list_others = $this->db->get()->result();

            $no = 0;
            foreach ($get_list_others as $item) {
                $no++;

                $qty_kasbon = 0;
                $nominal_kasbon = 0;

                $this->db->select('a.*');
                $this->db->from('kons_tr_kasbon_project_others a');
                $this->db->where('a.id_header', $id_header);
                $this->db->where('a.id_item', $item->id_item);
                $get_kasbon = $this->db->get()->row();
                if (!empty($get_kasbon)) {
                    $qty_kasbon = $get_kasbon->qty_pengajuan;
                    $nominal_kasbon = $get_kasbon->nominal_pengajuan;
                }

                $datalist_item[] = [
                    'no' => $no,
                    'id_detail_kasbon' => $item->id,
                    'nm_item' => $item->nm_biaya,
                    'qty_kasbon' => $qty_kasbon,
                    'nominal_kasbon' => $nominal_kasbon
                ];
            }

            $this->db->select('a.*');
            $this->db->from('kons_tr_expense_report_project_detail a');
            $this->db->where('a.id_header_kasbon', $id_header);
            $get_expense_detail = $this->db->get()->result();

            $no = 1;
            foreach ($get_expense_detail as $item) {
                $datalist_item_expense[$item->id_detail_kasbon] = [
                    'id' => $item->id,
                    'id_detail_kasbon' => $item->id_detail_kasbon,
                    'tipe' => $item->tipe,
                    'qty_expense' => $item->qty_expense,
                    'nominal_expense' => $item->nominal_expense
                ];
            }
        }

        $data = [
            'header' => $get_header,
            'list_bukti_pengembalian' => $get_bukti_pengembalian,
            'datalist_item' => $datalist_item,
            'datalist_item_expense' => $datalist_item_expense,
            'id_spk_budgeting' => $get_kasbon_header->id_spk_budgeting,
            'id_header' => $id_header,
            'id_spk_penawaran' => $get_kasbon_header->id_spk_penawaran,
            'id_penawaran' => $get_kasbon_header->id_penawaran,
            'tipe' => $get_kasbon_header->tipe
        ];

        $this->template->set($data);
        $this->template->render('edit_expense_subcont');
    }

    public function view_expense_subcont($id_header)
    {
        $id_header = urldecode($id_header);
        $id_header = str_replace('|', '/', $id_header);

        $this->db->select('a.*');
        $this->db->from('kons_tr_expense_report_project_header a');
        $this->db->where('a.id_header', $id_header);
        $get_header = $this->db->get()->row();

        $this->db->select('a.*');
        $this->db->from('kons_tr_expense_report_bukti_pengembalian a');
        $this->db->where('a.id_header_expense', $get_header->id);
        $get_bukti_pengembalian = $this->db->get()->result();

        $get_kasbon_header = $this->db->get_where('kons_tr_kasbon_project_header a', ['a.id' => $id_header])->row();

        $datalist_item = [];
        $datalist_item_expense = [];

        if ($get_kasbon_header->tipe == 1) {
            $this->db->select('a.*');
            $this->db->from('kons_tr_spk_budgeting_aktifitas a');
            $this->db->where('a.id_spk_budgeting', $get_kasbon_header->id_spk_budgeting);
            $this->db->order_by('a.id_aktifitas', 'asc');
            $get_list_subcont = $this->db->get()->result();

            $no = 0;
            foreach ($get_list_subcont as $item) {
                $no++;

                $qty_kasbon = 0;
                $nominal_kasbon = 0;

                $this->db->select('a.*');
                $this->db->from('kons_tr_kasbon_project_subcont a');
                $this->db->where('a.id_header', $id_header);
                $this->db->where('a.id_aktifitas', $item->id_aktifitas);
                $get_kasbon = $this->db->get()->row();
                if (!empty($get_kasbon)) {
                    $qty_kasbon = $get_kasbon->qty_pengajuan;
                    $nominal_kasbon = $get_kasbon->nominal_pengajuan;
                }

                $datalist_item[] = [
                    'no' => $no,
                    'id_detail_kasbon' => $item->id,
                    'nm_item' => $item->nm_aktifitas,
                    'qty_kasbon' => $qty_kasbon,
                    'nominal_kasbon' => $nominal_kasbon
                ];
            }

            $this->db->select('a.*');
            $this->db->from('kons_tr_expense_report_project_detail a');
            $this->db->where('a.id_header_kasbon', $id_header);
            $get_expense_detail = $this->db->get()->result();

            $no = 1;
            foreach ($get_expense_detail as $item) {
                $datalist_item_expense[$item->id_detail_kasbon] = [
                    'id' => $item->id,
                    'id_detail_kasbon' => $item->id_detail_kasbon,
                    'tipe' => $item->tipe,
                    'qty_expense' => $item->qty_expense,
                    'nominal_expense' => $item->nominal_expense
                ];
            }
        }

        if ($get_kasbon_header->tipe == 2) {
            $this->db->select('a.*, b.nm_biaya');
            $this->db->from('kons_tr_spk_budgeting_akomodasi a');
            $this->db->join('kons_master_biaya b', 'b.id = a.id_item', 'left');
            $this->db->where('a.id_spk_budgeting', $get_kasbon_header->id_spk_budgeting);
            $this->db->order_by('a.id_item', 'asc');
            $get_list_akomodasi = $this->db->get()->result();

            $no = 0;
            foreach ($get_list_akomodasi as $item) {
                $no++;

                $qty_kasbon = 0;
                $nominal_kasbon = 0;

                $this->db->select('a.*');
                $this->db->from('kons_tr_kasbon_project_akomodasi a');
                $this->db->where('a.id_header', $id_header);
                $this->db->where('a.id_item', $item->id_item);
                $get_kasbon = $this->db->get()->row();
                if (!empty($get_kasbon)) {
                    $qty_kasbon = $get_kasbon->qty_pengajuan;
                    $nominal_kasbon = $get_kasbon->nominal_pengajuan;
                }

                $datalist_item[] = [
                    'no' => $no,
                    'id_detail_kasbon' => $item->id,
                    'nm_item' => $item->nm_biaya,
                    'qty_kasbon' => $qty_kasbon,
                    'nominal_kasbon' => $nominal_kasbon
                ];
            }

            $this->db->select('a.*');
            $this->db->from('kons_tr_expense_report_project_detail a');
            $this->db->where('a.id_header_kasbon', $id_header);
            $get_expense_detail = $this->db->get()->result();

            $no = 1;
            foreach ($get_expense_detail as $item) {
                $datalist_item_expense[$item->id_detail_kasbon] = [
                    'id' => $item->id,
                    'id_detail_kasbon' => $item->id_detail_kasbon,
                    'tipe' => $item->tipe,
                    'qty_expense' => $item->qty_expense,
                    'nominal_expense' => $item->nominal_expense
                ];
            }
        }

        if ($get_kasbon_header->tipe == 3) {
            $this->db->select('a.*, b.nm_biaya');
            $this->db->from('kons_tr_spk_budgeting_others a');
            $this->db->join('kons_master_biaya b', 'b.id = a.id_item', 'left');
            $this->db->where('a.id_spk_budgeting', $get_kasbon_header->id_spk_budgeting);
            $this->db->order_by('a.id_item', 'asc');
            $get_list_others = $this->db->get()->result();

            $no = 0;
            foreach ($get_list_others as $item) {
                $no++;

                $qty_kasbon = 0;
                $nominal_kasbon = 0;

                $this->db->select('a.*');
                $this->db->from('kons_tr_kasbon_project_others a');
                $this->db->where('a.id_header', $id_header);
                $this->db->where('a.id_item', $item->id_item);
                $get_kasbon = $this->db->get()->row();
                if (!empty($get_kasbon)) {
                    $qty_kasbon = $get_kasbon->qty_pengajuan;
                    $nominal_kasbon = $get_kasbon->nominal_pengajuan;
                }

                $datalist_item[] = [
                    'no' => $no,
                    'id_detail_kasbon' => $item->id,
                    'nm_item' => $item->nm_biaya,
                    'qty_kasbon' => $qty_kasbon,
                    'nominal_kasbon' => $nominal_kasbon
                ];
            }

            $this->db->select('a.*');
            $this->db->from('kons_tr_expense_report_project_detail a');
            $this->db->where('a.id_header_kasbon', $id_header);
            $get_expense_detail = $this->db->get()->result();

            $no = 1;
            foreach ($get_expense_detail as $item) {
                $datalist_item_expense[$item->id_detail_kasbon] = [
                    'id' => $item->id,
                    'id_detail_kasbon' => $item->id_detail_kasbon,
                    'tipe' => $item->tipe,
                    'qty_expense' => $item->qty_expense,
                    'nominal_expense' => $item->nominal_expense
                ];
            }
        }

        $data = [
            'header' => $get_header,
            'list_bukti_pengembalian' => $get_bukti_pengembalian,
            'datalist_item' => $datalist_item,
            'datalist_item_expense' => $datalist_item_expense,
            'id_spk_budgeting' => $get_kasbon_header->id_spk_budgeting,
            'id_header' => $id_header,
            'id_spk_penawaran' => $get_kasbon_header->id_spk_penawaran,
            'id_penawaran' => $get_kasbon_header->id_penawaran,
            'tipe' => $get_kasbon_header->tipe
        ];

        $this->template->set($data);
        $this->template->render('view_expense_subcont');
    }


    // End Page Function    

    // Get Data Function    

    public function get_data_spk()
    {
        $draw = $this->input->post('draw');
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $search = $this->input->post('search');


        $this->db->select('a.id, a.id_header, a.total_expense_report, a.selisih, a.tipe, b.id_spk_penawaran, b.deskripsi, c.nm_customer, c.nm_project_leader, c.nm_sales, d.nm_paket as nm_project');
        $this->db->from('kons_tr_expense_report_project_header a');
        $this->db->join('kons_tr_kasbon_project_header b', 'b.id = a.id_header', 'left');
        $this->db->join('kons_tr_spk_penawaran c', 'c.id_spk_penawaran = b.id_spk_penawaran', 'left');
        $this->db->join('kons_master_konsultasi_header d', 'd.id_konsultasi_h = c.id_project', 'left');
        $this->db->where('a.sts', null);
        $this->db->where('a.sts_req', 1);

        $db_clone = clone $this->db;
        $count_all = $db_clone->count_all_results();

        $this->db->order_by('a.id', 'desc');
        $this->db->limit($length, $start);
        $get_data = $this->db->get()->result();

        $no = (0 + $start);
        $hasil = [];

        foreach ($get_data as $item) {
            $no++;

            if ($item->tipe == '1') {
                $tipe = '<span class="badge bg-red">Pengajuan Subcont</span>';
            }
            if ($item->tipe == '2') {
                $tipe = '<span class="badge bg-yellow">Pengajuan Akomodasi</span>';
            }
            if ($item->tipe == '3') {
                $tipe = '<span class="badge bg-blue">Pengajuan Others</span>';
            }
            if ($item->tipe == '4') {
                $tipe = '<span class="badge bg-cyan">Pengajuan lab</span>';
            }
            if ($item->tipe == '5') {
                $tipe = '<span class="badge bg-green">Pengajuan Subcont Tenaga Ahli</span>';
            }
            if ($item->tipe == '6') {
                $tipe = '<span class="badge bg-purple">Pengajuan Perusahaan</span>';
            }

            $action = '<a href="' . base_url('approval_expense_report_project/req_app/' . str_replace('/', '|', $item->id_header)) . '" class="btn btn-sm btn-primary"><i class="fa fa-arrow-up"></i></a>';

            $hasil[] = [
                'no' => $no,
                'nomor_spk' => $item->id_spk_penawaran,
                'nomor_expense' => $item->id,
                'customer' => $item->nm_customer,
                'sales' => $item->nm_sales,
                'project_leader' => $item->nm_project_leader,
                'package' => $item->nm_project,
                'keterangan' => $item->deskripsi,
                'tipe' => $tipe,
                'nominal' => number_format($item->total_expense_report),
                'action' => $action
            ];
        }

        $response = [
            'draw' => intval($draw),
            'recordsTotal' => $count_all,
            'recordsFiltered' => $count_all,
            'data' => $hasil
        ];

        echo json_encode($response);
    }

    public function get_data_kasbon_subcont()
    {
        $draw = $this->input->post('draw');
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $search = $this->input->post('search');
        $id_spk_budgeting = $this->input->post('id_spk_budgeting');
        $view = $this->input->post('view');

        $this->db->select('a.*');
        $this->db->from('kons_tr_kasbon_project_header a');
        $this->db->join('kons_tr_expense_report_project_header b', 'b.id_header = a.id', 'left');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $this->db->where('a.tipe', 1);
        $this->db->where('b.sts_req', 1);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.id', $search['value'], 'both');
            $this->db->or_like('a.deskripsi', $search['value'], 'both');
            $this->db->or_like('a.tgl', $search['value'], 'both');
            $this->db->or_like('a.grand_total', $search['value'], 'both');
            $this->db->group_end();
        }
        $this->db->order_by('a.created_by', 'desc');
        $this->db->limit($length, $start);
        $get_kasbon_subcont = $this->db->get();

        $this->db->select('a.*');
        $this->db->from('kons_tr_kasbon_project_header a');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $this->db->where('a.tipe', 1);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.id', $search['value'], 'both');
            $this->db->or_like('a.deskripsi', $search['value'], 'both');
            $this->db->or_like('a.tgl', $search['value'], 'both');
            $this->db->or_like('a.grand_total', $search['value'], 'both');
            $this->db->group_end();
        }
        $this->db->order_by('a.created_by', 'desc');
        $get_kasbon_subcont_all = $this->db->get();

        $nilai_kasbon_on_proses = 0;
        foreach ($get_kasbon_subcont_all->result() as $item) {
            if ($item->sts !== '1') {
                $nilai_kasbon_on_proses += $item->grand_total;
            }
        }

        $hasil = [];

        $no = 1;
        foreach ($get_kasbon_subcont->result() as $item) {
            $check_expense = $this->db->select('a.*')->from('kons_tr_expense_report_project_header a')->where('a.id_header', $item->id)->get();

            $sts = '<button type="button" class="btn btn-sm btn-success">New</button>';
            if ($check_expense->num_rows() > 0) {
                if ($check_expense->row()->sts_req == 1) {
                    $sts = '<button type="button" class="btn btn-sm btn-primary">Waiting Approval</button>';
                } else {
                    if ($check_expense->row()->sts == 1) {
                        $sts = '<button type="button" class="btn btn-sm btn-success">Approved</button>';
                    }
                    if ($check_expense->row()->sts == 2) {
                        $sts = '<button type="button" class="btn btn-sm btn-danger">Rejected</button>';
                    }
                }
            }

            $option = '<a href="' . base_url('expense_report_project/view_expense_subcont/' . urlencode(str_replace('/', '|', $item->id))) . '" class="btn btn-sm btn-info" target="_blank"><i class="fa fa-eye"></i></a>';

            $action = '<a href="' . base_url('expense_report_project/view_expense_subcont/' . urlencode(str_replace('/', '|', $item->id))) . '" class="btn btn-sm btn-info" target="_blank"><i class="fa fa-eye"></i></a>';

            $hasil[] = [
                'no' => $no,
                'req_number' => $item->id,
                'nm_aktifitas' => $item->deskripsi,
                'date' => date('d F Y', strtotime($item->tgl)),
                'total' => number_format($item->grand_total, 2),
                'status' => $sts,
                'action' => $option
            ];

            $no++;
        }

        echo json_encode([
            'draw' => intval($draw),
            'recordsTotal' => $get_kasbon_subcont_all->num_rows(),
            'recordsFiltered' => $get_kasbon_subcont_all->num_rows(),
            'data' => $hasil
        ]);
    }

    public function get_data_kasbon_akomodasi()
    {
        $draw = $this->input->post('draw');
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $search = $this->input->post('search');
        $id_spk_budgeting = $this->input->post('id_spk_budgeting');
        $view = $this->input->post('view');

        $this->db->select('a.*');
        $this->db->from('kons_tr_kasbon_project_header a');
        $this->db->join('kons_tr_expense_report_project_header b', 'b.id_header = a.id', 'left');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $this->db->where('a.tipe', 2);
        $this->db->where('b.sts_req', 1);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.id', $search['value'], 'both');
            $this->db->or_like('a.deskripsi', $search['value'], 'both');
            $this->db->or_like('a.tgl', $search['value'], 'both');
            $this->db->or_like('a.grand_total', $search['value'], 'both');
            $this->db->group_end();
        }
        $this->db->order_by('a.created_by', 'desc');
        $this->db->limit($length, $start);
        $get_kasbon_akomodasi = $this->db->get();

        $this->db->select('a.*');
        $this->db->from('kons_tr_kasbon_project_header a');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $this->db->where('a.tipe', 2);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.id', $search['value'], 'both');
            $this->db->or_like('a.deskripsi', $search['value'], 'both');
            $this->db->or_like('a.tgl', $search['value'], 'both');
            $this->db->or_like('a.grand_total', $search['value'], 'both');
            $this->db->group_end();
        }
        $this->db->order_by('a.created_by', 'desc');
        $get_kasbon_akomodasi_all = $this->db->get();

        $nilai_kasbon_on_proses = 0;
        foreach ($get_kasbon_akomodasi_all->result() as $item) {
            if ($item->sts !== '1') {
                $nilai_kasbon_on_proses += $item->grand_total;
            }
        }

        $hasil = [];

        $no = 1;
        foreach ($get_kasbon_akomodasi->result() as $item) {
            $check_expense = $this->db->select('a.*')->from('kons_tr_expense_report_project_header a')->where('a.id_header', $item->id)->get();

            $sts = '<button type="button" class="btn btn-sm btn-success">New</button>';
            if ($check_expense->num_rows() > 0) {
                if ($check_expense->row()->sts_req == 1) {
                    $sts = '<button type="button" class="btn btn-sm btn-primary">Waiting Approval</button>';
                } else {
                    if ($check_expense->row()->sts == 1) {
                        $sts = '<button type="button" class="btn btn-sm btn-success">Approved</button>';
                    }
                    if ($check_expense->row()->sts == 2) {
                        $sts = '<button type="button" class="btn btn-sm btn-danger">Rejected</button>';
                    }
                }
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

            if ($check_expense->num_rows() > 0) {
                $option .= '
                    <div class="col-12" style="margin-left: 0.5rem; padding-top: 0.5rem;">
                        <a href="' . base_url('expense_report_project/view_expense_subcont/' . urlencode(str_replace('/', '|', $item->id))) . '" class="btn btn-sm btn-info" style="color: #000000">
                            <div class="col-12 dropdown-item">
                            <b>
                                <i class="fa fa-eye"></i>
                            </b>
                            </div>
                        </a>
                        <span style="font-weight: 500"> View </span>
                    </div>
                ';

                if ($check_expense->row()->sts_req == '0' && $check_expense->row()->sts == '0') {
                    $option .= '
                        <div class="col-12" style="margin-left: 0.5rem; padding-top: 0.5rem;">
                            <a href="javascript:void(0);" class="btn btn-sm btn-primary req_approval" style="color: #000000" data-id="' . $item->id . '" title="Request Approval">
                                <div class="col-12 dropdown-item">
                                <b>
                                    <i class="fa fa-check"></i>
                                </b>
                                </div>
                            </a>
                            <span style="font-weight: 500"> Req. Approval </span>
                        </div>
                    ';
                }

                if ($check_expense->row()->sts_req == '0' && $check_expense->row()->sts == '0') {
                    $option .= '
                    <div class="col-12" style="margin-left: 0.5rem; padding-top: 0.5rem;">
                        <a href="' . base_url('expense_report_project/edit_expense_subcont/' . urlencode(str_replace('/', '|', $item->id))) . '" class="btn btn-sm btn-warning" style="color: #000000">
                            <div class="col-12 dropdown-item">
                            <b>
                                <i class="fa fa-pencil"></i>
                            </b>
                            </div>
                        </a>
                        <span style="font-weight: 500"> Edit </span>
                    </div>
                ';
                }
            } else {
                $option .= '
                    <div class="col-12" style="margin-left: 0.5rem; padding-top: 0.5rem;">
                        <a href="' . base_url('expense_report_project/add_expense_subcont/' . urlencode(str_replace('/', '|', $item->id))) . '" class="btn btn-sm btn-success" style="color: #000000">
                            <div class="col-12 dropdown-item">
                            <b>
                                <i class="fa fa-plus"></i>
                            </b>
                            </div>
                        </a>
                        <span style="font-weight: 500"> Add Expense </span>
                    </div>
                ';
            }


            if ($item->sts !== '1' && $item->sts_req !== '1') {
                $option .= '
                    <div class="col-12" style="margin-left: 0.5rem; padding-top: 0.5rem;">
                        <a href="javascript:void(0);" class="btn btn-sm btn-danger del_kasbon_subcont" style="color: #000000" data-id="' . $item->id . '">
                            <div class="col-12 dropdown-item">
                            <b>
                                <i class="fa fa-trash"></i>
                            </b>
                            </div>
                        </a>
                        <span style="font-weight: 500"> Delete </span>
                    </div>
                ';

                $option .= '
                    <div class="col-12" style="margin-left: 0.5rem; padding-top: 0.5rem;">
                        <a href="' . base_url('kasbon_project/edit_kasbon_subcont/' . urlencode(str_replace('/', '|', $item->id))) . '" class="btn btn-sm btn-warning" style="color: #000000">
                            <div class="col-12 dropdown-item">
                            <b>
                                <i class="fa fa-pencil"></i>
                            </b>
                            </div>
                        </a>
                        <span style="font-weight: 500"> Edit </span>
                    </div>
                ';
            }

            $option .= '</div>';

            if ($view == 'view') {
                $option = '';
            }

            $action = '<a href="' . base_url('expense_report_project/view_expense_subcont/' . urlencode(str_replace('/', '|', $item->id))) . '" class="btn btn-sm btn-info" target="_blank"><i class="fa fa-eye"></i></a>';

            $hasil[] = [
                'no' => $no,
                'req_number' => $item->id,
                'nm_biaya' => $item->deskripsi,
                'date' => date('d F Y', strtotime($item->tgl)),
                'total' => number_format($item->grand_total, 2),
                'status' => $sts,
                'option' => $option,
                'action' => $action
            ];

            $no++;
        }

        echo json_encode([
            'draw' => intval($draw),
            'recordsTotal' => $get_kasbon_akomodasi_all->num_rows(),
            'recordsFiltered' => $get_kasbon_akomodasi_all->num_rows(),
            'data' => $hasil
        ]);
    }

    public function get_data_kasbon_others()
    {
        $draw = $this->input->post('draw');
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $search = $this->input->post('search');
        $id_spk_budgeting = $this->input->post('id_spk_budgeting');
        $view = $this->input->post('view');

        $this->db->select('a.*');
        $this->db->from('kons_tr_kasbon_project_header a');
        $this->db->join('kons_tr_expense_report_project_header b', 'b.id_header = a.id', 'left');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $this->db->where('a.tipe', 3);
        $this->db->where('b.sts_req', 1);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.id', $search['value'], 'both');
            $this->db->or_like('a.deskripsi', $search['value'], 'both');
            $this->db->or_like('a.tgl', $search['value'], 'both');
            $this->db->or_like('a.grand_total', $search['value'], 'both');
            $this->db->group_end();
        }
        $this->db->order_by('a.created_by', 'desc');
        $this->db->limit($length, $start);
        $get_kasbon_others = $this->db->get();

        $this->db->select('a.*');
        $this->db->from('kons_tr_kasbon_project_header a');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $this->db->where('a.tipe', 3);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.id', $search['value'], 'both');
            $this->db->or_like('a.deskripsi', $search['value'], 'both');
            $this->db->or_like('a.tgl', $search['value'], 'both');
            $this->db->or_like('a.grand_total', $search['value'], 'both');
            $this->db->group_end();
        }
        $this->db->order_by('a.created_by', 'desc');
        $get_kasbon_others_all = $this->db->get();

        $nilai_kasbon_on_proses = 0;
        foreach ($get_kasbon_others_all->result() as $item) {
            if ($item->sts !== '1') {
                $nilai_kasbon_on_proses += $item->grand_total;
            }
        }

        $hasil = [];

        $no = 1;
        foreach ($get_kasbon_others->result() as $item) {
            $check_expense = $this->db->select('a.*')->from('kons_tr_expense_report_project_header a')->where('a.id_header', $item->id)->get();

            $sts = '<button type="button" class="btn btn-sm btn-success">New</button>';
            if ($check_expense->num_rows() > 0) {
                if ($check_expense->row()->sts_req == 1) {
                    $sts = '<button type="button" class="btn btn-sm btn-primary">Waiting Approval</button>';
                } else {
                    if ($check_expense->row()->sts == 1) {
                        $sts = '<button type="button" class="btn btn-sm btn-success">Approved</button>';
                    }
                    if ($check_expense->row()->sts == 2) {
                        $sts = '<button type="button" class="btn btn-sm btn-danger">Rejected</button>';
                    }
                }
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

            if ($check_expense->num_rows() > 0) {
                $option .= '
                    <div class="col-12" style="margin-left: 0.5rem; padding-top: 0.5rem;">
                        <a href="' . base_url('expense_report_project/view_expense_subcont/' . urlencode(str_replace('/', '|', $item->id))) . '" class="btn btn-sm btn-info" style="color: #000000">
                            <div class="col-12 dropdown-item">
                            <b>
                                <i class="fa fa-eye"></i>
                            </b>
                            </div>
                        </a>
                        <span style="font-weight: 500"> View </span>
                    </div>
                ';

                if ($check_expense->row()->sts_req == '0' && $check_expense->row()->sts == '0') {
                    $option .= '
                        <div class="col-12" style="margin-left: 0.5rem; padding-top: 0.5rem;">
                            <a href="javascript:void(0);" class="btn btn-sm btn-primary req_approval" style="color: #000000" data-id="' . $item->id . '" title="Request Approval">
                                <div class="col-12 dropdown-item">
                                <b>
                                    <i class="fa fa-check"></i>
                                </b>
                                </div>
                            </a>
                            <span style="font-weight: 500"> Req. Approval </span>
                        </div>
                    ';
                }

                if ($check_expense->row()->sts_req == '0' && $check_expense->row()->sts == '0') {
                    $option .= '
                    <div class="col-12" style="margin-left: 0.5rem; padding-top: 0.5rem;">
                        <a href="' . base_url('expense_report_project/edit_expense_subcont/' . urlencode(str_replace('/', '|', $item->id))) . '" class="btn btn-sm btn-warning" style="color: #000000">
                            <div class="col-12 dropdown-item">
                            <b>
                                <i class="fa fa-pencil"></i>
                            </b>
                            </div>
                        </a>
                        <span style="font-weight: 500"> Edit </span>
                    </div>
                ';
                }
            } else {
                $option .= '
                    <div class="col-12" style="margin-left: 0.5rem; padding-top: 0.5rem;">
                        <a href="' . base_url('expense_report_project/add_expense_subcont/' . urlencode(str_replace('/', '|', $item->id))) . '" class="btn btn-sm btn-success" style="color: #000000">
                            <div class="col-12 dropdown-item">
                            <b>
                                <i class="fa fa-plus"></i>
                            </b>
                            </div>
                        </a>
                        <span style="font-weight: 500"> Add Expense </span>
                    </div>
                ';
            }


            if ($item->sts !== '1' && $item->sts_req !== '1') {
                $option .= '
                    <div class="col-12" style="margin-left: 0.5rem; padding-top: 0.5rem;">
                        <a href="javascript:void(0);" class="btn btn-sm btn-danger del_kasbon_subcont" style="color: #000000" data-id="' . $item->id . '">
                            <div class="col-12 dropdown-item">
                            <b>
                                <i class="fa fa-trash"></i>
                            </b>
                            </div>
                        </a>
                        <span style="font-weight: 500"> Delete </span>
                    </div>
                ';

                $option .= '
                    <div class="col-12" style="margin-left: 0.5rem; padding-top: 0.5rem;">
                        <a href="' . base_url('kasbon_project/edit_kasbon_subcont/' . urlencode(str_replace('/', '|', $item->id))) . '" class="btn btn-sm btn-warning" style="color: #000000">
                            <div class="col-12 dropdown-item">
                            <b>
                                <i class="fa fa-pencil"></i>
                            </b>
                            </div>
                        </a>
                        <span style="font-weight: 500"> Edit </span>
                    </div>
                ';
            }

            $option .= '</div>';

            if ($view == 'view') {
                $option = '';
            }

            $action = '<a href="' . base_url('expense_report_project/view_expense_subcont/' . urlencode(str_replace('/', '|', $item->id))) . '" class="btn btn-sm btn-info" target="_blank"><i class="fa fa-eye"></i></a>';

            $hasil[] = [
                'no' => $no,
                'req_number' => $item->id,
                'nm_biaya' => $item->deskripsi,
                'date' => date('d F Y', strtotime($item->created_date)),
                'total' => number_format($item->grand_total, 2),
                'status' => $sts,
                'option' => $option,
                'action' => $action
            ];

            $no++;
        }

        echo json_encode([
            'draw' => intval($draw),
            'recordsTotal' => $get_kasbon_others_all->num_rows(),
            'recordsFiltered' => $get_kasbon_others_all->num_rows(),
            'data' => $hasil
        ]);
    }

    public function get_data_kasbon_lab()
    {
        $draw = $this->input->post('draw');
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $search = $this->input->post('search');
        $id_spk_budgeting = $this->input->post('id_spk_budgeting');
        $view = $this->input->post('view');

        $this->db->select('a.*');
        $this->db->from('kons_tr_kasbon_project_header a');
        $this->db->join('kons_tr_expense_report_project_header b', 'b.id_header = a.id', 'left');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $this->db->where('a.tipe', 4);
        $this->db->where('b.sts_req', 1);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.id', $search['value'], 'both');
            $this->db->or_like('a.deskripsi', $search['value'], 'both');
            $this->db->or_like('a.tgl', $search['value'], 'both');
            $this->db->or_like('a.grand_total', $search['value'], 'both');
            $this->db->group_end();
        }
        $this->db->order_by('a.created_by', 'desc');
        $this->db->limit($length, $start);
        $get_kasbon_lab = $this->db->get();

        $this->db->select('a.*');
        $this->db->from('kons_tr_kasbon_project_header a');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $this->db->where('a.tipe', 4);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.id', $search['value'], 'both');
            $this->db->or_like('a.deskripsi', $search['value'], 'both');
            $this->db->or_like('a.tgl', $search['value'], 'both');
            $this->db->or_like('a.grand_total', $search['value'], 'both');
            $this->db->group_end();
        }
        $this->db->order_by('a.created_by', 'desc');
        $get_kasbon_lab_all = $this->db->get();

        $nilai_kasbon_on_proses = 0;
        foreach ($get_kasbon_lab_all->result() as $item) {
            if ($item->sts !== '1') {
                $nilai_kasbon_on_proses += $item->grand_total;
            }
        }

        $hasil = [];

        $no = 1;
        foreach ($get_kasbon_lab->result() as $item) {
            $check_expense = $this->db->select('a.*')->from('kons_tr_expense_report_project_header a')->where('a.id_header', $item->id)->get();

            $sts = '<button type="button" class="btn btn-sm btn-success">New</button>';
            if ($check_expense->num_rows() > 0) {
                if ($check_expense->row()->sts_req == 1) {
                    $sts = '<button type="button" class="btn btn-sm btn-primary">Waiting Approval</button>';
                } else {
                    if ($check_expense->row()->sts == 1) {
                        $sts = '<button type="button" class="btn btn-sm btn-success">Approved</button>';
                    }
                    if ($check_expense->row()->sts == 2) {
                        $sts = '<button type="button" class="btn btn-sm btn-danger">Rejected</button>';
                    }
                }
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

            if ($check_expense->num_rows() > 0) {
                $option .= '
                    <div class="col-12" style="margin-left: 0.5rem; padding-top: 0.5rem;">
                        <a href="' . base_url('expense_report_project/view_expense_subcont/' . urlencode(str_replace('/', '|', $item->id))) . '" class="btn btn-sm btn-info" style="color: #000000">
                            <div class="col-12 dropdown-item">
                            <b>
                                <i class="fa fa-eye"></i>
                            </b>
                            </div>
                        </a>
                        <span style="font-weight: 500"> View </span>
                    </div>
                ';

                if ($check_expense->row()->sts_req == '0' && $check_expense->row()->sts == '0') {
                    $option .= '
                        <div class="col-12" style="margin-left: 0.5rem; padding-top: 0.5rem;">
                            <a href="javascript:void(0);" class="btn btn-sm btn-primary req_approval" style="color: #000000" data-id="' . $item->id . '" title="Request Approval">
                                <div class="col-12 dropdown-item">
                                <b>
                                    <i class="fa fa-check"></i>
                                </b>
                                </div>
                            </a>
                            <span style="font-weight: 500"> Req. Approval </span>
                        </div>
                    ';
                }

                if ($check_expense->row()->sts_req == '0' && $check_expense->row()->sts == '0') {
                    $option .= '
                    <div class="col-12" style="margin-left: 0.5rem; padding-top: 0.5rem;">
                        <a href="' . base_url('expense_report_project/edit_expense_subcont/' . urlencode(str_replace('/', '|', $item->id))) . '" class="btn btn-sm btn-warning" style="color: #000000">
                            <div class="col-12 dropdown-item">
                            <b>
                                <i class="fa fa-pencil"></i>
                            </b>
                            </div>
                        </a>
                        <span style="font-weight: 500"> Edit </span>
                    </div>
                ';
                }
            } else {
                $option .= '
                    <div class="col-12" style="margin-left: 0.5rem; padding-top: 0.5rem;">
                        <a href="' . base_url('expense_report_project/add_expense_subcont/' . urlencode(str_replace('/', '|', $item->id))) . '" class="btn btn-sm btn-success" style="color: #000000">
                            <div class="col-12 dropdown-item">
                            <b>
                                <i class="fa fa-plus"></i>
                            </b>
                            </div>
                        </a>
                        <span style="font-weight: 500"> Add Expense </span>
                    </div>
                ';
            }


            if ($item->sts !== '1' && $item->sts_req !== '1') {
                $option .= '
                    <div class="col-12" style="margin-left: 0.5rem; padding-top: 0.5rem;">
                        <a href="javascript:void(0);" class="btn btn-sm btn-danger del_kasbon_subcont" style="color: #000000" data-id="' . $item->id . '">
                            <div class="col-12 dropdown-item">
                            <b>
                                <i class="fa fa-trash"></i>
                            </b>
                            </div>
                        </a>
                        <span style="font-weight: 500"> Delete </span>
                    </div>
                ';

                $option .= '
                    <div class="col-12" style="margin-left: 0.5rem; padding-top: 0.5rem;">
                        <a href="' . base_url('kasbon_project/edit_kasbon_subcont/' . urlencode(str_replace('/', '|', $item->id))) . '" class="btn btn-sm btn-warning" style="color: #000000">
                            <div class="col-12 dropdown-item">
                            <b>
                                <i class="fa fa-pencil"></i>
                            </b>
                            </div>
                        </a>
                        <span style="font-weight: 500"> Edit </span>
                    </div>
                ';
            }

            $option .= '</div>';

            if ($view == 'view') {
                $option = '';
            }

            $action = '<a href="' . base_url('expense_report_project/view_expense_subcont/' . urlencode(str_replace('/', '|', $item->id))) . '" class="btn btn-sm btn-info" target="_blank"><i class="fa fa-eye"></i></a>';

            $hasil[] = [
                'no' => $no,
                'req_number' => $item->id,
                'nm_biaya' => $item->deskripsi,
                'date' => date('d F Y', strtotime($item->created_date)),
                'total' => number_format($item->grand_total, 2),
                'status' => $sts,
                'option' => $option,
                'action' => $action
            ];

            $no++;
        }

        echo json_encode([
            'draw' => intval($draw),
            'recordsTotal' => $get_kasbon_lab_all->num_rows(),
            'recordsFiltered' => $get_kasbon_lab_all->num_rows(),
            'data' => $hasil
        ]);
    }

    public function get_data_kasbon_subcont_tenaga_ahli()
    {
        $draw = $this->input->post('draw');
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $search = $this->input->post('search');
        $id_spk_budgeting = $this->input->post('id_spk_budgeting');
        $view = $this->input->post('view');

        $this->db->select('a.*');
        $this->db->from('kons_tr_kasbon_project_header a');
        $this->db->join('kons_tr_expense_report_project_header b', 'b.id_header = a.id', 'left');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $this->db->where('a.tipe', 5);
        $this->db->where('b.sts_req', 1);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.id', $search['value'], 'both');
            $this->db->or_like('a.deskripsi', $search['value'], 'both');
            $this->db->or_like('a.tgl', $search['value'], 'both');
            $this->db->or_like('a.grand_total', $search['value'], 'both');
            $this->db->group_end();
        }
        $this->db->order_by('a.created_by', 'desc');
        $this->db->limit($length, $start);
        $get_kasbon_subcont_tenaga_ahli = $this->db->get();

        $this->db->select('a.*');
        $this->db->from('kons_tr_kasbon_project_header a');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $this->db->where('a.tipe', 5);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.id', $search['value'], 'both');
            $this->db->or_like('a.deskripsi', $search['value'], 'both');
            $this->db->or_like('a.tgl', $search['value'], 'both');
            $this->db->or_like('a.grand_total', $search['value'], 'both');
            $this->db->group_end();
        }
        $this->db->order_by('a.created_by', 'desc');
        $get_kasbon_subcont_tenaga_ahli_all = $this->db->get();

        $nilai_kasbon_on_proses = 0;
        foreach ($get_kasbon_subcont_tenaga_ahli_all->result() as $item) {
            if ($item->sts !== '1') {
                $nilai_kasbon_on_proses += $item->grand_total;
            }
        }

        $hasil = [];

        $no = 1;
        foreach ($get_kasbon_subcont_tenaga_ahli->result() as $item) {
            $check_expense = $this->db->select('a.*')->from('kons_tr_expense_report_project_header a')->where('a.id_header', $item->id)->get();

            $sts = '<button type="button" class="btn btn-sm btn-success">New</button>';
            if ($check_expense->num_rows() > 0) {
                if ($check_expense->row()->sts_req == 1) {
                    $sts = '<button type="button" class="btn btn-sm btn-primary">Waiting Approval</button>';
                } else {
                    if ($check_expense->row()->sts == 1) {
                        $sts = '<button type="button" class="btn btn-sm btn-success">Approved</button>';
                    }
                    if ($check_expense->row()->sts == 2) {
                        $sts = '<button type="button" class="btn btn-sm btn-danger">Rejected</button>';
                    }
                }
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

            if ($check_expense->num_rows() > 0) {
                $option .= '
                    <div class="col-12" style="margin-left: 0.5rem; padding-top: 0.5rem;">
                        <a href="' . base_url('expense_report_project/view_expense_subcont/' . urlencode(str_replace('/', '|', $item->id))) . '" class="btn btn-sm btn-info" style="color: #000000">
                            <div class="col-12 dropdown-item">
                            <b>
                                <i class="fa fa-eye"></i>
                            </b>
                            </div>
                        </a>
                        <span style="font-weight: 500"> View </span>
                    </div>
                ';

                if ($check_expense->row()->sts_req == '0' && $check_expense->row()->sts == '0') {
                    $option .= '
                        <div class="col-12" style="margin-left: 0.5rem; padding-top: 0.5rem;">
                            <a href="javascript:void(0);" class="btn btn-sm btn-primary req_approval" style="color: #000000" data-id="' . $item->id . '" title="Request Approval">
                                <div class="col-12 dropdown-item">
                                <b>
                                    <i class="fa fa-check"></i>
                                </b>
                                </div>
                            </a>
                            <span style="font-weight: 500"> Req. Approval </span>
                        </div>
                    ';
                }

                if ($check_expense->row()->sts_req == '0' && $check_expense->row()->sts == '0') {
                    $option .= '
                    <div class="col-12" style="margin-left: 0.5rem; padding-top: 0.5rem;">
                        <a href="' . base_url('expense_report_project/edit_expense_subcont/' . urlencode(str_replace('/', '|', $item->id))) . '" class="btn btn-sm btn-warning" style="color: #000000">
                            <div class="col-12 dropdown-item">
                            <b>
                                <i class="fa fa-pencil"></i>
                            </b>
                            </div>
                        </a>
                        <span style="font-weight: 500"> Edit </span>
                    </div>
                ';
                }
            } else {
                $option .= '
                    <div class="col-12" style="margin-left: 0.5rem; padding-top: 0.5rem;">
                        <a href="' . base_url('expense_report_project/add_expense_subcont/' . urlencode(str_replace('/', '|', $item->id))) . '" class="btn btn-sm btn-success" style="color: #000000">
                            <div class="col-12 dropdown-item">
                            <b>
                                <i class="fa fa-plus"></i>
                            </b>
                            </div>
                        </a>
                        <span style="font-weight: 500"> Add Expense </span>
                    </div>
                ';
            }


            if ($item->sts !== '1' && $item->sts_req !== '1') {
                $option .= '
                    <div class="col-12" style="margin-left: 0.5rem; padding-top: 0.5rem;">
                        <a href="javascript:void(0);" class="btn btn-sm btn-danger del_kasbon_subcont" style="color: #000000" data-id="' . $item->id . '">
                            <div class="col-12 dropdown-item">
                            <b>
                                <i class="fa fa-trash"></i>
                            </b>
                            </div>
                        </a>
                        <span style="font-weight: 500"> Delete </span>
                    </div>
                ';

                $option .= '
                    <div class="col-12" style="margin-left: 0.5rem; padding-top: 0.5rem;">
                        <a href="' . base_url('kasbon_project/edit_kasbon_subcont/' . urlencode(str_replace('/', '|', $item->id))) . '" class="btn btn-sm btn-warning" style="color: #000000">
                            <div class="col-12 dropdown-item">
                            <b>
                                <i class="fa fa-pencil"></i>
                            </b>
                            </div>
                        </a>
                        <span style="font-weight: 500"> Edit </span>
                    </div>
                ';
            }

            $option .= '</div>';

            if ($view == 'view') {
                $option = '';
            }

            $action = '<a href="' . base_url('expense_report_project/view_expense_subcont/' . urlencode(str_replace('/', '|', $item->id))) . '" class="btn btn-sm btn-info" target="_blank"><i class="fa fa-eye"></i></a>';

            $hasil[] = [
                'no' => $no,
                'req_number' => $item->id,
                'nm_biaya' => $item->deskripsi,
                'date' => date('d F Y', strtotime($item->created_date)),
                'total' => number_format($item->grand_total, 2),
                'status' => $sts,
                'option' => $option,
                'action' => $action
            ];

            $no++;
        }

        echo json_encode([
            'draw' => intval($draw),
            'recordsTotal' => $get_kasbon_subcont_tenaga_ahli_all->num_rows(),
            'recordsFiltered' => $get_kasbon_subcont_tenaga_ahli_all->num_rows(),
            'data' => $hasil
        ]);
    }

    public function get_data_kasbon_subcont_perusahaan()
    {
        $draw = $this->input->post('draw');
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $search = $this->input->post('search');
        $id_spk_budgeting = $this->input->post('id_spk_budgeting');
        $view = $this->input->post('view');

        $this->db->select('a.*');
        $this->db->from('kons_tr_kasbon_project_header a');
        $this->db->join('kons_tr_expense_report_project_header b', 'b.id_header = a.id', 'left');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $this->db->where('a.tipe', 6);
        $this->db->where('b.sts_req', 1);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.id', $search['value'], 'both');
            $this->db->or_like('a.deskripsi', $search['value'], 'both');
            $this->db->or_like('a.tgl', $search['value'], 'both');
            $this->db->or_like('a.grand_total', $search['value'], 'both');
            $this->db->group_end();
        }
        $this->db->order_by('a.created_by', 'desc');
        $this->db->limit($length, $start);
        $get_kasbon_subcont_perusahaan = $this->db->get();

        $this->db->select('a.*');
        $this->db->from('kons_tr_kasbon_project_header a');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $this->db->where('a.tipe', 6);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.id', $search['value'], 'both');
            $this->db->or_like('a.deskripsi', $search['value'], 'both');
            $this->db->or_like('a.tgl', $search['value'], 'both');
            $this->db->or_like('a.grand_total', $search['value'], 'both');
            $this->db->group_end();
        }
        $this->db->order_by('a.created_by', 'desc');
        $get_kasbon_subcont_perusahaan_all = $this->db->get();

        $nilai_kasbon_on_proses = 0;
        foreach ($get_kasbon_subcont_perusahaan_all->result() as $item) {
            if ($item->sts !== '1') {
                $nilai_kasbon_on_proses += $item->grand_total;
            }
        }

        $hasil = [];

        $no = 1;
        foreach ($get_kasbon_subcont_perusahaan->result() as $item) {
            $check_expense = $this->db->select('a.*')->from('kons_tr_expense_report_project_header a')->where('a.id_header', $item->id)->get();

            $sts = '<button type="button" class="btn btn-sm btn-success">New</button>';
            if ($check_expense->num_rows() > 0) {
                if ($check_expense->row()->sts_req == 1) {
                    $sts = '<button type="button" class="btn btn-sm btn-primary">Waiting Approval</button>';
                } else {
                    if ($check_expense->row()->sts == 1) {
                        $sts = '<button type="button" class="btn btn-sm btn-success">Approved</button>';
                    }
                    if ($check_expense->row()->sts == 2) {
                        $sts = '<button type="button" class="btn btn-sm btn-danger">Rejected</button>';
                    }
                }
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

            if ($check_expense->num_rows() > 0) {
                $option .= '
                    <div class="col-12" style="margin-left: 0.5rem; padding-top: 0.5rem;">
                        <a href="' . base_url('expense_report_project/view_expense_subcont/' . urlencode(str_replace('/', '|', $item->id))) . '" class="btn btn-sm btn-info" style="color: #000000">
                            <div class="col-12 dropdown-item">
                            <b>
                                <i class="fa fa-eye"></i>
                            </b>
                            </div>
                        </a>
                        <span style="font-weight: 500"> View </span>
                    </div>
                ';

                if ($check_expense->row()->sts_req == '0' && $check_expense->row()->sts == '0') {
                    $option .= '
                        <div class="col-12" style="margin-left: 0.5rem; padding-top: 0.5rem;">
                            <a href="javascript:void(0);" class="btn btn-sm btn-primary req_approval" style="color: #000000" data-id="' . $item->id . '" title="Request Approval">
                                <div class="col-12 dropdown-item">
                                <b>
                                    <i class="fa fa-check"></i>
                                </b>
                                </div>
                            </a>
                            <span style="font-weight: 500"> Req. Approval </span>
                        </div>
                    ';
                }

                if ($check_expense->row()->sts_req == '0' && $check_expense->row()->sts == '0') {
                    $option .= '
                    <div class="col-12" style="margin-left: 0.5rem; padding-top: 0.5rem;">
                        <a href="' . base_url('expense_report_project/edit_expense_subcont/' . urlencode(str_replace('/', '|', $item->id))) . '" class="btn btn-sm btn-warning" style="color: #000000">
                            <div class="col-12 dropdown-item">
                            <b>
                                <i class="fa fa-pencil"></i>
                            </b>
                            </div>
                        </a>
                        <span style="font-weight: 500"> Edit </span>
                    </div>
                ';
                }
            } else {
                $option .= '
                    <div class="col-12" style="margin-left: 0.5rem; padding-top: 0.5rem;">
                        <a href="' . base_url('expense_report_project/add_expense_subcont/' . urlencode(str_replace('/', '|', $item->id))) . '" class="btn btn-sm btn-success" style="color: #000000">
                            <div class="col-12 dropdown-item">
                            <b>
                                <i class="fa fa-plus"></i>
                            </b>
                            </div>
                        </a>
                        <span style="font-weight: 500"> Add Expense </span>
                    </div>
                ';
            }


            if ($item->sts !== '1' && $item->sts_req !== '1') {
                $option .= '
                    <div class="col-12" style="margin-left: 0.5rem; padding-top: 0.5rem;">
                        <a href="javascript:void(0);" class="btn btn-sm btn-danger del_kasbon_subcont" style="color: #000000" data-id="' . $item->id . '">
                            <div class="col-12 dropdown-item">
                            <b>
                                <i class="fa fa-trash"></i>
                            </b>
                            </div>
                        </a>
                        <span style="font-weight: 500"> Delete </span>
                    </div>
                ';

                $option .= '
                    <div class="col-12" style="margin-left: 0.5rem; padding-top: 0.5rem;">
                        <a href="' . base_url('kasbon_project/edit_kasbon_subcont/' . urlencode(str_replace('/', '|', $item->id))) . '" class="btn btn-sm btn-warning" style="color: #000000">
                            <div class="col-12 dropdown-item">
                            <b>
                                <i class="fa fa-pencil"></i>
                            </b>
                            </div>
                        </a>
                        <span style="font-weight: 500"> Edit </span>
                    </div>
                ';
            }

            $option .= '</div>';

            if ($view == 'view') {
                $option = '';
            }

            $action = '<a href="' . base_url('expense_report_project/view_expense_subcont/' . urlencode(str_replace('/', '|', $item->id))) . '" class="btn btn-sm btn-info" target="_blank"><i class="fa fa-eye"></i></a>';

            $hasil[] = [
                'no' => $no,
                'req_number' => $item->id,
                'nm_biaya' => $item->deskripsi,
                'date' => date('d F Y', strtotime($item->created_date)),
                'total' => number_format($item->grand_total, 2),
                'status' => $sts,
                'option' => $option,
                'action' => $action
            ];

            $no++;
        }

        echo json_encode([
            'draw' => intval($draw),
            'recordsTotal' => $get_kasbon_subcont_perusahaan_all->num_rows(),
            'recordsFiltered' => $get_kasbon_subcont_perusahaan_all->num_rows(),
            'data' => $hasil
        ]);
    }

    // End Data Function

    // Update Data Function

    // public function approve_expense_report()
    // {
    //     $id_spk_budgeting = $this->input->post('id_spk_budgeting');

    //     $this->db->select('a.*, b.deskripsi');
    //     $this->db->from('kons_tr_expense_report_project_header a');
    //     $this->db->join('kons_tr_kasbon_project_header b', 'b.id = a.id_header', 'left');
    //     $this->db->where('b.id_spk_budgeting', $id_spk_budgeting);
    //     $this->db->where('a.sts_req', 1);
    //     $get_expense_report_req_app = $this->db->get()->result();

    //     $this->db->select('a.*');
    //     $this->db->from('kons_tr_expense_report_project_detail a');
    //     $this->db->join('kons_tr_expense_report_project_header b', 'b.id = a.id_header_expense');
    //     $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
    //     $this->db->where('b.sts_req', 1);
    //     $get_expense_report_req_app_detail = $this->db->get()->result();

    //     // print_r($this->db->last_query());
    //     // exit;

    //     $get_user = $this->db->get_where('users', array('id_user' => $this->auth->user_id()))->row();

    //     $this->db->trans_begin();

    //     $no_doc = $this->Approval_expense_report_project_model->GetAutoGenerate('format_expense');

    //     $arr_insert_expense = [];

    //     foreach ($get_expense_report_req_app as $item) {

    //         $this->db->select('a.*');
    //         $this->db->from('kons_tr_kasbon_project_header a');
    //         $this->db->where('a.id', $item->id_header);
    //         $get_header_kasbon = $this->db->get()->row();

    //         if ($item->selisih < 0) {
    //             $arr_insert_expense[] = [
    //                 'no_doc' => $no_doc,
    //                 'tgl_doc' => date('Y-m-d'),
    //                 'nama' => $get_user->nm_lengkap,
    //                 'approval' => $get_user->nm_lengkap,
    //                 'status' => 1,
    //                 'created_by' => $this->auth->user_id(),
    //                 'created_on' => date('Y-m-d H:i:s'),
    //                 'jumlah' => ($item->selisih * -1),
    //                 'informasi' => $get_header_kasbon->deskripsi,
    //                 'bank_id' => $get_header_kasbon->bank,
    //                 'accnumber' => $get_header_kasbon->bank_number,
    //                 'accname' => $get_header_kasbon->bank_account,
    //                 'id_kasbon' => $item->id_header,
    //                 'project_consultant' => 1,
    //                 'no_expense_consultant' => $item->id
    //             ];
    //         }
    //     }

    //     $arr_insert_expense_detail = [];

    //     foreach ($get_expense_report_req_app_detail as $item) {

    //         if ($item->tipe == '1') {
    //             $this->db->select('a.qty_expense, a.nominal_expense, (a.qty_expense * a.nominal_expense) as total_expense, b.qty_pengajuan as qty_kasbon, b.nominal_pengajuan as nominal_kasbon, b.total_pengajuan as total_kasbon');
    //             $this->db->from('kons_tr_expense_report_project_detail a');
    //             $this->db->join('kons_tr_kasbon_project_subcont b', 'b.id_header = a.id_header_kasbon');
    //             $this->db->join('kons_tr_spk_budgeting_aktifitas c', 'c.id = a.id_detail_kasbon AND c.id_spk_budgeting = a.id_spk_budgeting');
    //             $this->db->where('a.id', $item->id);
    //             $get_selisih_expense = $this->db->get()->row();
    //         }

    //         if ($item->tipe == '2') {
    //             $this->db->select('a.qty_expense, a.nominal_expense, (a.qty_expense * a.nominal_expense) as total_expense, b.qty_pengajuan as qty_kasbon, b.nominal_pengajuan as nominal_kasbon, b.total_pengajuan as total_kasbon');
    //             $this->db->from('kons_tr_expens e_report_project_detail a');
    //             $this->db->join('kons_tr_kasbon_project_akomodasi b', 'b.id_header = a.id_header_kasbon');
    //             $this->db->join('kons_tr_spk_budgeting_akomodasi c', 'c.id = a.id_detail_kasbon AND c.id_spk_budgeting = a.id_spk_budgeting');
    //             $this->db->where('a.id', $item->id);
    //             $get_selisih_expense = $this->db->get()->row();
    //         }

    //         if ($item->tipe == '3') {
    //             $this->db->select('a.qty_expense, a.nominal_expense, (a.qty_expense * a.nominal_expense) as total_expense, b.qty_pengajuan as qty_kasbon, b.nominal_pengajuan as nominal_kasbon, b.total_pengajuan as total_kasbon');
    //             $this->db->from('kons_tr_expense_report_project_detail a');
    //             $this->db->join('kons_tr_kasbon_project_others b', 'b.id_header = a.id_header_kasbon');
    //             $this->db->join('kons_tr_spk_budgeting_akomodasi c', 'c.id = a.id_detail_kasbon AND c.id_spk_budgeting = a.id_spk_budgeting');
    //             $this->db->where('a.id', $item->id);
    //             $get_selisih_expense = $this->db->get()->row();
    //         }

    //         if ($item->tipe == '4') {
    //             $this->db->select('a.qty_expense, a.nominal_expense, (a.qty_expense * a.nominal_expense) as total_expense, b.qty_pengajuan as qty_kasbon, b.nominal_pengajuan as nominal_kasbon, b.total_pengajuan as total_kasbon');
    //             $this->db->from('kons_tr_expense_report_project_detail a');
    //             $this->db->join('kons_tr_kasbon_project_lab b', 'b.id_header = a.id_header_kasbon');
    //             $this->db->join('kons_tr_spk_budgeting_lab c', 'c.id = a.id_detail_kasbon AND c.id_spk_budgeting = a.id_spk_budgeting');
    //             $this->db->where('a.id', $item->id);
    //             $get_selisih_expense = $this->db->get()->row();
    //         }

    //         if ($item->tipe == '5') {
    //             $this->db->select('a.qty_expense, a.nominal_expense, (a.qty_expense * a.nominal_expense) as total_expense, b.qty_pengajuan as qty_kasbon, b.nominal_pengajuan as nominal_kasbon, b.total_pengajuan as total_kasbon');
    //             $this->db->from('kons_tr_expense_report_project_detail a');
    //             $this->db->join('kons_tr_kasbon_project_subcont_tenaga_ahli b', 'b.id_header = a.id_header_kasbon');
    //             $this->db->join('kons_tr_spk_budgeting_subcont_tenaga_ahli c', 'c.id = a.id_detail_kasbon AND c.id_spk_budgeting = a.id_spk_budgeting');
    //             $this->db->where('a.id', $item->id);
    //             $get_selisih_expense = $this->db->get()->row();
    //         }

    //         if ($item->tipe == '6') {
    //             $this->db->select('a.qty_expense, a.nominal_expense, (a.qty_expense * a.nominal_expense) as total_expense, b.qty_pengajuan as qty_kasbon, b.nominal_pengajuan as nominal_kasbon, b.total_pengajuan as total_kasbon');
    //             $this->db->from('kons_tr_expense_report_project_detail a');
    //             $this->db->join('kons_tr_kasbon_project_subcont_perusahaan b', 'b.id_header = a.id_header_kasbon');
    //             $this->db->join('kons_tr_spk_budgeting_subcont_perusahaan c', 'c.id = a.id_detail_kasbon AND c.id_spk_budgeting = a.id_spk_budgeting');
    //             $this->db->where('a.id', $item->id);
    //             $get_selisih_expense = $this->db->get()->row();
    //         }

    //         if (!empty($get_selisih_expense)) {

    //             $selisih_expense_kasbon = ($get_selisih_expense->total_kasbon - $get_selisih_expense->total_expense);
    //             if ($selisih_expense_kasbon < 0) {
    //                 $selisih_expense_kasbon = ($selisih_expense_kasbon * -1);
    //                 $arr_insert_expense_detail[] = [
    //                     'tanggal' => date('Y-m-d'),
    //                     'no_doc' => $no_doc,
    //                     'deskripsi' => $item->keterangan,
    //                     'qty' => $item->qty_expense,
    //                     'harga' => $item->nominal_expense,
    //                     'total_harga' => $selisih_expense_kasbon,
    //                     'keterangan' => $item->keterangan,
    //                     'status' => 2,
    //                     'expense' => $selisih_expense_kasbon,
    //                     'created_by' => $get_user->nm_lengkap,
    //                     'created_on' => date('Y-m-d H:i:s')
    //                 ];
    //             }
    //         }
    //     }

    //     // print_r($arr_insert_expense_detail);
    //     // exit;

    //     if (!empty($arr_insert_expense)) {
    //         $insert_sendigs_expense = $this->otherdb->insert_batch('tr_expense', $arr_insert_expense);

    //         $error = $this->db->error();
    //         if ($error['code'] != 0) {
    //             $this->db->trans_rollback();
    //             print_r($this->db->last_query());
    //             exit;
    //         }
    //     }

    //     if (!empty($arr_insert_expense_detail)) {
    //         $insert_sendigs_expense_detail = $this->otherdb->insert_batch('tr_expense_detail', $arr_insert_expense_detail);

    //         $error = $this->db->error();
    //         if ($error['code'] != 0) {
    //             $this->db->trans_rollback();
    //             print_r($this->db->last_query());
    //             exit;
    //         }
    //     }

    //     foreach ($get_expense_report_req_app as $item) {
    //         $update_status_header = $this->db->update('kons_tr_expense_report_project_header', ['sts' => 1, 'sts_req' => null, 'reject_reason' => ''], ['id' => $item->id]);


    //         if (!$update_status_header) {
    //             $this->db->trans_rollback();
    //             print_r($this->db->error($update_status_header));
    //             exit;
    //         }
    //         // $get_user = $this->db->get_where('users', array('id_user' => $this->auth->user_id()))->row();

    //         // $this->db->insert('request_payment', array(
    //         //     'no_doc' => $item->id,
    //         //     'nama' => $get_user->nm_lengkap,
    //         //     'tgl_doc' => date('Y-m-d', strtotime($item->created_date)),
    //         //     'keperluan' => $item->deskripsi,
    //         //     'tipe' => 'expense',
    //         //     'jumlah' => $item->selisih,
    //         //     'created_by' => $get_user->username,
    //         //     'created_on' => date('Y-m-d H:i:s'),
    //         //     'ids' => $item->id,
    //         //     'currency' => 'IDR'
    //         // ));
    //     }

    //     if ($this->db->trans_status() === false) {
    //         $this->db->trans_rollback();

    //         $valid = 0;
    //         $pesan = 'Please try again later !';
    //     } else {
    //         $this->db->trans_commit();

    //         $valid = 1;
    //         $pesan = 'Data has been approved !';
    //     }

    //     echo json_encode([
    //         'status' => $valid,
    //         'pesan' => $pesan
    //     ]);
    // }

    public function approve_expense_report()
    {
        $id_header = $this->input->post('id_header');

        $get_header = $this->db->get_where('kons_tr_expense_report_project_header', ['id_header' => $id_header])->row();
        $get_user = $this->db->get_where('users', ['id_user' => $get_header->created_by])->row();
        $get_kasbon = $this->db->get_where('kons_tr_kasbon_project_header', ['id' => $id_header])->row();

        $this->db->trans_begin();

        $this->db->update('kons_tr_expense_report_project_header', ['sts' => 1, 'sts_req' => null, 'reject_reason' => null], ['id_header' => $id_header]);

        if ($get_header->selisih < 0) {
            $this->db->insert('request_payment', array(
                'no_doc' => $get_header->id,
                'nama' => $get_user->nm_lengkap,
                'tgl_doc' => date('Y-m-d', strtotime($get_header->created_date)),
                'keperluan' => $get_kasbon->deskripsi,
                'tipe' => 'expense',
                'jumlah' => ($get_header->selisih * -1),
                'created_by' => $get_user->username,
                'created_on' => date('Y-m-d H:i:s'),
                'ids' => $get_header->id,
                'currency' => 'IDR'
            ));
        }


        if ($this->db->trans_status() === false) {
            $this->db->trans_rollback();

            $response = [
                'status' => 0,
                'msg' => 'Please try again later !'
            ];
        } else {
            $this->db->trans_commit();

            $response = [
                'status' => 1,
                'msg' => 'Expense data has been approved !'
            ];
        }

        echo json_encode($response);
    }

    public function reject_expense_report()
    {
        $id_header = $this->input->post('id_header');
        $reject_reason = $this->input->post('reject_reason');

        $this->db->trans_begin();

        $this->db->update('kons_tr_expense_report_project_header', ['sts_req' => null, 'reject_reason' => $reject_reason], ['id_header' => $id_header]);

        if ($this->db->trans_status() === false) {
            $this->db->trans_rollback();

            $response = [
                'status' => 0,
                'msg' => 'Please try again later !'
            ];
        } else {
            $this->db->trans_commit();

            $response = [
                'status' => 1,
                'msg' => 'Expense data has been rejected !'
            ];
        }

        echo json_encode($response);
    }

    // public function reject_expense_report()
    // {
    //     $id_spk_budgeting = $this->input->post('id_spk_budgeting');
    //     $reject_reason = $this->input->post('reject_reason');

    //     $this->db->select('a.*');
    //     $this->db->from('kons_tr_expense_report_project_header a');
    //     $this->db->join('kons_tr_kasbon_project_header b', 'b.id = a.id_header', 'left');
    //     $this->db->where('b.id_spk_budgeting', $id_spk_budgeting);
    //     $this->db->where('a.sts_req', 1);
    //     $get_expense_report_req_app = $this->db->get()->result();

    //     $this->db->trans_begin();

    //     foreach ($get_expense_report_req_app as $item) {
    //         $this->db->update('kons_tr_expense_report_project_header', ['sts' => null, 'sts_req' => null, 'reject_reason' => $reject_reason], ['id' => $item->id]);
    //     }

    //     if ($this->db->trans_status() === false) {
    //         $this->db->trans_rollback();

    //         $valid = 0;
    //         $pesan = 'Please try again later !';
    //     } else {
    //         $this->db->trans_commit();

    //         $valid = 1;
    //         $pesan = 'Data has been rejected !';
    //     }

    //     echo json_encode([
    //         'status' => $valid,
    //         'pesan' => $pesan
    //     ]);
    // }

    // End Update Data Function
}
