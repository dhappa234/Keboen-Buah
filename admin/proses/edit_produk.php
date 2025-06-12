<?php
include '../../koneksi/koneksi.php';

$kode = $_POST['kode'];
$nama = $_POST['nama'];
$harga = $_POST['harga'];
$desk = $_POST['desk'];

// Proses upload gambar jika ada
if ($_FILES['files']['name'] != '') {
	$file = $_FILES['files']['name'];
	$tmp = $_FILES['files']['tmp_name'];
	move_uploaded_file($tmp, "../../image/produk/" . $file);
	$query = "UPDATE produk SET nama='$nama', harga='$harga', deskripsi='$desk', image='$file' WHERE kode_produk='$kode'";
} else {
	$query = "UPDATE produk SET nama='$nama', harga='$harga', deskripsi='$desk' WHERE kode_produk='$kode'";
}
mysqli_query($conn, $query);

// Hapus seluruh kode yang memproses $_POST['material'] dan $_POST['keb']

echo "<script>
    alert('Data produk berhasil diupdate!');
    window.location = '../m_produk.php';
</script>";
