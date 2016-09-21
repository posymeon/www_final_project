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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import java.text.*;
import java.sql.PreparedStatement;
/**
 *
 * @author koynoypis
 */
public class cancelMatch extends HttpServlet {

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
        
        String city = request.getParameter("city");
        String bv = request.getParameter("bookingVenue");
        String d = request.getParameter("day");
        String t = request.getParameter("time");
        
        
        String user = request.getParameter("user");
        
        Connection con = null; 
        Statement st = null;
        ResultSet rs = null;
        
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet cancelMatch</title>");            
            out.println("</head>");
            out.println("<body>");
            
            out.println("<h1>Servlet cancelMatch at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        
            try{
        
            
            Class.forName("com.mysql.jdbc.Driver");
            con =DriverManager.getConnection 
             ("jdbc:mysql://localhost:3306/FinalProject","root", "*******");
            st = con2.createStatement();
            rs = st.executeQuery("SELECT * FROM FindRival ");
            if(rs.next()){
                do{
                    if(city.equals(rs.getObject(1).toString()) && bv.equals(rs.getObject(2).toString())
                            && d.equals(rs.getObject(3).toString()) && t.equals(rs.getObject(4).toString())
                            && user.equals(rs.getObject(5).toString())){
                    
                            st.executeUpdate("DELETE FROM FindRival where user='"+user+"'"+"AND Location='"+city+"'"+"AND Field='"+bv+"'"+"AND Date='"+d+"'"+"AND Time='"+t+"'");
                            break;
                    }
                }while(rs.next());
                
            }
            
        } catch (SQLException e) {
            throw new ServletException("Servlet Could not display records.", e);
        } catch (ClassNotFoundException e) {
            throw new ServletException("JDBC Driver not found.", e);
  
        } finally {         
            try {
                if(rs != null) {
                    rs.close();
                    rs = null;
                }
                if(st != null) {
                    st.close();
                    st = null;
                }
                if(con != null) {
                    con.close();
                    con = null;
                }
                
            } catch (SQLException e) {}
            response.sendRedirect("http://83.212.100.171:9090/newFinal/findRival.jsp");
    }
                    
                    
         }finally{
            out.close();
        }
    

    }// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
    }// </editor-fold>
}
