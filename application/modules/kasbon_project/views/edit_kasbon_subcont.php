<?php
$ENABLE_ADD     = has_permission('Kasbon_Project.Add');
$ENABLE_MANAGE  = has_permission('Kasbon_Project.Manage');
$ENABLE_VIEW    = has_permission('Kasbon_Project.View');
$ENABLE_DELETE  = has_permission('Kasbon_Project.Delete');
?>
<!-- <link rel="stylesheet" href="<?= base_url('assets/plugins/datatables/dataTables.bootstrap.css') ?>"> -->
<link rel="stylesheet" href="https://cdn.datatables.net/2.1.7/css/dataTables.dataTables.min.css">

<style>
    .btn {
        border-radius: 10px;
    }

    .dropdown-menu {
        top: 100%;
        position: absolute;
        overflow: auto;
    }

    .pd-5 {
        padding: 5px;
    }

    .form-inline .form-control {
        width: auto;
        /* Let elements adjust automatically */
        max-width: 100%;
        /* Prevent overflow */
    }

    .form-inline {
        display: flex;
        /* Use flexbox for better alignment */
        justify-content: flex-start;
        /* Align items to the left */
        flex-wrap: nowrap;
        /* Prevent wrapping to the next line */
    }

    .top-total-project {
        width: 280px;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 15px;
    }

    .pd-5 {
        padding: 5px;
    }

    .valign-top {
        vertical-align: top;
    }

    .mt-5 {
        margin-top: 5px;
    }

    .valign-middle {
        vertical-align: middle !important;
    }
</style>

