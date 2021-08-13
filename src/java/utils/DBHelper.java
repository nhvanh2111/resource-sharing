/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author DELL
 */
public class DBHelper {
    public static Connection makeConnection(){
        Connection con=null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url="jdbc:sqlserver://localhost:1433;databasename=J3.L.P0016";
            con=DriverManager.getConnection(url,"sa","nguyenhuynhvananh2111");
           
        } catch(Exception e){
            e.printStackTrace();
        }
        return con;
    }
}
