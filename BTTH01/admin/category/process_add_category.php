<?php 
    
    if($_SERVER['REQUEST_METHOD'] == 'POST') {  
        try {
            $maTheLoai = $_POST['matheloai'];
            $tenTheLoai = $_POST['tentheloai'];
             
            
            $con = new PDO("mysql:host=localhost;dbname=btth01_cse485", "root", "");
            $sql = "INSERT INTO theloai VALUES 
            ('$maTheLoai', '$tenTheLoai')";
            $stmt = $con->prepare($sql);
            $stmt->execute();
            if($stmt->rowCount() > 0) {
                header("Location: category.php?msg=Thêm thành công");
            }
        } catch (PDOException $e) {
           echo $e->getMessage();
        }
    }
    

?>