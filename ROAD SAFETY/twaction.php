<?php
include'DatabaseCon.php';
$db=new DatabaseCon;
$n=$_GET['t1'];
$p=$_GET['t2'];
$s=$_GET['t3'];
$g=$_GET['t4'];
$a=$_GET['t5'];
$d=$_GET['t6'];
$c=$_GET['t7'];
$e=$_GET['t8'];
$ps=$_GET['t9'];
$sql="select * from twarden";
$rs=$db->selectData($sql);
$row=mysql_fetch_array($rs);
$e1=$row['emal'];
if($e==$e1)
{
	echo "<script> alert('Email id Already exists');window.location='twarden.php';</script>";
}
else
{
$q="insert into twarden(name,place,station,gen,age,dtime,phno,email)values('$n','$p','$s','$g','$a','$d','$c','$e')";
$db->insertQuery($q);
$q1="select max(tid) as id from twarden";
$rst=$db->selectData($q1);
$row1=mysql_fetch_array($rst);
$id=$row1['id'];
$q2="insert into login(uid,uname,upass,utype)values('$id','$e','$ps','traffic warden')";
$db->insertQuery($q2);
echo "<script> alert('Successfully submit the details');window.location='adminhome.php';</script>";
}
?>
