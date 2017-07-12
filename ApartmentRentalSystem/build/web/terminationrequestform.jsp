
<%@ page import ="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
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
              <div class="content_item">        <%
    Connection con = null;
    Statement st = null ;
    ResultSet rs = null ;
  
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ars_db",
            "root", "root");
    st = con.createStatement();
    String apartmentNumber = null ;
    String apartmentType = null ;
    int apartmentRent = 0 ;
    
    String query = "SELECT Distinct Apartment_Number, Apartment_Type, Apartment_Rent " +
                    "FROM user_info u, allotment alt, lease l, Apartment ap " +
                    "WHERE u.Login = '" + session.getAttribute("userid") + "' " +
                    "AND u.User_ID = alt.User_ID " +
                    "AND alt.Lease_ID = l.Lease_ID " +
                    "AND l.Apartment_ID = ap.Apartment_ID " ;

        
    System.out.println(query);
    rs = st.executeQuery(query);
    System.out.println("**********************executed************************");
    if(rs.next()){ 
        apartmentNumber = rs.getString(1) ;
        apartmentType = rs.getString(2) ;
        apartmentRent = rs.getInt(3) ;
    }
 %>

        <form method="post" action="terminationrequest.jsp">
            <center>
                <table   border="2" width="50%" cellpadding="10" style="color: white; font-size:medium ; margin-top: 10px">
                <thead>
                    <tr >
                        <th colspan="2">Lease Termination Request</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Apartment Number</td>
                        <td><input type="label" name="apartmentNumber" style="color: white; background: black; font-size:medium; border: none" value=<%=apartmentNumber %>> </td>
                    </tr>
                    <tr>
                        <td>Apartment Type</td>
                        <td><%=apartmentType %></td>
                    </tr>
                    <tr>
                        <td>Apartment Rent</td>
                        <td><%=apartmentRent %></td>
                    </tr>
                    <tr>
                        <td>Leaving Date</td>
                        <td><input type="text" name="leavingDate" value="" class="inputText"/> </td>
                    </tr>
                    <tr >
                        <td colspan="2" align="right"><input type="submit" value="Submit" class="button"/>
                            <input type="reset" value="Reset" class="button" style="margin-right: 50px;"/></td>
                    </tr>
                    <tr >
                        <td colspan="2">Main Portal!! <a href="tenantportal.jsp">Main Portal</a></td>
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
