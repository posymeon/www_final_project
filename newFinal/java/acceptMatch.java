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
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.*;
import java.util.*;
import java.text.*;
import java.sql.PreparedStatement;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.mail.AuthenticationFailedException;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.net.*;
/**
 *
 * @author koynoypis
 */
public class acceptMatch extends HttpServlet {

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
        String username = "";
        HttpSession session2 = request.getSession(false);
        if (session2 == null || session2.getAttribute("sUserID") == null) { 
                //min kaneis tpt
        }else{
            username = session2.getAttribute("sUserID").toString();
        }
        
        String user = request.getParameter("user");
        String city = request.getParameter("city");
        String bv = request.getParameter("bookingVenue");
        String d = request.getParameter("day");
        String t = request.getParameter("time");
        
        
        Connection con = null;
        Connection con2 = null;
        Statement st = null;
        Statement st2 = null;
        ResultSet rs  = null;
        ResultSet rs2 = null;
        String from = "playgroundsvolos@gmail.com";
        String pass = "volos2013";
        String to = "";
        
        try {
            /* TODO output your page here. You may use following sample code. */
            Class.forName("com.mysql.jdbc.Driver");
            con =DriverManager.getConnection 
             ("jdbc:mysql://localhost:3306/FinalProject","root", "*******");
            st = con.createStatement();
            rs = st.executeQuery("SELECT * FROM userregister ");
            if(rs.next()){
                do{
                    if(user.equals(rs.getObject(1).toString())){
                        to = rs.getObject(6).toString();
                        break;
                    }
                }while(rs.next());
                
            }
            Properties props = new Properties();
            props.setProperty("mail.host", "smtp.gmail.com");
            props.setProperty("mail.smtp.port", "587");
            props.setProperty("mail.smtp.auth", "true");
            props.setProperty("mail.smtp.starttls.enable", "true");
            Authenticator auth = new SMTPAuthenticator(from, pass);
            Session session = Session.getInstance(props, auth);
            MimeMessage msg = new MimeMessage(session);
            msg.setText("Rival Found! User " +username+ " accepted your invitation. Match will take place a t" +city+ " , in " +d+ ", time "+t+":00 on " +bv+ ".Book now \"http://83.212.100.171:9090/newFinal/prebook.jsp?bookingVenue="+bv+"&field=Book");
            msg.setSubject("Rival Found");
            msg.setFrom(new InternetAddress(from));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            Transport.send(msg);
            out.println("<html>");
            out.println("<head>");
            out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"finder.css\">");
            out.println("<title>Servlet finder</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Mail sent!");
            out.println("</body>");
            out.println("</html>");
            Class.forName("com.mysql.jdbc.Driver");
            con2 =DriverManager.getConnection 
             ("jdbc:mysql://localhost:3306/FinalProject","root", "*******");
            st2 = con2.createStatement();
            
            rs2 = st2.executeQuery("SELECT * FROM FindRival ");
            if(rs2.next()){
                do{
                    if(city.equals(rs2.getObject(1).toString()) && bv.equals(rs2.getObject(2).toString())
                            && d.equals(rs2.getObject(3).toString()) && t.equals(rs2.getObject(4).toString())
                            && user.equals(rs2.getObject(5).toString())){
                    
                            st2.executeUpdate("DELETE FROM FindRival where user='"+user+"'"+"AND Location='"+city+"'"+"AND Field='"+bv+"'"+"AND Date='"+d+"'"+"AND Time='"+t+"'");
                            break;
                    }
                }while(rs2.next());
                
            }
        
        } catch (AuthenticationFailedException ex) {
            request.setAttribute("ErrorMessage", "Authentication failed");

           

        } catch (AddressException ex) {
            request.setAttribute("ErrorMessage", "Wrong email address");

            

        } catch (MessagingException ex) {
            request.setAttribute("ErrorMessage", ex.getMessage());

                           
    } catch (SQLException e) {
            throw new ServletException("Servlet Could not display records.", e);
        } catch (ClassNotFoundException e) {
            throw new ServletException("JDBC Driver not found.", e);
  
        }finally {         
            try {
                if(rs != null) {
                    rs.close();
                    rs = null;
                }
                if(rs2 != null) {
                    rs2.close();
                    rs2 = null;
                }
                if(st != null) {
                    st.close();
                    st = null;
                }
                if(st2 != null) {
                    st2.close();
                    st2 = null;
                }
                if(con != null) {
                    con.close();
                    con = null;
                }if(con2 != null) {
                    con2.close();
                    con2 = null;
                }
                
            } catch (SQLException e) {}
            response.setHeader("REFRESH","3;url=findRival.jsp");
    }
        
    }
private class SMTPAuthenticator extends Authenticator {

        private PasswordAuthentication authentication;

        public SMTPAuthenticator(String login, String password) {
            authentication = new PasswordAuthentication(login, password);
        }

        protected PasswordAuthentication getPasswordAuthentication() {
            return authentication;
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
    }// </editor-fold>
}
