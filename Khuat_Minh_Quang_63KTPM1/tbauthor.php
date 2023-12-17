<?php
    //Kiem soat: Khai bao Cong ty dich vu Bao ve
    // session_start();
    // if(!isset($_SESSION['isLogined'])){ //Neu chua co the
    //     header("Location:login.php"); //Quay ra khai bao
    //     exit(1);
    // }
?>

<?php
    include".\conn.php";
    global $conn;
    try {
        // Kết nối MySQL bằng PDO
        // $conn = new PDO("mysql:host=localhost;dbname=BTTH01_CSE485_ex", "root", "");
        // Truy vấn dữ liệu từ cơ sở dữ liệu
        $sql = "SELECT * FROM tacgia";
        $result = $conn->query($sql);

        $counter = 1;

        // Đổ dữ liệu lên bảng
        if ($result->rowCount() > 0) {
            while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
                echo "<tr>";
                echo "<td>" . $counter++ . "</td>";
                echo "<td>" . $row["ten_tgia"] . "</td>";
                echo "<td>".'<a href="edit_author.php?id='.'"><i class="fas fa-pen-to-square"></i></a>'."</td>";
                echo "<td>".'<a href="'. '"><i class="fa-solid fa-trash"></i></a>'."</td>";
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