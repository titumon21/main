<?php
include'DatabaseCon.php';
$db=new DatabaseCon;
session_start();
$val=$_SESSION['uid'];
$s=$_GET['t1'];
$q="insert into spot(spot,vid)values('$s','$val')";
$db->insertQuery($q);
echo "<script> alert('Successfully submit the details');window.location='twardenhome.php';</script>";
?>