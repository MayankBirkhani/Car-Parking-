<%-- 
    Document   : del_operator
    Created on : 23 Jul, 2019, 6:57:26 AM
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
        <title>Delete/Update Operator</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

        <style>
            #header
            {
                background-color:#0FEB97;
                color:white;
            }

        </style>
        
    </head>
    <body>
        <div id="header" class="jumbotron text-center">
            <h1>CAR PARKING SYSTEM</h1>
            <h2 style="font-size:40px;">Delete Operator</h2>
        </div>
        <div class="container" id="demo">
            <%
                String iden="";
              Class.forName("com.mysql.jdbc.Driver");
              Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/carparking?zeroDateTimeBehavior=convertToNull","root","");
              Statement smt = conn.createStatement();
              ResultSet rst = null;      
             
              String query="SELECT * FROM register ORDER BY id ASC ";
              
              rst = smt.executeQuery(query);
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
                   out.print("<td> <button class='btn btn-danger' onclick='change("+iden+")'>");
                             out.print("Delete");out.print("</td>");
                   out.print("<td><button type='button' name='btn' class='btn btn-warning' data-toggle='modal' data-target='#mymodal' onclick='modify("+iden+")'>"); 
                             out.print("Update");out.print("</td>");
                   
                   out.print("</button></tr>");
                   no++;
                   
                   
               }
               out.print("</tbody>");
               out.print("</table>");
            %>
            
        </div>
            
        <div id="mymodal" class="modal fade" role="dialog">
      <div class="modal-dialog">
          <!--modal content-->
          <div class="modal-content">
              <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <h1>Update Operation</h1>
              </div>
              <div class="modal-body">
                  <form action="update1.php" method="POST">
                      <div class="form-group">
                          <label for="ifname">Firstname</label>
                          <input type="text" class="form-control" id="ifname" name="name">
                      </div>
                      <div class="form-group">
                          <label for="ilname">Lastname</label>
                          <input type="text" class="form-control" id="ilname" name="name">
                      </div>
                      <div class="form-group">
                          <label for="icontact">Contact</label>
                          <input type="text" class="form-control" id="icontact" name="contact">
                      </div>
                      <div class="form-group">
                          <label for="imail">Email</label>
                          <input type="email" class="form-control" id="imail" name="mail">
                      </div>
                      <div class="form-group">
                          <label for="iaddress">Address</label>
                          <input type="text" class="form-control" id="iaddress" name="address">
                      </div>
                      <div class="form-group">
                          <label for="iuname">Username</label>
                          <input type="text" class="form-control" id="iuname" name="uname">
                      </div>
                      <div class="form-group">
                          <label for="ipass">Password</label>
                          <input type="text" class="form-control" id="ipass" name="pass">
                      </div>
                  </form>
              </div>
              <div class="modal-footer">    
                  <button type="button" class="btn btn-info" onclick="up_date(<%= iden %>);">Save</button>
                  <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
              </div>
          </div>
      </div>
  </div>

  <h1 id="head">
  </h1>
<!--<div style="border:1px solid black;" id="demons">
  how are u
</div>-->
<div id="check_function_readata">
</div>

<script>
    function change(a)
    {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function()
        {
            if(this.readyState == 4 && this.status == 200)
            {
                document.getElementById("demo").innerHTML = this.responseText;
            }
        };

        var con;
        con = confirm("Are you sure you want to delete this operator ?");
        if(con == true)
        {
            xhttp.open("GET","del.jsp?data="+a,true);
            xhttp.send();
        }
    }

    function modify(id)//to set values in the modal
    {
        var xhtp = new XMLHttpRequest();
        xhtp.onreadystatechange = function()
        {
            if(this.readyState == 4 && this.status == 200)
            {

                var user = JSON.parse(this.responseText);//to convert json received from server to object
                document.getElementById("ifname").value = user.firstname;
                document.getElementById("ilname").value = user.lastname;
                document.getElementById("icontact").value = user.contact;
                document.getElementById("imail").value = user.email;
                document.getElementById("iaddress").value = user.address;
                document.getElementById("iuname").value = user.username;
                document.getElementById("ipass").value = user.password;
            }
        };
        xhtp.open("GET","update.jsp?iden="+id,true);
        xhtp.send();
    }

    function up_date(ident)
    {
        var xtp = new XMLHttpRequest();
        var firname = document.getElementById("ifname").value;
        var lasname = document.getElementById("ilname").value;
        var con = document.getElementById("icontact").value;
        var mail = document.getElementById("imail").value;
        var add = document.getElementById("iaddress").value;
        var uname = document.getElementById("iuname").value;
        var pass = document.getElementById("ipass").value;
        //document.getElementById("head").innerHTML = typeof(con);
        xtp.onreadystatechange = function()
        {
            if(this.readyState == 4 && this.status == 200)
            {
                $('#mymodal').modal("hide");
                document.getElementById("demo").innerHTML = this.responseText;
            }
        };
        xtp.open("POST", "update1.jsp", true);
        xtp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xtp.send("id="+ident+ "&firname="+firname+ "&lasname="+lasname+ "&con="+con+ "&mail="+mail+ "&add="+add+ "&uname="+uname+ "&pass="+pass);
    }


</script>

    </body>
</html>
