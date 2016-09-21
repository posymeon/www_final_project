/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.io.*;
import javax.servlet.*;
import java.text.*;
import java.sql.*;


/**
 * Web application lifecycle listener.
 *
 * @author Polixronis
 */
@WebListener()
public class SessionListener implements HttpSessionListener {
    private static int sessionCount=0;
    Date dNow = new Date( ); 
    SimpleDateFormat ft = 
    new SimpleDateFormat ("dd.MM");
    
    
    
    @Override
    public void sessionCreated(HttpSessionEvent se) {
        synchronized (this) {
            sessionCount++;
        }
        Date dNew = new Date( ); 
       if(!(ft.format(dNew).equals(ft.format(dNow)))){
       
       }
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        synchronized (this) {
            sessionCount--;
        }
     
    }
}
