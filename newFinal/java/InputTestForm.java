import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ValeryMini
 */
@WebServlet(name = "InputTestForm", urlPatterns = {"/InputTestForm"})
public class InputTestForm extends HttpServlet {
    //filds
    private PreparedStatement ps;
    private Statement st;

    @Override
    public void init() throws ServletException {
        super.init();
        initializeJdbc(); //initializing dtabase connection
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }//end doGet method

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           try {
            processRequest(request, response);
            PrintWriter out = response.getWriter();

            String t1 = request.getParameter("user_name");
            String t2 = request.getParameter("first_name");
            String t3 = request.getParameter("last_name");
            String t4 = request.getParameter("password");
            String t5 = request.getParameter("conf_password");
            String t6 = request.getParameter("email");
            String t7 = request.getParameter("phone");
            String t8 = request.getParameter("city");

            //here we must test any kind
            //here is the enother questin why with 1 all works fine but actually we looking for column 2
            //and we do submit 2 to getString we in trouble rs.getString(1); 
            //rs.getString(some name); rs.getString(any other number);
            String sql = "select username from userregister where sUserID = '"+t1.toLowerCase()+"'"; //this one is working
            String sql1 = "select email from userregister where sEmail = '"+t6.toLowerCase()+"'";
            String sql2 = "select phone from userregister where sContact = '"+t7.toLowerCase()+"'";
            
            ResultSet rs  = st.executeQuery(sql);
            ResultSet rs1  = st.executeQuery(sql1);
            ResultSet rs2  = st.executeQuery(sql2);
            String test = "";
            String test1 = "";
            String test2 = "";
            while (rs.next()) {
                test = rs.getString(1).toLowerCase();
                test1 = rs1.getString(1).toLowerCase();
                test2 = rs2.getString(1).toLowerCase();
            }

            //ask about better method to end while loop here is the one probblem lower apper case insencitive
            //so i geting to have same name just case can be different
            if (t1.length() <= 3 || t2.length() <= 5) {
                out.println("<h2>Some of the fields must be filled in with information</h2>");
            }else if(test.contains(t1.toLowerCase()) ){
                out.println("<h2>Entered username alredy exist try enother one.</h2>");
                out.println("<h2>"+t1+" "+test.toUpperCase()+"</h2>");
            }else if(test1.contains(t6.toLowerCase())){
                out.println("<h2>Entered Email account alredy exist try enother one.</h2>");
                out.println("<h2>"+t6+" "+test1.toUpperCase()+"</h2>");
            }else if( test2.contains(t7.toLowerCase())){
                out.println("<h2>Entered Email account alredy exist try enother one.</h2>");
                out.println("<h2>"+t7+" "+test2.toUpperCase()+"</h2>");
            }else{
                ps.setString(1, t1);
                ps.setString(2, t2);
                ps.setString(3, t3);
                ps.setString(4, t4);
                ps.setString(5, t5);
                ps.setString(6, t6);
                ps.setString(7, t7);
                ps.setString(8, t8);
                ps.executeUpdate();

                out.println("<h2>You Entered the following data</h2>");
                out.println("<br>User name: " + t1);
                out.println("<br>First Name: " + t2);
                out.println("<br>Last Name: " + t3 );
                out.println("<br>Telephone: " + t7);
                out.println("<br>Email: " + t6);
                out.println("<br>City:" + t8);
                
            }
        } //end doGet method
        catch (SQLException ex) {
            Logger.getLogger(InputTestForm.class.getName()).log(Level.SEVERE, null, ex);
        }

    }//end doPost method

    /**Method that initializing JDBC */
    private void initializeJdbc(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/FinalProject","root", "*******");

            String sql = "insert into userregister(sUserID,sFirstName,sLastName,sPassword,sForgetPassword,sEmail,sContact,iCityID) values(?,?,?,?,?,?,?,?)";
            ps = c.prepareStatement(sql);
            st = c.createStatement();

        } //end method initialize Jdbc
        catch (SQLException ex) {
            Logger.getLogger(InputTestForm.class.getName()).log(Level.SEVERE, null, ex);
        }        catch (ClassNotFoundException ex) {
            Logger.getLogger(InputTestForm.class.getName()).log(Level.SEVERE, null, ex);
        }

    }//end method initialize Jdbc

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
