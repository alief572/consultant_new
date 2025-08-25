<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<form action="" id="form-data">
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label for="isu_lingkungan">Isu Lingkungan <span class="text-red">*</span></label>
                <input type="text" name="isu_lingkungan" class="form-control form-control-sm" id="isu_lingkungan" Placeholder="Isu Lingkungan">
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label for="waktu">Waktu <span class="text-red">*</span></label>
                <select name="waktu" id="" class="form-control form-control-sm">
                    <option value="">- Waktu -</option>
                    <option value="1">1 Jam</option>
                    <option value="8">8 Jam</option>
                    <option value="24">24 Jam</option>
                </select>
            </div>
        </div>
        <div class="col-md-6">
            <label for="harga_ssc">Harga SSC / Titik <span class="text-red">*</span></label>
            <input type="text" name="harga_ssc" id="" class="form-control form-control-sm text-right auto_num">
        </div>
        <div class="col-md-6">
            <label for="harga_lab">Harga Lab / Titik <span class="text-red">*</span></label>
            <input type="text" name="harga_lab" id="" class="form-control form-control-sm text-right auto_num">
        </div>
        <div class="col-md-12">
            <div class="form-group">
                <label for="peraturan">Peraturan Perundang-undangan <span class="text-red">*</span></label>
                <textarea name="peraturan" id="" class="form-control form-control-sm"></textarea>
            </div>
        </div>
        <div class="col-md-12">
            <div class="form-group">
                <label for="peraturan">COA <span class="text-red">*</span></label>
                <select name="coa" class="form-control form-control select2">
                    <option value="">- Select COA -</option>
                    <?php
                    foreach ($list_coa as $item_coa) :
                        echo '<option value="' . $item_coa->no_perkiraan . '">(' . $item_coa->no_perkiraan . ') - ' . $item_coa->nm_coa . '</option>';
                    endforeach;
                    ?>
                </select>
            </div>
        </div>
    </div>
</form>

<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

<script>
    $('.select2').select2({
        width: '100%'
    });
</script>