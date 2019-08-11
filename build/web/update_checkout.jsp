<%-- 
    Document   : update_checkout
    Created on : 24 Jul, 2019, 10:14:46 AM
    Author     : Mayank
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/carparking?zeroDateTimeBehavior=convertToNull","root","");
                        
            String car=request.getParameter("car"); //fetching carno
            
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("HH:mm");  //fetching current time for checkedout
            LocalDateTime now = LocalDateTime.now();
            String timeout= dtf.format(now);
            String query="UPDATE checkinout SET status='checkedout', outtime='"+timeout+"' where carno='"+car+"'";
            PreparedStatement smt = conn.prepareStatement(query);
            //ResultSet rst = null;    
            if (smt.executeUpdate() > 0 ) {
                out.print("Check out status updated successfully");
            }
            }
            catch(Exception e){
                out.print("Excp: "+e.getMessage());
            }
        %>
    </body>
</html>
