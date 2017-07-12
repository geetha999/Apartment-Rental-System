
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page import ="java.sql.*" %>
<%
Connection con = null;
  Statement st = null ;
  ResultSet rs = null ;

try {
    String strLeavingDate = request.getParameter("leavingDate");
    String apartmentNumber = request.getParameter("apartmentNumber");
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
    
    DateFormat format = new SimpleDateFormat("dd/MM/yyyy");
    System.out.println(" Before Leaving date converted.");
    java.sql.Date leavingDate = new java.sql.Date(format.parse(strLeavingDate).getTime());
    System.out.println(" Leaving date converted." + leavingDate);
    java.sql.Date todayDate = new java.sql.Date(new java.util.Date().getTime());
    System.out.println(" Today date converted." + todayDate);
    
    query = "insert into Termination (Termination_Leaving_Date, Termination_Request_Date, Termination_Status, Requested_by, Apartment_Number) values ('" + leavingDate + "', '" + todayDate + "', 'Pending', " + user_id + ", '" + apartmentNumber + "')";
    System.out.println(query);
    st.executeUpdate(query,  Statement.RETURN_GENERATED_KEYS);
    
    
    response.sendRedirect("terminationrequestsuccess.jsp");
    
    }catch(Exception e){
        out.println("OOOOOOhhhhhhhhhhhhh!!!!!!!!!!!!");
        out.println("Exception occured");
        e.printStackTrace();
        session.setAttribute("exceptionMessage", e.getMessage());
        response.sendRedirect("terminationrequestfailure.jsp");
    }finally{
        if((rs != null) && (!rs.isClosed()))  rs.close();
        if((st != null) && (!st.isClosed()))  st.close();
        if((con != null) && (!con.isClosed())) con.close();
    } // end try-finally
%>