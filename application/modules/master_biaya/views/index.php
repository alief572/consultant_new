<?php
$ENABLE_ADD     = has_permission('Master_Biaya.Add');
$ENABLE_MANAGE  = has_permission('Master_Biaya.Manage');
$ENABLE_VIEW    = has_permission('Master_Biaya.View');
$ENABLE_DELETE  = has_permission('Master_Biaya.Delete');
?>
<style type="text/css">
	thead input {
		width: 100%;
	}
</style>
<div id='alert_edit' class="alert alert-success alert-dismissable" style="padding: 15px; display: none;"></div>
<link rel="stylesheet" href="<?= base_url('assets/plugins/datatables/dataTables.bootstrap.css') ?>">

<div class="box">
	<div class="box-header">
		<?php if ($ENABLE_ADD) : ?>
			<a class="btn btn-success btn-sm add" href="javascript:void(0)" title="Add"><i class="fa fa-plus">&nbsp;</i>Add</a>
		<?php endif; ?>

		<span class="pull-right">
		</span>
	</div>
	<!-- /.box-header -->
	<div class="box-body">
		<table id="example1" class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>#</th>
					<th>Nama Biaya</th>
					<th>Tipe Biaya</th>
					<th>Status</th>
					<th>Action</th>
				</tr>
			</thead>

			<tbody>

			</tbody>
		</table>
	</div>
	<!-- /.box-body -->
</div>

<!-- awal untuk modal dialog -->

<div class="modal modal-default fade" id="dialog-popup" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title" id="head_title">Default</h4>
			</div>
			<form action="" method="post" id="frm-data">
				<div class="modal-body" id="ModalView">

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger">
						<i class="fa fa-close"></i> Cancel
					</button>
					<button type="submit" class="btn btn-primary">
						<i class="fa fa-save"></i> Save
					</button>
				</div>
			</form>
		</div>
	</div>

	<!-- DataTables -->
	<script src="<?= base_url('assets/plugins/datatables/jquery.dataTables.min.js') ?>"></script>
	<script src="<?= base_url('assets/plugins/datatables/dataTables.bootstrap.min.js') ?>"></script>

	<!-- page script -->
	<script type="text/javascript">
		$(document).on('click', '.add', function() {
			$("#head_title").html("<b>Add Biaya</b>");
			$.ajax({
				type: 'POST',
				url: siteurl + active_controller + 'add/',
				success: function(data) {
					$("#dialog-popup").modal();
					$("#ModalView").html(data);
				}
			})
		});

		$(document).on('submit', '#frm-data', function(e) {
			e.preventDefault();

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
						url: siteurl + active_controller + 'save_biaya',
						data: formData,
						cache: false,
						dataType: 'json',
						success: function(result) {
							if (result.status == 1) {

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
		});

		$(function() {
			var table = $('#example1').DataTable({
				orderCellsTop: true,
				fixedHeader: true
			});
			$("#form-area").hide();
		});
	</script>