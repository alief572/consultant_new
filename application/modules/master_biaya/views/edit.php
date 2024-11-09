<input type="hidden" name="id" value="<?= $data_biaya->id ?>">
<div class="form-group">
    <label for="">Nama Biaya</label>
    <input type="text" name="nm_biaya" id="" class="form-control form-control-sm" value="<?= $data_biaya->nm_biaya ?>" required>
</div>
<div class="form-group">
    <label for="">Tipe Biaya</label>
    <select name="tipe_biaya" id="" class="form-control form-control-sm" required>
        <option value="">- Select Tipe Biaya -</option>
        <option value="1" <?= ($data_biaya->tipe_biaya == 1) ? 'selected' : '' ?>>Akomodasi</option>
        <option value="2" <?= ($data_biaya->tipe_biaya == 2) ? 'selected' : '' ?>>Others</option>
    </select>
</div>