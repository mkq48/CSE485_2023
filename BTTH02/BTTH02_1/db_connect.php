<?php
    // Thông tin kết nối cơ sở dữ liệu
    $servername = "localhost";  // Địa chỉ máy chủ MySQL
    $username = "root";  // Tên đăng nhập MySQL
    $dbname = "btth02_1";  // Tên cơ sở dữ liệu MySQL
    $password = "";  // Mật khẩu MySQL

    try {
        // Kết nối đến cơ sở dữ liệu
        $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    }
    catch(Exception $e){
        echo $e->getMessage();
    }

    // Đóng kết nối
    //$conn = null;
?>