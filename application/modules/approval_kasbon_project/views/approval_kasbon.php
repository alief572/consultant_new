<?php
$ENABLE_ADD     = has_permission('Kasbon_Project.Add');
$ENABLE_MANAGE  = has_permission('Kasbon_Project.Manage');
$ENABLE_VIEW    = has_permission('Kasbon_Project.View');
$ENABLE_DELETE  = has_permission('Kasbon_Project.Delete');
?>

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

  .dropdown-menu {

    position: absolute;
    top: 100%;
    /* Position below the button */
    right: 0;
    /* Align with left edge */
  }

  .valign-middle {
    vertical-align: middle !important;
  }
</style>

<input type="hidden" name="id_spk_budgeting" value="<?= $list_budgeting->id_spk_budgeting ?>">

<div class="box">
  <div class="box-header">

  </div>

  <div class="box-body" style="z-index: 1 !important;">
    <table border="0" style="width: 100%; z-index: 1 !important;">
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
        <td class="pd-5 valign-top" width="400"><?= $list_budgeting->nm_paket ?></td>
        <th class="pd-5 valign-top" width="150"></th>
        <td class="pd-5 valign-top" width="400"></td>
      </tr>
    </table>
  </div>
</div>

<div class="box">
  <div class="box-header">
    <h4>List Subcont</h4>
    <hr>
  </div>

  <div class="box-body">
    <table class="table custom-table">
      <thead>
        <tr>
          <th rowspan="2" class="text-center" valign="middle">No.</th>
          <th rowspan="2" class="text-center" valign="middle" width="170">Item</th>
          <th colspan="2" class="text-center">Estimasi</th>
          <th rowspan="2" class="text-center" valign="middle">Total Budget</th>
          <th colspan="3" class="text-center">Pengajuan</th>
          <th rowspan="2" class="text-center" valign="middle">Sisa Qty</th>
          <th rowspan="2" class="text-center" valign="middle">Sisa Budget</th>
        </tr>
        <tr>
          <th class="text-center">Qty</th>
          <th class="text-center">Price / Unit</th>
          <th class="text-center">Qty</th>
          <th class="text-center">Price / Unit</th>
          <th class="text-center">Total Pengajuan</th>
        </tr>
      </thead>
      <tbody>
        <?php
        $no = 0;

        $ttl_estimasi_subcont = 0;
        $ttl_pengajuan_subcont = 0;
        $ttl_aktual_subcont = 0;
        $ttl_sisa_subcont = 0;
        foreach ($list_kasbon_subcont as $item) {
          $no++;

          echo '<tr>';

          echo '<td class="text-center">' . $no . '</td>';
          echo '<td class="text-left">' . $item->nm_aktifitas . '</td>';
          echo '<td class="text-center">' . number_format($item->qty_estimasi) . '</td>';
          echo '<td class="text-right">' . number_format($item->price_unit_estimasi, 2) . '</td>';
          echo '<td class="text-right">' . number_format($item->total_budget_estimasi, 2) . '</td>';
          echo '<td class="text-center">' . number_format($item->qty_pengajuan) . '</td>';
          echo '<td class="text-right">' . number_format($item->nominal_pengajuan, 2) . '</td>';
          echo '<td class="text-right">' . number_format($item->total_pengajuan, 2) . '</td>';
          echo '<td class="text-center">' . number_format($item->aktual_terpakai) . '</td>';
          echo '<td class="text-right">' . number_format($item->sisa_budget, 2) . '</td>';
          echo '</tr>';

          $ttl_estimasi_subcont += $item->total_budget_estimasi;
          $ttl_pengajuan_subcont += $item->total_pengajuan;
          $ttl_aktual_subcont += $item->aktual_terpakai;
          $ttl_sisa_subcont += $item->sisa_budget;
        }
        ?>
      </tbody>
      <tfoot>
        <tr>
          <th colspan="4" class="text-right">Grand Total</th>
          <th class="text-right"><?= number_format($ttl_estimasi_subcont, 2) ?></th>
          <th colspan="2"></th>
          <th class="text-right"><?= number_format($ttl_pengajuan_subcont, 2) ?></th>
          <th class="text-center"><?= number_format($ttl_aktual_subcont) ?></th>
          <th class="text-right"><?= number_format($ttl_sisa_subcont, 2) ?></th>
        </tr>
      </tfoot>
    </table>
  </div>
</div>

