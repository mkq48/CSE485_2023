<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="jquery.js"></script>

    <title>Document</title>
</head>
<body>
    <div class="container">		
        <h2>Example: Comment System with Ajax, PHP & MySQL</h2>		
        <form method="POST" id="commentForm">
            <div class="form-group">
                <input type="text" name="name" id="name" class="form-control" placeholder="Enter Name" required />
            </div>
            <div class="form-group">
                <textarea style="margin-top: 10px;" name="comment" id="comment" class="form-control" placeholder="Enter Comment" rows="5" required></textarea>
            </div>
            <span id="message"></span>
            <div class="form-group">
                <input type="hidden" name="commentId" id="commentId" value="0" />
                <input style="margin-top: 10px;" type="submit" name="submit" id="submit" class="btn btn-primary" value="Post Comment" />
            </div>
	
        <div id="showComments"></div>   
    </div>	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="comments.js"></script>
</body>
</html>
