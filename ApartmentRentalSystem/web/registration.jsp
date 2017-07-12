
<%@ page import ="java.sql.*" %>
<%
Connection con = null;
  Statement st = null ;
  ResultSet rs = null ;

try {
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String regCode = request.getParameter("registrationcode");
    String email = request.getParameter("email");
    String login = request.getParameter("login");
    String password = request.getParameter("password");
    String coResident = request.getParameter("coresident");
    String mobile = request.getParameter("mobile");
    
    // check valid registration code : email, regCode from Allotment
    // check {email login}  already exist
    

    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ars_db",
            "root", "root");
    st = con.createStatement();
    String query = "SELECT distinct u.User_ID FROM user_info u, Allotment a " +
                    "WHERE a.User_ID = u.User_ID " +
                    "AND a.Registration_Code = '" + regCode + "' " +
                    "AND u.email = '" + email + "'";
    
    System.out.println(query);
    rs = st.executeQuery(query);
    System.out.println("**********************executed************************");
    int user_id = -1 ;
    if(rs.next()){ 
        user_id = rs.getInt(1);

        // check {email, user_id}  already exist
        query = "select distinct Login from user_info where Email ='" + email + "' AND user_ID = " + user_id ;
        System.out.println(query);
        rs = st.executeQuery(query);
        System.out.println("**********************executed************************");

        if(rs.next()){ 
            String alredyLogin = rs.getString(1);
            if(alredyLogin == null || alredyLogin.length()==0){
                query = "UPDATE user_info set First_Name = '" + fname + "' , Last_Name = '" + lname + "' , Login = '" + login + "', password = '" + password + "', Coresident = '" + coResident + "' , Mobile = '" + mobile + "' WHERE email = '" + email + "' AND user_ID = " + user_id ;
                System.out.println(query);
                st.executeUpdate(query);
                System.out.println("**********************executed************************");
                response.sendRedirect("registrationSuccess.jsp");
            }
        }
    }else {
        session.setAttribute("exceptionMessage", "Invalid Code or No account created yet.");
        response.sendRedirect("registrationfailure.jsp");
    }
    }catch(Exception e){
        out.println("OOOOOOhhhhhhhhhhhhh!!!!!!!!!!!!");
        out.println("Exception occured");
        session.setAttribute("exceptionMessage", e.getMessage());
        response.sendRedirect("registrationfailure.jsp");
    }finally{
        if((rs != null) && (!rs.isClosed()))  rs.close();
        if((st != null) && (!st.isClosed()))  st.close();
        if((con != null) && (!con.isClosed())) con.close();
    } // end try-finally
%>