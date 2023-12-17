<?php
if($_SERVER['REQUEST_METHOD']=="GET"){   
    try{
        $id = $_GET['id'];

        $con = new PDO("mysql:host=localhost;dbname=btth01_cse485","root","");
        $sql = "DELETE FROM tacgia WHERE ma_tgia = $id";
        $stmt = $con->prepare($sql);
        $stmt->execute();
        if($stmt->rowCount() > 0) {
            header('Location: author.php');
        }
        else {
            echo "Lỗi";
        }
    }catch (PDOException $e) {
        echo $e->getMessage();
    }
}
 
    
?>