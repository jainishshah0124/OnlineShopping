package Selection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class selectparticular {
	public static ResultSet select_city(String a) {
		Connection con;
		con = Conn.getConn.getConnection();
		try {
			PreparedStatement pst;
			ResultSet rs;
			pst = con.prepareStatement("select username from register where user_id='"+a+"'");
			rs = pst.executeQuery();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error");
			return null;
		}
	}
}
