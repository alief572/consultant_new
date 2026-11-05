<?php
$ENABLE_ADD = has_permission('Expense_Report_Project.Add');
?>
<link rel="stylesheet" href="https://cdn.datatables.net/2.1.7/css/dataTables.dataTables.min.css">
<link rel="stylesheet" href="<?= base_url('assets/css/expense_report_project.css') . '?v=' . filemtime(FCPATH . 'assets/css/expense_report_project.css') ?>">
<link rel="stylesheet" href="<?= base_url('assets/css/erp_mock.css') . '?v=' . filemtime(FCPATH . 'assets/css/erp_mock.css') ?>">

<div class="mk">
<div class="card">
    <div class="card-h">
        <span><i class="fa fa-briefcase"></i> Pilih SPK Proyek</span>
        <a href="<?= base_url('expense_report_project') ?>" class="mkb b-out"><i class="fa fa-angle-left"></i> Kembali</a>
    </div>
    <div class="tw">
        <table id="table_spk" class="dt" style="width: 100%;">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Nomor SPK &amp; Paket</th>
                    <th>Customer</th>
                    <th>Team / PIC</th>
                    <th>Waktu Pelaksanaan</th>
                    <th>Kasbon</th>
                    <th>Option</th>
                </tr>
            </thead>
        </table>
    </div>
    <p id="spk-table-feedback" role="status" aria-live="polite" class="erp-feedback"></p>
    <button id="spk-table-retry" type="button" class="mkb b-out" hidden>Muat ulang daftar SPK</button>
</div>
</div>

<script src="https://cdn.datatables.net/2.1.7/js/dataTables.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        DataTables();
    });
    $('#spk-table-retry').on('click', function () { DataTables(); });

    $(document).on('click', '.req_app', function(e) {
        e.preventDefault();

        var id_spk_budgeting = $(this).data('id_spk_budgeting');

        Swal.fire({
            icon: 'warning',
            title: 'Are you sure ?',
            text: 'This action cannot be undo !',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, proceed!'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    type: 'post',
                    url: siteurl + active_controller + 'req_app',
                    data: {
                        'id_spk_budgeting': id_spk_budgeting
                    },
                    cache: false,
                    dataType: 'JSON',
                    success: function(result) {
                        if (result.status == 1) {
                            Swal.fire({
                                icon: 'success',
                                title: 'Success !',
                                text: result.pesan
                            }).then(() => {
                                DataTables();
                            });
                        } else {
                            Swal.fire({
                                icon: 'warning',
                                title: 'Failed !',
                                text: result.pesan
                            });
                        }
                    },
                    error: function(result) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Error !',
                            text: 'Please try again later!'
                        });
                    }
                });
            }
        });
    });

    function DataTables() {
        $('#spk-table-feedback').removeAttr('data-kind').text('Memuat daftar SPK...');
        $('#spk-table-retry').prop('hidden', true);
        $('#table_spk').dataTable({
            ajax: {
                url: siteurl + active_controller + 'get_data_spk',
                type: "POST",
                dataType: "JSON",
                dataSrc: function (response) {
                    $('#spk-table-feedback').text('');
                    return response.data;
                },
                error: function () {
                    $('#spk-table-feedback').attr('data-kind', 'error').text('Daftar SPK gagal dimuat. Periksa koneksi lalu muat ulang.');
                    $('#spk-table-retry').prop('hidden', false);
                    $('#table_spk_processing').hide();
                }
            },
            columns: [
                { data: 'no', className: 'text-center', orderable: false },
                {
                    data: null, orderable: false,
                    render: function (data, type, row) {
                        if (type !== 'display') { return (row.id_spk_penawaran || '') + ' ' + (row.nm_project || ''); }
                        return '<b style="color:#1f6fa5"></b><br><small style="color:#6b7a83"></small>';
                    },
                    createdCell: function (td, cellData, row) {
                        $(td).find('b').text(row.id_spk_penawaran || '');
                        $(td).find('small').text(row.nm_project || '');
                    }
                },
                { data: 'nm_customer', orderable: false, render: $.fn.dataTable.render.text() },
                {
                    data: null, orderable: false,
                    render: function (data, type, row) {
                        if (type !== 'display') { return (row.project_leader || '') + ' ' + (row.sales || ''); }
                        return 'PL: <span class="pl"></span><br><small style="color:#6b7a83">Sales: <span class="sales"></span></small>';
                    },
                    createdCell: function (td, cellData, row) {
                        $(td).find('.pl').text(row.project_leader || '-');
                        $(td).find('.sales').text(row.sales || '-');
                    }
                },
                { data: 'periode', orderable: false, render: $.fn.dataTable.render.text() },
                {
                    data: 'kasbon_baru', className: 'text-center', orderable: false,
                    render: function (data, type) {
                        if (type !== 'display') { return data; }
                        return data > 0 ? '<span class="bd bd-ok">' + parseInt(data, 10) + ' kasbon baru</span>' : '<span class="bd bd-draft">Tidak ada</span>';
                    }
                },
                { data: 'pick', className: 'text-center', orderable: false, searchable: false }
            ],
            order: [],
            language: {
                search: 'Cari SPK:', searchPlaceholder: 'Nomor SPK, customer, atau proyek',
                lengthMenu: 'Tampilkan _MENU_ SPK', info: '_START_–_END_ dari _TOTAL_ SPK',
                infoEmpty: 'Belum ada SPK untuk ditampilkan', infoFiltered: '(dari _MAX_ SPK)',
                emptyTable: 'Belum ada SPK dengan kasbon yang dapat dilaporkan.',
                zeroRecords: 'Tidak ada SPK yang cocok. Ubah kata pencarian.',
                processing: 'Memuat daftar SPK...', loadingRecords: 'Memuat daftar SPK...',
                paginate: {previous: 'Sebelumnya', next: 'Berikutnya'}
            },
            processing: true,
            serverSide: true,
            destroy: true,
            paging: true,
            scrollX: true
        });
    }
</script>
<script src="<?= base_url('assets/js/basic.js') ?>"></script>
