<?php
    try {
        $con = new PDO("mysql:host=localhost;dbname=btth01_cse485", "root", "");
        $sql = "SELECT * FROM tacgia";
        $result = $con->query($sql);

        $counter = 1;

        if ($result->rowCount() > 0) {
            while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
                echo "<tr>";
                echo "<td>".$counter++."</td>";
                echo "<td>".$row["ten_tgia"]."</td>";
                echo "<td><a href='edit_author.php?id=".$row["ma_tgia"]."'><i class='fa-solid fa-pen-to-square'></i></a></td>";
                echo "<td><a onclick=\"return confirm('Bạn có chắc chắn muốn xoá?')\" href='delete_author.php?id=".$row["ma_tgia"]."'><i class='ms-4 fa-solid fa-trash'></i></a></td>";
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