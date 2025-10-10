<form action="" id="form-data">
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label for="isu_lingkungan">Isu Lingkungan</label>
                <input type="text" name="isu_lingkungan" class="form-control form-control-sm" id="isu_lingkungan" Placeholder="Isu Lingkungan" value="<?= $data_lab->isu_lingkungan ?>" readonly>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label for="waktu">Waktu</label>
                <input type="text" class="form-control form-control-sm" value="<?= $data_lab->waktu ?> Jam" readonly>
            </div>
        </div>
        <div class="col-md-6">
            <label for="harga_ssc">Harga SSC / Titik</label>
            <input type="text" name="harga_ssc" id="" class="form-control form-control-sm text-right" value="<?= number_format($data_lab->harga_ssc, 2) ?>" readonly>
        </div>
        <div class="col-md-6">
            <label for="harga_lab">Harga Lab / Titik</label>
            <input type="text" name="harga_lab" id="" class="form-control form-control-sm text-right" value="<?= number_format($data_lab->harga_lab, 2) ?>" readonly>
        </div>
        <div class="col-md-12">
            <div class="form-group">
                <label for="peraturan">Peraturan Perundang-undangan</label>
                <textarea name="peraturan" id="" class="form-control form-control-sm" readonly><?= $data_lab->peraturan ?></textarea>
            </div>
        </div>
        <div class="col-md-12">
            <div class="form-group">
                <label for="peraturan">COA</label>
                <select name="coa" class="form-control form-control select2" readonly>
                    <?php
                    foreach ($list_coa as $item_coa) :
                        $selected = '';
                        if ($item_coa->no_perkiraan == $data_lab->no_coa) :
                            echo '<option value="' . $item_coa->no_perkiraan . '" ' . $selected . '>' . $item_coa->no_perkiraan . ' - ' . $item_coa->nm_coa . '</option>';
                        endif;
                    endforeach;
                    ?>
                </select>
            </div>
        </div>
    </div>
</form>