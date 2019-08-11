<%-- 
    Document   : checkin_entry
    Created on : 24 Jul, 2019, 1:15:56 PM
    Author     : Mayank
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>checkin entry</title>
    </head>
    <body>
        <%
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/carparking?zeroDateTimeBehavior=convertToNull","root","");
                Statement smt = conn.createStatement();
                ResultSet rst = null;    
                
                String floor=request.getParameter("floor");
                String slot=request.getParameter("slot");
                String time=request.getParameter("time_c");
                String date=request.getParameter("date_c");
                String car=request.getParameter("car");
                String status="checkedin";
                String outtime="";
                
                PreparedStatement ps=conn.prepareStatement("Insert into checkinout(carno, date, slotid, floorid, intime, outtime, status) values(?,?,?,?,?,?,?)");
                ps.setString(1,car);
                ps.setString(2,date);
                ps.setString(3,slot);
                ps.setString(4,floor);
                ps.setString(5,time);
                ps.setString(6,status);
                ps.setString(7,status);
                
                int n = ps.executeUpdate();
                if(n>0){
                    out.print("New record created Successfully");
                }
                else{
                    out.println("Error in creating record");
                }
            }
            catch(Exception e){
                out.print("Excp: "+e.getMessage());
            }
        %>
    </body>
</html>
