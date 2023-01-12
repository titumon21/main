<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Road Safety</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">
    
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
      <?php 
  session_start();
  if($_SESSION['uid']=="" || $_SESSION['uid']=='null')
  header('location:index.html');
  ?>
  </head>
  <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
  	<div class="py-1 bg-black top">
    	<div class="container">
    		<div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
	    		<div class="col-lg-12 d-block">
		    		<div class="row d-flex">
		    			<div class="col-md pr-4 d-flex topper align-items-center">
					    	<div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-phone2"></span></div>
						    <span class="text">+ 1235 2355 98</span>
					    </div>
					    <div class="col-md pr-4 d-flex topper align-items-center">
					    	<div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-paper-plane"></span></div>
						    <span class="text">youremail@email.com</span>
					    </div>
					    <div class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right justify-content-end">
						   
					    </div>
				    </div>
			    </div>
		    </div>
		  </div>
    </div>
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="userhome.php">Road Safety</a>
	      <button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav nav ml-auto">
	             <li class="nav-item"><a href="userhome.php" class="nav-link"><span>Home</span></a></li>
	         <li class="nav-item"><a href="viewnews.php" class="nav-link"><span>News</span></a></li>
	          <li class="nav-item"><a href="viewrules.php" class="nav-link"><span>Rules</span></a></li>
	          <li class="nav-item"><a href="viewtwarden.php" class="nav-link"><span>Traffic Warden</span></a></li>
	          <li class="nav-item"><a href="viewacdent.php" class="nav-link"><span>Accident</span></a></li>
	          <li class="nav-item"><a href="viewfn.php" class="nav-link"><span>Fine</span></a></li>
                <li class="nav-item"><a href="search.php" class="nav-link"><span>Search</span></a></li>
	          <li class="nav-item cta mr-md-2"><a href="index.html" class="nav-link">Logout</a></li>
	        </ul>
	      </div>
	    </div>
	  </nav>
	  
	  <section class="hero-wrap js-fullheight" style="background-image:url(images/e.jpg);" data-section="home" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-start" data-scrollax-parent="true">
          <div class="col-md-6 pt-5 ftco-animate">
          	<div class="mt-5">
            <center>
           <form action="paymentaction.php" onSubmit="return check();">
           <table style="color:#F00">
           <?php
		   include'DatabaseCon.php';
		   $db=new DatabaseCon;
		   $id=$_GET['id'];
		   $q="select * from fine where fid='$id'";
		   $rs=$db->selectData($q);
		   while($row=mysql_fetch_array($rs))
		   {
			   ?>
               <tr><td>Amount</td><td><input type="text" name="t1" value="<?php echo $row['amt'];?>" readonly></td></tr>
               <tr><td>&nbsp;</td></tr>
               <tr><td>Card holder name</td><td><input type="text" name="t2" required="yes" id="t2"></td></tr>
               <tr><td>&nbsp;</td></tr>
               <tr><td>Card Number</td><td><input type="text" name="t3" requireed="yes" id="t3" maxlength="16" minlength="16"></td></tr>
               <tr><td>&nbsp;</td></tr>
               <tr><td>C v v</td><td><input type="text" name="t4" maxlength="3" minlength="3" id="t4"></td></tr>
               <tr><td>&nbsp;</td></tr>
               <tr><td>Date</td><td><input type="date" name="t5"min="<?php echo date('Y-m-d');?>"></td></tr>
               <?php
		   }
		   ?>
           <tr><td>&nbsp;</td></tr>
           <tr><td align="center" colspan="2"><input type="submit" value="ADD" class="btn-danger"></td></tr>
           </table>
           </form>
            </center>
             </div>
          </div>
        </div>
      </div>
    </section>
<script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  
  <script src="js/main.js"></script>
    
  </body>
</html>

<script type="text/javascript">
var letters=/^[a-z A-Z]+$/;
var numbers=/^[0-9]+$/;
function check()
{
	if(!document.getElementById("t2").value.match(letters))
	{
		alert("Please input alphabets only for name");
		return false;
	}
	else if(!document.getElementById("t3").value.match(numbers))
	{
		alert("Please input digits only for card number");
		return false;
	}
	else if(!document.getElementById("t4").value.match(numbers))
	{
		alert("Please input digits only for cvv number");
		return false;
	}
	else
	{
		return true;
	}
}
</script>
