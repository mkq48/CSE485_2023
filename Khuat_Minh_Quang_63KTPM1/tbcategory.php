<?php
include("conn.php");
    try {
        // Chuẩn bị truy vấn SQL
        $sql = "SELECT * FROM theloai";
        
        // Thực thi truy vấn và lấy kết quả
        $stmt = $conn->query($sql);
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
        
        // Xử lý kết quả
        foreach ($result as $row) {
            echo "<tr>";
            echo "<td>". $row['ma_tloai'] . "</td>";
            echo "<td>". $row['ten_tloai'] . "</td>";
            echo "<td>".'<a href="edit_author.php?id='.'"><i class="fas fa-pen-to-square"></i></a>'."</td>";
            echo "<td>".'<a href="'. '"><i class="fa-solid fa-trash"></i></a>'."</td>";
            echo "<tr>";
        }
    } catch(PDOException $e) {
        echo "Lỗi truy vấn: " . $e->getMessage();
    }
    
    $conn = null;

    // try {
    //     $conn = new PDO("mysql:host=localhost;dbname=btth01_cse485_ex", "root", "");
    //     // Truy vấn dữ liệu từ cơ sở dữ liệu
    //     $sql = "SELECT * FROM theloai";
    //     $result = $conn->query($sql);

    //     $counter = 1;

    //     // Đổ dữ liệu lên bảng
    //     if ($result->rowCount() > 0) {
    //         while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
    //             echo "<tr>";
    //             //echo "<td>" . $counter++ . "</td>";
    //             echo "<td>" . $row["ma_tloai"] . "</td>";
    //             echo "<td>" . $row["ten_tloai"] . "</td>";
    //             echo "<td>".'<a href="edit_author.php?id='.'"><i class="fas fa-pen-to-square"></i></a>'."</td>";
    //             echo "<td>".'<a href="'. '"><i class="fa-solid fa-trash"></i></a>'."</td>";
    //             echo "</tr>";
    //         }

    //     } else {
    //         echo "<tr><td colspan='2'>Không có dữ liệu</td></tr>";
    //     }

    //     // Đóng kết nối
    //     $conn = null;
    // } catch (PDOException $e) {
    //     echo "Lỗi kết nối: " . $e->getMessage();
    // }


?>