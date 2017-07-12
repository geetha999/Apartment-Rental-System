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
<%
  Connection con = null;
  Statement st = null ;
  ResultSet rs = null ;

try {
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ars_db",
            "root", "root");
    st = con.createStatement();
    
    String query = "select user_ID from user_info where Login ='" + session.getAttribute("userid") + "'";
    System.out.println(query);
    rs = st.executeQuery(query);
    System.out.println("**********************executed************************");
    int user_id = -1 ;
    if(rs.next()){ 
        user_id = rs.getInt(1);
    }
    
    String sql =  "SELECT DATE_FORMAT(Termination_Leaving_Date,'%d/%m/%Y'), DATE_FORMAT(Termination_Request_Date,'%d/%m/%Y') , datediff(Termination_Leaving_Date, Termination_Request_Date), Termination_Status, First_Name, Last_Name " +
                    " FROM Termination t, user_info u " +
                    " WHERE t.Requested_by = u.User_ID " +
                    " AND Requested_by = " + user_id;
    
    PreparedStatement ps = con.prepareStatement(sql);
    rs = ps.executeQuery();
    int i=0;

    if(!rs.first()){ %>
        <h1>There is no pending lease termination request from any tenant.</h1>
        <br><a href="tenantportal.jsp"> Back to Main Page</a>
        <% return;
    } else { rs.beforeFirst(); %>
    <h1>Lease Termination Requests</h1>
    <table border="2" width="100%" cellpadding="10" style="color: white; font-size:medium; margin-top: 10px; ">
        <tr>
            <td>Leaving Date</td><td>Request Date</td><td>Prior Notice</td><td>Status</td><td>Tenant First Name</td><td>Tenant Last Name</td>
        </tr>

    <% while(rs.next()){ %>
        <tr>
            <td><%=rs.getString(1)%></td><td><%=rs.getString(2)%></td><td><%=rs.getInt(3)%> days</td>
            <td><%=rs.getString(4)%><td><%=rs.getString(5)%></td><td><%=rs.getString(6)%></td>
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
	  <a href="tenantportal.jsp">Home</a> | <a href="paymentform.jsp">Payment</a> | <a href="paymenthistory.jsp">Payment History</a> | <a href="renewalrequestform.jsp">Lease Extension</a> | <a href="viewextensionstenant.jsp">Extension Status</a> | <a href="terminationrequestform.jsp">Lease Termination</a> | <a href="viewterminationstenant.jsp">Termination Status</a> <br/><br/>
	  
    </footer> 
  
  </div><!--close main-->
  
  <!-- javascript at the bottom for fast page loading -->
  <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/image_slide.js"></script>
  
</body>
</html>