<form action="" method="post" id="frm-data" enctype="multipart/form-data">
    <input type="hidden" name="id" value="<?= $header->id ?>">
    <input type="hidden" name="id_spk_budgeting" value="<?= $list_budgeting->id_spk_budgeting ?>">
    <input type="hidden" name="id_spk_penawaran" value="<?= $list_budgeting->id_spk_penawaran ?>">
    <input type="hidden" name="id_penawaran" value="<?= $list_budgeting->id_penawaran ?>">
    <div class="box">
        <div class="box-header">

        </div>

        <div class="box-body">
            <table border="0" style="width: 100%;">
                <tr>
                    <th class="pd-5 valign-top" width="150">No. SPK</th>
                    <td class="pd-5 valign-top" width="400"><?= $list_budgeting->id_spk_penawaran ?></td>
                    <th class="pd-5 valign-top" width="150">Project Leader</th>
                    <td class="pd-5 valign-top" width="400"><?= ucfirst($list_budgeting->nm_project_leader) ?></td>
                </tr>
                <tr>
                    <th class="pd-5 valign-top" width="150">Customer</th>
                    <td class="pd-5 valign-top" width="400"><?= $list_budgeting->nm_customer ?></td>
                    <th class="pd-5 valign-top" width="150">Sales</th>
                    <td class="pd-5 valign-top" width="400"><?= ucfirst($list_budgeting->nm_sales) ?></td>
                </tr>
                <tr>
                    <th class="pd-5 valign-top" width="150">Address</th>
                    <td class="pd-5 valign-top" width="400"><?= $list_budgeting->alamat ?></td>
                    <th class="pd-5 valign-top" width="150">Waktu</th>
                    <td class="pd-5 valign-top" width="400">
                        <div class="form-inline">
                            <div class="form-group">
                                <input type="date" name="" id="" class="form-control form-control-sm" value="<?= $list_budgeting->waktu_from ?>" readonly>
                            </div>
                            <div class="form-group text-center" style="width: 50px; padding-top: 8px;">
                                <span>-</span>
                            </div>
                            <div class="form-group">
                                <input type="date" name="" id="" class="form-control form-control-sm" value="<?= $list_budgeting->waktu_to ?>" readonly>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th class="pd-5 valign-top" width="150">Project</th>
                    <td class="pd-5 valign-top" width="400"><?= $list_budgeting->nm_project ?></td>
                    <th class="pd-5 valign-top" width="150"></th>
                    <td class="pd-5 valign-top" width="400">
                        
                    </td>
                </tr>
                <tr>
                    <th class="pd-5 valign-top" width="150">Tanggal</th>
                    <td class="pd-5 valign-top" width="400">
                        <input type="date" name="tgl" id="" class="form-control form-control-sm" value="<?= date('Y-m-d', strtotime($header->tgl)) ?>" required>
                    </td>
                    <th class="pd-5 valign-top" width="150">Description</th>
                    <td class="pd-5 valign-top" width="400">
                        <textarea name="deskripsi" id="" class="form-control form-control-sm"><?= $header->deskripsi ?></textarea>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <div class="box">
        <div class="box-header">
            <h4 style="font-weight: 800;">List Item Subcont</h4>
        </div>

        <div class="box-body">
            <table class="table custom-table">
                <thead>
                    <tr>
                        <th rowspan="2" class="text-center valign-middle">No</th>
                        <th rowspan="2" class="text-center valign-middle">Item</th>
                        <th colspan="2" class="text-center valign-middle">Pengajuan</th>
                        <th colspan="3" class="text-center valign-middle">Estimasi</th>
                        <th rowspan="2" class="text-center valign-middle">Aktual Terpakai</th>
                        <th rowspan="2" class="text-center valign-middle">Sisa Budget</th>
                    </tr>
                    <tr>
                        <th class="text-center valign-middle">Qty</th>
                        <th class="text-center valign-middle">Nominal</th>
                        <th class="text-center valign-middle">Qty</th>
                        <th class="text-center valign-middle">Price/Unit</th>
                        <th class="text-center valign-middle">Total Budget</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $no = 1;

                    $ttl_est_qty = 0;
                    $ttl_est_price_unit = 0;
                    $ttl_est_total_budget = 0;

                    $ttl_aktual_terpakai = 0;
                    $ttl_sisa_budget = 0;

                    $ttl_qty_pengajuan = 0;
                    $ttl_nominal_pengajuan = 0;

                    foreach ($list_subcont as $item) {

                        $aktual_terpakai = (isset($data_kasbon_subcont[$item->id_aktifitas]['ttl_qty_pengajuan'])) ? $data_ : 0;
                        $sisa_budget = (isset($data_kasbon_subcont[$item->id_aktifitas]['ttl_total_pengajuan'])) ? (($item->mandays_rate_subcont_final * $item->mandays_subcont_final) - $data_kasbon_subcont[$item->id_aktifitas]['ttl_total_pengajuan']) : ($item->mandays_rate_subcont_final * $item->mandays_subcont_final);

                        $qty_pengajuan = (isset($data_kasbon_subcont[$item->id_aktifitas]['qty_pengajuan'])) ? $data_kasbon_subcont[$item->id_aktifitas]['qty_pengajuan'] : 0;

                        $nominal_pengajuan = (isset($data_kasbon_subcont[$item->id_aktifitas]['nominal_pengajuan'])) ? $data_kasbon_subcont[$item->id_aktifitas]['nominal_pengajuan'] : 0;

                        $readonly = '';
                        // if ($sisa_budget <= 0) {
                        //     $readonly = 'readonly';
                        // }



                        echo '<tr>';

                        echo '<td class="text-center">' . $no . '</td>';
                        echo '<td>';
                        echo $item->nm_aktifitas;
                        echo '<input type="hidden" name="detail_subcont[' . $no . '][id_aktifitas]" value="' . $item->id_aktifitas . '">';
                        echo '<input type="hidden" name="detail_subcont[' . $no . '][nm_aktifitas]" value="' . $item->nm_aktifitas . '">';
                        echo '</td>';

                        echo '<td>';
                        echo '<input type="text" name="detail_subcont[' . $no . '][qty_pengajuan]" class="form-control form-control-sm text-right auto_num" value="'.$qty_pengajuan.'" onchange="hitung_all_pengajuan()" ' . $readonly . '>';
                        echo '</td>';

                        echo '<td>';
                        echo '<input type="text" name="detail_subcont[' . $no . '][nominal_pengajuan]" class="form-control form-control-sm text-right auto_num" value="'.$nominal_pengajuan.'" onchange="hitung_all_pengajuan()" ' . $readonly . '>';
                        echo '</td>';

                        echo '<td class="text-center">';
                        echo number_format($item->mandays_subcont_final);
                        echo '<input type="hidden" name="detail_subcont[' . $no . '][qty_estimasi]" value="' . $item->mandays_subcont_final . '">';
                        echo '</td>';

                        echo '<td class="text-center">';
                        echo number_format($item->mandays_rate_subcont_final, 2);
                        echo '<input type="hidden" name="detail_subcont[' . $no . '][price_unit_estimasi]" value="' . $item->mandays_rate_subcont_final . '">';
                        echo '</td>';

                        echo '<td class="text-center">';
                        echo number_format(($item->mandays_rate_subcont_final * $item->mandays_subcont_final), 2);
                        echo '<input type="hidden" name="detail_subcont[' . $no . '][total_estimasi]" value="' . ($item->mandays_rate_subcont_final * $item->mandays_subcont_final) . '">';
                        echo '</td>';

                        echo '<td class="text-center">';
                        echo number_format($aktual_terpakai);
                        echo '<input type="hidden" name="detail_subcont[' . $no . '][aktual_terpakai]" value="' . $aktual_terpakai . '">';
                        echo '</td>';

                        echo '<td class="text-center">';
                        echo number_format($sisa_budget, 2);
                        echo '<input type="hidden" name="detail_subcont[' . $no . '][sisa_budget]" value="' . $sisa_budget . '">';
                        echo '</td>';

                        echo '</tr>';

                        $ttl_qty_pengajuan += $qty_pengajuan;
                        $ttl_nominal_pengajuan += $nominal_pengajuan;

                        $ttl_est_qty += $item->mandays_subcont_final;
                        $ttl_est_price_unit += $item->mandays_rate_subcont_final;
                        $ttl_est_total_budget += ($item->mandays_rate_subcont_final * $item->mandays_subcont_final);

                        $ttl_aktual_terpakai += $aktual_terpakai;
                        $ttl_sisa_budget += $sisa_budget;

                        $no++;
                    }
                    ?>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="2" class="text-center">Total</td>
                        <td class="text-center ttl_qty_pengajuan"><?= number_format($ttl_qty_pengajuan) ?></td>
                        <td class="text-center ttl_nominal_pengajuan"><?= number_format($ttl_nominal_pengajuan, 2) ?></td>
                        <td class="text-center"><?= number_format($ttl_est_qty) ?></td>
                        <td class="text-center"><?= number_format($ttl_est_price_unit, 2) ?></td>
                        <td class="text-center"><?= number_format($ttl_est_total_budget, 2) ?></td>
                        <td class="text-center"><?= number_format($ttl_aktual_terpakai) ?></td>
                        <td class="text-center"><?= number_format($ttl_sisa_budget, 2) ?></td>
                    </tr>
                </tfoot>
            </table>

            <br><br>

            <div class="col-md-6">
                <table style="width: 100%">
                    <tr>
                        <th style="padding: 5px;">Document</th>
                        <td style="padding: 5px;">
                            <input type="file" name="kasbon_document" id="" class="form-control form-control-sm">
                            <input type="hidden" name="dokument_link" value="<?= $header->dokument_link ?>">
                            <?php 
                                if(file_exists('./'.$header->dokument_link)) {
                                    echo '<a href="'.base_url($header->dokument_link).'" class="btn btn-sm btn-primary" target="_blank">
                                        <i class="fa fa-download"></i> Download
                                    </a>';
                                }
                            ?>
                        </td>
                    </tr>
                    <tr>
                        <th style="padding: 5px;">Bank</th>
                        <td style="padding: 5px;">
                            <input type="text" name="kasbon_bank" id="" class="form-control form-control-sm" placeholder="- Bank -" value="<?= $header->bank ?>">
                        </td>
                    </tr>
                    <tr>
                        <th style="padding: 5px;">Bank Number</th>
                        <td style="padding: 5px;">
                            <input type="text" name="kasbon_bank_number" id="" class="form-control form-control-sm" placeholder="- Bank Number -" value="<?= $header->bank_number ?>">
                        </td>
                    </tr>
                    <tr>
                        <th style="padding: 5px;">Account Name</th>
                        <td style="padding: 5px;">
                            <input type="text" name="kasbon_bank_account" id="" class="form-control form-control-sm" placeholder="- Account Name -" value="<?= $header->bank_account ?>">
                        </td>
                    </tr>
                </table>
            </div>

            <div class="col-md-12 mt-5">
                <a href="<?= base_url('kasbon_project/add_kasbon/' . urlencode(str_replace('/', '|', $list_budgeting->id_spk_budgeting))) ?>" class="btn btn-sm btn-danger">
                    <i class="fa fa-arrow-left"></i> Back
                </a>
                <button type="submit" class="btn btn-sm btn-success">
                    <i class="fa fa-save"></i> Save
                </button>
            </div>
        </div>
    </div>
