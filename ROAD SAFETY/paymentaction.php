<?php
include'DatabaseCon.php';
$db=new DatabaseCon;
session_start();
$val=$_SESSION['uid'];
$a=$_GET['t1'];
$chn=$_GET['t2'];
$cn=$_GET['t3'];
$cv=$_GET['t4'];
$d=$_GET['t5'];
$dt=date('m-d-Y');
$q="select * from ureg where rid='$val'";
$rs=$db->selectData($q);
$row=mysql_fetch_array($rs);
$na=$row['name'];
$q="insert into payment(amt,chname,cno,cvvno,dte,name,vid,status,dt)values('$a','$chn','$cn','$cv','$d','$na','$val','paid','$dt')";
$db->insertQuery($q);
echo "<script> alert('Successfully Paid, Please download the recipte');window.location='print.php';</script>";
?>


