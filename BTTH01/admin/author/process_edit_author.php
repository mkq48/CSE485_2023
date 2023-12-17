<?php

if($_SERVER['REQUEST_METHOD']=="POST"){
    try{
        $maTacGia = $_POST['matacgia'];
        $tenTacGia = $_POST['tentacgia'];

        $con = new PDO("mysql:host=localhost;dbname=btth01_cse485", "root", "");
        $sql = "UPDATE tacgia SET ten_tgia = '$tenTacGia'  WHERE ma_tgia = $maTacGia";
        $stmt = $con->prepare($sql);
        $stmt->execute();
        if($stmt->rowCount() > 0) {
            header('Location: author.php');
        }
        else {
            echo "Lỗi";
        }
    }catch(PDOException $e){
        echo $e->getMessage();
    }
}


?>