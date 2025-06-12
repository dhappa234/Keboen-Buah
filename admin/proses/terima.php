<?php
include '../../koneksi/koneksi.php';
$inv = $_GET['inv'];

// Update status produksi menjadi diterima
$update = mysqli_query($conn, "UPDATE produksi SET terima = '1', status = 'Pesanan Diterima (Siap Kirim)' WHERE invoice = '$inv'");

if ($update) {
	echo "
    <script>
    alert('PESANAN BERHASIL DITERIMA');
    window.location = '../produksi.php';
    </script>
    ";
} else {
	echo "
    <script>
    alert('Terjadi kesalahan saat menerima pesanan!');
    window.location = '../produksi.php';
    </script>
    ";
}
