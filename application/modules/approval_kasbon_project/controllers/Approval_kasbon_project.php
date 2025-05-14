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
class Approval_kasbon_project extends Admin_Controller
{
    //Permission
    protected $viewPermission     = 'Approval_Kasbon_Project.View';
    protected $addPermission      = 'Approval_Kasbon_Project.Add';
    protected $managePermission = 'Approval_Kasbon_Project.Manage';
    protected $deletePermission = 'Approval_Kasbon_Project.Delete';

    public function __construct()
    {
        parent::__construct();
        $this->template->title('Approval Kasbon Project');
        $this->template->page_icon('fa fa-cubes');
        $this->load->library('upload');
        $this->load->model(array('Approval_kasbon_project/Approval_kasbon_project_model'));
        date_default_timezone_set('Asia/Bangkok');
    }

    public function index()
    {
        $this->auth->restrict($this->viewPermission);
        $this->template->title('Approval Kasbon Project');
        $this->template->render('index');
    }

    public function get_data_spk()
    {
        $draw = $this->input->post('draw');
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $search = $this->input->post('search');

        $this->db->select('b.*, a.id_kasbon, c.nm_sales, d.nm_paket');
        $this->db->from('kons_tr_req_kasbon_project a');
        $this->db->join('kons_tr_spk_budgeting b', 'b.id_spk_budgeting = a.id_spk_budgeting', 'left');
        $this->db->join('kons_tr_spk_penawaran c', 'c.id_spk_penawaran = b.id_spk_penawaran', 'left');
        $this->db->join('kons_master_konsultasi_header d', 'd.id_konsultasi_h = c.id_project', 'left');
        $this->db->where('a.sts', 0);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.id_spk_budgeting', $search['value'], 'both');
            $this->db->or_like('c.id_spk_penawaran', $search['value'], 'both');
            $this->db->or_like('b.nm_customer', $search['value'], 'both');
            $this->db->or_like('c.nm_sales', $search['value'], 'both');
            $this->db->or_like('b.nm_project_leader', $search['value'], 'both');
            $this->db->or_like('b.nm_project', $search['value'], 'both');
            $this->db->group_end();
        }
        $this->db->order_by('a.created_date', 'desc');
        $this->db->limit($length, $start);

        $get_data = $this->db->get();

        $this->db->select('b.*, a.id_kasbon, c.nm_sales, d.nm_paket');
        $this->db->from('kons_tr_req_kasbon_project a');
        $this->db->join('kons_tr_spk_budgeting b', 'b.id_spk_budgeting = a.id_spk_budgeting', 'left');
        $this->db->join('kons_tr_spk_penawaran c', 'c.id_spk_penawaran = b.id_spk_penawaran', 'left');
        $this->db->join('kons_master_konsultasi_header d', 'd.id_konsultasi_h = c.id_project', 'left');
        $this->db->where('a.sts', 0);
        if (!empty($search)) {
            $this->db->group_start();
            $this->db->like('a.id_spk_budgeting', $search['value'], 'both');
            $this->db->or_like('c.id_spk_penawaran', $search['value'], 'both');
            $this->db->or_like('b.nm_customer', $search['value'], 'both');
            $this->db->or_like('c.nm_sales', $search['value'], 'both');
            $this->db->or_like('b.nm_project_leader', $search['value'], 'both');
            $this->db->or_like('b.nm_project', $search['value'], 'both');
            $this->db->group_end();
        }
        $this->db->order_by('a.created_date', 'desc');

        $get_data_all = $this->db->get();

        $hasil = [];

