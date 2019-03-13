<?php
if(isset($_POST['submit_row']))
{
 $host="localhost";
 $username="root";
 $password="";
 $databasename="spectrum";
 $dbh = new PDO('mysql:host=localhost;dbname=spectrum', $username, $password);
 
 $datasetname=$_POST['Name'];
 $description=$_POST['Description'];
 $split=$_POST['split'];
 $data = file_get_contents($_FILES['file']['tmp_name']);
 $file_type = $_FILES['file']['type'];
 $stmt = $dbh->prepare("insert into tbl_current_dataset values('',?,?,?,?,?)");
 $stmt->bindParam(1,$datasetname);
 $stmt->bindParam(2,$description);
 $stmt->bindParam(3,$file_type);
 $stmt->bindParam(4,$data);
 $stmt->bindParam(5,$split);
 $stmt->execute();
 
}
?>