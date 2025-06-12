<?php
include 'header.php';
?>


<div class="container">
	<h2 style=" width: 100%; border-bottom: 4px solid gray"><b>Master Produk</b></h2>
	<table class="table table-striped">
		<thead>
			<tr>
				<th scope="col">No</th>
				<th scope="col">Kode Produk</th>
				<th scope="col">Nama Produk</th>
				<th scope="col">Image</th>
				<th scope="col">Harga</th>
				<th scope="col">Stok</th> <!-- Tambah kolom stok -->
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<?php
			$result = mysqli_query($conn, "SELECT * FROM produk");
			$no = 1;
			while ($row = mysqli_fetch_assoc($result)) {
				// Ambil stok dari inventory berdasarkan nama produk
				$stok = 0;
				$qinv = mysqli_query($conn, "SELECT qty FROM inventory WHERE nama = '" . $row['nama'] . "' LIMIT 1");
				if ($rinv = mysqli_fetch_assoc($qinv)) {
					$stok = $rinv['qty'];
				}
				$status = ($stok > 0) ? "<span class='label label-success'>Tersedia</span>" : "<span class='label label-danger'>Habis</span>";
			?>
				<tr>
					<td><?= $no; ?></td>
					<td><?= $row['kode_produk']; ?></td>
					<td><?= $row['nama'];  ?></td>
					<td><img src="../image/produk/<?= $row['image']; ?>" width="100"></td>
					<td>Rp.<?= number_format($row['harga']);  ?></td>
					<td><?= $status; ?></td>
					<td>
						<a href="edit_produk.php?kode=<?= $row['kode_produk']; ?>" class="btn btn-warning"><i class="glyphicon glyphicon-edit"></i> </a>
						<a href="proses/del_produk.php?kode=<?= $row['kode_produk']; ?>" class="btn btn-danger" onclick="return confirm('Yakin Ingin Menghapus Data ?')"><i class="glyphicon glyphicon-trash"></i> </a>
					</td>
				</tr>
			<?php
				$no++;
			}
			?>

		</tbody>
	</table>
	<a href="tm_produk.php" class="btn btn-success"><i class="glyphicon glyphicon-plus-sign"></i> Tambah Produk</a>
</div>
<!-- Button trigger modal -->

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

<?php
include 'footer.php';
?>