<section class="content-header">
    <h1>
        Kategori <?= $button; ?>
        <small>Control panel</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Kelola Kategori <?= $button; ?></li>
    </ol>
</section>

<!-- Main content -->
<section class="content">

    <div class="box">
        <div class="box-body">
            <form action="<?php echo $action; ?>" method="post">
                <div class="form-group">
                    <label for="varchar">Nomor Anggota <?php echo form_error('nomor') ?></label>
                    <input type="text" class="form-control" name="nomor" id="nomor" placeholder="Nomor" value="<?php echo $nomor; ?>" readonly />
                </div>
                <div class="form-group">
                    <label for="varchar">Nama <?php echo form_error('nama') ?></label>
                    <input type="text" class="form-control" name="nama" id="nama" placeholder="Nama" value="<?php echo $nama; ?>" />
                </div>
                <div class="form-group">
                    <label for="varchar">Username <?php echo form_error('username') ?></label>
                    <input type="text" class="form-control" name="username" id="username" placeholder="Username" value="<?php echo $username; ?>" />
                </div>
                <div class="form-group">
                    <label for="varchar">Password <?php echo form_error('password') ?></label>
                    <input type="text" class="form-control" name="password" id="password" placeholder="Password" value="<?php echo $password; ?>" />
                </div>
                <div class="form-group">
                    <label for="varchar">Hak Akses <?php echo form_error('hak_akses') ?></label>
                    <select name="hak_akses" id="hak_akses" class="form-control">
                        <option value="admin">Admin</option>
                        <option value="petugas">Petugas</option>
                        <option value="kelurahan">Kelurahan</option>
                        <option value="kecamatan">Kecamatan</option>
                        <option value="pengelola">Pengelola</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="id_kecamatan">Kecamatan <?php echo form_error('id_kecamatan') ?></label>
                    <select name="id_kecamatan" id="id_kecamatan" class="form-control">
                        <option value="" selected disabled>Pilih Kecamatan</option>
                        <?php foreach ($list_kecamatan as $kecamatan) : ?>
                            <?php if ($kecamatan->id == $id_kecamatan) : ?>
                                <option value="<?= $kecamatan->id ?>" selected><?= $kecamatan->nama_kecamatan ?></option>
                            <?php else : ?>
                                <option value="<?= $kecamatan->id ?>"><?= $kecamatan->nama_kecamatan ?></option>
                            <?php endif ?>
                        <?php endforeach ?>
                    </select>
                </div>
                <input type="hidden" name="id" value="<?php echo $id; ?>" />
                <button type="submit" class="btn btn-primary"><?php echo $button ?></button>
                <a href="<?php echo site_url('petugas') ?>" class="btn btn-default">Cancel</a>
            </form>
        </div>
    </div>

</section>