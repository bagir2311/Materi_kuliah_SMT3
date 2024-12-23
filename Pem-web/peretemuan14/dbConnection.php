<?php
$connect = mysqli_connect("localhost", "root", "", "sikampus");
if (!$connect) {
    die("Koneksi gagal: " . mysqli_connect_error());
}