</form>


<script src="<?= base_url('assets/js/autoNumeric.js'); ?>"></script>
<script>
    $(document).ready(function() {
        $('.auto_num').autoNumeric();
    });

    function number_format(number, decimals, dec_point, thousands_sep) {
        // Strip all characters but numerical ones.
        number = (number + '').replace(/[^0-9+\-Ee.]/g, '');
        var n = !isFinite(+number) ? 0 : +number,
            prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
            sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
            dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
            s = '',
            toFixedFix = function(n, prec) {
                var k = Math.pow(10, prec);
                return '' + Math.round(n * k) / k;
            };
        // Fix for IE parseFloat(0.55).toFixed(0) = 0;
        s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
        if (s[0].length > 3) {
            s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
        }
        if ((s[1] || '').length < prec) {
            s[1] = s[1] || '';
            s[1] += new Array(prec - s[1].length + 1).join('0');
        }
        return s.join(dec);
    }

    function get_num(nilai = null) {
        if (nilai !== '' && nilai !== null) {
            nilai = nilai.split(',').join('');
            nilai = parseFloat(nilai);
        } else {
            nilai = 0;
        }

        return nilai;
    }

    function hitung_all_pengajuan() {
        var no = "<?= $no ?>";

        var ttl_qty = 0;
        var ttl_price = 0;

        for (i = 1; i <= no; i++) {
            var qty_pengajuan = get_num($('input[name="detail_subcont[' + i + '][qty_pengajuan]"]').val());
            var nominal_pengajuan = get_num($('input[name="detail_subcont[' + i + '][nominal_pengajuan]"]').val());

            ttl_qty += qty_pengajuan;
            ttl_price += nominal_pengajuan;
        }

        $('.ttl_qty_pengajuan').html(number_format(ttl_qty));
        $('.ttl_nominal_pengajuan').html(number_format(ttl_price, 2));
    }

    $(document).on('submit', '#frm-data', function(e) {
        e.preventDefault();

        var no = "<?= $no ?>";

        var valid = 1;

        for (i = 1; i <= no; i++) {
            var qty_pengajuan = get_num($('input[name="detail_subcont[' + i + '][qty_pengajuan]"]').val());
            var qty_estimasi = get_num($('input[name="detail_subcont[' + i + '][qty_estimasi]"]').val());
            var nominal_pengajuan = get_num($('input[name="detail_subcont[' + i + '][nominal_pengajuan]"]').val());
            var price_unit_estimasi = get_num($('input[name="detail_subcont[' + i + '][price_unit_estimasi]"]').val());

            if (valid == '1' && qty_pengajuan > qty_estimasi) {
                valid = 0;
            }
            if (valid == '1' && nominal_pengajuan > price_unit_estimasi) {
                valid = 0;
            }
        }

        if (valid == '0') {
            swal({
                type: 'warning',
                title: 'Warning !',
                text: 'Qty atau Nominal pengajuan melebihi estimasi !'
            });
        } else {
            swal({
                type: 'warning',
                title: 'Are you sure ?',
                text: 'This data will be saved !',
                showCancelButton: true
            }, function(next) {
                if (next) {
                    var formData = new FormData($('#frm-data')[0]);

                    $.ajax({
                        type: 'post',
                        url: siteurl + active_controller + 'update_kasbon_subcont',
                        data: formData,
                        cache: false,
                        processData: false,
                        contentType: false,
                        dataType: 'JSON',
                        success: function(result) {
                            if (result.status == '1') {
                                swal({
                                    type: 'success',
                                    title: 'Success !',
                                    text: result.pesan
                                }, function(lanjut) {
                                    window.location.href = siteurl + active_controller + "add_kasbon/<?= urlencode(str_replace('/', '|', $list_budgeting->id_spk_budgeting)) ?>"
                                });
                            } else {
                                swal({
                                    type: 'warning',
                                    title: 'Failed !',
                                    text: result.pesan
                                });
                            }
                        },
                        error: function(result) {
                            swal({
                                type: 'error',
                                title: 'Error !',
                                text: 'Please try again later !'
                            });
                        }
                    });
                }
            });
        }

    })
</script>