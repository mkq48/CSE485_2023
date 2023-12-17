<?php 
    
    if($_SERVER['REQUEST_METHOD'] == 'POST') {  
        try {
            $maTacGia = $_POST['matacgia'];
            $tenTacGia = $_POST['tentacgia'];
             
            
            $con = new PDO("mysql:host=localhost;dbname=btth01_cse485", "root", "");
            $sql = "INSERT INTO tacgia VALUES 
            ('$maTacGia', '$tenTacGia')";
            $stmt = $con->prepare($sql);
            $stmt->execute();
            if($stmt->rowCount() > 0) {
                header("Location: author.php?msg=Thêm thành công");
            }
        } catch (PDOException $e) {
           echo $e->getMessage();
        }
    }
    

?>