import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import java.text.*;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Web application lifecycle listener.
 *
 * @author koynoypis
 */
public class MatchDateListener implements HttpSessionListener {
    
    @Override
    public void sessionCreated(HttpSessionEvent se) {
        
        Date now = new Date();
        SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
        Connection con = null;  
        Statement stmt = null;
        ResultSet rs = null;
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con =DriverManager.getConnection 
                ("jdbc:mysql://localhost:3306/FinalProject","root", "*******");
            stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT * FROM FindRival");
            if(rs.next()){
            do{
                Date date = ft.parse(rs.getObject(3).toString());
                if(!(ft.format(date).compareTo(ft.format(now))>0)){
                    
                    stmt.executeUpdate("DELETE FROM FindRival where date ='"+date+"'");
                    
                }
            }while(rs.next());
            
            }
            
        }catch (SQLException e) {
               // throw new ServletException("Servlet Could not display records.", e);
            } catch (ClassNotFoundException e) {
             //throw new ServletException("JDBC Driver not found.", e);
            
            }catch(ParseException e){
            
            
            }finally {         
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
  
                   // out.close();
               } 
        
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
