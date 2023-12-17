<?php
if($_SERVER['REQUEST_METHOD']=="GET"){   
    try{
        $id = $_GET['id'];

        $con = new PDO("mysql:host=localhost;dbname=btth01_cse485","root","");
        $sql = "DELETE FROM theloai WHERE ma_tloai = $id";
        $stmt = $con->prepare($sql);
        $stmt->execute();
        if($stmt->rowCount() > 0) {
            header('Location: category.php');
        }
        else {
            echo "Lỗi";
        }
    }catch (PDOException $e) {
        echo $e->getMessage();
    }
}
 
    
?>