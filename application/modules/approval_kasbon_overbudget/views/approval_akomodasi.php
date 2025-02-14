<input type="hidden" name="id" value="<?= $id ?>">
<table class="table table-striped">
    <thead>
        <tr>
            <th class="text-center">No.</th>
            <th class="text-center">Item</th>
            <th class="text-center">Qty Tambahan</th>
            <th class="text-center">Budget Tambahan</th>
            <th class="text-center">Total Pengajuan</th>
            <th class="text-center">Reason</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $no = 0;
        foreach ($list_data as $item) {
            $no++;

            echo '<tr>';
            echo '<td class="text-center">' . $no . '</td>';
            echo '<td class="text-left">' . $item['nm_item'] . '</td>';
            echo '<td class="text-center">' . number_format($item['qty_budget_tambahan']) . '</td>';
            echo '<td class="text-right">' . number_format($item['budget_tambahan']) . '</td>';
            echo '<td class="text-right">' . number_format($item['qty_budget_tambahan'] * $['budget_tambahan']) . '</td>';
            echo '<td class="text-left">' . $item['reason'] . '</td>';item
            echo '</tr>';
        }
        ?>
    </tbody>
</table>

<br><br>

<div class="form-group">
    <label for="">Reject Reason</label>
    <textarea name="reject_reason" id="" class="form-control form-control-sm"></textarea>
</div>