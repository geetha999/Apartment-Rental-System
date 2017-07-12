
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
</head>
  
<body>
  <div id="main">
    <header>
	  <div id="banner">
	    <div id="welcome">
	      <h2>Apartment Rental System</h2>
	    </div><!--close welcome-->			  	
	  </div><!--close banner-->	
	</header>
	
	<nav>
	  <div id="menubar">
        <ul id="nav">
          <li><a href="tenantportal.jsp">Home</a></li>
          <li><a href="paymentform.jsp">Payment</a></li>
          <li><a href="paymenthistory.jsp">Payment History</a></li>
          <li><a href="renewalrequestform.jsp">Lease Extension</a></li>
          <li><a href="viewextensionstenant.jsp">Extension Status</a></li>
          <li><a href="terminationrequestform.jsp">Lease Termination</a></li>
          <li><a href="viewterminationstenant.jsp">Termination Status</a></li>
          <li><a href="index.jsp">Log out</a></li>
        </ul>
      </div><!--close menubar-->	
    </nav>	
    
	<div id="site_content">		

        <div class="slideshow">
	<!-- <div style="width: 940px; height: 800px; float: left;"> -->
        <ul class="slideshow">
        <!-- <ul style="width: 940px; height: 300px; float: left;"> -->
          <li class="show"><img width="940" height="600" src="images/home_1.jpg"  /></li>
          <li><img width="940" height="600" src="images/home_2.jpg"  /></li>
          <li><img width="940" height="600" src="images/tenanthome.png"  /></li>
        </ul> 
	  </div><!--close slideshow  -->
	  <div id="content">
              <div class="content_item">
                  
  <form method="post" action="registration.jsp">
            <center>
                <table  border="2" width="50%" cellpadding="10" style="color: white; font-size:medium ; margin-top: 10px">
                <thead>
                    <tr >
                        <th colspan="2"><font style="color:white">User Registration</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>First Name</td>
                        <td><input type="text" name="fname" value="" class="inputText"/></td>
                    </tr>
                    <tr>
                        <td>Last Name</td>
                        <td><input type="text" name="lname" value="" class="inputText" /></td>
                    </tr>
                    <tr>
                        <td>Registration Code</td>
                        <td><input type="text" name="registrationcode" value="" class="inputText" /></td>
                    </tr>
                    <tr>
                        <td>Email Id</td>
                        <td><input type="text" name="email" value="" class="inputText"/> </td>
                    </tr>
                    <tr>
                        <td>Login</td>
                        <td><input type="text" name="login" value="" class="inputText"/> </td>
                    </tr>
                    <tr>
                        <td>Enter Password</td>
                        <td><input type="password" name="password" value="" class="inputText"/></td>
                    </tr>
                    <tr>
                        <td>Confirm Password</td>
                        <td><input type="password" name="cpassword" value="" class="inputText"/></td>
                    </tr>
                    <tr>
                        <td>Co-Resident Name</td>
                        <td><input type="text" name="coresident" value="" class="inputText"/></td>
                    </tr>
                    <tr>
                        <td>Mobile Number</td>
                        <td><input type="text" name="mobile" value="" class="inputText"/></td>
                    </tr>
                    <tr >
                        <td colspan="2" align="right"><input type="submit" value="Submit" class="button"/>
                            <input type="reset" value="Reset" class="button" style="margin-right: 50px"/></td>
                    </tr>
                    <tr >
                        <td colspan="2">Already registered!! <a href="index.jsp">Login Here</a></td>
                    </tr>
                </tbody>
            </table>
            </center>
        </form>                
                  
               </div><!--close content_item-->
         </div><!--close content-->   
	
	</div><!--close site_content-->
    
    <footer>
	  <a href="tenantportal.jsp">Home</a> | <a href="paymentform.jsp">Payment</a> | <a href="paymenthistory.jsp">Payment History</a> | <a href="renewalrequestform.jsp">Lease Extension</a> | <a href="viewextensionstenant.jsp">Extension Status</a> | <a href="terminationrequestform.jsp">Lease Termination</a> | <a href="viewterminationstenant.jsp">Termination Status</a> <br/><br/>
	  
    </footer> 
  
  </div><!--close main-->
  
  <!-- javascript at the bottom for fast page loading -->
  <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/image_slide.js"></script>
  
</body>
</html>
