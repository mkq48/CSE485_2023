<?php
if(isset($_GET['id'])){
    $id = $_GET['id'];
    try{
        $con = new PDO("mysql:host=localhost;dbname=btth01_cse485","root","");
        $sql = "DELETE FROM baiviet WHERE ma_bviet = $id";
        $stmt = $con->prepare($sql);
        $stmt->execute();
        if($stmt->rowCount() > 0) {
            header('Location: article.php');
        }
        else {
            echo "Lỗi";
        }
    }catch (\PDOException $e) {
        echo $e->getMessage();
    }
}
 
    
?>