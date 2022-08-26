<!-- DataTables -->
<link rel="stylesheet" href="<?php echo base_url() ?>assets/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
<table id="example2" class="table table-bordered" style="margin-bottom: 10px; margin-left: 20px; margin-right: 20px;">
    <thead>
        <tr>
            <th>Aksi</th>
            <th>No</th>
            <th>Nama Barang</th>
            <th>Kode Barang</th>
            <th>Jenis</th>
            <th>Kategori</th>
            <th>Tanggal Pengadaan</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $no = 1;
        foreach ($data_inventaris as $inventaris) : ?>
            <tr>
                <td>
                    <a href="<?= base_url('laporan/hapus_inventaris_barang/' . $inventaris->id_barang . "?periode=" . $periode . "&index=" . $index) ?>" class="btn btn-default btn-sm" title="Hapus"><i class="fas fa-trash-alt"></i></a>
                    <button type="button" class="btn btn-default btn-sm modalBarang" id="modalBarang" title="Detail" data-toggle="modal" data-target="#barangModal" data-id="<?= $inventaris->id_barang ?>"><i class="fas fa-eye"></i></button>
                </td>
                <td><?= $no++; ?></td>
                <td><?= $inventaris->nama_barang; ?></td>
                <td><?= $inventaris->kode; ?></td>
                <td><?= $inventaris->jenis; ?></td>
                <td><?= $inventaris->nama_kategori; ?></td>
                <td><?= cari_tanggal($inventaris->tanggal_pengadaan); ?></td>
            </tr>
        <?php endforeach; ?>
    </tbody>
</table>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- DataTables -->
<script src="<?php echo base_url() ?>assets/bower_components/jquery/dist/jquery.js"></script>
<script src="<?php echo base_url() ?>assets/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="<?php echo base_url() ?>assets/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="<?php echo base_url() ?>assets/bower_components/jquery-ui/jquery-ui.min.js"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button);
    $(function() {
        $('#example1').DataTable({
            'paging': true,
            'lengthChange': true,
            'searching': true,
            'ordering': true,
            'info': true,
            'autoWidth': true
        })
    })
    $(function() {
        $('#example2').DataTable({
            'paging': true,
            'lengthChange': true,
            'searching': true,
            'ordering': true,
            'info': true,
            'autoWidth': true
        })
    })
</script>