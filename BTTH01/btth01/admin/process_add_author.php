<?php
    try {
        $conn = new PDO("mysql:host=localhost;dbname=BTTH01_CSE485_ex", "root", "");
        
       

         // Thiết lập chế độ báo lỗi và exception cho PDO
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        if (isset($_POST['txtAuthorName'])) {
            $author = $_POST['txtAuthorName'];

            // Lưu bản băm (hash) vào cơ sở dữ liệu
            $sql = "INSERT INTO tacgia (ten_tgia) VALUES ('$author')";
            $stmt = $conn->prepare($sql);
            $stmt->execute();
            
           
        }
        header("Location:author.php");
        $conn = null;
    } catch (PDOException $e) { 
        echo "Lỗi kết nối". $e->getMessage() ."";
    }
?>