package Conn;


import java.sql.*;

public class getConn {
	public static Connection getConnection() {
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/leelamrut", "root", "root");
			return con;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("error");
			return null;
		}
	}
}
