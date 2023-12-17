<?php
    include("db_connect.php");
    
    // Define the getCommentReplies function
    function getCommentReply($conn, $commentId) {
        $commentQuery = "SELECT id, comment, sender, date FROM comments WHERE parent_id = '$commentId' ORDER BY id DESC";
        $stm = $conn->prepare($commentQuery);
        $stm->execute();
        $replyHTML = '';

        while($reply = $stm->fetch()){
            $replyHTML .= '
                <div class="panel panel-primary">
                <div class="panel-heading">By <b>'.$reply["sender"].'</b> on <i>'.$reply["date"].'</i></div>
                <div class="panel-body">'.$reply["comment"].'</div>
		        <div class="panel-footer" align="right"><button type="button" class="btn btn-primary reply" id="'.$reply["id"].'">Reply</button></div>
                </div> ';
        }

        return $replyHTML;
    }

    try{
        $commentQuery = "SELECT id, parent_id, comment, sender, date FROM comments WHERE parent_id = '0' ORDER BY id DESC";
        $stm = $conn->prepare($commentQuery);
        $stm->execute();
        $commentHTML = '';
        while($comment = $stm->fetch()){
	        $commentHTML .= '
		    <div class="panel panel-primary">
		    <div class="panel-heading">By <b>'.$comment["sender"].'</b> on <i>'.$comment["date"].'</i></div>
		    <div class="panel-body">'.$comment["comment"].'</div>
		    <div class="panel-footer" align="right"><button type="button" class="btn btn-primary reply" id="'.$comment["id"].'">Reply</button></div>
		    </div> ';
            $commentHTML .= getCommentReply($conn, $comment["id"]);
        }
    echo $commentHTML;
    }catch(PDOException $e){
        echo $e->getMessage();
    }
?>
