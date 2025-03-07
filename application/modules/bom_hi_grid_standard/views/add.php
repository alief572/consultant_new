<?php

$no_bom          = (!empty($header))?$header[0]->no_bom:'';
$id_product      = (!empty($header))?$header[0]->id_product:'';
$waste_product   = (!empty($header))?$header[0]->waste_product:'';
$waste_setting   = (!empty($header))?$header[0]->waste_setting:'';
$variant_product   = (!empty($header))?$header[0]->variant_product:'';

$fire_retardant = (!empty($header[0]->fire_retardant))?$header[0]->fire_retardant:'0';
$anti_uv 		= (!empty($header[0]->anti_uv))?$header[0]->anti_uv:'0';
$tixotropic 	= (!empty($header[0]->tixotropic))?$header[0]->tixotropic:'0';
$food_grade 	= (!empty($header[0]->food_grade))?$header[0]->food_grade:'0';
$wax 			= (!empty($header[0]->wax))?$header[0]->wax:'0';
$corrosion 		= (!empty($header[0]->corrosion))?$header[0]->corrosion:'0';

$variant_product   	= (!empty($header))?$header[0]->variant_product:'';
$color_product   	= (!empty($header))?$header[0]->color:'';
$surface_product   	= (!empty($header))?$header[0]->surface:'';
$keterangan   		= (!empty($header))?$header[0]->keterangan:'';

$kode   		= (!empty($header))?$header[0]->kode:'';

