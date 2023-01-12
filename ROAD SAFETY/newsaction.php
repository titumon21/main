<?php
include'DatabaseCon.php';
$db=new DatabaseCon;
session_start();
$val=$_SESSION['uid'];
$t=$_GET['t1'];
$d=$_GET['t2'];
$q="insert into news(title,description,vid)values('$t','$d','$val')";
$db->insertQuery($q);
echo "<script> alert('Successfully submit the details');window.location='twardenhome.php';</script>";
?>
