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
class Kasbon_project extends Admin_Controller
{
    //Permission
    protected $viewPermission     = 'Kasbon_Project.View';
    protected $addPermission      = 'Kasbon_Project.Add';
    protected $managePermission = 'Kasbon_Project.Manage';
    protected $deletePermission = 'Kasbon_Project.Delete';

    public function __construct()
    {
        parent::__construct();
        $this->template->title('Kasbon Project');
        $this->template->page_icon('fa fa-cubes');
        $this->load->library('upload');
        $this->load->model(array('Kasbon_project/Kasbon_project_model'));
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

        $this->db->select('a.*, b.nm_sales');
        $this->db->from('kons_tr_spk_budgeting a');
        $this->db->join('kons_tr_spk_penawaran b', 'b.id_spk_penawaran = a.id_spk_penawaran', 'left');
        $this->db->where('a.sts', 1);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.id_spk_budgeting', $search['value'], 'both');
            $this->db->or_like('a.nm_customer', $search['value'], 'both');
            $this->db->or_like('b.nm_sales', $search['value'], 'both');
            $this->db->or_like('a.nm_project_leader', $search['value'], 'both');
            $this->db->or_like('a.nm_project', $search['value'], 'both');
            $this->db->group_end();
        }
        $this->db->order_by('a.create_date', 'desc');
        $this->db->limit($length, $start);

        $get_data = $this->db->get();

        $this->db->select('a.*, b.nm_sales');
        $this->db->from('kons_tr_spk_budgeting a');
        $this->db->join('kons_tr_spk_penawaran b', 'b.id_spk_penawaran = a.id_spk_penawaran', 'left');
        $this->db->where('a.sts', 1);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.id_spk_budgeting', $search['value'], 'both');
            $this->db->or_like('a.nm_customer', $search['value'], 'both');
            $this->db->or_like('b.nm_sales', $search['value'], 'both');
            $this->db->or_like('a.nm_project_leader', $search['value'], 'both');
            $this->db->or_like('a.nm_project', $search['value'], 'both');
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

            $option = '<a href="' . base_url('kasbon_project/add_kasbon/' . urlencode(str_replace('/', '|', $item->id_spk_budgeting))) . '" class="btn btn-sm btn-primary" title="Process Kasbon"><i class="fa fa-arrow-up"></i></a>';


            $hasil[] = [
                'no' => $no,
                'id_spk_penawaran' => $item->id_spk_penawaran,
                'nm_customer' => $item->nm_customer,
                'nm_sales' => ucfirst($item->nm_sales),
                'nm_project_leader' => ucfirst($item->nm_project_leader),
                'nm_project' => $item->nm_project,
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

    public function get_data_kasbon_subcont()
    {
        $draw = $this->input->post('draw');
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $search = $this->input->post('search');
        $id_spk_budgeting = $this->input->post('id_spk_budgeting');

        $this->db->select('a.*');
        $this->db->from('kons_tr_kasbon_project_subcont a');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.id_kasbon_subcont', $search['value'], 'both');
            $this->db->or_like('a.nm_aktifitas', $search['value'], 'both');
            $this->db->or_like('DATE_FORMAT(a.created_date, "%d %M %Y")', $search['value'], 'both');
            $this->db->or_like('a.qty_pengajuan', $search['value'], 'both');
            $this->db->or_like('a.nominal_pengajuan', $search['value'], 'both');
            $this->db->or_like('a.total_pengajuan', $search['value'], 'both');
            $this->db->group_end();
        }
        $this->db->order_by('a.created_by', 'desc');
        $this->db->limit($length, $start);
        $get_kasbon_subcont = $this->db->get();

        $this->db->select('a.*');
        $this->db->from('kons_tr_kasbon_project_subcont a');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.id_kasbon_subcont', $search['value'], 'both');
            $this->db->or_like('a.nm_aktifitas', $search['value'], 'both');
            $this->db->or_like('DATE_FORMAT(a.created_date, "%d %M %Y")', $search['value'], 'both');
            $this->db->or_like('a.qty_pengajuan', $search['value'], 'both');
            $this->db->or_like('a.nominal_pengajuan', $search['value'], 'both');
            $this->db->or_like('a.total_pengajuan', $search['value'], 'both');
            $this->db->group_end();
        }
        $this->db->order_by('a.created_by', 'desc');
        $get_kasbon_subcont_all = $this->db->get();

