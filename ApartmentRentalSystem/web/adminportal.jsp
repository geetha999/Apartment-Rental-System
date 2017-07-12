
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
        if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
     response.sendRedirect("loginfailed.jsp"); 
      return ;  } %> 
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

        <div class="slideshow2">
	<!-- <div style="width: 940px; height: 800px; float: left;"> -->
        <ul class="slideshow2">
        <!-- <ul style="width: 940px; height: 300px; float: left;"> -->
          <li class="show"><img width="940" height="600" src="images/adminhome.jpg"  /></li>
          <li><img width="940" height="600" src="images/home_2.jpg"  /></li>
          <li><img width="940" height="600" src="images/tenanthome.png"  /></li>
        </ul> 
	  </div><!--close slideshow  -->
	  <div id="content">
              <div class="content_item">

                  
                  
                  
               </div><!--close content_item-->
         </div><!--close content-->   
	
	</div><!--close site_content-->
    
    <footer>
	  <a href="adminportal.jsp">Home</a> | <a href="apartmentAllotmentForm.jsp">Register Tenant</a> | <a href="paymenthistoradmin.jsp">Payments</a> | <a href="viewextensionsadmin.jsp">Lease Extension</a> | <a href="viewterminationsadmin.jsp">Lease Termination</a><br/><br/>
	  
    </footer> 
  
  </div><!--close main-->
  
  <!-- javascript at the bottom for fast page loading -->
  <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/image_slide_1.js"></script>
  
</body>
</html>
