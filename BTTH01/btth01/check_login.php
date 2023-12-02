<?php
    if(isset($_POST['user']) && isset($_POST['pass'])){
        //Lay thong tin tu FORM gui toi
        $user = $_POST['user'];
        $passInput = $_POST['pass'];
    
        //KIEM TRA THONG TIN lay duoc voi CSDL
        //B1. ket noi DB Server
        try{
            $conn = new PDO("mysql:host=localhost;dbname=BTTH01_CSE485_ex", "root", "");
            //B2. thuc thi truy van
            $sql = "SELECT * FROM users WHERE (username = '$user')";
            $stmt = $conn->prepare($sql);
            $stmt->execute();
    
           
            //B3. xu ly truy van
            if($stmt->rowCount() > 0){
                $users = $stmt->fetch();
                $password = $users['pass']; //Lay mat khau dang luu trong CSDL
                
                if(password_verify($passInput, $password)){
                    header("Location:admin/index.php");
                }else{
                    $error = "Password invalid";
                    header("Location:login.php?error=$error");
                }
            }else{
                $error = "Username not found";
                header("Location:login.php?error=$error");
            }
        }catch(PDOException $e){
            echo $e->getMessage();
        }
    }

?>