        $no = 1;
        foreach ($get_data->result() as $item) {

            $status = '<button type="button" class="btn btn-sm btn-primary">Waiting Approval</button>';
            if ($item->sts == 2) {
                $status = '<button type="button" class="btn btn-sm btn-danger">Rejected</button>';
            }

            $option = '<a href="' . base_url('approval_kasbon_project/approval_kasbon/' . urlencode(str_replace('/', '|', $item->id_kasbon))) . '" class="btn btn-sm btn-primary" title="Approval Kasbon"><i class="fa fa-arrow-up"></i></a>';

            $this->db->select('a.*');
            $this->db->from('kons_tr_kasbon_project_header a');
            $this->db->where('a.id', $item->id_kasbon);
            $get_header_kasbon = $this->db->get()->row();

            $keterangan = (!empty($get_header_kasbon)) ? $get_header_kasbon->deskripsi : '';
            $tipe = '';
            if (!empty($get_header_kasbon)) {
                if ($get_header_kasbon->tipe == '1') {
                    $tipe = 'Subcont';
                }
                if ($get_header_kasbon->tipe == '2') {
                    $tipe = 'Akomodasi';
                }
                if ($get_header_kasbon->tipe == '3') {
                    $tipe = 'Others';
                }
            }
            $nominal = (!empty($get_header_kasbon)) ? $get_header_kasbon->grand_total : 0;


            $hasil[] = [
                'no' => $no,
                'id_spk_penawaran' => $item->id_spk_penawaran,
                'id_kasbon' => $item->id_kasbon,
                'nm_customer' => $item->nm_customer,
                'nm_sales' => ucfirst($item->nm_sales),
                'nm_project_leader' => ucfirst($item->nm_project_leader),
                'nm_project' => $item->nm_paket,
                'keterangan' => $keterangan,
                'tipe' => $tipe,
                'nominal' => number_format($nominal),
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

    public function approval_kasbon($id_kasbon)
    {
        $id_kasbon = urldecode($id_kasbon);
        $id_kasbon = str_replace('|', '/', $id_kasbon);

        $get_header = $this->db->get_where('kons_tr_kasbon_project_header', ['id' => $id_kasbon])->row();

        $id_spk_budgeting = $get_header->id_spk_budgeting;

        $this->db->select('a.*, b.nm_sales, b.waktu_from, b.waktu_to, c.nm_paket');
        $this->db->from('kons_tr_spk_budgeting a');
        $this->db->join('kons_tr_spk_penawaran b', 'b.id_spk_penawaran = a.id_spk_penawaran', 'left');
        $this->db->join('kons_master_konsultasi_header c', 'c.id_konsultasi_h = a.id_project', 'left');
        $this->db->where('a.id_spk_budgeting', $id_spk_budgeting);
        $get_budgeting = $this->db->get()->row();

        $this->db->select('a.*');
        $this->db->from('kons_tr_kasbon_project_subcont a');
        $this->db->where('a.id_header', $id_kasbon);
        $this->db->where('a.sts', null);
        $this->db->where('a.custom_subcont', '0');
        $get_kasbon_subcont = $this->db->get()->result();

        $this->db->from('kons_tr_kasbon_project_subcont a');
        $this->db->where('a.id_header', $id_kasbon);
        $this->db->where('a.sts', null);
        $this->db->where('a.custom_subcont', '1');
        $get_kasbon_subcont_custom = $this->db->get()->result();

        $this->db->select('a.*, b.nm_biaya');
        $this->db->from('kons_tr_kasbon_project_akomodasi a');
        $this->db->join('kons_master_biaya b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_header', $id_kasbon);
        $this->db->where('a.sts', null);
        $get_kasbon_akomodasi = $this->db->get()->result();

        $this->db->select('a.*, b.nm_biaya');
        $this->db->from('kons_tr_kasbon_project_others a');
        $this->db->join('kons_master_biaya b', 'b.id = a.id_item', 'left');
        $this->db->where('a.id_header', $id_kasbon);
        $this->db->where('a.sts', null);
        $get_kasbon_others = $this->db->get()->result();

        $this->db->select('a.*, b.nm_biaya');
        $this->db->from('kons_tr_kasbon_req_ovb_akomodasi_detail a');
        $this->db->join('kons_master_biaya b', 'b.id = a.id_item', 'left');
        $this->db->join('kons_tr_kasbon_req_ovb_akomodasi_header c', 'c.id_request_ovb = a.id_request_ovb');
        $this->db->where('c.id_spk_budgeting', $id_spk_budgeting);
        $this->db->where('c.sts', '1');
        $get_ovb_akomodasi = $this->db->get()->result();

        $this->db->select('a.id_aktifitas, a.qty_budget_tambahan, a.budget_tambahan, a.pengajuan_budget');
        $this->db->from('kons_tr_kasbon_req_ovb_subcont_detail a');
        $this->db->join('kons_tr_kasbon_req_ovb_subcont_header b', 'b.id_request_ovb = a.id_request_ovb', 'left');
        $this->db->where('b.id_spk_budgeting', $id_spk_budgeting);
        $this->db->where('b.sts', '1');
        $get_ovb_subcont = $this->db->get()->result();

        $data_overbudget_subcont = [];
        foreach ($get_ovb_subcont as $item_ovb_subcont) :
            $data_overbudget_subcont[$item_ovb_subcont->id_aktifitas] = [
                'qty_budget_tambahan' => $item_ovb_subcont->qty_budget_tambahan,
                'budget_tambahan' => $item_ovb_subcont->budget_tambahan,
                'pengajuan_budget' => $item_ovb_subcont->pengajuan_budget
            ];
        endforeach;

        $this->db->select('a.qty_budget_tambahan, a.budget_tambahan, a.pengajuan_budget, c.id_others');
        $this->db->from('kons_tr_kasbon_req_ovb_others_detail a');
        $this->db->join('kons_tr_kasbon_req_ovb_others_header b', 'b.id_request_ovb = a.id_request_ovb', 'left');
        $this->db->join('kons_tr_spk_budgeting_others c', 'c.id = a.id_detail');
        $this->db->where('b.id_spk_budgeting', $id_spk_budgeting);
        $this->db->where('b.sts', '1');
        $get_ovb_others = $this->db->get()->result();

        $data_overbudget_others = [];
        foreach ($get_ovb_others as $item_ovb_others) :
            $data_overbudget_others[$item_ovb_others->id_others] = [
                'qty_budget_tambahan' => $item_ovb_others->qty_budget_tambahan,
                'budget_tambahan' => $item_ovb_others->budget_tambahan,
                'pengajuan_budget' => $item_ovb_others->pengajuan_budget
            ];
        endforeach;

        $data = [
            'id_kasbon' => $id_kasbon,
            'id_spk_budgeting' => $id_spk_budgeting,
            'tipe' => $get_header->tipe,
            'list_budgeting' => $get_budgeting,
            'list_kasbon_subcont' => $get_kasbon_subcont,
            'list_kasbon_subcont_custom' => $get_kasbon_subcont_custom,
            'list_kasbon_akomodasi' => $get_kasbon_akomodasi,
            'list_kasbon_others' => $get_kasbon_others,
            'list_ovb_akomodasi' => $get_ovb_akomodasi,
            'data_overbudget_subcont' => $data_overbudget_subcont,
            'data_overbudget_others' => $data_overbudget_others
        ];

        $this->template->set($data);
        $this->template->render('approval_kasbon');
    }

    public function reject_kasbon()
    {
        $id_kasbon = $this->input->post('id_kasbon');
        $reject_reason = $this->input->post('reject_reason');

        $this->db->trans_begin();

        $update_req = $this->db->update('kons_tr_req_kasbon_project', ['sts' => 2, 'reject_reason' => $reject_reason], ['id_kasbon' => $id_kasbon, 'sts' => 0]);
        if (!$update_req) {
            $this->db->trans_rollback();

            print_r($this->db->error($update_req));
            exit;
        }

        if ($this->db->trans_status() === false) {
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

    public function approve_kasbon()
    {
        $id_kasbon = $this->input->post('id_kasbon');

        $get_header_kasbon = $this->db->get_where('kons_tr_kasbon_project_header', array('id' => $id_kasbon))->row();

        $get_user = $this->db->get_where('users', array('id_user' => $get_header_kasbon->created_by))->row();

        $nm_user = (!empty($get_user)) ? $get_user->nm_lengkap : '';

        $get_direktur_user = $this->db->get_where('users', array('id_user' => 48))->row();

        $data_insert_req_payment = [
            'no_doc' => $id_kasbon,
            'nama' => $nm_user,
            'tgl_doc' => date('Y-m-d'),
            'keperluan' => $get_header_kasbon->deskripsi,
            'tipe' => 'kasbon',
            'jumlah' => $get_header_kasbon->grand_total,
            'status' => 0,
            'created_by' => $get_user->username,
            'created_on' => date('Y-m-d H:i:s'),
            'ids' => $id_kasbon,
            'currency' => 'IDR'
        ];

        $no_doc = '';
        $newcode = '';
		$data = $this->db->get_where(DBSF.'.ms_generate', array('tipe' => 'format_kasbon'))->row();
		if ($data !== false) {
			if (stripos($data->info, 'YEAR', 0) !== false) {
				if ($data->info3 != date("Y")) {
					$years = date("Y");
					$number = 1;
					$newnumber = sprintf('%0' . $data->info4 . 'd', $number);
				} else {
					$years = $data->info3;
					$number = ($data->info2 + 1);
					$newnumber = sprintf('%0' . $data->info4 . 'd', $number);
				}
				$newcode = str_ireplace('XXXX', $newnumber, $data->info);
				$newcode = str_ireplace('YEAR', $years, $newcode);
				$newdata = array('info2' => $number, 'info3' => $years);
			} else {
				$number = ($data->info2 + 1);
				$newnumber = sprintf('%0' . $data->info4 . 'd', $number);
				$newcode = str_ireplace('XXXX', $newnumber, $data->info);
				$newdata = array('info2' => $number);
			}
			$this->db->update(DBSF.'.ms_generate', $newdata, array('tipe' => 'format_kasbon'));

			$no_doc = $newcode;
		} else {
			return false;
		}

        

        $project = '';
        if ($get_header_kasbon->tipe == '1') :
            $project = 'Subcont';
        endif;
        if ($get_header_kasbon->tipe == '2') :
            $project = 'Akomodasi';
        endif;
        if ($get_header_kasbon->tipe == '3') :
            $project = 'Others';
        endif;

        $data_insert_sendigs_kasbon = [
            'no_doc' => $no_doc,
            'tgl_doc' => date('Y-m-d'),
            'departement' => '',
            'nama' => $nm_user,
            'jumlah_kasbon' => $get_header_kasbon->grand_total,
            'keperluan' => $get_header_kasbon->deskripsi,
            'doc_file' => $get_header_kasbon->dokument_link,
            'status' => 1,
            'created_by' => $nm_user,
            'created_on' => date('Y-m-d H:i:s'),
            'bank_id' => $get_header_kasbon->bank,
            'accnumber' => $get_header_kasbon->bank_number,
            'accname' => $get_header_kasbon->bank_account,
            'project' => $project,
            'approved_by' => $get_direktur_user->nm_lengkap,
            'approved_on' => date('Y-m-d H:i:s'),
            'keterangan' => $get_header_kasbon->deskripsi,
            'metode_pembayaran' => 1,
            'project_consultant' => 1,
            'no_kasbon_consultant' => $id_kasbon
        ];

        $this->db->trans_begin();

        // $insert_req_payment = $this->db->insert('request_payment', $data_insert_req_payment);
        // if (!$insert_req_payment) {
        //     $this->db->trans_rollback();

        //     print_r($this->db->error($insert_req_payment));
        //     exit;
        // }

        $insert_sendigs_kasbon = $this->db->insert(DBSF.'.tr_kasbon', $data_insert_sendigs_kasbon);
        if(!$insert_sendigs_kasbon) {
            $this->db->trans_rollback();

            print_r($this->db->error($insert_sendigs_kasbon));
            exit;
        }

        $update_req = $this->db->update('kons_tr_kasbon_project_header', ['sts' => 1], ['id' => $id_kasbon]);
        if (!$update_req) {
            $this->db->trans_rollback();

            print_r($this->db->error($update_req));
            exit;
        }

        $update_req = $this->db->update('kons_tr_req_kasbon_project', ['sts' => 1], ['id_kasbon' => $id_kasbon, 'sts' => 0]);
        if (!$update_req) {
            $this->db->trans_rollback();

            print_r($this->db->error($update_req));
            exit;
        }

        $update_req_subcont = $this->db->update('kons_tr_kasbon_project_subcont', ['sts' => 1], ['id_header' => $id_kasbon]);

        $update_req_akomodasi = $this->db->update('kons_tr_kasbon_project_akomodasi', ['sts' => 1], ['id_header' => $id_kasbon]);

        $update_req_others = $this->db->update('kons_tr_kasbon_project_others', ['sts' => 1], ['id_header' => $id_kasbon]);

        if ($this->db->trans_status() === false) {
            $this->db->trans_rollback();

            $valid = 0;
            $pesan = 'Please try again later !';
        } else {
            $this->db->trans_commit();

            $valid = 1;
            $pesan = 'Data has been approved !';
        }

        echo json_encode([
            'status' => $valid,
            'pesan' => $pesan
        ]);
    }
}
