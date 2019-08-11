<%-- 
    Document   : show_basement_slots
    Created on : 24 Jul, 2019, 1:07:11 PM
    Author     : Mayank
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
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
        <title>show basement slots</title>
    </head>
    <body>
        <%
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/carparking?zeroDateTimeBehavior=convertToNull","root","");
                Statement smt = conn.createStatement();
                Statement smt2 = conn.createStatement();
                ResultSet rst = null;    
                
                //code for fetching current date
                Date date = new Date();
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                String strDate= formatter.format(date);
                
                //code for fetching current time
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("HH:mm");  //fetching current time for checkedout
                LocalDateTime now = LocalDateTime.now();
                String timein= dtf.format(now);
                
                String floor = request.getParameter("base");
                String query = "select * from slot where floorid='"+floor+"'";
                rst = smt.executeQuery(query);
                if (floor.equals("base1")){
                    out.print("<h2>Floor : Basement 1</h2>");
                }
                else if(floor.equals("base2")){
                    out.print("<h2>Floor : Basement 2</h2>");
                }
                else{
                    out.print("<h2>Floor : Basement 3</h2>");
                }
                //TODO...
                ResultSet rst2 = null;
                String username = "";
                while(rst.next()) {
                    String slotid=rst.getString(1);
                    String query2 = "select * from checkinout where date='"+strDate+"' and slotid='"+slotid+"' and floorid='"+floor+"' and status='checkedin'"; //To Do
                    rst2 = smt2.executeQuery(query2);
                    if (rst2.next()) {
                        out.print("<div style='float:left;padding:15px;border:2px solid green;'><button class='btn btn-danger'>'"+slotid+"'</button></div>");
                    } else {
                        out.print("<div style='float:left;padding:15px;border:2px solid green;'><button class='btn btn-success' onclick=checkin('"+strDate+"','"+timein+"',this,'"+floor+"') data-toggle='modal' data-target='#myModal'>'"+slotid+"</button></div>");
                    }
                    
                }
                
            }
            catch(Exception e){
                out.print("Excp: "+e.getMessage());
            }
            
         %>
    </body>
</html>
