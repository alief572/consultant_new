<?php
    $ENABLE_ADD     = has_permission('Product_Type.Add');
    $ENABLE_MANAGE  = has_permission('Product_Type.Manage');
    $ENABLE_VIEW    = has_permission('Product_Type.View');
    $ENABLE_DELETE  = has_permission('Product_Type.Delete');

	$id = (!empty($listData[0]->id))?$listData[0]->id:'';
	$code = (!empty($listData[0]->code_lv1))?$listData[0]->code_lv1:'';
	$nama = (!empty($listData[0]->nama))?$listData[0]->nama:'';

	$status1 = (!empty($listData[0]->status) AND $listData[0]->status == '1')?'checked':'';
	$status2 = (!empty($listData[0]->status) AND $listData[0]->status == '2')?'checked':'';
?>
<div class="box box-primary">
	<div class="box-body">
		<form id="data_form" autocomplete="off">
			<div class="form-group row">
				<div class="col-md-3">
				<label for="">Product Type <span class='text-danger'>*</span></label>
				</div>
				<div class="col-md-9">
				<input type="hidden" class="form-control" id="id" name="id" value='<?=$id;?>'>
				<input type="hidden" class="form-control" id="code" name="code" value='<?=$code;?>'>
				<input type="text" class="form-control" id="nama" required name="nama" placeholder="Product Type" value='<?=$nama;?>'>
				</div>
			</div>
			<?php if(!empty($id)){ ?>
			<div class="form-group row">
				<div class="col-md-3">
					<label for="">Status</label>
				</div>
				<div class="col-md-4">
					<label>
					<input type="radio" class="radio-control" name="status" value="1" <?=$status1;?>> Aktif
					</label>
					&nbsp &nbsp &nbsp
					<label>
					<input type="radio" class="radio-control" name="status" value="0" <?=$status2;?>> Non-Aktif
					</label>
				</div>
			</div>
			<?php } ?>
			<div class="form-group row">
				<div class="col-md-3"></div>
				<div class="col-md-9">
				<button type="submit" class="btn btn-primary" name="save" id="save"><i class="fa fa-save"></i> Save</button>
				</div>
			</div>
		</form>
	</div>
</div>