// print_r($header);
?>

 <div class="box box-primary">
    <div class="box-body">
		<form id="data-form" method="post"><br>
			<div class="form-group row">
				<div class="col-md-2">
					<label for="customer">Product Master <span class='text-red'>*</span></label>
				</div>
				<div class="col-md-4">
					<input type="hidden" name="no_bom" value="<?=$no_bom;?>">
					<select id="id_product" name="id_product" class="form-control input-md chosen-select" required>
						<option value="0">Select An Option</option>
						<?php foreach ($results['product'] as $product){
						$sel = ($product->code_lv4 == $id_product)?'selected':'';
						?>
						<option value="<?= $product->code_lv4;?>" <?=$sel;?> data-kode='<?= $product->code?>'><?= strtoupper(strtolower($product->nama))?></option>
						<?php } ?>
					</select>
				</div>
				<div class="col-md-2">
					<label for="customer">Varian Product</label>
				</div>
				<div class="col-md-4">
					<select id="variant_product" name="variant_product" class="form-control input-md chosen-select" required>
						<option value="0">Select An Option</option>
						<?php foreach ($results['list_variant_product'] as $product){
						$sel = ($product->value == $variant_product)?'selected':'';
						?>
						<option value="<?= $product->value;?>" <?=$sel;?> data-kode='<?= $product->kode?>'><?= $product->view?> (<?= $product->kode?>)</option>
						<?php } ?>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-md-2">
					<label for="customer">Color Product</label>
				</div>
				<div class="col-md-4">
					<select id="color_product" name="color_product" class="form-control input-md chosen-select" required>
						<option value="0">Select An Option</option>
						<?php foreach ($results['list_color_product'] as $product){
						$sel = ($product->value == $color_product)?'selected':'';
						?>
						<option value="<?= $product->value;?>" <?=$sel;?> data-kode='<?= $product->kode?>'><?= $product->view?> (<?= $product->kode?>)</option>
						<?php } ?>
					</select>
				</div>
				<div class="col-md-2">
					<label for="customer">Surface</label>
				</div>
				<div class="col-md-4">
					<select id="surface_product" name="surface_product" class="form-control input-md chosen-select" required>
						<option value="0">Select An Option</option>
						<?php foreach ($results['list_surface_product'] as $product){
						$sel = ($product->value == $surface_product)?'selected':'';
						?>
						<option value="<?= $product->value;?>" <?=$sel;?> data-kode='<?= $product->kode?>'><?= $product->view?> (<?= $product->kode?>)</option>
						<?php } ?>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-md-2">
					<label for="customer">Keterangan</label>
				</div>
				<div class="col-md-4">
					<textarea name="keterangan" class='form-control input-md' placeholder='Keterangan' rows='2'><?=$keterangan;?></textarea>
				</div>
				<div class="col-md-2">
					<label for="customer">Kode</label>
				</div>
				<div class="col-md-4">
					<input type="text" name="kode" id="kode" class='form-control input-md' readonly value="<?=$kode;?>">
					<span style='cursor:pointer;' class='text-primary' id='updateManualCode'>Update Code Program</span>
				</div>
			</div>
			<br>
			<div class='box box-info'>
				<div class='box-header'>
					<h3 class='box-title'>Detail Material</h3>
					<div class='box-tool pull-right'>
						<!--<button type='button' data-id='frp_".$a."' class='btn btn-md btn-info panelSH'>SHOW</button>-->
					</div><br><br>
					<div class="form-group row">
						<div class="col-md-2">
							<label for="customer">Copy From BOM</label>
						</div>
						<div class="col-md-9">
							<select id="bom_higrid_list" name="bom_higrid_list" class="form-control input-md chosen-select" required>
								<option value="0">Select An Option</option>
								<?php foreach ($results['bom_higrid_list'] as $valx => $product){
								?>
								<option value="<?= $product['no_bom'];?>"><?= strtoupper($product['nama'].'; '.$product['variant_product'].'; '.$product['color'].'; '.$product['surface'])?></option>
								<?php } ?>
							</select>
						</div>
						<div class="col-md-1">
							<button type="button" class="btn btn-default" id="copyBOM">Copy</button>
						</div>
					</div>
				</div>
				<div class='box-body hide_header'>
					<table class='table table-striped table-bordered table-hover table-condensed' width='100%'>
						<thead>
							<tr class='bg-blue'>
								<th class='text-center' style='width: 4%;'>#</th>
								<th class='text-center' style='width: 40%;'>Material Name</th>
								<th class='text-center'>Weight /kg</th>
								<th class='text-center'>Keterangan</th>
								<th class='text-center' style='width: 4%;'>#</th>
							</tr>
						</thead>
						<tbody id='body_table'>
              <?php
                $val = 0;
                if(!empty($detail)){
      						foreach($detail AS $val => $valx){ $val++;
                    echo "<tr class='header_".$val."'>";
                      echo "<td align='center'>".$val."</td>";
                      echo "<td align='left'>";
                      echo "<select name='Detail[".$val."][code_material]' class='chosen-select form-control input-sm inline-blockd material'>";
                      echo "<option value='0'>Select Material Name</option>";
                      foreach($material AS $valx4){
                        $sel2 = ($valx4->code_lv4 == $valx['code_material'])?'selected':'';
                        echo "<option value='".$valx4->code_lv4."' ".$sel2.">".strtoupper($valx4->nama)."</option>";
                      }
                      echo 		"</select>";
                      echo "</td>";
                      echo "<td align='left'>";
                      echo "<input type='text' name='Detail[".$val."][weight]' class='form-control input-md autoNumeric4 qty' placeholder='Weight /kg' value='".$valx['weight']."'>";
                      echo "</td>";
					  echo "<td align='left'>";
                      echo "<input type='text' name='Detail[".$val."][ket]' class='form-control input-md' placeholder='Keterangan' value='".$valx['ket']."'>";
                      echo "</td>";
                      echo "<td align='left'>";
                      echo "&nbsp;<button type='button' class='btn btn-sm btn-danger delPart' title='Delete Part'><i class='fa fa-close'></i></button>";
                      echo "</td>";
                    echo "</tr>";
                  }
                }
              ?>
							<tr id='add_<?=$val?>'>
								<td align='center'></td>
								<td align='left'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-sm btn-warning addPart' title='Add Material'><i class='fa fa-plus'></i>&nbsp;&nbsp;Add Material</button></td>
								<td align='center'></td>
								<td align='center'></td>
								<td align='center'></td>
							</tr>
						</tbody>
					</table>
					<hr>
					<div class="form-group row">
						<div class="col-md-2">
							<label for="customer">Fire Reterdant</label>
						</div>
						<div class="col-md-2">
							<select id="fire_retardant" name="fire_retardant" class="form-control input-md chosen-select">
								<option value="0" <?=($fire_retardant == '0')?'selected':'';?>>No</option>
								<option value="1" <?=($fire_retardant == '1')?'selected':'';?>>Yes</option>
							</select>
						</div>
						<div class="col-md-2">
							<label for="customer">Anti UV</label>
						</div>
						<div class="col-md-2">
							<select id="anti_uv" name="anti_uv" class="form-control input-md chosen-select">
								<option value="0" <?=($anti_uv == '0')?'selected':'';?>>No</option>
								<option value="1" <?=($anti_uv == '1')?'selected':'';?>>Yes</option>
							</select>
						</div>
						<div class="col-md-2">
							<label for="customer">Tixotropic</label>
						</div>
						<div class="col-md-2">
							<select id="tixotropic" name="tixotropic" class="form-control input-md chosen-select">
								<option value="0" <?=($tixotropic == '0')?'selected':'';?>>No</option>
								<option value="1" <?=($tixotropic == '1')?'selected':'';?>>Yes</option>
							</select>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-md-2">
							<label for="customer">Food Grade</label>
						</div>
						<div class="col-md-2">
							<select id="food_grade" name="food_grade" class="form-control input-md chosen-select">
								<option value="0" <?=($food_grade == '0')?'selected':'';?>>No</option>
								<option value="1" <?=($food_grade == '1')?'selected':'';?>>Yes</option>
							</select>
						</div>
						<div class="col-md-2">
							<label for="customer">Wax</label>
						</div>
						<div class="col-md-2">
							<select id="wax" name="wax" class="form-control input-md chosen-select">
								<option value="0" <?=($wax == '0')?'selected':'';?>>No</option>
								<option value="1" <?=($wax == '1')?'selected':'';?>>Yes</option>
							</select>
						</div>
						<div class="col-md-2">
							<label for="customer">Corrosion</label>
						</div>
						<div class="col-md-2">
							<select id="corrosion" name="corrosion" class="form-control input-md chosen-select">
								<option value="0">Select An Option</option>
								<option value="excellent" <?=($corrosion == 'excellent')?'selected':'';?>>Excellent</option>
								<option value="very good" <?=($corrosion == 'very good')?'selected':'';?>>Very Good</option>
								<option value="moderate" <?=($corrosion == 'moderate')?'selected':'';?>>Moderate</option>
							</select>
						</div>
					</div>
					<hr>
					<div class="form-group row">
						<div class="col-md-2">
							<label for="customer">Waste Product (%)</label>
						</div>
						<div class="col-md-2">
							<input type="text" name="waste_product" class='form-control input-md autoNumeric' value="<?=$waste_product;?>">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-md-2">
							<label for="customer">Waste Setting/Cleaning (%)</label>
						</div>
						<div class="col-md-2">
							<input type="text" name="waste_setting" class='form-control input-md autoNumeric' value="<?=$waste_setting;?>">
						</div>
					</div>
					<button type="button" class="btn btn-danger" style='float:right; margin-left:5px;' name="back" id="back"><i class="fa fa-reply"></i> Back</button>
					<button type="submit" class="btn btn-primary" style='float:right;' name="save" id="save"><i class="fa fa-save"></i> Save</button>

				</div>
			</div>
		</form>
	</div>
