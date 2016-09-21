/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.http.HttpSession;

/**
 *
 * @author koynoypis
 */
public class matchRegister extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        //get parameters
        HttpSession session = request.getSession(false);
        if(!(session == null || session.getAttribute("sUserID") == null)){
        String location = request.getParameter("location");
        String field = request.getParameter("field");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String user = session.getAttribute("sUserID").toString();
        
        //setting up the connextion with db
        Connection con = null;  
        Statement stmt = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<html>");
            out.println("<head>");   
            out.println("</head>");
            out.println("<body>");
            Class.forName("com.mysql.jdbc.Driver");
            con =DriverManager.getConnection 
             ("jdbc:mysql://localhost:3306/FinalProject","root", "*******");
            stmt = con.createStatement();
            String data="INSERT INTO FindRival VALUES(? , ? , ? , ? , ?)";
            ps = con.prepareStatement(data);
            ps.setString(1, location);
	    ps.setString(2, field);
            ps.setString(3, date);
            ps.setString(4, time);
            ps.setString(5, user);
	    ps.executeUpdate();
            
            
            
            out.println("<h1>Servlet matchRegister at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            
            
        }   catch (SQLException e) {
            throw new ServletException("Servlet Could not display records.", e);
        } catch (ClassNotFoundException e) {
            throw new ServletException("JDBC Driver not found.", e);
  
        
        } finally {            
            try {
                if(rs != null) {
                    rs.close();
                    rs = null;
                }
                if(stmt != null) {
                    stmt.close();
                    stmt = null;
                }
                if(con != null) {
                    con.close();
                    con = null;
                }
                if(ps != null){
					ps.close(); ps=null;}
                 response.sendRedirect("http://83.212.100.171:9090/newFinal/findRival.jsp");
            } catch (SQLException e) {}
  
                   out.close();
                   
                   
               }
        }else{
        
            response.sendRedirect("http://83.212.100.171:9090/newFinal/findRival.jsp");
        
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
    }
}
