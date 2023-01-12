<?php
include'DatabaseCon.php';
$db=new DatabaseCon;
$n=$_GET['t1'];
$a=$_GET['t2'];
$c=$_GET['t3'];
$e=$_GET['t4'];
$p=$_GET['t5'];
$vn=$_GET['t6'];
$q="select * from ureg";
$rs=$db->selectData($q);
$row=mysql_fetch_array($rs);
$e1=$row['email'];
if($e==$e1)
{
	echo "<script> alert('Email is already exists');window.location='ureg.php';</script>";
}
else
{
	$q1="insert into ureg(name,addr,phno,email,vhno)values('$n','$a','$c','$e','$vn')";
	$db->insertQuery($q1);
	$q2="select max(rid) as id from ureg";
	$rst=$db->selectData($q2);
	$row1=mysql_fetch_array($rst);
	$id=$row1['id'];
	$q3="insert into login(uid,uname,upass,utype)values('$id','$e','$p','user')";
	$db->insertQuery($q3);
	echo "<script> alert('Registration successfully completed');window.location='index.html';</script>";
}
?>