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
			$r=$_POST['t1'];
			$d=$_POST['t2'];
			$f=$_POST['t3'];
			$q="insert into rules(rls,description,fine,doc)values('$r','$d','$f','$name')";
			$db->insertQuery($q);
			echo "<script> alert('Successfully submit the details');window.location='adminhome.php';</script>";

		}
	}
}
?>