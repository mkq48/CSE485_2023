<?php 
    
    if($_SERVER['REQUEST_METHOD'] == 'POST') {  
        try {
            $maBaiViet = $_POST['mabaiviet'];
            $tieuDe = $_POST['tieude'];
            $tenBaiHat = $_POST['tenbaihat'];
            $maTheLoai = $_POST['matheloai'];
            $tomTat = $_POST['tomtat'];
            $maTacGia = $_POST['matacgia'];
            $ngayViet = $_POST['ngayviet'];
            
            $con = new PDO("mysql:host=localhost;dbname=btth01_cse485", "root", "");
            $sql = "INSERT INTO baiviet VALUES 
            ('$maBaiViet', '$tieuDe', '$tenBaiHat', '$maTheLoai', '$tomTat', '$maTacGia', '$ngayViet')";
            $stmt = $con->prepare($sql);
            $stmt->execute();
            if($stmt->rowCount() > 0) {
                header("Location: article.php?msg=Thêm thành công");
            }
        } catch (PDOException $e) {
           echo $e->getMessage();
        }
    }
    

?>