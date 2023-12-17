

<?php
    include"conn.php";

    try {
        // Kết nối MySQL bằng PDO
        //$conn = new PDO("mysql:host=localhost;dbname=BTTH01_CSE485_ex", "root", "");
        // Truy vấn dữ liệu từ cơ sở dữ liệu
        $sql = "SELECT * FROM baiviet";
        $result = $conn->query($sql);

        $counter = 1;
        

        // Đổ dữ liệu lên bảng
        if ($result->rowCount() > 0) {
            while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
                echo "<tr>";
                //echo "<td>" . $counter++ . "</td>";
                echo "<td scope="."col>" . $row["ma_bviet"] . "</td>";
                echo "<td scope="."col>" . $row["tieude"] . "</td>";
                echo "<td scope="."col>" . $row["ten_bhat"] . "</td>";
                echo "<td scope="."col>" . $row["ma_tloai"] . "</td>";
                echo "<td scope="."col>" . $row["tomtat"] . "</td>";
                //echo "<td scope="."col>" . $row["noidung"] . "</td>";
                echo "<td scope="."col>" . $row["ma_tgia"] . "</td>";
                echo "<td scope="."col>" . $row["ngayviet"] . "</td>";
                //echo "<td>" . $row["hinhanh"] . "</td>";
                echo "<th>".'<a href="edit_author.php?id='.'"><i class="fas fa-pen-to-square"></i></a>'."</th>";
                echo "<th>".'<a href="'. '"><i class="fa-solid fa-trash"></i></a>'."</th>";
                echo "</tr>";
            }

        } else {
            echo "<tr><td colspan='2'>Không có dữ liệu</td></tr>";
        }

        // Đóng kết nối
        $conn = null;
    } catch (PDOException $e) {
        echo "Lỗi kết nối: " . $e->getMessage();
    }


?>