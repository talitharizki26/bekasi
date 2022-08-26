<select class="form-control" id="id_barang" name="id_barang">
    <option value="" selected disabled>Pilih Kode Barang</option>
    <?php foreach ($data_barang as $barang) : ?>
        <option value="<?= $barang->id_barang ?>"><?= $barang->id_barang . '.' . $barang->kode . ' | ' . $barang->nama_barang ?></option>
    <?php endforeach ?>
</select>