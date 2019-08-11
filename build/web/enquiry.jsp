<%-- 
    Document   : enquiry
    Created on : 21 Jul, 2019, 3:33:26 PM
    Author     : Mayank
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
               
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <title>Enquiry Slots</title>
    </head>
    <body>
        <div class="container">
        <%
            try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/carparking?zeroDateTimeBehavior=convertToNull","root","");
            Statement smt = conn.createStatement();
            ResultSet rst = null;    
                                            //doubt
            Date date = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            String strDate= formatter.format(date);
                   
            String data=request.getParameter("data");
             //   out.print(data);
            if(data.equals("check1")){
               String query="select carno, date, slotid, floorid from checkinout where status='checkedin' ";
                rst = smt.executeQuery(query);
                out.print( "<table class='table table-bordered'>");
                out.print("<thead>");
                    out.print( "<tr class='table-primary'>");
                    out.print( "<th>Sno.</th>");
                    out.print( "<th>Car Number</th>");
                    out.print( "<th>Date</th>");
                    out.print( "<th>Slot</th>");
                    out.print( "<th>Floor</th>");
                    out.print( "</tr>");
                out.print("</thead>");
                out.print( "<tbody>");
               int no=1;
               
                while(rst.next()){
                   out.print("<tr>");
                   out.print("<td>");out.print(no);out.print("</td>");

                   out.print("<td>"); out.print(rst.getString(1)); out.print("</td>");
                   out.print("<td>"); out.print(rst.getString(2)); out.print("</td>");
                   out.print("<td>"); out.print(rst.getString(3)); out.print("</td>");
                   out.print("<td>"); out.print(rst.getString(4)); out.print("</td>");
                   out.print("</tr>");
                   no++;
               }
               out.print("</tbody>");
               out.print("</table>");
            }
            else if(data.equals("check2")){
                String query="select carno, date, slotid, floorid from checkinout where date='"+strDate+"'";//doubt
                rst = smt.executeQuery(query);
                out.print( "<table class='table table-bordered'>");
                out.print("<thead>");
                    out.print( "<tr class='table-primary'>");
                    out.print( "<th>Sno.</th>");
                    out.print( "<th>Car Number</th>");
                    out.print( "<th>Date</th>");
                    out.print( "<th>Slot</th>");
                    out.print( "<th>Floor</th>");
                    out.print( "</tr>");
                out.print("</thead>");
                out.print( "<tbody>");
               int no=1;
               
                while(rst.next()){
                   out.print("<tr>");
                   out.print("<td>");out.print(no);out.print("</td>");

                   out.print("<td>"); out.print(rst.getString(1)); out.print("</td>");
                   out.print("<td>"); out.print(rst.getString(2)); out.print("</td>");
                   out.print("<td>"); out.print(rst.getString(3)); out.print("</td>");
                   out.print("<td>"); out.print(rst.getString(4)); out.print("</td>");
                   out.print("</tr>");
                   no++;
               }
               out.print("</tbody>");
               out.print("</table>");
                
            }
            else{
                out.print("<h2><center>No cars parked today.</center></h2>");
            
            }
            }
            catch(Exception e){
                 out.print("Excp: "+e.getMessage());
            }
            
        %>
        </div>
    </body>
</html>
