<?php




if($_SERVER['REQUEST_METHOD']=="POST"){
    try{
        $id = $_POST['mabaiviet'];
        $tieude = $_POST['tieude'];
        $tenbaihat = $_POST['tenbaihat'];
        $matheloai = $_POST['matheloai'];
        $tomtat = $_POST['tomtat'];
        $matacgia = $_POST['matacgia'];
        $ngayviet = $_POST['ngayviet'];

        $con = new PDO("mysql:host=localhost;dbname=btth01_cse485", "root", "");
        $sql = "UPDATE baiviet SET tieude = '$tieude', ten_bhat = '$tenbaihat', ma_tloai = '$matheloai', tomtat = '$tomtat',
                 ma_tgia = '$matacgia', ngayviet = '$ngayviet' WHERE ma_bviet = $id";
        $stmt = $con->prepare($sql);
        $stmt->execute();
        if($stmt->rowCount() > 0) {
            header('Location: article.php');
        }
        else {
            echo "Lỗi";
        }
    }catch(PDOException $e){
        echo $e->getMessage();
    }
}


?>