<%-- 
    Document   : regis
    Created on : 19 Jul, 2019, 8:51:41 PM
    Author     : Mayank
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Complete</title>
        
  </style>
    </head>
    <body>
 
        
        <%
            try{
                String firstname=request.getParameter("fname");
                String lastname=request.getParameter("lname");
                String dob=request.getParameter("dob");
                Integer age=Integer.parseInt(request.getParameter("age"));
                String contact=request.getParameter("contact");
                String email=request.getParameter("mail");
                String username=request.getParameter("username");
                String password=request.getParameter("pass");
                String address=request.getParameter("address");
                String gender=request.getParameter("gender");
          
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/carparking?zeroDateTimeBehavior=convertToNull","root","");
                PreparedStatement ps=con.prepareStatement("Insert into register(firstname,lastname,dob,age,contact,email,username,password,address,gender) values(?,?,?,?,?,?,?,?,?,?)");
                ps.setString(1, firstname);
                ps.setString(2, lastname);
                ps.setString(3, dob);
                ps.setInt(4,age);
                ps.setString(5, contact);
                ps.setString(6,email);
                ps.setString(7,username);
                ps.setString(8,password);
                ps.setString(9,address);
                ps.setString(10,gender);
                
                int n = ps.executeUpdate();
                if(n>0){
                    response.sendRedirect("regis2.html");
                }
                else{
                    out.println("Cannot Register!");
                }
                
            }
            catch(Exception e){
                out.print("Excp: "+e.getMessage());
            }
            
         %>
    </body>
</html>
