
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
  <script>
		function submit_form(target) {
                    document.getElementById("extensionform").action = target;
                    document.getElementById("extensionform").method = 'post';
                    document.getElementById("extensionform").submit();
		}
		
</script>
<style>
.button{
                   font-weight: bold;
                font-size: 100%;
                font-family: Arial;
                width: 80px;
                height: 25px;
                margin-left: 30px
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
    
    String sql =  "SELECT Renewal_ID, DATE_FORMAT(Renewal_Start_Date,'%d/%m/%Y'), DATE_FORMAT(Renewal_End_Date,'%d/%m/%Y'), DATE_FORMAT(Renewal_Request_Date,'%d/%m/%Y'), datediff(Renewal_Start_Date, Renewal_Request_Date), First_Name, Last_Name " +
                    " FROM Renewal r, user_info u " +
                    " WHERE r.Requested_by = u.User_ID " +
                    " AND Renewal_Status='Pending' " ;
    
    PreparedStatement ps = con.prepareStatement(sql);
    rs = ps.executeQuery();
    int i=0;

    if(!rs.first()){ %>
        <h1>There is no pending lease extension request from any tenant.</h1>
        <br><a href="adminportal.jsp"> Back to Home Page</a>
        <% return;
    } else { rs.beforeFirst(); %>
    <h1>Lease Extension Pending Requests</h1>
    <form id="extensionform" name="extensionform">
    <table border="2" width="100%" cellpadding="10" style="color: white; font-size:medium ; margin-top: 10px;  ">
        <tr><td>Select</td>
            <td>Renewal Start Date</td><td>Renewal End Date</td><td>Renewal Request Date</td><td>Prior Notice</td><td>Tenant First Name</td><td>Tenant Last Name</td>
        </tr>

    <% while(rs.next()){ %>
        <tr>
            <td><input type="checkbox" name="check<%=i%>" value=<%=rs.getInt(1)%>></td>
            <td><%=rs.getString(2)%></td><td><%=rs.getString(3)%></td><td><%=rs.getString(4)%></td>
            <td><%=rs.getInt(5)%> days</td>
            <td><%=rs.getString(6)%></td><td><%=rs.getString(7)%></td>
        </tr>
    <% i++;
    } // end while %>
    </table>
    <p><br>
    <input type="submit" value="Approve" onclick="submit_form('approveextensions.jsp');" class="button">
    <input type="submit" value="Reject" onclick="submit_form('rejectextensions.jsp');" class="button">
    </form>
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