<div class="box">
  <div class="box-header">
    <h4>List Akomodasi</h4>
    <hr>
  </div>

  <div class="box-body">
    <table class="table custom-table">
      <thead>
        <tr>
          <th rowspan="2" class="text-center" valign="middle">No.</th>
          <th rowspan="2" class="text-center" valign="middle" width="170">Item</th>
          <th colspan="2" class="text-center">Estimasi</th>
          <th rowspan="2" class="text-center" valign="middle">Total Budget</th>
          <th colspan="3" class="text-center">Pengajuan</th>
          <th rowspan="2" class="text-center" valign="middle">Qty Budget Tambahan</th>
          <th rowspan="2" class="text-center" valign="middle">Budget Tambahan</th>
          <th rowspan="2" class="text-center" valign="middle">Sisa Qty</th>
          <th rowspan="2" class="text-center" valign="middle">Sisa Budget</th>
        </tr>
        <tr>
          <th class="text-center">Qty</th>
          <th class="text-center">Price / Unit</th>
          <th class="text-center">Qty</th>
          <th class="text-center">Price / Unit</th>
          <th class="text-center">Total Pengajuan</th>
        </tr>
      </thead>
      <tbody>
        <?php
        $no = 0;

        $ttl_estimasi_akomodasi = 0;
        $ttl_pengajuan_akomodasi = 0;
        $ttl_qty_tambahan_akomodasi = 0;
        $ttl_qty_sisa_akomodasi = 0;
        $ttl_sisa_budget_akomodasi = 0;

        foreach ($list_kasbon_akomodasi as $item) {
          $no++;

          echo '<tr>';

          echo '<td class="text-center">' . $no . '</td>';
          echo '<td class="text-left">' . $item->nm_biaya . '</td>';
          echo '<td class="text-center">' . number_format($item->qty_estimasi) . '</td>';
          echo '<td class="text-right">' . number_format($item->price_unit_estimasi, 2) . '</td>';
          echo '<td class="text-right">' . number_format($item->total_budget_estimasi, 2) . '</td>';
          echo '<td class="text-center">' . number_format($item->qty_pengajuan) . '</td>';
          echo '<td class="text-right">' . number_format($item->nominal_pengajuan, 2) . '</td>';
          echo '<td class="text-right">' . number_format($item->total_pengajuan, 2) . '</td>';
          echo '<td class="text-center">' . number_format($item->qty_budget_tambahan) . '</td>';
          echo '<td class="text-right">' . number_format($item->budget_tambahan, 2) . '</td>';
          echo '<td class="text-center">' . number_format($item->aktual_terpakai) . '</td>';
          echo '<td class="text-right">' . number_format($item->sisa_budget, 2) . '</td>';
          echo '</tr>';

          $ttl_estimasi_akomodasi += $item->total_budget_estimasi;
          $ttl_pengajuan_akomodasi += $item->total_pengajuan;
          $ttl_qty_tambahan_akomodasi += $item->qty_budget_tambahan;
          $ttl_qty_sisa_akomodasi += $item->aktual_terpakai;
          $ttl_sisa_budget_akomodasi += $item->sisa_budget;
        }
        ?>
      </tbody>
      <tfoot>
        <tr>
          <th colspan="4"></th>
          <th class="text-right"><?= number_format($ttl_estimasi_akomodasi, 2) ?></th>
          <th colspan="2"></th>
          <th class="text-right"><?= number_format($ttl_pengajuan_akomodasi, 2) ?></th>
          <th class="text-center"><?= number_format($ttl_qty_tambahan_akomodasi) ?></th>
          <th class="text-right"></th>
          <th class="text-center"><?= number_format($ttl_qty_sisa_akomodasi) ?></th>
          <th class="text-right"><?= number_format($ttl_sisa_budget_akomodasi, 2) ?></th>
        </tr>
      </tfoot>
    </table>
  </div>
</div>

