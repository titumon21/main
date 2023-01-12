<?php
include'DatabaseCon.php';
$db=new DatabaseCon;


if(isset($_GET['id']))
{
	$id=$_GET['id'];
	
	$q="select * from rules where rid='$id'";
	$rs=$db->selectData($q);
	$row=mysql_fetch_array($rs);
	$filepath='uploads/'.$row['doc'];
	
	if(file_exists($filepath))
	{
		header('Content-Description:File Transfer');
		header('Content-Type:application/octet-stream');
		header('Content-Disposition:attachment; filename=' .basename($filepath));
		header('Expires: 0');
		header('Cache-Control: must-revalidate');
		header('Pragma: public');
		header('Content-Length: '.filesize('uploads/' .$row['doc']));
		readfile('uploads/' .$row['doc']);
	}
}
?>
	