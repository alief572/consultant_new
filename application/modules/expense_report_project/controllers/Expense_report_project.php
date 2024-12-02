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
class Expense_report_project extends Admin_Controller
{
    //Permission
    protected $viewPermission     = 'Expense_Report_Project.View';
    protected $addPermission      = 'Expense_Report_Project.Add';
    protected $managePermission = 'Expense_Report_Project.Manage';
    protected $deletePermission = 'Expense_Report_Project.Delete';

    public function __construct()
    {
        parent::__construct();
        $this->template->title('Expense Report Project');
        $this->template->page_icon('fa fa-cubes');
        $this->load->library('upload');
        $this->load->model(array('Expense_report_project/Expense_report_project_model'));
        date_default_timezone_set('Asia/Bangkok');
    }

    // View Page Function

    public function index()
    {
        $this->auth->restrict($this->viewPermission);
        $this->template->title('Expense Report Project');
        $this->template->render('index');
    }

    public function add($id_spk_budgeting)
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

        $this->db->select('SUM(b.budget_tambahan) as total_ovb_akomodasi');
        $this->db->from('kons_tr_kasbon_req_ovb_akomodasi_header a');
        $this->db->join('kons_tr_kasbon_req_ovb_akomodasi_detail b', 'b.id_request_ovb = a.id_request_ovb', 'left');
        $this->db->where('a.tipe', 2);
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $get_budget_ovb_akomodasi = $this->db->get()->row();
        $budget_akomodasi += $get_budget_ovb_akomodasi->total_ovb_akomodasi;

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

        $this->db->select('a.*');
        $this->db->from('kons_tr_kasbon_project_akomodasi a');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $get_kasbon_akomodasi = $this->db->get()->result();

        $nilai_kasbon_on_proses_akomodasi = 0;
        foreach ($get_kasbon_akomodasi as $item) {
            if ($item->sts !== '1') {
                $nilai_kasbon_on_proses_akomodasi += $item->total_pengajuan;
            }
        }

        $this->db->select('a.*');
        $this->db->from('kons_tr_kasbon_project_others a');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $get_kasbon_others = $this->db->get()->result();

        $nilai_kasbon_on_proses_others = 0;
        foreach ($get_kasbon_others as $item) {
            if ($item->sts !== '1') {
                $nilai_kasbon_on_proses_others += $item->total_pengajuan;
            }
        }

        $data = [
            'list_budgeting' => $get_budgeting,
            'budget_subcont' => $budget_subcont,
            'budget_akomodasi' => $budget_akomodasi,
            'budget_others' => $budget_others,
            'nilai_kasbon_on_proses' => $nilai_kasbon_on_proses,
            'nilai_kasbon_on_proses_akomodasi' => $nilai_kasbon_on_proses_akomodasi,
            'nilai_kasbon_on_proses_others' => $nilai_kasbon_on_proses_others
        ];

        $this->template->set($data);
        $this->template->render('add');
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

        $data = [
            'datalist_item' => $datalist_item,
            'id_spk_budgeting' => $get_kasbon_header->id_spk_budgeting,
            'id_header' => $id_header,
            'id_spk_penawaran' => $get_kasbon_header->id_spk_penawaran,
            'id_penawaran' => $get_kasbon_header->id_penawaran
        ];

