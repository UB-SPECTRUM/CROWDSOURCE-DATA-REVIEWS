<?php
if(isset($_POST["submit"])){
    require 'PHPMailerAutoload.php';
    $mail = new PHPMailer;

    $mail-> Host='smtp.gmail.com';
    $mail->Port=587;
    $mail-> SMTPAuth=true;
    $mail->SMTPSecure='tls';
    $mail->Username='nallusowmith6@gmail.com';
    $mail->Password='anitha1995';

    $mail->setFrom($_POST['vemail']);
    $mail->addAddress('nallusomwith@gmail.com');
    $mail->addReplyTo($_POST['vemail']);
    $mail->isHTML(true);
    //$mail->Subject='Form Submission:' '.$_POST['Subject'];
    echo('<p>Successfully authenticated</p>');
    }

    ?>