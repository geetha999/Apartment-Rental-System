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
      
    String sql = "SELECT Payment_Type, Account_Details, DATE_FORMAT(Payment_Duration_FromDate,'%d/%m/%Y'), DATE_FORMAT(Payment_Duration_ToDate,'%d/%m/%Y'), Payment_Amount, DATE_FORMAT(Payment_Date,'%d/%m/%Y') , First_Name, Last_Name " +
                    " FROM Payment p, user_info u " +
                    " WHERE p.Payment_by = u.User_Id " ;
    PreparedStatement ps = con.prepareStatement(sql);
    rs = ps.executeQuery();
    int i=0;

    if(!rs.first()){ %>
        <h1>No payment records available.</h1>
        <br><a href="adminportal.jsp"> Home Page</a>
        <% return;
    } else { rs.beforeFirst(); %>
    <h1>Payment History</h1>
    <table border="2" cellpadding="10" width="100%" style="color: white; font-size: medium; margin-top: 10px; ">
        <tr ><td>Payment Type</td>
            <td>Account Details</td><td>Duration From</td><td>Duration To</td><td>Amount</td><td>Payment Date</td><td>First Name</td><td>Last Name</td>
        </tr>

    <% while(rs.next()){ %>
        <tr>
            <td><%=rs.getString(1)%></td>
            <td><%=rs.getString(2)%></td><td><%=rs.getString(3)%></td><td><%=rs.getString(4)%></td><td><%=rs.getInt(5)%></td><td><%=rs.getString(6)%></td><td><%=rs.getString(7)%></td><td><%=rs.getString(8)%></td>
        </tr>
    <% i++;
    } // end while %>
    </table>
    <%
    }}catch(Exception e){
        out.println("OOOOOOhhhhhhhhhhhhh!!!!!!!!!!!!");
        out.println("Exception occured");
    }finally{
        if((rs != null) && (!rs.isClosed()))  rs.close();
        if((st != null) && (!st.isClosed()))  st.close();
        if((con != null) && (!con.isClosed())) con.close();
    } // end try-finally %>

                  
                  
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
