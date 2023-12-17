<?php
    try {
        $con = new PDO("mysql:host=localhost;dbname=btth01_cse485", "root", "");
        $sql = "SELECT * FROM baiviet";
        $result = $con->query($sql);

       

        if ($result->rowCount() > 0) {
            while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
                echo "<tr>";
                echo "<td>".$row["ma_bviet"]."</td>";
                echo "<td>".$row["tieude"]."</td>";
                echo "<td>".$row["ten_bhat"]."</td>";
                echo "<td>".$row["ma_tloai"]."</td>";
                echo "<td>".$row["tomtat"]."</td>";
                echo "<td>".$row["ma_tgia"]."</td>";
                echo "<td>".$row["ngayviet"]."</td>";
                echo "<td><a href='edit_article.php?id=".$row["ma_bviet"]."'><i class='fa-solid fa-pen-to-square'></i></a></td>";
                echo "<td><a onclick=\"return confirm('Bạn có chắc chắn muốn xoá?')\" href='process_delete_article.php?id=".$row["ma_bviet"]."'><i class='ms-4 fa-solid fa-trash'></i></a></td>";
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