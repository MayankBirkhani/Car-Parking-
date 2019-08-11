package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class show_005fbasement_005fslots_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>show basement slots</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

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
                
                String floor = "base1"; //request.getParameter("base");
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
