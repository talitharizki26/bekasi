<section class="content-header">
    <h1>
        Transaksi <?= $button; ?>
        <small>Control panel</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Kelola Transaksi <?= $button; ?></li>
    </ol>
</section>

    <!-- Main content -->
<section class="content">

<div class="box">
    <div class="box-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
	    <div class="form-group">
            <label for="varchar">Barang <?php echo form_error('kode_barang') ?></label>
            <select class="form-control" name="kode_barang" id="kode_barang">
                <option>Pilih Barang</option>
                <?php foreach ($barang as $item): ?>
                    <option value="<?= $item->kode ?>"><?= $item->nama ?></option>
                <?php endforeach ?>
            </select>
            <!-- <input type="text" class="form-control" name="kode_barang" id="kode_barang" placeholder="Kode Barang" value="<?php echo $kode_barang; ?>" /> -->
        </div>
	    <div class="form-group">
            <label for="varchar">Nomor Anggota <?php echo form_error('nomor_anggota') ?></label>
            <input type="text" class="form-control" name="nomor_anggota" id="nomor_anggota" placeholder="Nomor Anggota" value="<?= ($nomor_anggota) ? $nomor_anggota : $this->session->userdata('nomor_anggota'); ?>" readonly />
        </div>
	    <div class="form-group">
            <label for="datetime">Tanggal Pemakaian <?php echo form_error('tanggal_datang') ?></label>
            <input type="date" class="form-control" name="tanggal_datang" id="tanggal_datang" placeholder="Tanggal Pemakaian" value="<?php echo $tanggal_datang; ?>" />
        </div>
	    <div class="form-group">
            <label for="datetime">Tanggal Pengiriman <?php echo form_error('tanggal_distribusi') ?></label>
            <input type="date" class="form-control" name="tanggal_distribusi" id="tanggal_distribusi" placeholder="Tanggal Pengiriman" value="<?php echo $tanggal_distribusi; ?>" />
        </div>
        <div class="form-group">
            <label for="datetime">Waktu <?php echo form_error('waktu') ?></label>
            <select class="form-control" name="waktu" id="waktu" placeholder="Waktu" value="<?php echo $waktu; ?>" >
                <option selected disabled value="">Pilih Waktu</option>
                <option value="Pagi" <?= ($waktu == 'Pagi') ? 'selected' : '' ?>>Pagi</option>
                <option value="Siang" <?= ($waktu == 'Siang') ? 'selected' : '' ?>>Siang</option>
                <option value="Sore" <?= ($waktu == 'Sore') ? 'selected' : '' ?>>Sore</option>
                <option value="Malam" <?= ($waktu == 'Malam') ? 'selected' : '' ?>>Malam</option>
            </select>
        </div>
        
	    <div class="form-group">
            <label for="enum">Status <?php echo form_error('status') ?></label>
            <select class="form-control" name="status" id="status">
                <option>Pilih Status</option>
                <option value="datang">datang</option>
                <option value="dikirim">dikirim</option>
            </select>
            <!-- <input type="text" class="form-control" name="status" id="status" placeholder="Status" value="<?php echo $status; ?>" /> -->
        </div>
	    <input type="hidden" name="id" value="<?php echo $id; ?>" /> 
        <div class="form-group">
            <label for="bap">Surat BAP</label>
            <input type="file" class="form-control" name="bap" id="bap">
        </div>
	    <button type="submit" class="btn btn-primary"><?php echo $button ?></button> 
	    <a href="<?php echo site_url('transaksi') ?>" class="btn btn-default">Cancel</a>
	</form>

    </div>
    </div>
</section>