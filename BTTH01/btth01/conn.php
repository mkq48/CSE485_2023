<?php
    $conn = new PDO("mysql:host=localhost;dbname=BTTH01_CSE485_ex", "root", "");
    //B2. thuc thi truy van
    $sql = "SELECT * FROM users WHERE (username = '$user')";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
?>