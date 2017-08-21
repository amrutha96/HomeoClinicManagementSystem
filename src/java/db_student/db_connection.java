/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db_student;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author student21
 */
public class db_connection {
    Connection con=null;
    Statement st=null;
    ResultSet rs=null;
    public db_connection()
    {
       try{
           Class.forName("com.mysql.jdbc.Driver");
       }
       catch(ClassNotFoundException ex)
       {
           System.out.println(ex);
       }
           try {con=DriverManager.getConnection("jdbc:mysql://localhost/db_regi","root","");
               
           }
           catch(SQLException ex) {
                System.out.println(ex);
           }
       }           
public boolean insert(String ins)
{
    boolean b=false;
    try {
        st=con.createStatement();
        st.executeUpdate(ins);
        b=true;
    } catch (SQLException ex) {
        System.out.println(ex);
    }
    return b;
    
    }
    public ResultSet select(String sel) {
        try {
            st=con.createStatement();
            rs=st.executeQuery(sel);
        } catch (Exception ex) {
            System.out.println(ex);
        }
       return rs;
    }
}


    
    
    

