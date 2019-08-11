<%-- 
    Document   : update1
    Created on : 24 Jul, 2019, 9:16:09 PM
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
           String id=request.getParameter("id");
           String fname=request.getParameter("firname");
           String lname=request.getParameter("lasname");
           String cont=request.getParameter("con");
           String mail=request.getParameter("mail");
           String add=request.getParameter("add");
           String uname=request.getParameter("uname");
           String pass=request.getParameter("pass");
           
           Class.forName("com.mysql.jdbc.Driver");
           Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/carparking?zeroDateTimeBehavior=convertToNull","root","");
           //Statement smt = conn.createStatement();
           
           String q="UPDATE register SET firstname=?, lastname=?, contact=?, email=?, address=?, username=?, password=? where id=? ";
           PreparedStatement ps = conn.prepareStatement(q);
           ps.setString(1,fname);
           ps.setString(2,lname);
           ps.setString(3,cont);
           ps.setString(4,mail);
           ps.setString(5,add);
           ps.setString(6,uname);
           ps.setString(7,pass);
           ps.setString(8,id);
           
           String iden=request.getParameter("data");
           if (ps.executeUpdate() > 0 ){
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
        
        //ResultSet rst = null; 

           

          }
          catch(Exception e){
              out.print("Excp: "+e.getMessage());
          }
           
         %>
    </body>
</html>
