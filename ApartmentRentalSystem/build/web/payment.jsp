
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page import ="java.sql.*" %>
<%
Connection con = null;
  Statement st = null ;
  ResultSet rs = null ;

try {
    String paymentType = request.getParameter("paymentType");
    String accountDetails = request.getParameter("accountDetails");
    String strStartDate = request.getParameter("startDate");
    String strEndDate = request.getParameter("endDate");
    int amount = Integer.parseInt(request.getParameter("amount"));
    
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
    java.sql.Date fromDate = new java.sql.Date(format.parse(strStartDate).getTime());
    java.sql.Date toDate = new java.sql.Date(format.parse(strEndDate).getTime());
    java.sql.Date todayDate = new java.sql.Date(new java.util.Date().getTime());
    
  
    query = "insert into Payment (Payment_Type, Account_Details, Payment_Duration_FromDate, Payment_Duration_ToDate, Payment_Amount, Payment_by, Payment_Date) values ('" + paymentType + "','" + accountDetails + "', '" + fromDate + "', '" + toDate + "', " + amount + ", " + user_id + ", '" + todayDate +  "')";
    System.out.println(query);
    st.executeUpdate(query,  Statement.RETURN_GENERATED_KEYS);
    
    
    response.sendRedirect("paymentsuccess.jsp");
    
    }catch(Exception e){
        out.println("OOOOOOhhhhhhhhhhhhh!!!!!!!!!!!!");
        out.println("Exception occured");
        session.setAttribute("exceptionMessage", e.getMessage());
        response.sendRedirect("paymentfailure.jsp");
    }finally{
        if((rs != null) && (!rs.isClosed()))  rs.close();
        if((st != null) && (!st.isClosed()))  st.close();
        if((con != null) && (!con.isClosed())) con.close();
    } // end try-finally
%>