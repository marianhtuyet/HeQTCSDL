/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import jdk.nashorn.internal.codegen.CompilerConstants;
import jdk.nashorn.internal.objects.Global;

/**
 *
 * @author MyPC
 */
public class DBConnect {

    public static Connection connection;
    public static final String hostName = "localhost";
    public static final String sqlInstanceName = "MAYTINH-VOUIPOT";
    public static final String database = "QuanLyDaNgoai";

    public static void dbConnect() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://Localhost:1433;databaseName=QuanLyDaNgoai";
            String Username = "sa";
            String Password = "1234";
            connection = DriverManager.getConnection(url, Username, Password);
            System.out.println("\nconnected");
        } catch (Exception exception) {
            System.out.print(exception);
            System.out.print("can't connect database! ");
        }

    }
    public static void dbDisconnect() throws SQLException{
       
        try {
            if(connection != null )
            {
                
                connection.close();
            }
            
        } catch (Exception e) {
                throw e;
        }

        
    }
    public static ResultSet dbExcute(String sql) throws SQLException{
        Statement stmt = null;
        ResultSet rs = null;
        try {
            dbConnect();
            stmt = connection.createStatement();
              rs =  stmt.executeQuery(sql);
              while (rs.next()) {      
                  
                  System.out.println("ID" + rs.getInt("ID"));
            }
        } catch (SQLException e) {
            System.out.print(e);
            System.out.print("Can't execute!");
        }
       dbDisconnect();
       return rs;
        }
    
    
}
