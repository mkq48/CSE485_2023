<?php
    try {
        $con = new PDO("mysql:host=localhost;dbname=btth01_cse485", "root", "");
        $sql = "SELECT * FROM theloai";
        $result = $con->query($sql);

        $counter = 1;

        if ($result->rowCount() > 0) {
            while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
                echo "<tr>";
                echo "<td>".$counter++."</td>";
                echo "<td>".$row["ten_tloai"]."</td>";
                echo "<td>". '<a href="edit_category.php?id='.$row["ma_tloai"].'"><i class="fa-solid fa-pen-to-square"></i></a>'."</td>";
                echo "<td>".'<a onclick="return confirm(\'Bạn có chắc chắn muốn xoá?\')" href="delete_category.php?id='.$row["ma_tloai"].'"><i class="fa-solid fa-trash"></i></a>'."</td>";
                echo "</tr>";
            }
        } else {
            echo "<tr><td colspan='2'>Không có dữ liệu</td></tr>";
        }
        $con = null;
    } catch (PDOException $e) {
        echo "Lỗi kết nối: ".$e->getMessage();
    }
?>