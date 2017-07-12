
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
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

        <div class="slideshow">
	<!-- <div style="width: 940px; height: 800px; float: left;"> -->
        <ul class="slideshow">
        <!-- <ul style="width: 940px; height: 300px; float: left;"> -->
          <li class="show"><img width="940" height="600" src="images/home_1.jpg"  /></li>
          <li><img width="940" height="600" src="images/home_2.jpg"  /></li>
          <li><img width="940" height="600" src="images/adminhome.jpg"  /></li>
        </ul> 
	  </div><!--close slideshow  -->
	  <div id="content">
              <div class="content_item">
                  
                 <%
    Connection con = null;
  Statement st = null ;
  ResultSet rs = null ;

try {
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ars_db",
            "root", "root");
    st = con.createStatement();

    boolean selectedRowFound = false ;
    String id[] = new String[10];
    for (int i = 0; i < 10; i++) {
        id[i] = request.getParameter("check" + i);
    if(id[i] != null){
        st.executeUpdate("UPDATE Renewal set  Renewal_Status='Approved' WHERE Renewal_ID = " + Integer.parseInt(id[i])+ ""); %>
        <h1>Extension Approved Successfully</font></h1>
    <% selectedRowFound = true ;
    } // end if
    }// end for
    if(!selectedRowFound){
        out.println("<h1> No Request is selected to approve. </h1>");
        out.println();
    }
    }catch(Exception e){
        out.println("OOOOOOhhhhhhhhhhhhh!!!!!!!!!!!!");
        out.println("Exception occured");
    }finally{
        if((st != null) && (!st.isClosed()))  st.close();
        if((con != null) && (!con.isClosed())) con.close();
    } // end try-finally
%>
        <h1>
<br><a href="viewextensionsadmin.jsp"> Back to View Extension Requests</a>
<br><a href="adminportal.jsp"> Back to Home Page</a> </h1> 
                  
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
