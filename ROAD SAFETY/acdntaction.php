<?php
include'DatabaseCon.php';
$db=new DatabaseCon;
session_start();
$val=$_SESSION['uid'];
if(isset($_POST['submit']))
{
	$name=$_FILES['file']['name'];
$tmpname=$_FILES['file']['tmp_name'];
	if(isset($name))
	{
		if(!empty($name))
		{
			$location='uploads/';
			echo"file is".$name;
			if(move_uploaded_file($tmpname,$location.$name))
			$s=$_POST['t1'];
			$t=$_POST['t2'];
			$d=$_POST['t3'];
			$vn=$_POST['t4'];
			$v=$_POST['t5'];
			$dt=$_POST['t6'];
			$q="insert into accident(spot,time,dte,vname,vno,dtls,img,vid)values('$s','$t','$d','$vn','$v','$dt','$name','$val')";
			$db->insertQuery($q);
			echo "<script> alert('Successfully submit the details');window.location='twardenhome.php';</script>";

		}
	}
}
?>