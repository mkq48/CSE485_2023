<?php
include("db_connect.php");

if(!empty($_POST["name"]) && !empty($_POST["comment"])){
    
    $commentId = $_POST["commentId"];
    $comment = $_POST["comment"];
    $name = $_POST["name"];

    $insertComments = "INSERT INTO comments (parent_id, comment, sender) VALUES ('$commentId', '$comment', '$name')";

    $result = $conn->query($insertComments);

    if ($result->rowCount() > 0) {
        $message = '<label class="text-success">Comment posted Successfully.</label>';
        $status = array(
            'error'  => 0,
            'message' => $message
        );	

    //$result = null;
    } else {
        $message = '<label class="text-danger">Error: Comment not posted.</label>';
        $status = array(
            'error'  => 1,
            'message' => $message
        );	
    }
    
echo json_encode($status);
}
?>
