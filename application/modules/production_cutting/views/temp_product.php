<?php
    if(!empty($result)){
        foreach ($result as $key => $value) { $key++;
            $nama_product = $value['nm_product'];

            echo "<tr class='tr_".$key."'>";
                echo "<td class='text-center'>".$key."</td>";
                echo "<td>".$nama_product."</td>";
                echo "<td class='text-center qtyBelumKirim'>".number_format($value['qty_spk'],2)."</td>";
                echo "<td class='text-center'>
                        <input type='hidden' name='detail[".$key."][id_spk]' value='".$value['id_spk']."'>
                        <input type='hidden' name='detail[".$key."][code_lv4]' value='".$value['code_lv4']."'>
                        <input type='hidden' name='detail[".$key."][qty_spk]' value='".$value['qty_spk']."'>
                        <input type='text' name='detail[".$key."][qty_outgoing]' data-id_spk='".$value['id_spk']."' class='form-control input-sm text-center autoNumeric0 changeDelivery' value='".$value['qty_outgoing']."'>
                        </td>";
                echo "<td class='text-center'><button type='button' class='btn btn-sm btn-danger delPart' data-id='".$value['id_spk']."' title='Delete' data-role='qtip'><i class='fa fa-trash'></i></button></td>";
            echo "</tr>";
        }
    }
?>