<div class="box">
  <div class="box-header">
    <h4>List Others</h4>
    <hr>
  </div>

  <div class="box-body">
    <table class="table custom-table">
      <thead>
        <tr>
          <th rowspan="2" class="text-center" valign="middle">No.</th>
          <th rowspan="2" class="text-center" valign="middle" width="170">Item</th>
          <th colspan="2" class="text-center">Estimasi</th>
          <th rowspan="2" class="text-center" valign="middle">Total Budget</th>
          <th colspan="3" class="text-center">Pengajuan</th>
          <th rowspan="2" class="text-center" valign="middle">Sisa Qty</th>
          <th rowspan="2" class="text-center" valign="middle">Sisa Budget</th>
        </tr>
        <tr>
          <th class="text-center">Qty</th>
          <th class="text-center">Price / Unit</th>
          <th class="text-center">Qty</th>
          <th class="text-center">Price / Unit</th>
          <th class="text-center">Total Pengajuan</th>
        </tr>
      </thead>
      <tbody>
        <?php
        $ttl_estimasi_others = 0;
        $ttl_pengajuan_others = 0;
        $ttl_aktual_others = 0;
        $ttl_sisa_others = 0;

        $no = 0;
        foreach ($list_kasbon_others as $item) {
          $no++;

          echo '<tr>';

          echo '<td class="text-center">' . $no . '</td>';
          echo '<td class="text-left">' . $item->nm_biaya . '</td>';
          echo '<td class="text-center">' . number_format($item->qty_estimasi) . '</td>';
          echo '<td class="text-right">' . number_format($item->price_unit_estimasi, 2) . '</td>';
          echo '<td class="text-right">' . number_format($item->total_budget_estimasi, 2) . '</td>';
          echo '<td class="text-center">' . number_format($item->qty_pengajuan) . '</td>';
          echo '<td class="text-right">' . number_format($item->nominal_pengajuan, 2) . '</td>';
          echo '<td class="text-right">' . number_format($item->total_pengajuan, 2) . '</td>';
          echo '<td class="text-center">' . number_format($item->aktual_terpakai) . '</td>';
          echo '<td class="text-right">' . number_format($item->sisa_budget, 2) . '</td>';
          echo '</tr>';

          $ttl_estimasi_others += $item->total_budget_estimasi;
          $ttl_pengajuan_others += $item->total_pengajuan;
          $ttl_aktual_others += $item->aktual_terpakai;
          $ttl_sisa_others += $item->sisa_budget;
        }
        ?>
      </tbody>
      <tfoot>
        <tr>
          <th colspan="4" class="text-right">Grand Total</th>
          <th class="text-right"><?= number_format($ttl_estimasi_others, 2) ?></th>
          <th colspan="2"></th>
          <th class="text-right"><?= number_format($ttl_pengajuan_others, 2) ?></th>
          <th class="text-center"><?= number_format($ttl_aktual_others) ?></th>
          <th class="text-right"><?= number_format($ttl_sisa_others, 2) ?></th>
        </tr>
      </tfoot>
    </table>

    <br><br>

    <div class="col-md-6">
      <div class="form-group">
        <label for="">Reject Reason</label>
        <textarea name="reject_reason" class="form-control form-control-sm" id="" cols="30" rows="5"></textarea>
      </div>
    </div>
  </div>
</div>

<a href="<?= base_url('approval_kasbon_project') ?>" class="btn btn-sm btn-danger">
  <i class="fa fa-arrow-left"></i> Back
</a>
<button type="button" class="btn btn-sm btn-danger reject_kasbon">
  <i class="fa fa-close"></i> Reject
</button>
<button type="button" class="btn btn-sm btn-primary approve_kasbon">
  <i class="fa fa-check"></i> Approve
</button>


<script src="<?= base_url('assets/js/autoNumeric.js'); ?>"></script>
<script src="https://cdn.datatables.net/2.1.8/js/dataTables.min.js"></script>

<script>
  $(document).ready(function() {

  });

  $(document).on('click', '.reject_kasbon', function(e) {
    e.preventDefault();

    var id_spk_budgeting = $('input[name="id_spk_budgeting"]').val();
    var reject_reason = $('input[name="reject_reason"]').val();

    if (reject_reason == '') {
      swal({
        type: 'warning',
        title: 'Warning !',
        text: 'Please fill the reject reason first !'
      });
    } else {
      swal({
        type: 'warning',
        title: 'Are you sure ?',
        text: 'This data will be rejected !'
      }, function(next) {
        if (next) {
          $.ajax({
            type: 'post',
            url: siteurl + active_controller + 'reject_kasbon',
            data: {
              'id_spk_budgeting': id_spk_budgeting,
              'reject_reason': reject_reason
            },
            cache: false,
            dataType: 'json',
            success: function(result) {
              if (result.status == '1') {
                swal({
                  type: 'success',
                  title: 'Success !',
                  text: result.pesan
                }, function(a) {
                  window.location.href = siteurl + active_controller;
                });
              } else {
                swal({
                  type: 'warning',
                  title: 'Failed !',
                  text: result.pesan
                });
              }
            },
            error: function() {
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
  });

  $(document).on('click', '.approve_kasbon', function(e) {
    e.preventDefault();

    var id_spk_budgeting = $('input[name="id_spk_budgeting"]').val();

    swal({
      type: 'warning',
      title: 'Are you sure ?',
      text: 'This data will be approved !'
    }, function(next) {
      if (next) {
        $.ajax({
          type: 'post',
          url: siteurl + active_controller + 'approve_kasbon',
          data: {
            'id_spk_budgeting': id_spk_budgeting
          },
          cache: false,
          dataType: 'json',
          success: function(result) {
            if (result.status == '1') {
              swal({
                type: 'success',
                title: 'Success !',
                text: result.pesan
              }, function(a) {
                window.location.href = siteurl + active_controller;
              });
            } else {
              swal({
                type: 'warning',
                title: 'Failed !',
                text: result.pesan
              });
            }
          },
          error: function() {
            swal({
              type: 'error',
              title: 'Error !',
              text: 'Please try again later !'
            });
          }
        });
      }
    });
  });
</script>