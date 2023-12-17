<?php
if($_SERVER['REQUEST_METHOD']=="POST"){
    //Lay thong tin tu Form gui toi
    $user = $_POST['user'];
    $passInput = $_POST['pass'];
    
    
    //KIEM TRA THONG TIN LAY TU CSDL
    //Ket noi CSDL
    try{
        $con = new PDO("mysql:host=localhost;dbname=btth01_cse485","root","");
        //Truy van
        $sql = "SELECT * FROM users WHERE (username = '$user')";
        $stmt = $con->prepare($sql);
        $stmt->execute();

        //Xu ly truy van
        if($stmt->rowCount()>0){
            $users = $stmt->fetch();
            $password = $users['pass'];

            if(password_verify($passInput, $password)){
                header("Location:admin/index.php");
            }else{
                $error = "Mat khau khong hop le";
                header("Location:login.php?error=$error");
            }
        }else{
            $error = "Khong tim thay nguoi dung";
            header("Location:login.php?error=$error");
        }

    }catch(PDOException $e){
        echo $e->getMessage();
    }
}

?>