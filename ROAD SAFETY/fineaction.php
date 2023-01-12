<?php
include'DatabaseCon.php';
$db=new DatabaseCon;
session_start();
$val=$_SESSION['uid'];
$v=$_GET['t1'];
$a=$_GET['t2'];
$d=$_GET['t3'];
//$id=$_GET['t'];
$q="insert into fine(vno,amt,dte,vid)values('$v','$a','$d','$val')";
$db->insertQuery($q);
echo "<script> alert('Successfully submit the details');window.location='twardenhome.php';</script>";
?>