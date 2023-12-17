<?php

if($_SERVER['REQUEST_METHOD']=="POST"){
    try{
        $maTheLoai = $_POST['matheloai'];
        $tenTheLoai = $_POST['tentheloai'];

        $con = new PDO("mysql:host=localhost;dbname=btth01_cse485", "root", "");
        $sql = "UPDATE theloai SET ten_tloai = '$tenTheLoai'  WHERE ma_tloai = $maTheLoai";
        $stmt = $con->prepare($sql);
        $stmt->execute();
        if($stmt->rowCount() > 0) {
            header('Location: category.php');
        }
        else {
            echo "Lỗi";
        }
    }catch(PDOException $e){
        echo $e->getMessage();
    }
}


?>