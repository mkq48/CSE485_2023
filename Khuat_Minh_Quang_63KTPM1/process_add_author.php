<?php
    include("conn.php");
    try {
        
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        if (isset($_POST['txtAuthorName'])) {
            $author = $_POST['txtAuthorName'];
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