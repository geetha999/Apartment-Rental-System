
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>

<head>
  <title>Apartment Rental System</title>
  <meta name="description" content="website description" />
  <meta name="keywords" content="website keywords, website keywords" />
  <meta http-equiv="content-type" content="text/html; charset=windows-1252" />
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <!-- modernizr enables HTML5 elements and feature detects -->
  <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
</head>

<body>
  <div id="main">
    <header>
        <style>
            .button{
                   font-weight: bold;
                font-size: 100%;
                font-family: Arial;
                width: 80px;
                height: 25px;
                margin-left: 30px
            }
            .inputText{
                font-family: Arial; 
                font-size: medium; 
                width: 80%;
                height: 25px;
            }
        </style>
        <script type="text/javascript">

    function findTotal(){
        //alert('function is called');
        var water = document.getElementById('watercharges');
        var sewage = document.getElementById('sewagecharges');
        var gbg = document.getElementById('garbagecharges');
        var rent = document.getElementById('rent');
        var sum = 0 ;
        if(!isNaN(parseInt(water.value)))    
            sum += parseInt(water.value);
        if(!isNaN(parseInt(sewage.value)))    
            sum += parseInt(sewage.value); 
        if(!isNaN(parseInt(gbg.value)))    
            sum += parseInt(gbg.value);
        if(!isNaN(parseInt(rent.value)))    
            sum += parseInt(rent.value); 
        
        document.getElementById('totalcharges').value = sum ;
    
    }

    </script>
	  <div id="banner">
	    <div id="welcome">
	      <h2>Apartment Rental System</h2>
	    </div><!--close welcome-->			  	
	  </div><!--close banner-->	
	</header>
	
	<nav>
	  <div id="menubar">
        <ul id="nav">
          <li class="current"><a href="adminportal.jsp">Home</a></li>
          <li><a href="apartmentAllotmentForm.jsp">Register Tenant</a></li>
          <li><a href="paymenthistoradmin.jsp">Payments</a></li>
          <li><a href="viewextensionsadmin.jsp">Lease Extension</a></li>
          <li><a href="viewterminationsadmin.jsp">Lease Termination</a></li>
          <li><a href="index.jsp">Log out</a></li>
        </ul>
      </div><!--close menubar-->	
    </nav>	
        <div id="site_content">
      
        <div class="slideshow">
	<!-- <div style="width: 940px; height: 800px; float: left;"> -->
        <ul class="slideshow">
        <!-- <ul style="width: 940px; height: 300px; float: left;"> -->
          <li class="show"><img width="940" height="300" src="images/home_1.jpg"  /></li>
          <li><img width="940" height="300" src="images/home_2.jpg"  /></li>
          <li><img width="940" height="300" src="images/adminhome.jpg"  /></li>
        </ul> 
	  </div><!--close slideshow  -->
	<div id="content">		
        <div class="content_item">
	  	
	 
              <form method="post" action="apartmentAllotment.jsp">
            <center>
                <table  border="2" width="50%" cellpadding="10" style="color: white; font-size:medium ; margin-top: 30px">
                <thead>
                    <tr >
                        <th colspan="2">Apartment Allotment Registration</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Tenant First Name</td>
                        <td><input type="text" name="tfname" value="" class="inputText" /></td>
                    </tr>
                    <tr>
                        <td>Tenant Last Name</td>
                        <td><input type="text" name="tlname" value="" class="inputText" /></td>
                    </tr>
                    <tr>
                        <td>Apartment Number</td>
                        <td><input type="text" name="apartmentNo" value="" class="inputText" /></td>
                    </tr>
                    <tr>
                        <td>Apartment Type</td>
                        <td><input type="text" name="apartmentType" value="" class="inputText"` /></td>
                    </tr>
                    <tr>
                        <td>From Date</td>
                        <td><input type="text" name="fromDate" value="" class="inputText"/> </td>
                    </tr>
                    <tr>
                        <td>To Date</td>
                        <td><input type="text" name="toDate" value="" class="inputText"/> </td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name="email" value="" class="inputText"/> </td>
                    </tr>
                    <tr>
                        <td>Registration Code</td>
                        <td><input type="text" name="registrationcode" value="" class="inputText"/> </td>
                    </tr>
                    <tr>
                        <td>Water Charges</td>
                        <td><input type="text" onblur="findTotal();" id="watercharges" name="watercharges" value="" class="inputText"/> </td>
                    </tr>
                    <tr>
                        <td>Sewage Charges</td>
                        <td><input type="text" onblur="findTotal();" id="sewagecharges" name="sewagecharges" value="" class="inputText"/> </td>
                    </tr>
                    <tr>
                        <td>Garbage Charges</td>
                        <td><input type="text" onblur="findTotal()" id="garbagecharges" name="garbagecharges" value="" class="inputText"/> </td>
                    </tr>
                    <tr>
                        <td>Monthly Rent</td>
                        <td><input type="text" onblur="findTotal()" id="rent" name="rent" value="" class="inputText"/> </td>
                    </tr>
                    <tr>
                        <td>Total Monthly Charges</td>
                        <td><input type="label" id="totalcharges" name="totalcharges" value="" style="font-size:medium ; color: white; background: black; border: none" > </td>
                     </tr>
                    <tr>
                        <td colspan="2" align="right"><input type="submit" value="Submit" class="button" style="width:80px"/>
                            <input type="reset" value="Reset" class="button" style="margin-right: 40px; "/></td>
                    </tr>
                    <tr>
                        <td colspan="2">Back to Home!! <a href="adminportal.jsp">Home Page</a></td>
                    </tr>
                </tbody>
            </table>
            </center>
        </form>
            
          </div><!--close content_item-->
      </div><!--close content-->   
	
	</div><!--close site_content-->  	
  
    <footer>
	  <a href="adminportal.jsp">Home</a> | <a href="apartmentAllotmentForm.jsp">Register Tenant</a> | <a href="paymenthistoradmin.jsp">Payments</a> | <a href="viewextensionsadmin.jsp">Lease Extension</a> | <a href="viewterminationsadmin.jsp">Lease Termination</a><br/><br/>
	  
    </footer> 
        
  </div><!--close main-->
  
  <!-- javascript at the bottom for fast page loading -->
  <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/image_slide.js"></script>
  
</body>
</html>

