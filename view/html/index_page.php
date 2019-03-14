
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/mycss.css">
  <script src="js/jquery.js"></script>
  <script src="js/popper.js"></script>
  <script src="js/bootstrap.js"></script>
</head>
<body>

 
<div class="flip-card" style="float:left">
        <div class="flip-card-inner">
            <div class="flip-card-front">
                 <img src="js/logo.png" alt="Avatar" style="width:200px;height:200px;">
            </div>
            <div class="flip-card-back">
                 <p>THE INDEPENDENT STUDENT PUBLICATION OF THE UNIVERSITY AT BUFFALO, SINCE 1950</p>
            </div>
        </div>
    </div>
  <div class="" id="jumbo">
      <div id="textInJumbo">
         <h1>CrowdSource Data Reviews</h1> 
         <p>THE LESS YOU KNOW THE MORE YOU BELIEVE.</p> 
    </div>

  </div>
<div id =input_padding>
</div>
<div class="container">
    <h2>DataSet of the Month ! </h2>

    <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. 
        Exercitationem, omnis amet, hic nostrum voluptatibus ut libero sunt aperiam consequuntur repudiandae quas 
        esse ducimus recusandae saepe eum. Quos saepe obcaecati dolorum.</p>
    <p>Want to review ? </p>

    <form method="POST" action="validate.php" >
        <label>Please enter your UBIT Name: </label>
        <input type="text" name="ubitname" place-holder="UBIT Name"/>
        <button type="button" class="btn btn-primary_own" data-toggle="modal" data-target="#myModal">
            Enter
        </button>
       
    </form>
</div>
<div class="container">
 
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Please enter the token send to your mail.</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
       
        <div class="modal-body">
          <input type="text" name="otp" placeholder="Valid Token">
          <form action="secure_email_code.php" id="form" method="post" name="form">
          <input type="submit" name="otp" value="Submit"/>
          <h3><?php include "secure_email_code.php"?></h3>
          </form>
        </div>


</body>
</html>