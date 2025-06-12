<?php
include 'header.php';
?>

<!-- IMAGE (Enhanced with Overlay & Animation) -->
<div class="container-fluid" style="margin: 0; padding: 0; position: relative;">
	<div class="image" style="margin-top: -21px; position: relative; overflow: hidden;">
		<img src="image/home/gue.jpg"
			style="width: 100%; height: 650px; object-fit: cover; transition: transform 0.5s ease;"
			class="main-banner-img">
		<div class="banner-overlay"
			style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; 
                    background: rgba(0, 0, 0, 0.4); display: flex; 
                    flex-direction: column; align-items: center; justify-content: center; 
                    color: white; text-align: center; padding: 0 20px;">
			<h1 style="font-size: 48px; font-weight: bold; margin-bottom: 20px;">Selamat Datang di Keboen Buah</h1>
			<p style="font-size: 20px; max-width: 700px;">
				Solusi lengkap kebutuhan harian Anda. Belanja buah, sayur, frozen food, dan sembako lebih mudah & cepat.
			</p>
			<a href="#produk-kami" class="btn btn-warning"
				style="margin-top: 30px; padding: 10px 25px; border-radius: 30px; font-size: 18px;">
				Jelajahi Produk
			</a>
		</div>
	</div>
</div>

<!-- Efek Hover Gambar -->
<style>
	.main-banner-img:hover {
		transform: scale(1.05);
	}
</style>

<br><br>

<!-- PRODUK TERBARU -->
<div class="container" style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">

	<h4 class="text-center" style="padding: 15px 0; font-style: italic; line-height: 29px; border-top: 2px solid #4ecdc4; border-bottom: 2px solid #4ecdc4; color: #555;">
		Sejak Tahun 2021, Keboen Buah telah menjadi destinasi terpercaya di Semarang untuk kebutuhan harian lengkap, mulai dari buah segar lokal/impor, sayuran, frozen food, hingga sembako—dengan harga terjangkau. Kami menawarkan kemudahan belanja online via WhatsApp, pembayaran fleksibel (transfer, QRIS, COD), serta pengiriman ke seluruh Semarang, memastikan kualitas dan pelayanan terbaik untuk Anda.
	</h4>

	<h2 id="produk-kami" style="width: 100%; border-bottom: 4px solid #4ecdc4; margin-top: 80px; padding-bottom: 10px;"><b>Produk Kami</b></h2>

	<div class="row">
		<?php
		$result = mysqli_query($conn, "SELECT * FROM produk");
		while ($row = mysqli_fetch_assoc($result)) {
			// Ambil stok dari inventory berdasarkan nama produk
			$stok = 0;
			$qinv = mysqli_query($conn, "SELECT qty FROM inventory WHERE nama = '" . $row['nama'] . "' LIMIT 1");
			if ($rinv = mysqli_fetch_assoc($qinv)) {
				$stok = $rinv['qty'];
			}
			$status = ($stok > 0) ? "<span class='label label-success'>Tersedia</span>" : "<span class='label label-danger'>Habis</span>";
		?>
			<div class="col-sm-6 col-md-4" style="margin-bottom: 30px;">
				<div class="thumbnail" style="border-radius: 10px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); transition: transform 0.3s;">
					<img src="image/produk/<?= $row['image']; ?>" style="border-top-left-radius: 10px; border-top-right-radius: 10px; height: 250px; width: 100%; object-fit: cover; transition: 0.3s;">
					<div class="caption" style="padding: 15px;">
						<h3 style="font-size: 20px; color: #333;"><?= $row['nama'];  ?></h3>
						<h4 style="color: #e76f51;">Rp.<?= number_format($row['harga']); ?></h4>
						<p><?= $status; ?></p>
						<div class="row" style="margin-top: 15px;">
							<div class="col-md-6">
								<a href="detail_produk.php?produk=<?= $row['kode_produk']; ?>" class="btn btn-warning btn-block" style="border-radius: 20px;">Detail</a>
							</div>
							<?php if (isset($_SESSION['kd_cs'])) { ?>
								<div class="col-md-6">
									<a href="proses/add.php?produk=<?= $row['kode_produk']; ?>&kd_cs=<?= $kode_cs; ?>&hal=1" class="btn btn-success btn-block" style="border-radius: 20px;"><i class="glyphicon glyphicon-shopping-cart"></i> Tambah</a>
								</div>
							<?php } else { ?>
								<div class="col-md-6">
									<a href="keranjang.php" class="btn btn-success btn-block" style="border-radius: 20px;"><i class="glyphicon glyphicon-shopping-cart"></i> Tambah</a>
								</div>
							<?php } ?>
						</div>
					</div>
				</div>
			</div>
		<?php
		}
		?>
	</div>
</div>
<br><br><br><br>

<?php
include 'footer.php';
?>