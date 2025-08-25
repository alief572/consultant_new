<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<form action="" id="form-data">
    <input type="hidden" name="id" value="<?= $data_lab->id ?>">
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label for="isu_lingkungan">Isu Lingkungan</label>
                <input type="text" name="isu_lingkungan" class="form-control form-control-sm" id="isu_lingkungan" Placeholder="Isu Lingkungan" value="<?= $data_lab->isu_lingkungan ?>">
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label for="waktu">Waktu</label>
                <select name="waktu" id="" class="form-control form-control-sm">
                    <option value="">- Waktu -</option>
                    <option value="1" <?= ($data_lab->waktu == 1) ? 'selected' : '' ?>>1 Jam</option>
                    <option value="8" <?= ($data_lab->waktu == 8) ? 'selected' : '' ?>>8 Jam</option>
                    <option value="24" <?= ($data_lab->waktu == 24) ? 'selected' : '' ?>>24 Jam</option>
                </select>
            </div>
        </div>
        <div class="col-md-6">
            <label for="harga_ssc">Harga SSC / Titik</label>
            <input type="text" name="harga_ssc" id="" class="form-control form-control-sm text-right" value="<?= number_format($data_lab->harga_ssc, 2) ?>">
        </div>
        <div class="col-md-6">
            <label for="harga_lab">Harga Lab / Titik</label>
            <input type="text" name="harga_lab" id="" class="form-control form-control-sm text-right" value="<?= number_format($data_lab->harga_lab, 2) ?>">
        </div>
        <div class="col-md-12">
            <div class="form-group">
                <label for="peraturan">Peraturan Perundang-undangan</label>
                <textarea name="peraturan" id="" class="form-control form-control-sm"><?= $data_lab->peraturan ?></textarea>
            </div>
        </div>
        <div class="col-md-12">
            <div class="form-group">
                <label for="peraturan">COA</label>
                <select name="coa" class="form-control form-control select2">
                    <option value="">- Select COA -</option>
                    <?php
                    foreach ($list_coa as $item_coa) :
                        $selected = '';
                        if ($item_coa->no_perkiraan == $data_lab->no_coa) :
                            $selected = 'selected';
                        endif;
                        echo '<option value="' . $item_coa->no_perkiraan . '" ' . $selected . '>(' . $item_coa->no_perkiraan . ') - ' . $item_coa->nm_coa . '</option>';
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