</div>

<script src="<?= base_url('assets/js/autoNumeric.js')?>"></script>
<style media="screen">
  .datepicker{
    cursor: pointer;
    padding-left: 12px;
  }
</style>
<script type="text/javascript">
	//$('#input-kendaraan').hide();
	var base_url			= '<?php echo base_url(); ?>';
	var active_controller	= '<?php echo($this->uri->segment(1)); ?>';

	$(document).ready(function(){
		$('.chosen-select').select2();
		$( ".datepicker" ).datepicker();
		$( ".autoNumeric4" ).autoNumeric('init', {mDec: '4', aPad: false});

		//add part
		$(document).on('click', '.addPart', function(){
			// loading_spinner();
			var get_id 		= $(this).parent().parent().attr('id');
			// console.log(get_id);
			var split_id	= get_id.split('_');
			var id 		= parseInt(split_id[1])+1;
			var id_bef 	= split_id[1];

			$.ajax({
				url: base_url+active_controller+'/get_add/'+id,
				cache: false,
				type: "POST",
				dataType: "json",
				success: function(data){
					$("#add_"+id_bef).before(data.header);
					$("#add_"+id_bef).remove();
					$('.chosen_select').select2({width: '100%'});
					$('.autoNumeric4').autoNumeric('init', {mDec: '4', aPad: false});
					swal.close();
				},
				error: function() {
					swal({
						title				: "Error Message !",
						text				: 'Connection Time Out. Please try again..',
						type				: "warning",
						timer				: 3000,
						showCancelButton	: false,
						showConfirmButton	: false,
						allowOutsideClick	: false
					});
				}
			});
		});

		$(document).on('change','#id_product, #variant_product, #color_product, #surface_product',function(){
			var id_product 		= ($("#id_product").val() != '0')?$("#id_product").find(':selected').data('kode'):'';
			var variant_product = ($("#variant_product").val() != '0')?$("#variant_product").find(':selected').data('kode'):'';
			var color_product 	= ($("#color_product").val() != '0')?$("#color_product").find(':selected').data('kode'):'';
			var surface_product = ($("#surface_product").val() != '0')?$("#surface_product").find(':selected').data('kode'):'';

			var newKode = id_product+'-'+variant_product+'-'+color_product+'-'+surface_product;
			$('#kode').val(newKode)
		});

		$(document).on('click','#updateManualCode',function(){
			var id_product 		= ($("#id_product").val() != '0')?$("#id_product").find(':selected').data('kode'):'';
			var variant_product = ($("#variant_product").val() != '0')?$("#variant_product").find(':selected').data('kode'):'';
			var color_product 	= ($("#color_product").val() != '0')?$("#color_product").find(':selected').data('kode'):'';
			var surface_product = ($("#surface_product").val() != '0')?$("#surface_product").find(':selected').data('kode'):'';

			var newKode = id_product+'-'+variant_product+'-'+color_product+'-'+surface_product;
			$('#kode').val(newKode)
		});

		$(document).on('click', '#copyBOM', function(){
			var id 		= $('#bom_higrid_list').val();

			$.ajax({
				url: base_url+active_controller+'/get_add_copy/'+id,
				cache: false,
				type: "POST",
				dataType: "json",
				success: function(data){
					$("#body_table").html(data.header);
					$('.chosen_select').select2({width: '100%'});
					$('.autoNumeric4').autoNumeric('init', {mDec: '4', aPad: false});
					swal.close();
				},
				error: function() {
					swal({
						title				: "Error Message !",
						text				: 'Connection Time Out. Please try again..',
						type				: "warning",
						timer				: 3000,
						showCancelButton	: false,
						showConfirmButton	: false,
						allowOutsideClick	: false
					});
				}
			});
		});

	   //delete part
		$(document).on('click', '.delPart', function(){
			var get_id 		= $(this).parent().parent().attr('class');
			$("."+get_id).remove();
		});

    	//add part
		$(document).on('click', '#back', function(){
		    window.location.href = base_url + active_controller;
		});

		$('#save').click(function(e){
			e.preventDefault();
			var id_product		  	= $('#id_product').val();
			var material	      	= $('.material').val();
			var qty		        	= $('.qty').val();

			if(id_product == '0' ){
				swal({
					title	: "Error Message!",
					text	: 'Product name empty, select first ...',
					type	: "warning"
				});

				$('#save').prop('disabled',false);
				return false;
			}
			if(material == '0' ){
				swal({
					title	: "Error Message!",
					text	: 'Material name empty, select first ...',
					type	: "warning"
				});

				$('#save').prop('disabled',false);
				return false;
			}
      		if(qty == '' ){
				swal({
					title	: "Error Message!",
					text	: 'Weight empty, select first ...',
					type	: "warning"
				});

				$('#save').prop('disabled',false);
				return false;
			}

			swal({
				  title: "Are you sure?",
				  text: "You will not be able to process again this data!",
				  type: "warning",
				  showCancelButton: true,
				  confirmButtonClass: "btn-danger",
				  confirmButtonText: "Yes, Process it!",
				  cancelButtonText: "No, cancel process!",
				  closeOnConfirm: true,
				  closeOnCancel: false
				},
				function(isConfirm) {
				  if (isConfirm) {
						var formData 	=new FormData($('#data-form')[0]);
						var baseurl = base_url+active_controller+'/add'
						$.ajax({
							url			: baseurl,
							type		: "POST",
							data		: formData,
							cache		: false,
							dataType	: 'json',
							processData	: false,
							contentType	: false,
							success		: function(data){
								if(data.status == 1){
									swal({
										  title	: "Save Success!",
										  text	: data.pesan,
										  type	: "success",
										  timer	: 3000,
										  showCancelButton	: false,
										  showConfirmButton	: false,
										  allowOutsideClick	: false
										});
									window.location.href = base_url + active_controller;
								}else{

									if(data.status == 2){
										swal({
										  title	: "Save Failed!",
										  text	: data.pesan,
										  type	: "warning",
										  timer	: 3000,
										  showCancelButton	: false,
										  showConfirmButton	: false,
										  allowOutsideClick	: false
										});
									}else{
										swal({
										  title	: "Save Failed!",
										  text	: data.pesan,
										  type	: "warning",
										  timer	: 3000,
										  showCancelButton	: false,
										  showConfirmButton	: false,
										  allowOutsideClick	: false
										});
									}

								}
							},
							error: function() {

								swal({
								  title				: "Error Message !",
								  text				: 'An Error Occured During Process. Please try again..',
								  type				: "warning",
								  timer				: 7000,
								  showCancelButton	: false,
								  showConfirmButton	: false,
								  allowOutsideClick	: false
								});
							}
						});
				  } else {
					swal("Cancelled", "Data can be process again :)", "error");
					return false;
				  }
			});
		});

});

</script>
