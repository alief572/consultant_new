<?php
$ENABLE_ADD     = has_permission('Master_Subcont_Perusahaan.Add');
$ENABLE_MANAGE  = has_permission('Master_Subcont_Perusahaan.Manage');
$ENABLE_VIEW    = has_permission('Master_Subcont_Perusahaan.View');
$ENABLE_DELETE  = has_permission('Master_Subcont_Perusahaan.Delete');
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
					<th>COA</th>
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
					<button type="button" class="btn btn-danger" data-dismiss="modal">
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
		$(document).ready(function() {
			datatables();
		});

		function datatables() {
			// var dataTable = $('#example1').dataTable();
			// datatable.destroy();

			var dataTable = $('#example1').dataTable({
				ajax: {
					url: siteurl + active_controller + 'get_data_biaya',
					type: "POST",
					dataType: "JSON",
					data: function(d) {

					}
				},
				columns: [{
					data: 'no',
				}, {
					data: 'nm_biaya'
				}, {
					data: 'coa'
				}, {
					data: 'option'
				}],
				responsive: true,
				processing: true,
				serverSide: true,
				stateSave: true,
				destroy: true,
				paging: true
			});
		}

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

		$(document).on('click', '.edit_biaya_modal', function() {
			var id = $(this).data('id');

			$("#head_title").html("<b>Edit Biaya</b>");
			$.ajax({
				type: 'POST',
				url: siteurl + active_controller + 'edit/',
				data: {
					'id': id
				},
				success: function(data) {
					$("#dialog-popup").modal();
					$("#ModalView").html(data);
				}
			})
		});

		$(document).on('submit', '#frm-data', function(e) {
			e.preventDefault();

			Swal.fire({
				icon: 'warning',
				title: 'Are you sure ?',
				text: 'This data will be saved !',
				showCancelButton: true,
				showConfirmButton: true,
				allowOutsideClick: false
			}).then((next) => {
				if (next.isConfirmed) {
					var formData = $('#frm-data').serialize();

					$.ajax({
						type: 'post',
						url: siteurl + active_controller + 'save_biaya',
						data: formData,
						cache: false,
						dataType: 'json',
						success: function(result) {
							if (result.status == 1) {
								Swal.fire({
									icon: 'success',
									title: 'Success !',
									text: result.pesan,
									allowOutsideClick: false,
									showConfirmButton: false,
									timer: 3000,
									allowEscapeKey: false,
									timerProgressBar: true
								}).then(() => {
									swal.close();
									$('#dialog-popup').modal('hide');
									datatables();
								});
							} else {
								Swal.fire({
									icon: 'warning',
									title: 'Failed !',
									text: result.pesan,
									showConfirmButton: false,
									showCancelButton: false,
									allowOutsideClick: false,
									timer: 3000
								});
							}
						},
						error: function(result) {
							Swal.fire({
								icon: 'error',
								title: 'Error !',
								text: 'Please try again later !',
								showConfirmButton: false,
								showCancelButton: false,
								allowOutsideClick: false,
								timer: 3000
							});
						}
					});
				}
			});
		});

		$(document).on('click', '.del_biaya', function() {
			var id = $(this).data('id');

			Swal.fire({
				icon: 'warning',
				title: 'Are you sure ?',
				text: 'This will delete the data !',
				showCancelButton: true,
				showConfirmButton: true,
				allowOutsideClick: false
			}).then((next) => {
				if (next.isConfirmed) {
					$.ajax({
						type: 'post',
						url: siteurl + active_controller + 'del_biaya',
						data: {
							'id': id
						},
						cache: false,
						dataType: 'JSON',
						success: function(result) {
							if (result.status == 1) {
								Swal.fire({
									icon: 'success',
									title: 'Success !',
									text: result.pesan,
									allowOutsideClick: false,
									showConfirmButton: false,
									timer: 3000,
									allowEscapeKey: false,
									timerProgressBar: true
								}).then(() => {
									swal.close();
									datatables();
								});
							} else {
								Swal.fire({
									icon: 'warning',
									title: 'Failed !',
									text: result.pesan,
									showCancelButton: false,
									showConfirmButton: false,
									allowOutsideClick: false,
									timer: 3000
								});
							}
						},
						error: function(result) {
							Swal.fire({
								icon: 'error',
								title: 'Error !',
								text: 'Please try again later !',
								showCancelButton: false,
								showConfirmButton: false,
								allowOutsideClick: false,
								timer: 3000
							});
						}
					});
				}
			});
		})
	</script>