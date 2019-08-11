<%-- 
    Document   : show_checkin_details
    Created on : 24 Jul, 2019, 6:22:54 AM
    Author     : Mayank
--%>

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
              Statement smt = conn.createStatement();
              ResultSet rst = null;    
              
              String car=request.getParameter("car");       //Fetching carno from checkout page
              String query="SELECT * FROM checkinout where carno='"+car+"'";    //passing carno in query
              rst = smt.executeQuery(query);                    
                          //fetching status of car from DB
              

              
               while(rst.next()){
                   
                    String carno=rst.getString(1);
                    String date=rst.getString(2);
                    String slotid=rst.getString(3);
                    String floorid=rst.getString(4);
                    String intime=rst.getString(5);
                    String outtime=rst.getString(6);
                    String status=rst.getString(7);
                    if(status.equals("checkedout")){
                            out.print("Already Checked out");
                    }
                    else if(status.equals("checkedin")){
                        out.print("Car no : <input type='text' id='carno' class='form-control' readonly value='"+carno+"' />");
                        out.print("Date : <input type='text' id='date' class='form-control' readonly value='"+date+"' />");
                        out.print("Slot Id : <input type='text' id='slotid' class='form-control' readonly value='"+slotid+"'/>");
                        out.print("Floor Id : <input type='text' id='floorid' class='form-control' readonly value='"+floorid+"' />");
                        out.print("In Time: <input type='text' id='intime' class='form-control' readonly value='"+intime+"' />");
                        out.print("Out time : <input type='text' id='carno' class='form-control' readonly value='"+outtime+"' />");
                        out.print("Status : <input type='text' id='status' class='form-control' readonly value='"+status+"' />");
                        out.print("<br/>");
                        out.print("<button class='btn btn-danger' type='button' onclick='update_status()'>Update Check Out</button>");
                  
                    }
                    else{
                        out.print("No Data Found!");
                    }
               }
              
          }
          catch(Exception e){
              out.print("Excp: "+e.getMessage());
          }
         %>
         
    </body>
</html>
