<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Expense_report_project_model extends BF_Model
{

    protected $ENABLE_ADD;
    protected $ENABLE_MANAGE;
    protected $ENABLE_VIEW;
    protected $ENABLE_DELETE;

    protected $gl;
    protected $sendigs;

    public function __construct()
    {
        parent::__construct();

        $this->ENABLE_ADD     = has_permission('Expense_Report_Project.Add');
        $this->ENABLE_MANAGE  = has_permission('Expense_Report_Project.Manage');
        $this->ENABLE_VIEW    = has_permission('Expense_Report_Project.View');
        $this->ENABLE_DELETE  = has_permission('Expense_Report_Project.Delete');

        $this->gl = $this->load->database('gl_sendigs', true);
        $this->sendigs = $this->load->database('sendigs_finance', true);
    }

    function generate_id_expense_report_header()
    {
        $Ym             = date('ym');
        $srcMtr            = "SELECT MAX(id) as maxP FROM kons_tr_expense_report_project_header WHERE id LIKE '%/EXP/H/" . date('Y') . "%' ";
        $resultMtr        = $this->db->query($srcMtr)->result_array();
        $angkaUrut2        = $resultMtr[0]['maxP'];
        $urutan2        = (int)substr($angkaUrut2, 0, 4);
        $urutan2++;
        $urut2            = sprintf('%04s', $urutan2);
        $kode_trans        = $urut2 . '/EXP/H/' . date('Y');

        return $kode_trans;
    }

    public function set_jurnal_expense()
    {
        $post = $this->input->post();

        $id_penawaran = $post['id_penawaran'];

        $kelebihan_kasbon = $post['kelebihan_kasbon'];
        $kelebihan_expense = $post['kelebihan_expense'];
        $kontrol = $post['kontrol'];

        $total_kasbon = $post['total_kasbon'];
        $total_expense = $post['total_expense'];

        $id_bank = $post['id_bank'];

        $this->db->select('a.id, a.nm_company');
        $this->db->from('kons_tr_company a');
        $this->db->join('kons_tr_penawaran b', 'b.company = a.id');
        $this->db->where('b.id_quotation', $id_penawaran);
        $get_company = $this->db->get()->row();

        $id_company = (!empty($get_company)) ? $get_company->id : '';
        $nm_company = (!empty($get_company)) ? $get_company->nm_company : '';

        $hasil_jurnal = '';

        $ttl_debit = 0;
        $ttl_kredit = 0;
        if ($kelebihan_expense == '0' && $kelebihan_kasbon == '0') {
            $arr_coa_jurnal = ['5010-12-5', '1030-20-4'];

            $this->gl->select('a.no_perkiraan, a.nama as nm_coa');
            $this->gl->from('coa_master a');
            $this->gl->where_in('a.no_perkiraan', $arr_coa_jurnal);
            $get_coa = $this->gl->get()->result();

            $hasil_jurnal = '';
            $no_jurnal = 0;


            foreach ($get_coa as $item_coa) {
                $no_jurnal++;

                $debit = 0;
                $kredit = 0;

                if ($item_coa->no_perkiraan == '5010-12-5') {
                    $debit = $total_expense;
                }
                if ($item_coa->no_perkiraan == '1030-20-4') {
                    $kredit = $total_kasbon;
                }

                $hasil_jurnal .= '<tr>';

                $hasil_jurnal .= '<td class="text-center">';
                $hasil_jurnal .= date('d F Y');
                $hasil_jurnal .= '<input type="hidden" name="jurnal[' . $no_jurnal . '][tgl_jurnal]" value="' . date('Y-m-d') . '">';
                $hasil_jurnal .= '</td>';

                $hasil_jurnal .= '<td class="text-center">';
                $hasil_jurnal .= $item_coa->no_perkiraan;
                $hasil_jurnal .= '<input type="hidden" name="jurnal[' . $no_jurnal . '][coa]" value="' . $item_coa->no_perkiraan . '">';
                $hasil_jurnal .= '</td>';

                $hasil_jurnal .= '<td class="text-center">';
                $hasil_jurnal .= $nm_company;
                $hasil_jurnal .= '<input type="hidden" name="jurnal[' . $no_jurnal . '][id_company]" value="' . $id_company . '">';
                $hasil_jurnal .= '<input type="hidden" name="jurnal[' . $no_jurnal . '][nm_company]" value="' . $nm_company . '">';
                $hasil_jurnal .= '</td>';

                $hasil_jurnal .= '<td class="text-center">';
                $hasil_jurnal .= $item_coa->nm_coa;
                $hasil_jurnal .= '<input type="hidden" name="jurnal[' . $no_jurnal . '][nm_coa]" value="' . $item_coa->nm_coa . '">';
                $hasil_jurnal .= '</td>';

                $hasil_jurnal .= '<td class="text-right">';
                $hasil_jurnal .= number_format($debit);
                $hasil_jurnal .= '<input type="hidden" name="jurnal[' . $no_jurnal . '][debit]" value="' . $debit . '">';
                $hasil_jurnal .= '</td>';

                $hasil_jurnal .= '<td class="text-right">';
                $hasil_jurnal .= number_format($kredit);
                $hasil_jurnal .= '<input type="hidden" name="jurnal[' . $no_jurnal . '][kredit]" value="' . $kredit . '">';
                $hasil_jurnal .= '</td>';

                $hasil_jurnal .= '</tr>';

                $ttl_debit += $debit;
                $ttl_kredit += $kredit;
            }
        }

        if ($kontrol > 0) {
            $arr_coa_jurnal = ['5010-12-5', '1030-20-4'];

            $coa_bank = '';
            if ($post['id_bank'] !== '') {
                $get_bank = $this->sendigs->get_where('ms_bank', ['id' => $post['id_bank']])->row();

                $coa_bank = $get_bank->coa_bank;
                array_push($arr_coa_jurnal, $get_bank->coa_bank);
            }

            $this->gl->select('a.no_perkiraan, a.nama as nm_coa');
            $this->gl->from('coa_master a');
            $this->gl->where_in('a.no_perkiraan', $arr_coa_jurnal);
            $get_coa = $this->gl->get()->result();

            $hasil_jurnal = '';
            $no_jurnal = 0;

            $ttl_debit = 0;
            $ttl_kredit = 0;
            foreach ($get_coa as $item_coa) {
                $no_jurnal++;

                $debit = 0;
                $kredit = 0;

                if ($item_coa->no_perkiraan == '5010-12-5') {
                    $debit = $total_expense;
                }
                if ($item_coa->no_perkiraan == '1030-20-4') {
                    $kredit = $total_kasbon;
                }
                if ($coa_bank !== '' && $item_coa->no_perkiraan == $coa_bank) {
                    $debit = $kontrol;
                }


                $hasil_jurnal .= '<tr>';

                $hasil_jurnal .= '<td class="text-center">';
                $hasil_jurnal .= date('d F Y');
                $hasil_jurnal .= '<input type="hidden" name="jurnal[' . $no_jurnal . '][tgl_jurnal]" value="' . date('Y-m-d') . '">';
                $hasil_jurnal .= '</td>';

                $hasil_jurnal .= '<td class="text-center">';
                $hasil_jurnal .= $item_coa->no_perkiraan;
                $hasil_jurnal .= '<input type="hidden" name="jurnal[' . $no_jurnal . '][coa]" value="' . $item_coa->no_perkiraan . '">';
                $hasil_jurnal .= '</td>';

                $hasil_jurnal .= '<td class="text-center">';
                $hasil_jurnal .= $nm_company;
                $hasil_jurnal .= '<input type="hidden" name="jurnal[' . $no_jurnal . '][id_company]" value="' . $id_company . '">';
                $hasil_jurnal .= '<input type="hidden" name="jurnal[' . $no_jurnal . '][nm_company]" value="' . $nm_company . '">';
                $hasil_jurnal .= '</td>';

                $hasil_jurnal .= '<td class="text-center">';
                $hasil_jurnal .= $item_coa->nm_coa;
                $hasil_jurnal .= '<input type="hidden" name="jurnal[' . $no_jurnal . '][nm_coa]" value="' . $item_coa->nm_coa . '">';
                $hasil_jurnal .= '</td>';

                $hasil_jurnal .= '<td class="text-right">';
                $hasil_jurnal .= number_format($debit);
                $hasil_jurnal .= '<input type="hidden" name="jurnal[' . $no_jurnal . '][debit]" value="' . $debit . '">';
                $hasil_jurnal .= '</td>';

                $hasil_jurnal .= '<td class="text-right">';
                $hasil_jurnal .= number_format($kredit);
                $hasil_jurnal .= '<input type="hidden" name="jurnal[' . $no_jurnal . '][kredit]" value="' . $kredit . '">';
                $hasil_jurnal .= '</td>';

                $hasil_jurnal .= '</tr>';

                $ttl_debit += $debit;
                $ttl_kredit += $kredit;
            }
        }

        if ($kontrol < 0) {
            $arr_coa_jurnal = ['5010-12-5', '1030-20-4', '2040-20-0'];

            $this->gl->select('a.no_perkiraan, a.nama as nm_coa');
            $this->gl->from('coa_master a');
            $this->gl->where_in('a.no_perkiraan', $arr_coa_jurnal);
            $get_coa = $this->gl->get()->result();

            $hasil_jurnal = '';
            $no_jurnal = 0;

            $ttl_debit = 0;
            $ttl_kredit = 0;
            foreach ($get_coa as $item_coa) {
                $no_jurnal++;

                $debit = 0;
                $kredit = 0;

                if ($item_coa->no_perkiraan == '5010-12-5') {
                    $debit = $total_expense;
                }
                if ($item_coa->no_perkiraan == '1030-20-4') {
                    $kredit = $total_kasbon;
                }
                if ($item_coa->no_perkiraan == '2040-20-0') {
                    $kredit = ($kontrol * -1);
                }


                $hasil_jurnal .= '<tr>';

                $hasil_jurnal .= '<td class="text-center">';
                $hasil_jurnal .= date('d F Y');
                $hasil_jurnal .= '<input type="hidden" name="jurnal[' . $no_jurnal . '][tgl_jurnal]" value="' . date('Y-m-d') . '">';
                $hasil_jurnal .= '</td>';

                $hasil_jurnal .= '<td class="text-center">';
                $hasil_jurnal .= $item_coa->no_perkiraan;
                $hasil_jurnal .= '<input type="hidden" name="jurnal[' . $no_jurnal . '][coa]" value="' . $item_coa->no_perkiraan . '">';
                $hasil_jurnal .= '</td>';

                $hasil_jurnal .= '<td class="text-center">';
                $hasil_jurnal .= $nm_company;
                $hasil_jurnal .= '<input type="hidden" name="jurnal[' . $no_jurnal . '][id_company]" value="' . $id_company . '">';
                $hasil_jurnal .= '<input type="hidden" name="jurnal[' . $no_jurnal . '][nm_company]" value="' . $nm_company . '">';
                $hasil_jurnal .= '</td>';

                $hasil_jurnal .= '<td class="text-center">';
                $hasil_jurnal .= $item_coa->nm_coa;
                $hasil_jurnal .= '<input type="hidden" name="jurnal[' . $no_jurnal . '][nm_coa]" value="' . $item_coa->nm_coa . '">';
                $hasil_jurnal .= '</td>';

                $hasil_jurnal .= '<td class="text-right">';
                $hasil_jurnal .= number_format($debit);
                $hasil_jurnal .= '<input type="hidden" name="jurnal[' . $no_jurnal . '][debit]" value="' . $debit . '">';
                $hasil_jurnal .= '</td>';

                $hasil_jurnal .= '<td class="text-right">';
                $hasil_jurnal .= number_format($kredit);
                $hasil_jurnal .= '<input type="hidden" name="jurnal[' . $no_jurnal . '][kredit]" value="' . $kredit . '">';
                $hasil_jurnal .= '</td>';

                $hasil_jurnal .= '</tr>';

                $ttl_debit += $debit;
                $ttl_kredit += $kredit;
            }
        }

        $response = [
            'hasil' => $hasil_jurnal,
            'ttl_debit' => $ttl_debit,
            'ttl_kredit' => $ttl_kredit
        ];

        echo json_encode($response);
    }
}
