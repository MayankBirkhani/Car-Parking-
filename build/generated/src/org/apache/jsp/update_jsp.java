package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
import java.util.Map;
import java.util.HashMap;

public final class update_jsp extends org.apache.jasper.runtime.HttpJspBase
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
            String password = rst.getString("password");
            jsonMap.put("firstname", fname);
            jsonMap.put("lastname", lname);
            jsonMap.put("contact", contact);
            jsonMap.put("email", email);
            jsonMap.put("address", address);
            jsonMap.put("username", username);
            jsonMap.put("password", password);
            ObjectMapper mapper = new ObjectMapper();
            mapper.writeValueAsString(jsonMap);
            out.print(jsonMap);
        } else {
            out.print("Error in getting result");
        }
        
        
    } catch (Exception e) {
        out.print(e.getMessage());
    }
    
    


      out.write('\n');
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
