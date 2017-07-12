<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Locale"%>
<%@ page import ="java.sql.*" %>
<%
   
Connection con = null;
  Statement st = null ;
  ResultSet rs = null ;

try {
    String fname = request.getParameter("tfname");
    String lname = request.getParameter("tlname");
    String apartmentNumber = request.getParameter("apartmentNo").trim();
    String apartmentType = request.getParameter("apartmentType");
    
    String strFromDate = request.getParameter("fromDate");
    String strToDate = request.getParameter("toDate");
    String email = request.getParameter("email");
    String regCode = request.getParameter("registrationcode");
    
    int rent = Integer.parseInt(request.getParameter("rent"));
    int waterCharges = Integer.parseInt(request.getParameter("watercharges"));
    int sewageCharges = Integer.parseInt(request.getParameter("sewagecharges"));
    int garbageCharges = Integer.parseInt(request.getParameter("garbagecharges"));
    
    // create user if not exist: tfname, tlname,email
    // create apartment: apartmentNo, apartmentType, rent
    // create lease: fromDate, toDate
    // create allotment: user_id, lease_id, registrationcode
    

    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ars_db",
            "root", "root");
    con.setAutoCommit(false);
    st = con.createStatement();
    // create user if not exist: tfname, tlname,email
    String query = "select user_ID from user_info where Email ='" + email + "'";
    System.out.println(query);
    rs = st.executeQuery(query);
    System.out.println("**********************executed************************");
    int user_id = -1 ;
    if(rs.next()){ 
        user_id = rs.getInt(1);
    }else {
        query = "insert into user_info (First_Name, Last_Name, Email) values ('" + fname + "','" + lname + "','" + email + "')";
        System.out.println(query);
        st.executeUpdate(query, Statement.RETURN_GENERATED_KEYS);
        rs = st.getGeneratedKeys();
        if (rs.next()) {
            user_id = rs.getInt(1);
        }
    }
    
    int apartment_id = -1 ;
    query = "SELECT Apartment_ID, Apartment_STATUS FROM Apartment WHERE Apartment_Number = '" + apartmentNumber + "'";
    System.out.println(query);
    String apartmentStatus = null ;
    rs = st.executeQuery(query);
    System.out.println("**********************executed************************");
    if(rs.next()){          // id apartment already exist
        apartment_id = rs.getInt(1);
        apartmentStatus = rs.getString(2);
        System.out.println("Apartment Found. ID : " + apartment_id + " Status : " + apartmentStatus);
        if(apartmentStatus.equals("ALLOTED")){ // already alloted
            session.setAttribute("exceptionMessage", "Apartment is already alloted.");
            response.sendRedirect("apartmentAllotmentFailure.jsp");
            return ;
        }else{                                  // Allot it
            System.out.println("Updating Apartment Status to Alloted.");
            st.executeUpdate("UPDATE Apartment set Apartment_Type = '" + apartmentType + "', Apartment_water_charges = " + waterCharges + ", Apartment_sewage_charges = " + sewageCharges + " , Apartment_garbage_charges = " + garbageCharges + " , Apartment_Rent = " + rent + " , Apartment_Status = 'ALLOTED' WHERE Apartment_Number = '" +  apartmentNumber + "'");
        }
    }else { // not found. it is a new apartment 
        st.executeUpdate("insert into Apartment (Apartment_Number, Apartment_Type, Apartment_water_charges, Apartment_sewage_charges, Apartment_garbage_charges, Apartment_Rent, Apartment_Status) values ('" + apartmentNumber + "','" + apartmentType + "', " + waterCharges + ", " + sewageCharges + ", " + garbageCharges + ", " + rent + ", 'ALLOTED')",  Statement.RETURN_GENERATED_KEYS);
        rs = st.getGeneratedKeys();
        if (rs.next()) {
            apartment_id = rs.getInt(1);
        }
    }
    // create apartment: apartmentNo, apartmentType, rent
    
    DateFormat format = new SimpleDateFormat("dd/MM/yyyy");
    java.sql.Date fromDate = new java.sql.Date(format.parse(strFromDate).getTime());
    java.sql.Date toDate = new java.sql.Date(format.parse(strToDate).getTime());
  

    // create lease: fromDate, toDate
    int lease_id = -1 ;
    query = "insert into Lease (Lease_Start_Date, Lease_End_Date, Apartment_ID) values ('" + fromDate + "','" + toDate + "'," + apartment_id + ")";
    System.out.println(query);
    st.executeUpdate(query,  Statement.RETURN_GENERATED_KEYS);
    rs = st.getGeneratedKeys();
    if (rs.next()) {
        lease_id = rs.getInt(1);
    }
    query = "insert into Allotment (User_ID, Lease_ID, Registration_Code, Allotment_Date) values (" + user_id + ", " + lease_id + ", '" + regCode + "', '"+ new java.sql.Date(new java.util.Date().getTime()) + "')";
    System.out.println(query);
    // create allotment: user_id, lease_id, registrationcode
    int i = st.executeUpdate(query,  Statement.RETURN_GENERATED_KEYS);
   
    con.commit();
    response.sendRedirect("apartmentAllotmentSuccessful.jsp");
    }catch(Exception e){
        e.printStackTrace();
        con.rollback();
        session.setAttribute("exceptionMessage", e.getMessage());
        response.sendRedirect("apartmentAllotmentFailure.jsp");
    }finally{
        if((rs != null) && (!rs.isClosed()))  rs.close();
        if((st != null) && (!st.isClosed()))  st.close();
        if((con != null) && (!con.isClosed())) con.close();
    } // end try-finally 
        
%>