package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class del_005foperator_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Delete/Update Operator</title>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js\"></script>\n");
      out.write("\n");
      out.write("        <style>\n");
      out.write("            #header\n");
      out.write("            {\n");
      out.write("                background-color:#0FEB97;\n");
      out.write("                color:white;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("        </style>\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div id=\"header\" class=\"jumbotron text-center\">\n");
      out.write("            <h1>CAR PARKING SYSTEM</h1>\n");
      out.write("            <h2 style=\"font-size:40px;\">Delete Operator</h2>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"container\" id=\"demo\">\n");
      out.write("            ");

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
            
      out.write("\n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("            \n");
      out.write("        <div id=\"mymodal\" class=\"modal fade\" role=\"dialog\">\n");
      out.write("      <div class=\"modal-dialog\">\n");
      out.write("          <!--modal content-->\n");
      out.write("          <div class=\"modal-content\">\n");
      out.write("              <div class=\"modal-header\">\n");
      out.write("                  <button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>\n");
      out.write("                  <h1>Update Operation</h1>\n");
      out.write("              </div>\n");
      out.write("              <div class=\"modal-body\">\n");
      out.write("                  <form action=\"update1.php\" method=\"POST\">\n");
      out.write("                      <div class=\"form-group\">\n");
      out.write("                          <label for=\"ifname\">Firstname</label>\n");
      out.write("                          <input type=\"text\" class=\"form-control\" id=\"ifname\" name=\"name\">\n");
      out.write("                      </div>\n");
      out.write("                      <div class=\"form-group\">\n");
      out.write("                          <label for=\"ilname\">Lastname</label>\n");
      out.write("                          <input type=\"text\" class=\"form-control\" id=\"ilname\" name=\"name\">\n");
      out.write("                      </div>\n");
      out.write("                      <div class=\"form-group\">\n");
      out.write("                          <label for=\"icontact\">Contact</label>\n");
      out.write("                          <input type=\"text\" class=\"form-control\" id=\"icontact\" name=\"contact\">\n");
      out.write("                      </div>\n");
      out.write("                      <div class=\"form-group\">\n");
      out.write("                          <label for=\"imail\">Email</label>\n");
      out.write("                          <input type=\"email\" class=\"form-control\" id=\"imail\" name=\"mail\">\n");
      out.write("                      </div>\n");
      out.write("                      <div class=\"form-group\">\n");
      out.write("                          <label for=\"iaddress\">Address</label>\n");
      out.write("                          <input type=\"text\" class=\"form-control\" id=\"iaddress\" name=\"address\">\n");
      out.write("                      </div>\n");
      out.write("                      <div class=\"form-group\">\n");
      out.write("                          <label for=\"iuname\">Username</label>\n");
      out.write("                          <input type=\"text\" class=\"form-control\" id=\"iuname\" name=\"uname\">\n");
      out.write("                      </div>\n");
      out.write("                      <div class=\"form-group\">\n");
      out.write("                          <label for=\"ipass\">Password</label>\n");
      out.write("                          <input type=\"text\" class=\"form-control\" id=\"ipass\" name=\"pass\">\n");
      out.write("                      </div>\n");
      out.write("                  </form>\n");
      out.write("              </div>\n");
      out.write("              <div class=\"modal-footer\">    \n");
      out.write("                  <button type=\"button\" class=\"btn btn-info\" onclick=\"up_date(");
      out.print( iden );
      out.write(");\">Save</button>\n");
      out.write("                  <button type=\"button\" class=\"btn btn-warning\" data-dismiss=\"modal\">Close</button>\n");
      out.write("              </div>\n");
      out.write("          </div>\n");
      out.write("      </div>\n");
      out.write("  </div>\n");
      out.write("\n");
      out.write("  <h1 id=\"head\">\n");
      out.write("  </h1>\n");
      out.write("<!--<div style=\"border:1px solid black;\" id=\"demons\">\n");
      out.write("  how are u\n");
      out.write("</div>-->\n");
      out.write("<div id=\"check_function_readata\">\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<script>\n");
      out.write("    function change(a)\n");
      out.write("    {\n");
      out.write("        var xhttp = new XMLHttpRequest();\n");
      out.write("        xhttp.onreadystatechange = function()\n");
      out.write("        {\n");
      out.write("            if(this.readyState == 4 && this.status == 200)\n");
      out.write("            {\n");
      out.write("                document.getElementById(\"demo\").innerHTML = this.responseText;\n");
      out.write("            }\n");
      out.write("        };\n");
      out.write("\n");
      out.write("        var con;\n");
      out.write("        con = confirm(\"Are you sure you want to delete this operator ?\");\n");
      out.write("        if(con == true)\n");
      out.write("        {\n");
      out.write("            xhttp.open(\"GET\",\"del.jsp?data=\"+a,true);\n");
      out.write("            xhttp.send();\n");
      out.write("        }\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    function modify(id)//to set values in the modal\n");
      out.write("    {\n");
      out.write("        var xhtp = new XMLHttpRequest();\n");
      out.write("        xhtp.onreadystatechange = function()\n");
      out.write("        {\n");
      out.write("            if(this.readyState == 4 && this.status == 200)\n");
      out.write("            {\n");
      out.write("\n");
      out.write("                var user = JSON.parse(this.responseText);//to convert json received from server to object\n");
      out.write("                document.getElementById(\"ifname\").value = user.firstname;\n");
      out.write("                document.getElementById(\"ilname\").value = user.lastname;\n");
      out.write("                document.getElementById(\"icontact\").value = user.contact;\n");
      out.write("                document.getElementById(\"imail\").value = user.email;\n");
      out.write("                document.getElementById(\"iaddress\").value = user.address;\n");
      out.write("                document.getElementById(\"iuname\").value = user.username;\n");
      out.write("                document.getElementById(\"ipass\").value = user.password;\n");
      out.write("            }\n");
      out.write("        };\n");
      out.write("        xhtp.open(\"GET\",\"update.jsp?iden=\"+id,true);\n");
      out.write("        xhtp.send();\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    function up_date(ident)\n");
      out.write("    {\n");
      out.write("        var xtp = new XMLHttpRequest();\n");
      out.write("        var firname = document.getElementById(\"ifname\").value;\n");
      out.write("        var lasname = document.getElementById(\"ilname\").value;\n");
      out.write("        var con = document.getElementById(\"icontact\").value;\n");
      out.write("        var mail = document.getElementById(\"imail\").value;\n");
      out.write("        var add = document.getElementById(\"iaddress\").value;\n");
      out.write("        var uname = document.getElementById(\"iuname\").value;\n");
      out.write("        var pass = document.getElementById(\"ipass\").value;\n");
      out.write("        //document.getElementById(\"head\").innerHTML = typeof(con);\n");
      out.write("        xtp.onreadystatechange = function()\n");
      out.write("        {\n");
      out.write("            if(this.readyState == 4 && this.status == 200)\n");
      out.write("            {\n");
      out.write("                $('#mymodal').modal(\"hide\");\n");
      out.write("                document.getElementById(\"demo\").innerHTML = this.responseText;\n");
      out.write("            }\n");
      out.write("        };\n");
      out.write("        xtp.open(\"POST\", \"update1.php\", true);\n");
      out.write("        xtp.setRequestHeader(\"Content-type\", \"application/x-www-form-urlencoded\");\n");
      out.write("        xtp.send(\"id=\"+ident+ \"&firname=\"+firname+ \"&lasname=\"+lasname+ \"&con=\"+con+ \"&mail=\"+mail+ \"&add=\"+add+ \"&uname=\"+uname+ \"&pass=\"+pass);\n");
      out.write("    }\n");
      out.write("\n");
      out.write("\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
