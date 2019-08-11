/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mayank
 */
@WebServlet(urlPatterns = {"/testlog"})
public class testlog extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           try{
               if("POST".equals(request.getMethod())){
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/carparking?zeroDateTimeBehavior=convertToNull","root","");
                    Statement smt = conn.createStatement();
                    ResultSet rst = null;
                    String username = request.getParameter("uname");
                    String password = request.getParameter("pass");
                    String type = request.getParameter("type");
                    HttpSession sess = request.getSession(true);
                    sess.setAttribute("username",username);
                    if(type.equals("operator")){
                        String query="select * from register where username= '"+username+"' and password= '"+password+"' ";
                        rst = smt.executeQuery(query);
                        
                        if(rst.next()){
                            response.sendRedirect("home_op.html");
                        }
                        else{
                             out.print("<script type=\"text/javascript\">" + " alert(\"Invalid! credentials\")"+ "</script>");
                        }
                        
                    }
                    else if(type.equals("admin")){
                        String query="select * from admin where username= '"+username+"' and password= '"+password+"' ";
                        rst = smt.executeQuery(query);
                        
                        if(rst.next()){
                            response.sendRedirect("home2.html");
                        }
                        else{
                             out.print("<script type=\"text/javascript\">" + " alert(\"Invalid! credentials\")"+ "</script>");
                        }
                    }
                    else {
                            out.print("<script type=\"text/javascript\"> alert(\"Select Usertype\")</script>");
                    }
               }
               
               
           }
           catch(Exception e){
               out.print(e.getMessage());
           }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
