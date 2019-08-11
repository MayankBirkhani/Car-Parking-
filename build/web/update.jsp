<%-- 
    Document   : update
    Created on : 24 Jul, 2019, 3:47:20 PM
    Author     : Mayank
--%>

<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/carparking?zeroDateTimeBehavior=convertToNull","root","");
        Statement smt = conn.createStatement();
        ResultSet rst = null;
        String iden = request.getParameter("iden");
        String query="SELECT * FROM register where id='"+iden+"'";
        rst = smt.executeQuery(query);
        if (rst.next()) {
            Map<String, String> jsonMap = new HashMap<String,String>();
            String fname = rst.getString("firstname");
            String lname = rst.getString("lastname");
            String contact = rst.getString("contact");
            String email = rst.getString("email");
            String address = rst.getString("address");
            String username = rst.getString("username");
            String password = rst.getString("password").toString();
            jsonMap.put("firstname", fname);
            jsonMap.put("lastname", lname);
            jsonMap.put("contact", contact);
            jsonMap.put("email", email);
            jsonMap.put("address", address);
            jsonMap.put("username", username);
            jsonMap.put("password", password);
            ObjectMapper mapper = new ObjectMapper();
            String jsonString = mapper.writeValueAsString(jsonMap);
            out.print(jsonString);
        } else {
            out.print("Error in getting result");
        }
        
        
    } catch (Exception e) {
        out.print(e.getMessage());
    }
    
    

%>
