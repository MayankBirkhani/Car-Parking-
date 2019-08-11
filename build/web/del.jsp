<%-- 
    Document   : del
    Created on : 23 Jul, 2019, 12:01:58 PM
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
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/carparking?zeroDateTimeBehavior=convertToNull","root","");
                String iden=request.getParameter("data");
                String q="DELETE FROM register where id='"+iden+"'";
                PreparedStatement psmt = conn.prepareStatement(q);
                if(psmt.executeUpdate()>0) {
                    Statement smt = conn.createStatement();
                    String query="SELECT * FROM register ORDER BY id ASC ";
                    ResultSet rst = smt.executeQuery(query);
               
                out.print( "<table class='table table-bordered'>");
                out.print("<thead>");
                    out.print( "<tr class='table-primary'>");
                    out.print( "<th>Sno.</th>");
                    
                    out.print( "<th>ID</th>");
                    out.print( "<th>Firstname</th>");
                    out.print( "<th>Lastname</th>");
                    out.print( "<th>DOB</th>");
                    out.print( "<th>Contact</th>");
                    out.print( "<th>Email</th>");
                    out.print( "<th>Username</th>");
                    out.print( "<th>Password</th>");
                    out.print( "<th>Address</th>");
                    out.print( "<th>Gender</th>");
                    
                    out.print( "<th>Delete</th>");
                    out.print( "<th>Update</th>");
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
                   out.print("<td>"); out.print(rst.getString(6)); out.print("</td>");
                   out.print("<td>"); out.print(rst.getString(7)); out.print("</td>");
                   out.print("<td>"); out.print(rst.getString(8)); out.print("</td>");
                   out.print("<td>"); out.print(rst.getString(9)); out.print("</td>");
                   out.print("<td>"); out.print(rst.getString(10)); out.print("</td>");
                   out.print("<td>"); out.print(rst.getString(11)); out.print("</td>");
                   iden=rst.getString((1));
                   out.print("<td> <button class='btn btn-danger' onclick='change(iden)'>");
                             out.print("Delete");out.print("</td>");
                   out.print("<td><button type='button' name='btn' class='btn btn-warning' data-toggle='modal' data-target='#mymodal' onclick='modify($iden)'>"); 
                             out.print("Update");out.print("</td>");
                   
                   out.print("</button></tr>");
                   no++;
                   
                   
               }
               out.print("</tbody>");
               out.print("</table>");
                
                    
                }
                
                

                //Till Here
                
                
            }
            catch(Exception e){
                out.print("Excp: "+e.getMessage());
            }
         %>
    </body>
</html>
