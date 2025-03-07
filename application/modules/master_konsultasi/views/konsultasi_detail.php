<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label>Paket Konsultasi</label>
            <input type="text" name="konsultasi" id="konsultasi" class="form-control form-control-sm" value="<?= $konsultasi_header->row()->nm_paket; ?>">
        </div>
    </div>
    <div class="col-md-12">
        <div class="table-responsive">
            <table id="my-grid" class="table table-striped table-bordered TableKonsultasi" width="100%">
                <thead>
                    <tr>
                        <th width="4%">#</th>
                        <th>Aktifitas</th>
                        <th width="20%">Harga</th>
                        <th width="10%">Bobot</th>
                        <th width="10%">Mandays</th>
                    </tr>
                </thead>
                <tbody>
                    <?php

                    $ttl_harga = 0;
                    $ttl_bobot = 0;
                    $ttl_mandays = 0;

                    if ($konsultasi_detail->num_rows() > 0) {
                        $no = 1;
                        foreach ($konsultasi_detail->result() as $dt) {
                    ?>
                            <tr>
                                <td class="text-center"><?php echo $no; ?></td>
                                <td class="text-left" style='vertical-align:middle; width:40px;'>
                                    <?php echo $dt->nm_aktifitas; ?>
                                </td>
                                <td class="text-right">
                                    <?php echo number_format($dt->harga_aktifitas); ?>
                                </td>
                                <td class="text-center"><?php echo $dt->bobot; ?></td>
                                <td class="text-center"><?php echo $dt->mandays; ?></td>
                            </tr>

                            <?php
                            $cek_point = $this->db
                                ->select('id_chk_point, id_aktifitas, nm_chk_point')
                                ->where('id_aktifitas', $dt->id_aktifitas)
                                ->get('kons_master_check_point');
                            if ($cek_point->num_rows() > 0) {
                            ?>
                                <tr>
                                    <td colspan="7" style="padding: 15px 15px 0px 15px;">
                                        <table class="table table-bordered" width="100%">
                                            <thead>
                                                <tr style="background: #f1f1f1; font-weight: 600;">
                                                    <td width="5%">
                                                        <center>No.</center>
                                                    </td>
                                                    <td>Detail Check Point - (<?php echo $dt->nm_aktifitas; ?>)</td>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php
                                                $nomor = 1;
                                                foreach ($cek_point->result() as $d) {
                                                    echo "
                                            <tr>
                                                <td><center>" . $nomor . "</center></td>
                                                <td>" . $d->nm_chk_point . "</td>
                                            </tr>
                                        ";
                                                    $nomor++;
                                                }
                                                ?>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                    <?php
                            }

                            $ttl_harga += $dt->harga_aktifitas;
                            $ttl_bobot += $dt->bobot;
                            $ttl_mandays += $dt->mandays;
                            $no++;
                        }
                    } else {
                        echo "
                    <tr>
                        <td colspan='5'><center>Belum ada aktifitas</center></td>
                    </tr>
                    ";
                    }
                    ?>
                </tbody>
                <tfoot>
                    <tr>
                        <th colspan="2" class="text-right">Total</th>
                        <th class="text-right"><?= number_format($ttl_harga) ?></th>
                        <th class="text-center"><?= number_format($ttl_bobot) ?></th>
                        <th class="text-center"><?= number_format($ttl_mandays) ?></th>
                    </tr>
                </tfoot>
            </table>
        </div>

        <a href="<?= base_url('master_konsultasi') ?>" class="btn btn-sm btn-danger">
            <i class="fa fa-arrow-left"></i> Back
        </a>
    </div>
</div>