        $this->template->set($data);
        $this->template->render('add_expense_subcont');
    }

    // End Page Function    

    // Get Data Function    

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

        $no = 0;
        foreach ($get_data->result() as $item) {



            $valid_show = 1;

            $check_app_kasbon_project = $this->db->get_where('kons_tr_req_kasbon_project', ['id_spk_budgeting' => $item->id_spk_budgeting, 'sts' => 1])->num_rows();
            if ($check_app_kasbon_project < 1) {
                $valid_show = 0;
            }

            if ($valid_show == 1) {
                $no++;

                $option = '<a href="' . base_url('expense_report_project/add/' . urlencode(str_replace('/', '|', $item->id_spk_budgeting))) . '" class="btn btn-sm btn-primary" title="Add Expense Report"><i class="fa fa-arrow-up"></i></a>';

                $hasil[] = [
                    'no' => $no,
                    'id_spk_penawaran' => $item->id_spk_penawaran,
                    'nm_customer' => $item->nm_customer,
                    'nm_sales' => ucfirst($item->nm_sales),
                    'nm_project_leader' => ucfirst($item->nm_project_leader),
                    'nm_project' => $item->nm_project,
                    'option' => $option
                ];
            }
        }

        echo json_encode([
            'draw' => intval($draw),
            'recordsTotal' => $no,
            'recordsFiltered' => $no,
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
        $view = $this->input->post('view');

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
                if ($check_expense->sts !== 1) {
                    $sts = '<button type="button" class="btn btn-sm btn-info">Waiting Approval</button>';
                } else {
                    $sts = '<button type="button" class="btn btn-sm btn-primary">Approved</button>';
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
                        <a href="' . base_url('kasbon_project/view_kasbon_subcont/' . urlencode(str_replace('/', '|', $item->id))) . '" class="btn btn-sm btn-info" style="color: #000000">
                            <div class="col-12 dropdown-item">
                            <b>
                                <i class="fa fa-eye"></i>
                            </b>
                            </div>
                        </a>
                        <span style="font-weight: 500"> View </span>
                    </div>
                ';

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

            $hasil[] = [
                'no' => $no,
                'req_number' => $item->id,
                'nm_aktifitas' => $item->deskripsi,
                'date' => date('d F Y', strtotime($item->tgl)),
                'total' => number_format($item->grand_total, 2),
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

    // End Data Function

    // Update Data Function

    public function save_expense_report_subcont()
    {
        $post = $this->input->post();

        $this->db->trans_start();

        $id = $this->Expense_report_project_model->generate_id_expense_report_header();

        $config['upload_path'] = './uploads/expense_report_project/'; //path folder
        $config['allowed_types'] = '*'; //type yang dapat diakses bisa anda sesuaikan
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

        if ($this->upload->do_upload('kasbon_document')) {
            $data_upload_po = $this->upload->data();
            $upload_po = 'uploads/expense_report_project/' . $data_upload_po['file_name'];
        }

        $data_bukti_pengembalian = [];

        $files2 = $_FILES['bukti_pengembalian'];
        $file_count2 = count($files2['name']);

        $config2['upload_path'] = './uploads/bukti_pengembalian_expense_report/'; //path folder
        $config2['allowed_types'] = '*'; //type yang dapat diakses bisa anda sesuaikan
        $config2['max_size'] = 100000000; // Maximum file size in kilobytes (2MB).
        $config2['encrypt_name'] = FALSE; // Encrypt the uploaded file's name.
        $config2['remove_spaces'] = TRUE; // Remove spaces from the file name.

        // $this->load->library('upload', $config);
        $this->upload->initialize($config2);

        for ($i = 0; $i < $file_count2; $i++) {
            $_FILES['bukti_pengembalian']['name'] = $files2['name'][$i];
            $_FILES['bukti_pengembalian']['type'] = $files2['type'][$i];
            $_FILES['bukti_pengembalian']['tmp_name'] = $files2['tmp_name'][$i];
            $_FILES['bukti_pengembalian']['error'] = $files2['error'][$i];
            $_FILES['bukti_pengembalian']['size'] = $files2['size'][$i];

            // Reinitialize the upload class for each file
            if ($this->upload->do_upload()) {
                // Handle success (save file information or any other action)
                $data = $this->upload->data();

                $data_bukti_pengembalian[] = [
                    'id_header_expense' => $id,
                    'document_link' => 'uploads/bukti_pengembalian_expense_report/' . $data['file_name'],
                    'created_by' => $this->auth->user_id(),
                    'created_date' => date('Y-m-d H:i:s')
                ];
            }
        }

        $data_insert_detail = [];

        $ttl_kasbon = 0;
        $ttl_expense_report = 0;

        if (isset($post['detail_subcont'])) {
            foreach ($post['detail_subcont'] as $item) {
                $qty_kasbon = $item['qty_kasbon'];
                $nominal_kasbon = $item['nominal_kasbon'];

                $qty_expense = str_replace(',', '', $item['qty_expense']);
                $nominal_expense = str_replace(',', '', $item['nominal_expense']);

                if ($qty_expense > 0 && $nominal_expense > 0) {
                    $data_insert_detail[] = [
                        'id_header_expense' => $id,
                        'id_header_kasbon' => $post['id_header'],
                        'id_spk_budgeting' => $post['id_spk_budgeting'],
                        'id_spk_penawaran' => $post['id_spk_penawaran'],
                        'id_penawaran' => $post['id_penawaran'],
                        'id_detail_kasbon' => $item['id_detail_kasbon'],
                        'tipe' => 1,
                        'qty_expense' => $qty_expense,
                        'nominal_expense' => $nominal_expense,
                        'created_by' => $this->auth->user_id(),
                        'created_date' => date('Y-m-d H:i:s')
                    ];
                }

                $ttl_kasbon += ($qty_kasbon * $nominal_kasbon);
                $ttl_expense_report += ($qty_expense * $nominal_expense);
            }
        }

        $data_insert_header = [
            'id' => $id,
            'id_header' => $post['id_header'],
            'total_expense_report' => $ttl_expense_report,
            'total_kasbon' => $ttl_kasbon,
            'selisih' => ($ttl_kasbon - $ttl_expense_report),
            'tipe' => 1,
            'document_link' => $upload_po,
            'bank' => $post['kasbon_bank'],
            'bank_number' => $post['kasbon_bank_number'],
            'bank_account' => $post['kasbon_bank_account'],
            'created_by' => $this->auth->user_id(),
            'created_date' => date('Y-m-d H:i:s')
        ];

        $insert_header = $this->db->insert('kons_tr_expense_report_project_header', $data_insert_header);
        if (!$insert_header) {
            $this->db->trans_rollback();

            print_r('error insert header : ' . $this->db->error($insert_header));
            exit;
        }

        $insert_detail = $this->db->insert_batch('kons_tr_expense_report_project_detail', $data_insert_detail);
        if (!$insert_detail) {
            $this->db->trans_rollback();

            print_r('error insert detail :' . $this->db->error($insert_detail));
            exit;
        }

        if (!empty($data_bukti_pengembalian)) {
            $insert_bukti_pengembalian = $this->db->insert_batch('kons_tr_expense_report_bukti_pengembalian', $data_bukti_pengembalian);
            if (!$insert_bukti_pengembalian) {
                $this->db->trans_rollback();

                print_r('error insert bukti pengembalian : ' . $this->db->error($insert_bukti_pengembalian));
                exit;
            }
        }

        if ($this->db->trans_status() === false) {
            $this->db->trans_rollback();

            $valid = 0;
            $pesan = 'Please try again later !';
        } else {
            $this->db->trans_commit();

            $valid = 1;
            $pesan = 'Expense data has been saved !';
        }

        echo json_encode([
            'status' => $valid,
            'pesan' => $pesan
        ]);
    }

    // End Update Data Function
}
