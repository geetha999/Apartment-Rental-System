
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Apartment Rental System</title>
    </head>
    <body>
        <%@ page import ="java.sql.*" %>
<%

    Connection con = null;
    Statement st = null ;
    ResultSet rs = null ;
    try{

        String login = request.getParameter("login");
        String passwd = request.getParameter("passwd");
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ars_db",
            "root", "root");
        st = con.createStatement();
        //ResultSet rs;
        rs = st.executeQuery("select USER_TYPE from user_info where Login ='" + login + "' and Password='" + passwd + "'");
        if (rs.next()) {
            int user_type = rs.getInt(1);
            session.setAttribute("userid", login);
            //session.setAttribute("password", passwd);
            if(user_type == 0)
                response.sendRedirect("tenantportal.jsp");
            else 
                response.sendRedirect("adminportal.jsp");
                //response.sendRedirect("adminportal.jsp");
        } else {
            response.sendRedirect("loginfailed.jsp");
        }// end if-else
    
    }catch(Exception e){
        out.println("Hello");
        out.println("Exception occured");
        response.sendRedirect("loginfailed.jsp");
    }finally{
        if((rs != null) && (!rs.isClosed()))  rs.close();
        if((st != null) && (!st.isClosed()))  st.close();
        if((con != null) && (!con.isClosed())) con.close();
    } // end try-finally

%>
    </body>
</html>
