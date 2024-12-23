<?php
include('dbConnection.php'); // Memanggil file koneksi database

// Ambil Data untuk Edit
$editData = null;
if (isset($_GET['edit'])) {
    $id = $_GET['edit'];
    $result = $connect->query("SELECT * FROM tbl_mahasiswa WHERE nim='$id'");
    if ($result && $result->num_rows > 0) {
        $editData = $result->fetch_assoc();
    }
}

// Create & Update Data
if (isset($_POST['submit'])) {
    $nim = $_POST['nim'];
    $nama = $_POST['nama'];
    $jurusan = $_POST['jurusan'];
    $old_nim = $_POST['old_nim'] ?? null;

    if ($old_nim) {
        // Update Data
        $query = "UPDATE tbl_mahasiswa SET nama='$nama', jurusan='$jurusan' WHERE nim='$old_nim'";
    } else {
        // Create Data
        $query = "INSERT INTO tbl_mahasiswa (nim, nama, jurusan) VALUES ('$nim', '$nama', '$jurusan')";
    }

    if ($connect->query($query)) {
        header("Location: " . $_SERVER['PHP_SELF']);
        exit();
    } else {
        echo "Error: " . $connect->error;
    }
}

// Delete Data
if (isset($_GET['delete'])) {
    $nim = $_GET['delete'];
    $query = "DELETE FROM tbl_mahasiswa WHERE nim='$nim'";
    $connect->query($query);
    header("Location: " . $_SERVER['PHP_SELF']);
    exit();
}

// Fungsi Menampilkan Form
function formMahasiswa($data = null)
{
    $nim = $data['nim'] ?? '';
    $nama = $data['nama'] ?? '';
    $jurusan = $data['jurusan'] ?? '';
    $buttonLabel = $data ? "Update" : "Simpan";
    $readonly = $data ? "readonly" : "";

    echo "
    <h1>Form Mahasiswa</h1>
    <form method='POST'>
        <input type='hidden' name='old_nim' value='$nim'>
        <table>
            <tr>
                <td>NIM</td>
                <td><input type='text' name='nim' value='$nim' $readonly required></td>
            </tr>
            <tr>
                <td>Nama</td>
                <td><input type='text' name='nama' value='$nama' required></td>
            </tr>
            <tr>
                <td>Jurusan</td>
                <td><input type='text' name='jurusan' value='$jurusan' required></td>
            </tr>
            <tr>
                <td></td>
                <td><button type='submit' name='submit'>$buttonLabel</button></td>
            </tr>
        </table>
    </form>
    ";
}

// Fungsi Menampilkan Tabel
function tableMahasiswa($connect)
{
    echo "
    <h1>Data Mahasiswa</h1>
    <table border='1' cellspacing='0' cellpadding='5'>
        <tr>
            <th>No</th>
            <th>NIM</th>
            <th>Nama</th>
            <th>Jurusan</th>
            <th>Aksi</th>
        </tr>
    ";
    $result = $connect->query("SELECT * FROM tampilmhs");
    if ($result && $result->num_rows > 0) {
        $no = 1;
        while ($row = $result->fetch_assoc()) {
            echo "
            <tr>
                <td>{$no}</td>
                <td>{$row['nim']}</td>
                <td>{$row['nama']}</td>
                <td>{$row['jurusan']}</td>
                <td>
                    <a href='?edit={$row['nim']}'>Edit</a>
                    <a href='?delete={$row['nim']}' onclick='return confirm(\"Yakin ingin menghapus?\")'>Delete</a>
                </td>
            </tr>
            ";
            $no++;
        }
    } else {
        echo "<tr><td colspan='5'>Tidak ada data.</td></tr>";
    }
    echo "</table>";
}

// Menampilkan Form dan Tabel
formMahasiswa($editData);
tableMahasiswa($connect);
