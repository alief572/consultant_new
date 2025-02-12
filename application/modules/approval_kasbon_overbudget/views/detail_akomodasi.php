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
            echo '<td class="text-right">' . number_format($item['pengajuan_budget']) . '</td>';
            echo '<td class="text-left">' . $item['reason'] . '</td>';
            echo '</tr>';
        }
        ?>
    </tbody>
</table>