<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Laporan extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('MBarang');
        $this->load->model('MRuangan');
        $this->load->model('MTransaksi');
    }
    public function index()
    {
        // if($this->session->hak_akses == 'admin'){
        // $data['transaksi_data'] = $this->db->query("SELECT *,transaksi.id as id,barang.id as id_barang FROM transaksi INNER JOIN barang ON transaksi.kode_barang = barang.kode WHERE status = 'datang'")->result();
        // }else{
        // $data['transaksi_data'] = $this->db->query("SELECT *,transaksi.id as id,barang.id as id_barang FROM transaksi INNER JOIN barang ON transaksi.kode_barang = barang.kode WHERE nomor_anggota = '".$this->session->nomor_anggota."'")->result();
        // }
        // $data['page'] = 'transaksi/transaksi_list';
        // $this->load->view('template', $data);
    }

    public function barang()
    {
        $this->load->view('template', [
            'page' => 'laporan/lokasi-barang',
            'data_lokasi' =>
            $this->db
                ->select('*, kartu_inventaris_barang.id AS id_kartu_inventaris_barang, lokasi.id AS lokasi_id')
                ->join('kecamatan', 'kecamatan.id=lokasi.id_kecamatan')
                ->join('kartu_inventaris_barang', 'kartu_inventaris_barang.id_lokasi=lokasi.id', 'left')
                ->get_where('lokasi', ['kartu_inventaris_barang.is_valid' => 1])->result(),
        ]);
    }

    public function pilih_periode($id_lokasi = null, $id_kategori = null)
    {
        $this->load->view('template', [
            'page' => 'laporan/pilih-periode',
            'lokasi' =>  $this->MBarang->get_barang_by_lokasi($id_lokasi),
            'id_lokasi' =>  $id_lokasi,
            'data_barang' => $this->MBarang->get_non_inventaris_barang($id_lokasi, $id_kategori),
            'data_inventaris' => $this->MBarang->get_inventaris_barang($id_lokasi, $id_kategori),
        ]);
    }
    public function kelola_barang($id_lokasi = null, $id_kategori = null)
    {
        if (!empty($this->input->get('periode'))) {
            $periode = $this->input->get('periode');
        } else {
            $periode = "all";
        }
        $this->load->view('template', [
            'page' => 'laporan/kelola-inventaris-barang',
            'lokasi' =>  $this->MBarang->get_barang_by_lokasi($id_lokasi),
            'data_barang' => $this->MBarang->get_non_inventaris_barang($id_lokasi, $id_kategori),
            'data_inventaris' => $this->MBarang->get_inventaris_barang($id_lokasi, $id_kategori, $periode),
        ]);
    }

    public function checkBarang()
    {
        $barang = $this->MBarang->getBarang($this->input->get('id_barang'))->row_array();
        echo json_encode($barang);
    }

    public function tambah_inventaris_barang()
    {
        $this->db->where('id', $this->input->post('id_barang'));
        $this->db->update('barang', ['is_inventaris' => 1]);

        $this->db->where('id_lokasi', $this->input->post('id_lokasi'));
        $this->db->update('kartu_inventaris_barang', ['is_valid' => 0]);
        $this->db->insert('kartu_inventaris_barang', ['id_lokasi' => $this->input->post('id_lokasi')]);
        $this->MBarang->insertPengesahanBarang($this->input->post('id_barang'), $this->input->post('id_lokasi'));

        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">
            Data Inventaris berhasil ditambahkan
            </div>');
        redirect($_SERVER['HTTP_REFERER']);
    }

    public function hapus_inventaris_barang($id_barang = null)
    {
        $this->db->where('id', $id_barang);
        $this->db->update('barang', ['is_inventaris' => 0]);
        $barang = $this->db->get_where('barang', ['id' => $id_barang])->row();

        $this->db->where('id_lokasi', $this->input->post('id_lokasi'));
        $this->db->update('kartu_inventaris_barang', ['is_valid' => 0]);
        $this->db->insert('kartu_inventaris_barang', ['id_lokasi' => $barang->id_lokasi]);
        $this->MBarang->insertPengesahanBarang($id_barang, $barang->id_lokasi);

        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">
            Data Inventaris berhasil dihapus
            </div>');
        redirect($_SERVER['HTTP_REFERER']);
    }

    public function kartuInventarisBarang($id_kartu_inventaris_barang = null, $id_kategori = null)
    {
        $inventaris = $this->db->get_where('kartu_inventaris_barang', ['id' => $id_kartu_inventaris_barang])->row();
        $this->load->view('template', [
            'page' => 'laporan/kartu-inventaris-barang',
            'lokasi' =>  $this->MBarang->get_kartu_inventaris_barang($id_kartu_inventaris_barang),
            'data_barang' => $this->MBarang->get_inventaris_barang($inventaris->id_lokasi, $id_kategori),
        ]);
    }

    public function menuKartuInventarisBarang($id_kartu_inventaris_barang = null)
    {
        $this->load->view('template', [
            'page' => 'laporan/menu-barang',
            'id_kartu_inventaris_barang' =>  $id_kartu_inventaris_barang,
            'kategori' => $this->db->get('kategori')->result(),
        ]);
    }

    public function ruangan()
    {
        $this->load->view('template', [
            'page' => 'laporan/lokasi-ruangan',
            'data_lokasi' =>
            $this->db
                ->select('*, kartu_inventaris_ruangan.id AS id_kartu_inventaris_ruangan')
                ->join('lokasi', 'lokasi.id=kartu_inventaris_ruangan.id_lokasi')
                ->join('kecamatan', 'kecamatan.id=lokasi.id_kecamatan')
                ->get_where('kartu_inventaris_ruangan', [
                    'is_valid' => 1
                ])->result(),
        ]);
    }

    public function kartuInventarisRuangan($id_kartu_inventaris_ruangan = null)
    {
        $this->load->view('template', [
            'page' => 'laporan/kartu-inventaris-ruangan',
            'lokasi' =>  $this->MRuangan->get_kartu_inventaris_ruangan($id_kartu_inventaris_ruangan),
            'data_ruangan' => $this->MRuangan->get_join_by_id_lokasi($id_kartu_inventaris_ruangan),
        ]);
    }
}
