<!DOCTYPE html>

<html lang="en">
	<head>
		<style>	
		.table {
			width: 100%;
			margin-bottom: 20px;
		}	
		
		.table-striped tbody > tr:nth-child(odd) > td,
		.table-striped tbody > tr:nth-child(odd) > th {
			background-color: #f9f9f9;
		}
		
  .ad {margin-left:200px;
  margin-top:200px;
  width:700px;
  }
  lab {margin-left:200px;
  color:blue;
  }
  
  
  

		@media print{
			#print {
				display:none;
			}
		}
		@media print {
			#PrintButton {
				display: none;
			}
		}
		
		@page {
			size: auto;   /* auto is the initial value */
			margin: 0;  /* this affects the margin in the printer settings */
		}
	</style>
	</head>
<body>
	<h2>...</h2>
	<br /> <br /> <br /> <br />
	<b style="color:blue;">Date Prepared:</b>
	<?php
		$date = date("Y-m-d", strtotime("+6 HOURS"));
		echo $date;
	?>
	<div class="ad">
    
<div class="c" >
          	<form action="" class="request-form ftco-animate" style="width:200" onSubmit="return check();">
          
          		<h2><center> FINE RECIPTE</center></h2><hr color="#FF0000">
                
                <div align="center">
                <img src="images/5.webp" width="90" height="90">
                </div>
                <br><br>
	    				<div class="form-group">
                        <?php
			  include "DatabaseCon.php";
			  $db=new DatabaseCon;
			 session_start();
			 $val=$_SESSION['uid'];
			 // $id=$_GET['id'];
			  $s="select * from payment where vid='$val'";
			  $rs=$db->selectData($s);
			  while($row=mysql_fetch_array($rs))
			  {
				  ?>
                  <input type="hidden" class="form-control" value="<?php echo $row['vid'];?>" required name="t" id="t">
                  <div class="p" align="left">
                 
	    					
	    				<div class="a1" align="left">
                        <center><font color="#FF6666"><u>PAYMENT DETAILS</u></font>
                        <br><br>
	    					<label for="" class="label"><?php echo $row['name'];?></label>
                          
                            <label for="" class="label"><?php echo $row['amt'];?></label>
	    					 <br>
                            <label for="" class="label"><?php echo $row['dt'];?></label>
                            <br>
                            <label for="" class="label"><?php echo $row['status'];?></label>
	    					</center>
                        </div>
                       
                       
	    				<!--<div class="d-flex">
	    					<div class="form-group mr-2">
	                <label for="" class="label">Pick-up date</label>
	                <input type="text" class="form-control" id="book_pick_date" placeholder="Date">
	              </div>
	              <div class="form-group ml-2">
	                <label for="" class="label">Drop-off date</label>
	                <input type="text" class="form-control" id="book_off_date" placeholder="Date">
	              </div>
              </div>
              <div class="form-group">
                <label for="" class="label">Pick-up time</label>
                <input type="text" class="form-control" id="time_pick" placeholder="Time">
              </div>-->
              <?php } ?>
	            <!--<div class="form-group">
	              <input type="submit" value="Update" class="btn btn-info">
	            </div>-->
	    			<hr></form>
          </div>
</div>
<br><br>
	<center><button id="PrintButton" onclick="PrintPage()">Print</button></center>
</body>
<script type="text/javascript">
	function PrintPage() {
		window.print();
	}
</script>
</html>


