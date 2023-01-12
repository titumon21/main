<?php
include'DatabaseCon.php';
$db=new DatabaseCon;
$uname=$_POST['t1'];
$upass=$_POST['t2'];
$query="select * from login where uname='$uname' and upass='$upass'" ;
echo "<script> alert('Invalid Password or username');window.location='index.html';</script>";
$d=new DatabaseCon;
$ret=$d->selectQuery($query);
$rst=$d->selectData($query);
$row=mysql_fetch_array($rst);
if($ret==1)
 {
	   session_start();
	   if($row['utype']=="admin")
	   {
  //	$_SESSION['userloged']=$username;
	$_SESSION['uid']=$row['uid'];
	 header('location:adminhome.php');
	   }

	    else if($row['utype']=="user")
	   {
		   $_SESSION['uid']=$row['uid'];
		  // $_SESSION['userloged']=$username;
	 header('location:userhome.php');
	   }
	   else if($row['utype']=="traffic warden")
	   {
		   $_SESSION['uid']=$row['uid'];
		  // $_SESSION['userloged']=$username;
	 header('location:twardenhome.php');
	   }
	   
 }
 else
 {
	 header('location:index.html');
	 
 }
 $d->closeDatabase();
 ?>
