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
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class finder extends HttpServlet {

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
            
            String location = request.getParameter("location");
            Connection con = null;  
            Statement stmt = null;
            ResultSet rs = null;
            HttpSession session = null;
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<html>");
            out.println("<head>");
            out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"finder.css\">");
            out.println("<title>Servlet finder</title>");            
            out.println("</head>");
            out.println("<body>");

	    session = request.getSession(false);
	    if(session == null || session.getAttribute("sUserID")==null){

   		out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"notloggedin.css\">");
        out.println("<div id=\"header\">");
        out.println("<div id=\"insert\">");
        out.println("<div id=\"register\">");
        out.println("<form name=\"account.jsp\"  method=\"post\" action=\"account.jsp\">");
        out.println("<table cellspacing=\"0\">");
        out.println("<tr>");
        out.println("<td>");
        out.println("<input type=\"submit\" name=\"Submit\" value=\"Register Now!\">");
        out.println("</td>");
        out.println("</tr>");
        out.println("</table>");
        out.println("</form>");
        out.println("</div>");
        out.println("<div id=\"login\">");
        out.println("<form name=\"frmLogin\"  onSubmit=\"return validate();\" action=\"doLogin.jsp\" method=\"post\">");
        out.println("<table cellspacing=\"0\">");
        out.println("<tr>");
        out.println("<td>");
        out.println("<input id=\"username\" type=\"text\" tabindex=\"1\" name=\"sUserName\" placeholder=\"username\">");
        out.println("</td>");
        out.println("<td>");
        out.println("<input id=\"password\" type=\"password\" name=\"sPwd\" placeholder=\"password\">");
        out.println("</td>");
        out.println("<td>");
        out.println("<input type=\"submit\" id=\"button\" name=\"sSubmit\" value=\"Log in\" />");
        out.println("</td>");
        out.println("</tr>");
        out.println("</table>");
        out.println("</form>");
        out.println("</div>");
        out.println("</div>");
        out.println("<a href=\"http://83.212.100.171:9090/newFinal/\"><img src=\"images/egipedo.png\" id=\"egipedo\"></a>");
        out.println("</div>");

	    }
	    else{
		out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"loggedin.css\">");
        out.println("<div id=\"header\">");
        out.println("<div id=\"insert\">");
        out.println("<div id=\"logout\">");
        out.println("<form name=\"logout\" action=\"doLogout.jsp\" method=\"post\">");
        out.println("<input type=\"submit\" id=\"button\" name=\"sSubmit\" value=\"Log out\" />");
        out.println("</form>");
        out.println("</div>");
        out.println("<a href=\"http://83.212.100.171:9090/newFinal/profile.jsp\" id=\"link\"><p>Welcome" + session.getAttribute("sUserID").toString()+"</p></a>");
        out.println("</div>");
        out.println("<a href=\"http://83.212.100.171:9090/newFinal/\"><img src=\"images/egipedo.png\" id=\"egipedo\"></a>");
        out.println("</div>");

	    }
            out.println("<h2>"+"Οι αθλητικές εγκαταστάσεις της περιοχής σου είναι :"+"</h2>");
            
            Class.forName("com.mysql.jdbc.Driver");
            
            
             con =DriverManager.getConnection 
             ("jdbc:mysql://localhost:3306/FinalProject","root", "*******");
             
             stmt = con.createStatement();
             
             rs = stmt.executeQuery("SELECT * FROM playgrounds WHERE location = '"+location+ "'");
             if(rs.next()){
             
             //out.println("<div id=\"tableContainer\">");
             //out.println("<div id=\"tableRow\">");
             
             out.println("<div id=\"map\">");
            out.println("<iframe width=\"1000\" height=\"800\" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" src=\"https://maps.google.com/maps/ms?msa=0&amp;msid=215270049696195036503.0004d5b3d9f12a148947d&amp;ie=UTF8&amp;t=m&amp;ll=39.377834,22.93602&amp;spn=0.053076,0.085745&amp;z=14&amp;output=embed\"></iframe>");
   
            out.println("</div>");    
                 
             out.println("<div id=\"pinakas\">");
             out.println("<table>");
             out.println("<tr><th>Onoma</th><th>Perioxh</th><th>Thlefwno</th></tr>");
             
            do{
                out.println("<tr><td>");
                String bv= rs.getObject(1).toString();
                out.println(rs.getObject(1).toString());
                out.println("</td><td>");
                out.println(rs.getObject(2).toString());
                out.println("</td><td>");
                out.println(rs.getObject(3).toString());
                out.println("</td><td>");
                
                out.println("<form name=\"input\" action=\"prebook.jsp\" method=\"get\">");
                out.println("<input type=\"hidden\", name=\"bookingVenue\" value="+bv +">");
                out.println("<input type=\"submit\" id=\"button\" value=\"Book\" name=\"field\">");
                out.println("</form>");
                out.println("</td></tr>");
                
            }while (rs.next());
            out.println("</table>");
            out.println("</div>");
            
            
            //out.println("</div>");
            //out.println("</div>");
            }
            else{
             
                 out.println("Δεν υπάρχουν γήπεδα στην περιοχή σου!");
             
             }
            
            
            
            out.println("</body>");
            out.println("<footer>");
            out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"footer.css\">");
            out.println("<div id=\"footer\">");
            out.println("<h3>Web Designed by e-Gipedo team &copy 2013</h3>");
            out.println("</div>");
            out.println("<footer>");
            out.println("</html>");
            //response.sendRedirect("findField.jsp");
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
                if(stmt != null) {
                    stmt.close();
                    stmt = null;
                }
                if(con != null) {
                    con.close();
                    con = null;
                }
            } catch (SQLException e) {}
  
                    out.close();
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