        $nilai_kasbon_on_proses = 0;
        foreach ($get_kasbon_subcont_all->result() as $item) {
            if ($item->sts !== '1') {
                $nilai_kasbon_on_proses += $item->total_pengajuan;
            }
        }

        $hasil = [];

        $no = 1;
        foreach ($get_kasbon_subcont->result() as $item) {
            $sts = '<button type="button" class="btn btn-sm btn-primary">Requested</button>';
            if ($item->sts == '1') {
                $sts = '<button type="button" class="btn btn-sm btn-success">Paid</button>';
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

            $option .= '
                <div class="col-12" style="margin-left: 0.5rem; padding-top: 0.5rem;">
                    <a href="javascript:void(0);" class="btn btn-sm btn-info" style="color: #000000">
                        <div class="col-12 dropdown-item">
                        <b>
                            <i class="fa fa-eye"></i>
                        </b>
                        </div>
                    </a>
                    <span style="font-weight: 500"> View </span>
                </div>
            ';

            if ($item->sts !== '1') {
                $option .= '
                    <div class="col-12" style="margin-left: 0.5rem; padding-top: 0.5rem;">
                        <a href="javascript:void(0);" class="btn btn-sm btn-danger del_kasbon_subcont" style="color: #000000" data-id_kasbon_subcont="' . $item->id_kasbon_subcont . '">
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
                    <a href="javascript:void(0);" class="btn btn-sm btn-success paid_kasbon_subcont" style="color: #000000" data-id_kasbon_subcont="' . $item->id_kasbon_subcont . '">
                        <div class="col-12 dropdown-item">
                        <b>
                            <i class="fa fa-check"></i>
                        </b>
                        </div>
                    </a>
                    <span style="font-weight: 500"> Paid </span>
                </div>
            ';
            }

            // $option .= '
            //     <div class="col-12" style="margin-left: 0.5rem; padding-top: 0.5rem;">
            //         <a href="javascript:void(0);" class="btn btn-sm btn-danger" style="color: #000000">
            //             <div class="col-12 dropdown-item">
            //             <b>
            //                 <i class="fa fa-close"></i>
            //             </b>
            //             </div>
            //         </a>
            //         <span style="font-weight: 500"> Reject </span>
            //     </div>
            // ';

            

            $option .= '</div>';

            $hasil[] = [
                'no' => $no,
                'req_number' => $item->id_kasbon_subcont,
                'nm_aktifitas' => $item->nm_aktifitas,
                'date' => date('d F Y', strtotime($item->created_date)),
                'qty' => $item->qty_pengajuan,
                'amount' => number_format($item->nominal_pengajuan, 2),
                'total' => number_format($item->total_pengajuan, 2),
                'status' => $sts,
                'option' => $option
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

        $this->db->select('a.*, b.nm_biaya');
        $this->db->from('kons_tr_kasbon_project_akomodasi a');
        $this->db->join('kons_master_biaya b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.id_kasbon_akomodasi', $search['value'], 'both');
            $this->db->or_like('b.nm_biaya', $search['value'], 'both');
            $this->db->or_like('DATE_FORMAT(a.created_date, "%d %M %Y")', $search['value'], 'both');
            $this->db->or_like('a.qty_pengajuan', $search['value'], 'both');
            $this->db->or_like('a.nominal_pengajuan', $search['value'], 'both');
            $this->db->or_like('a.total_pengajuan', $search['value'], 'both');
            $this->db->group_end();
        }
        $this->db->order_by('a.created_by', 'desc');
        $this->db->limit($length, $start);
        $get_kasbon_akomodasi = $this->db->get();

        $this->db->select('a.*, b.nm_biaya');
        $this->db->from('kons_tr_kasbon_project_akomodasi a');
        $this->db->join('kons_master_biaya b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.id_kasbon_akomodasi', $search['value'], 'both');
            $this->db->or_like('b.nm_biaya', $search['value'], 'both');
            $this->db->or_like('DATE_FORMAT(a.created_date, "%d %M %Y")', $search['value'], 'both');
            $this->db->or_like('a.qty_pengajuan', $search['value'], 'both');
            $this->db->or_like('a.nominal_pengajuan', $search['value'], 'both');
            $this->db->or_like('a.total_pengajuan', $search['value'], 'both');
            $this->db->group_end();
        }
        $this->db->order_by('a.created_by', 'desc');
        $get_kasbon_akomodasi_all = $this->db->get();

        $nilai_kasbon_on_proses = 0;
        foreach ($get_kasbon_akomodasi_all->result() as $item) {
            if ($item->sts !== '1') {
                $nilai_kasbon_on_proses += $item->total_pengajuan;
            }
        }

        $hasil = [];

        $no = 1;
        foreach ($get_kasbon_akomodasi->result() as $item) {
            $sts = '<button type="button" class="btn btn-sm btn-primary">Requested</button>';
            if ($item->sts == '1') {
                $sts = '<button type="button" class="btn btn-sm btn-success">Paid</button>';
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

            $option .= '
                <div class="col-12" style="margin-left: 0.5rem; padding-top: 0.5rem;">
                    <a href="javascript:void(0);" class="btn btn-sm btn-info" style="color: #000000">
                        <div class="col-12 dropdown-item">
                        <b>
                            <i class="fa fa-eye"></i>
                        </b>
                        </div>
                    </a>
                    <span style="font-weight: 500"> View </span>
                </div>
            ';

            if ($item->sts !== '1') {
                $option .= '
                    <div class="col-12" style="margin-left: 0.5rem; padding-top: 0.5rem;">
                        <a href="javascript:void(0);" class="btn btn-sm btn-danger del_kasbon_akomodasi" style="color: #000000" data-id_kasbon_akomodasi="' . $item->id_kasbon_akomodasi . '">
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
                    <a href="javascript:void(0);" class="btn btn-sm btn-success paid_kasbon_akomodasi" style="color: #000000" data-id_kasbon_akomodasi="' . $item->id_kasbon_akomodasi . '">
                        <div class="col-12 dropdown-item">
                        <b>
                            <i class="fa fa-check"></i>
                        </b>
                        </div>
                    </a>
                    <span style="font-weight: 500"> Paid </span>
                </div>
            ';
            }

            $option .= '</div>';

            $hasil[] = [
                'no' => $no,
                'req_number' => $item->id_kasbon_akomodasi,
                'nm_biaya' => $item->nm_biaya,
                'date' => date('d F Y', strtotime($item->created_date)),
                'qty' => $item->qty_pengajuan,
                'amount' => number_format($item->nominal_pengajuan, 2),
                'total' => number_format($item->total_pengajuan, 2),
                'status' => $sts,
                'option' => $option
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

    public function get_data_kasbon_others() {
        $draw = $this->input->post('draw');
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $search = $this->input->post('search');
        $id_spk_budgeting = $this->input->post('id_spk_budgeting');

        $this->db->select('a.*, b.nm_biaya');
        $this->db->from('kons_tr_kasbon_project_others a');
        $this->db->join('kons_master_biaya b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.id_kasbon_others', $search['value'], 'both');
            $this->db->or_like('b.nm_biaya', $search['value'], 'both');
            $this->db->or_like('DATE_FORMAT(a.created_date, "%d %M %Y")', $search['value'], 'both');
            $this->db->or_like('a.qty_pengajuan', $search['value'], 'both');
            $this->db->or_like('a.nominal_pengajuan', $search['value'], 'both');
            $this->db->or_like('a.total_pengajuan', $search['value'], 'both');
            $this->db->group_end();
        }
        $this->db->order_by('a.created_by', 'desc');
        $this->db->limit($length, $start);
        $get_kasbon_others = $this->db->get();

        $this->db->select('a.*, b.nm_biaya');
        $this->db->from('kons_tr_kasbon_project_others a');
        $this->db->join('kons_master_biaya b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.id_kasbon_others', $search['value'], 'both');
            $this->db->or_like('b.nm_biaya', $search['value'], 'both');
            $this->db->or_like('DATE_FORMAT(a.created_date, "%d %M %Y")', $search['value'], 'both');
            $this->db->or_like('a.qty_pengajuan', $search['value'], 'both');
            $this->db->or_like('a.nominal_pengajuan', $search['value'], 'both');
            $this->db->or_like('a.total_pengajuan', $search['value'], 'both');
            $this->db->group_end();
        }
        $this->db->order_by('a.created_by', 'desc');
        $get_kasbon_others_all = $this->db->get();

        $nilai_kasbon_on_proses = 0;
        foreach ($get_kasbon_others_all->result() as $item) {
            if ($item->sts !== '1') {
                $nilai_kasbon_on_proses += $item->total_pengajuan;
            }
        }

        $hasil = [];

        $no = 1;
        foreach ($get_kasbon_others->result() as $item) {
            $sts = '<button type="button" class="btn btn-sm btn-primary">Requested</button>';
            if ($item->sts == '1') {
                $sts = '<button type="button" class="btn btn-sm btn-success">Paid</button>';
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

            $option .= '
                <div class="col-12" style="margin-left: 0.5rem; padding-top: 0.5rem;">
                    <a href="javascript:void(0);" class="btn btn-sm btn-info" style="color: #000000">
                        <div class="col-12 dropdown-item">
                        <b>
                            <i class="fa fa-eye"></i>
                        </b>
                        </div>
                    </a>
                    <span style="font-weight: 500"> View </span>
                </div>
            ';

            if ($item->sts !== '1') {
                $option .= '
                    <div class="col-12" style="margin-left: 0.5rem; padding-top: 0.5rem;">
                        <a href="javascript:void(0);" class="btn btn-sm btn-danger del_kasbon_others" style="color: #000000" data-id_kasbon_others="' . $item->id_kasbon_others . '">
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
                    <a href="javascript:void(0);" class="btn btn-sm btn-success paid_kasbon_others" style="color: #000000" data-id_kasbon_others="' . $item->id_kasbon_others . '">
                        <div class="col-12 dropdown-item">
                        <b>
                            <i class="fa fa-check"></i>
                        </b>
                        </div>
                    </a>
                    <span style="font-weight: 500"> Paid </span>
                </div>
            ';
            }

            $option .= '</div>';

            $hasil[] = [
                'no' => $no,
                'req_number' => $item->id_kasbon_others,
                'nm_biaya' => $item->nm_biaya,
                'date' => date('d F Y', strtotime($item->created_date)),
                'qty' => $item->qty_pengajuan,
                'amount' => number_format($item->nominal_pengajuan, 2),
                'total' => number_format($item->total_pengajuan, 2),
                'status' => $sts,
                'option' => $option
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

    public function add_kasbon($id_spk_budgeting)
    {
        $id_spk_budgeting = urldecode($id_spk_budgeting);
        $id_spk_budgeting = str_replace('|', '/', $id_spk_budgeting);

        $this->db->select('a.*, b.nm_sales, b.waktu_from, b.waktu_to');
        $this->db->from('kons_tr_spk_budgeting a');
        $this->db->join('kons_tr_spk_penawaran b', 'b.id_spk_penawaran = a.id_spk_penawaran', 'left');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $get_budgeting = $this->db->get()->row();

        $budget_subcont = 0;
        $this->db->select('a.mandays_subcont_final, a.mandays_rate_subcont_final');
        $this->db->from('kons_tr_spk_budgeting_aktifitas a');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $get_budget_subcont = $this->db->get()->result();

        foreach ($get_budget_subcont as $item) {
            $budget_subcont += ($item->mandays_rate_subcont_final * $item->mandays_subcont_final);
        }

        $this->db->select('SUM(a.total_final) as budget_akomodasi');
        $this->db->from('kons_tr_spk_budgeting_akomodasi a');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $get_budget_akomodasi = $this->db->get()->row();
        $budget_akomodasi = $get_budget_akomodasi->budget_akomodasi;

        $this->db->select('SUM(a.total_final) as budget_others');
        $this->db->from('kons_tr_spk_budgeting_others a');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $get_budget_others = $this->db->get()->row();
        $budget_others = $get_budget_others->budget_others;

        $this->db->select('a.*');
        $this->db->from('kons_tr_kasbon_project_subcont a');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $get_kasbon_subcont = $this->db->get()->result();

        $nilai_kasbon_on_proses = 0;
        foreach ($get_kasbon_subcont as $item) {
            if ($item->sts !== '1') {
                $nilai_kasbon_on_proses += $item->total_pengajuan;
            }
        }


        $data = [
            'id_spk_budgeting' => $id_spk_budgeting,
            'list_budgeting' => $get_budgeting,
            'budget_subcont' => $budget_subcont,
            'budget_akomodasi' => $budget_akomodasi,
            'budget_others' => $budget_others,
            'list_kasbon_subcont' => $get_kasbon_subcont,
            'nilai_kasbon_on_proses' => $nilai_kasbon_on_proses
        ];

        $this->template->set($data);
        $this->template->render('add');
    }

    public function add_kasbon_subcont($id_spk_budgeting)
    {
        $id_spk_budgeting = urldecode($id_spk_budgeting);
        $id_spk_budgeting = str_replace('|', '/', $id_spk_budgeting);

        $this->db->select('a.*, b.nm_sales, b.waktu_from, b.waktu_to');
        $this->db->from('kons_tr_spk_budgeting a');
        $this->db->join('kons_tr_spk_penawaran b', 'b.id_spk_penawaran = a.id_spk_penawaran', 'left');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $get_budgeting = $this->db->get()->row();

        $this->db->select('a.*');
        $this->db->from('kons_tr_spk_budgeting_aktifitas a');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $this->db->where('a.mandays_rate_subcont_final >', 0);
        $get_data_subcont = $this->db->get()->result();

        $this->db->select('a.id_aktifitas, SUM(a.qty_pengajuan) as ttl_qty_pengajuan, SUM(a.total_pengajuan) as ttl_total_pengajuan');
        $this->db->from('kons_tr_kasbon_project_subcont a');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $this->db->group_by('a.id_aktifitas');
        $get_kasbon_subcont = $this->db->get()->result();

        $data_kasbon_subcont = [];
        foreach ($get_kasbon_subcont as $item) {
            $data_kasbon_subcont[$item->id_aktifitas] = [
                'ttl_qty_pengajuan' => $item->ttl_qty_pengajuan,
                'ttl_total_pengajuan' => $item->ttl_total_pengajuan
            ];
        }

        // print_r($data_kasbon_subcont);
        // exit;

        $data = [
            'id_spk_budgeting' => $id_spk_budgeting,
            'list_budgeting' => $get_budgeting,
            'list_subcont' => $get_data_subcont,
            'data_kasbon_subcont' => $data_kasbon_subcont
        ];

        $this->template->set($data);
        $this->template->render('add_kasbon_subcont');
    }

    public function add_kasbon_akomodasi($id_spk_budgeting)
    {
        $id_spk_budgeting = urldecode($id_spk_budgeting);
        $id_spk_budgeting = str_replace('|', '/', $id_spk_budgeting);

        $this->db->select('a.*, b.nm_sales, b.waktu_from, b.waktu_to');
        $this->db->from('kons_tr_spk_budgeting a');
        $this->db->join('kons_tr_spk_penawaran b', 'b.id_spk_penawaran = a.id_spk_penawaran', 'left');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $get_budgeting = $this->db->get()->row();

        $this->db->select('a.*, b.nm_biaya');
        $this->db->from('kons_tr_spk_budgeting_akomodasi a');
        $this->db->join('kons_master_biaya b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $get_data_akomodasi = $this->db->get()->result();

        $this->db->select('a.id_akomodasi ,SUM(a.qty_pengajuan) as ttl_qty_pengajuan, SUM(a.total_pengajuan) as ttl_total_pengajuan');
        $this->db->from('kons_tr_kasbon_project_akomodasi a');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $this->db->group_by('a.id_akomodasi');
        $get_kasbon_akomodasi = $this->db->get()->result();

        $data_kasbon_akomodasi = [];
        foreach($get_kasbon_akomodasi as $item) {
            $data_kasbon_akomodasi[$item->id_akomodasi] = [
                'ttl_qty_pengajuan' => $item->ttl_qty_pengajuan,
                'ttl_total_pengajuan' => $item->ttl_total_pengajuan
            ];
        }


        $data = [
            'id_spk_budgeting' => $id_spk_budgeting,
            'list_budgeting' => $get_budgeting,
            'list_akomodasi' => $get_data_akomodasi,
            'data_kasbon_akomodasi' => $data_kasbon_akomodasi
        ];

        $this->template->set($data);
        $this->template->render('add_kasbon_akomodasi');
    }

    public function add_kasbon_others($id_spk_budgeting)
    {
        $id_spk_budgeting = urldecode($id_spk_budgeting);
        $id_spk_budgeting = str_replace('|', '/', $id_spk_budgeting);

        $this->db->select('a.*, b.nm_sales, b.waktu_from, b.waktu_to');
        $this->db->from('kons_tr_spk_budgeting a');
        $this->db->join('kons_tr_spk_penawaran b', 'b.id_spk_penawaran = a.id_spk_penawaran', 'left');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $get_budgeting = $this->db->get()->row();

        $this->db->select('a.*, b.nm_biaya');
        $this->db->from('kons_tr_spk_budgeting_others a');
        $this->db->join('kons_master_biaya b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $get_data_others = $this->db->get()->result();

        $this->db->select('a.id_others ,SUM(a.qty_pengajuan) as ttl_qty_pengajuan, SUM(a.total_pengajuan) as ttl_total_pengajuan');
        $this->db->from('kons_tr_kasbon_project_others a');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $this->db->group_by('a.id_others');
        $get_kasbon_others = $this->db->get()->result();

        $data_kasbon_others = [];
        foreach($get_kasbon_others as $item) {
            $data_kasbon_others[$item->id_others] = [
                'ttl_qty_pengajuan' => $item->ttl_qty_pengajuan,
                'ttl_total_pengajuan' => $item->ttl_total_pengajuan
            ];
        }


        $data = [
            'id_spk_budgeting' => $id_spk_budgeting,
            'list_budgeting' => $get_budgeting,
            'list_others' => $get_data_others,
            'data_kasbon_others' => $data_kasbon_others
        ];

        $this->template->set($data);
        $this->template->render('add_kasbon_others');
    }

    public function save_kasbon_subcont()
    {
        $post = $this->input->post();

        $config['upload_path'] = './uploads/kasbon_project/'; //path folder
        $config['allowed_types'] = 'gif|jpg|png|jpeg|bmp|pdf|webp'; //type yang dapat diakses bisa anda sesuaikan
        $config['max_size'] = 100000000; // Maximum file size in kilobytes (2MB).
        $config['encrypt_name'] = FALSE; // Encrypt the uploaded file's name.
        $config['remove_spaces'] = TRUE; // Remove spaces from the file name.

        $this->load->library('upload', $config);
        $this->upload->initialize($config);

        $upload_po = '';

        $files = $_FILES['kasbon_document'];
        $file_count = count($files['name']);

        $_FILES['kasbon_document']['name'] = $files['name'];
        $_FILES['kasbon_document']['type'] = $files['type'];
        $_FILES['kasbon_document']['tmp_name'] = $files['tmp_name'];
        $_FILES['kasbon_document']['error'] = $files['error'];
        $_FILES['kasbon_document']['size'] = $files['size'];

        if (!$this->upload->do_upload('kasbon_document')) {
            // If upload fails, display error
            $error = array('error' => $this->upload->display_errors());
            // print_r($error);
        } else {
            $data_upload_po = $this->upload->data();
            $upload_po = 'uploads/kasbon_project/' . $data_upload_po['file_name'];
        }


        $this->db->trans_begin();

        $data_insert = [];

        $no = 1;
        foreach ($post['detail_subcont'] as $item) {
            if (str_replace(',', '', $item['qty_pengajuan']) > 0 && str_replace(',', '', $item['nominal_pengajuan'])) {
                $data_insert[] = [
                    'id_kasbon_subcont' => $this->Kasbon_project_model->generate_id_kasbon_subcont($no),
                    'id_spk_budgeting' => $post['id_spk_budgeting'],
                    'id_spk_penawaran' => $post['id_spk_penawaran'],
                    'id_penawaran' => $post['id_penawaran'],
                    'id_aktifitas' => $item['id_aktifitas'],
                    'nm_aktifitas' => $item['nm_aktifitas'],
                    'qty_pengajuan' => str_replace(',', '', $item['qty_pengajuan']),
                    'nominal_pengajuan' => str_replace(',', '', $item['nominal_pengajuan']),
                    'total_pengajuan' => (str_replace(',', '', $item['nominal_pengajuan']) *  str_replace(',', '', $item['qty_pengajuan'])),
                    'qty_estimasi' => $item['qty_estimasi'],
                    'price_unit_estimasi' => $item['price_unit_estimasi'],
                    'total_budget_estimasi' => $item['total_estimasi'],
                    'document_link' => $upload_po,
                    'bank' => $post['kasbon_bank'],
                    'bank_number' => $post['kasbon_bank_number'],
                    'bank_account' => $post['kasbon_bank_account'],
                    'created_by' => $this->auth->user_id(),
                    'created_date' => date('Y-m-d H:i:s')
                ];

                $no++;
            }
        }

        $insert_kasbon_subcont = $this->db->insert_batch('kons_tr_kasbon_project_subcont', $data_insert);
        if (!$insert_kasbon_subcont) {
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
            $pesan = 'Data has been saved !';
        }

        echo json_encode([
            'status' => $valid,
            'pesan' => $pesan
        ]);
    }

    public function save_kasbon_akomodasi() {
        $post = $this->input->post();

        $config['upload_path'] = './uploads/kasbon_project/'; //path folder
        $config['allowed_types'] = 'gif|jpg|png|jpeg|bmp|pdf|webp'; //type yang dapat diakses bisa anda sesuaikan
        $config['max_size'] = 100000000; // Maximum file size in kilobytes (2MB).
        $config['encrypt_name'] = FALSE; // Encrypt the uploaded file's name.
        $config['remove_spaces'] = TRUE; // Remove spaces from the file name.

        $this->load->library('upload', $config);
        $this->upload->initialize($config);

        $upload_po = '';

        $files = $_FILES['kasbon_document'];
        $file_count = count($files['name']);

        $_FILES['kasbon_document']['name'] = $files['name'];
        $_FILES['kasbon_document']['type'] = $files['type'];
        $_FILES['kasbon_document']['tmp_name'] = $files['tmp_name'];
        $_FILES['kasbon_document']['error'] = $files['error'];
        $_FILES['kasbon_document']['size'] = $files['size'];

        if (!$this->upload->do_upload('kasbon_document')) {
            // If upload fails, display error
            $error = array('error' => $this->upload->display_errors());
            // print_r($error);
        } else {
            $data_upload_po = $this->upload->data();
            $upload_po = 'uploads/kasbon_project/' . $data_upload_po['file_name'];
        }


        $this->db->trans_begin();

        $data_insert = [];

        $no = 1;
        foreach ($post['detail_akomodasi'] as $item) {
            if (str_replace(',', '', $item['qty_pengajuan']) > 0 && str_replace(',', '', $item['nominal_pengajuan'])) {
                $data_insert[] = [
                    'id_kasbon_akomodasi' => $this->Kasbon_project_model->generate_id_kasbon_akomodasi($no),
                    'id_spk_budgeting' => $post['id_spk_budgeting'],
                    'id_spk_penawaran' => $post['id_spk_penawaran'],
                    'id_penawaran' => $post['id_penawaran'],
                    'id_akomodasi' => $item['id_akomodasi'],
                    'id_item' => $item['id_item'],
                    'nm_item' => $item['nm_item'],
                    'qty_pengajuan' => str_replace(',', '', $item['qty_pengajuan']),
                    'nominal_pengajuan' => str_replace(',', '', $item['nominal_pengajuan']),
                    'total_pengajuan' => (str_replace(',', '', $item['nominal_pengajuan']) *  str_replace(',', '', $item['qty_pengajuan'])),
                    'qty_estimasi' => $item['qty_estimasi'],
                    'price_unit_estimasi' => $item['price_unit_estimasi'],
                    'total_budget_estimasi' => $item['total_estimasi'],
                    'document_link' => $upload_po,
                    'bank' => $post['kasbon_bank'],
                    'bank_number' => $post['kasbon_bank_number'],
                    'bank_account' => $post['kasbon_bank_account'],
                    'created_by' => $this->auth->user_id(),
                    'created_date' => date('Y-m-d H:i:s')
                ];

                $no++;
            }
        }

        $insert_kasbon_subcont = $this->db->insert_batch('kons_tr_kasbon_project_akomodasi', $data_insert);
        if (!$insert_kasbon_subcont) {
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
            $pesan = 'Data has been saved !';
        }

        echo json_encode([
            'status' => $valid,
            'pesan' => $pesan
        ]);
    }

    public function save_kasbon_others() {
        $post = $this->input->post();

        $config['upload_path'] = './uploads/kasbon_project/'; //path folder
        $config['allowed_types'] = 'gif|jpg|png|jpeg|bmp|pdf|webp'; //type yang dapat diakses bisa anda sesuaikan
        $config['max_size'] = 100000000; // Maximum file size in kilobytes (2MB).
        $config['encrypt_name'] = TRUE; // Encrypt the uploaded file's name.
        $config['remove_spaces'] = TRUE; // Remove spaces from the file name.

        $this->load->library('upload', $config);
        $this->upload->initialize($config);

        $upload_po = '';

        $files = $_FILES['kasbon_document'];
        $file_count = count($files['name']);

        $_FILES['kasbon_document']['name'] = $files['name'];
        $_FILES['kasbon_document']['type'] = $files['type'];
        $_FILES['kasbon_document']['tmp_name'] = $files['tmp_name'];
        $_FILES['kasbon_document']['error'] = $files['error'];
        $_FILES['kasbon_document']['size'] = $files['size'];

        if (!$this->upload->do_upload('kasbon_document')) {
            // If upload fails, display error
            $error = array('error' => $this->upload->display_errors());
            // print_r($error);
        } else {
            $data_upload_po = $this->upload->data();
            $upload_po = 'uploads/kasbon_project/' . $data_upload_po['file_name'];
        }


        $this->db->trans_begin();

        $data_insert = [];

        $no = 1;
        foreach ($post['detail_others'] as $item) {
            if (str_replace(',', '', $item['qty_pengajuan']) > 0 && str_replace(',', '', $item['nominal_pengajuan'])) {
                $data_insert[] = [
                    'id_kasbon_others' => $this->Kasbon_project_model->generate_id_kasbon_others($no),
                    'id_spk_budgeting' => $post['id_spk_budgeting'],
                    'id_spk_penawaran' => $post['id_spk_penawaran'],
                    'id_penawaran' => $post['id_penawaran'],
                    'id_others' => $item['id_others'],
                    'id_item' => $item['id_item'],
                    'nm_item' => $item['nm_item'],
                    'qty_pengajuan' => str_replace(',', '', $item['qty_pengajuan']),
                    'nominal_pengajuan' => str_replace(',', '', $item['nominal_pengajuan']),
                    'total_pengajuan' => (str_replace(',', '', $item['nominal_pengajuan']) *  str_replace(',', '', $item['qty_pengajuan'])),
                    'qty_estimasi' => $item['qty_estimasi'],
                    'price_unit_estimasi' => $item['price_unit_estimasi'],
                    'total_budget_estimasi' => $item['total_estimasi'],
                    'document_link' => $upload_po,
                    'bank' => $post['kasbon_bank'],
                    'bank_number' => $post['kasbon_bank_number'],
                    'bank_account' => $post['kasbon_bank_account'],
                    'created_by' => $this->auth->user_id(),
                    'created_date' => date('Y-m-d H:i:s')
                ];

                $no++;
            }
        }

        $insert_kasbon_subcont = $this->db->insert_batch('kons_tr_kasbon_project_others', $data_insert);
        if (!$insert_kasbon_subcont) {
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
            $pesan = 'Data has been saved !';
        }

        echo json_encode([
            'status' => $valid,
            'pesan' => $pesan
        ]);
    }

    public function del_kasbon_subcont()
    {
        $id_kasbon_subcont = $this->input->post('id_kasbon_subcont');

        $this->db->trans_start();

        $del_kasbon_subcont = $this->db->delete('kons_tr_kasbon_project_subcont', ['id_kasbon_subcont' => $id_kasbon_subcont]);

        if ($this->db->trans_status() === false) {
            $this->db->trans_rollback();

            $valid = 0;
            $pesan = 'Please try again later !';
        } else {
            $this->db->trans_commit();

            $valid = 1;
            $pesan = 'Data has been deleted !';
        }

        echo json_encode([
            'status' => $valid,
            'pesan' => $pesan
        ]);
    }

    public function del_kasbon_akomodasi()
    {
        $id_kasbon_akomodasi = $this->input->post('id_kasbon_akomodasi');

        $this->db->trans_start();

        $del_kasbon_subcont = $this->db->delete('kons_tr_kasbon_project_akomodasi', ['id_kasbon_akomodasi' => $id_kasbon_akomodasi]);

        if ($this->db->trans_status() === false) {
            $this->db->trans_rollback();

            $valid = 0;
            $pesan = 'Please try again later !';
        } else {
            $this->db->trans_commit();

            $valid = 1;
            $pesan = 'Data has been deleted !';
        }

        echo json_encode([
            'status' => $valid,
            'pesan' => $pesan
        ]);
    }

    public function paid_kasbon_subcont()
    {
        $id_kasbon_subcont = $this->input->post('id_kasbon_subcont');

        $this->db->trans_begin();

        $this->db->update('kons_tr_kasbon_project_subcont', ['sts' => 1], ['id_kasbon_subcont' => $id_kasbon_subcont]);

        if ($this->db->trans_status() === false) {
            $this->db->trans_rollback();

            $valid = 0;
            $pesan = 'Please try again later !';
        } else {
            $this->db->trans_commit();

            $valid = 1;
            $pesan = 'Data has been paid !';
        }

        echo json_encode([
            'status' => $valid,
            'pesan' => $pesan
        ]);
    }

    public function paid_kasbon_akomodasi()
    {
        $id_kasbon_akomodasi = $this->input->post('id_kasbon_akomodasi');

        $this->db->trans_begin();

        $this->db->update('kons_tr_kasbon_project_akomodasi', ['sts' => 1], ['id_kasbon_akomodasi' => $id_kasbon_akomodasi]);

        if ($this->db->trans_status() === false) {
            $this->db->trans_rollback();

            $valid = 0;
            $pesan = 'Please try again later !';
        } else {
            $this->db->trans_commit();

            $valid = 1;
            $pesan = 'Data has been paid !';
        }

        echo json_encode([
            'status' => $valid,
            'pesan' => $pesan
        ]);
    }
}
