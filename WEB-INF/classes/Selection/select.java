package Selection;

import java.sql.*;

public class select {
	public static ResultSet select_deliverytype() {
		Connection con;
		con = Conn.getConn.getConnection();
		try {
			PreparedStatement pst;
			ResultSet rs;
			pst = con.prepareStatement("select * from delivery_type");
			rs = pst.executeQuery();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error");
			return null;
		}
	}
	
	public static ResultSet select_adresses() {
		Connection con;
		con = Conn.getConn.getConnection();
		try {
			PreparedStatement pst;
			ResultSet rs;
			pst = con.prepareStatement("select * from adresses");
			rs = pst.executeQuery();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error");
			return null;
		}
	}
	
	public static ResultSet select_city() {
		Connection con;
		con = Conn.getConn.getConnection();
		try {
			PreparedStatement pst;
			ResultSet rs;
			pst = con.prepareStatement("select * from city");
			rs = pst.executeQuery();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error");
			return null;
		}
	}
	public static ResultSet select_state() {
		Connection con;
		con = Conn.getConn.getConnection();
		try {
			PreparedStatement pst;
			ResultSet rs;
			pst = con.prepareStatement("select * from state");
			rs = pst.executeQuery();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error");
			return null;
		}
	}
	public static ResultSet select_products() {
		Connection con;
		con = Conn.getConn.getConnection();
		try {
			PreparedStatement pst;
			ResultSet rs;
			pst = con.prepareStatement("select * from products");
			rs = pst.executeQuery();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error");
			return null;
		}
	}
	public static ResultSet select_product_image() {
		Connection con;
		con = Conn.getConn.getConnection();
		try {
			PreparedStatement pst;
			ResultSet rs;
			pst = con.prepareStatement("select * from product_image");
			rs = pst.executeQuery();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error");
			return null;
		}
	}
	public static ResultSet select_role() {
		Connection con;
		con = Conn.getConn.getConnection();
		try {
			PreparedStatement pst;
			ResultSet rs;
			pst = con.prepareStatement("select * from role_master");
			rs = pst.executeQuery();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error");
			return null;
		}
	}
	public static ResultSet select_orders() {
		Connection con;
		con = Conn.getConn.getConnection();
		try {
			PreparedStatement pst;
			ResultSet rs;
			pst = con.prepareStatement("select * from orders");
			rs = pst.executeQuery();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error");
			return null;
		}
	}
	public static ResultSet select_register() {
		Connection con;
		con = Conn.getConn.getConnection();
		try {
			PreparedStatement pst;
			ResultSet rs;
			pst = con.prepareStatement("select * from register");
			rs = pst.executeQuery();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error");
			return null;
		}
	}
	public static ResultSet select_user() {
		Connection con;
		con = Conn.getConn.getConnection();
		try {
			PreparedStatement pst;
			ResultSet rs;
			pst = con.prepareStatement("select * from user");
			rs = pst.executeQuery();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error");
			return null;
		}
	}
	public static ResultSet select_invoice() {
		Connection con;
		con = Conn.getConn.getConnection();
		try {
			PreparedStatement pst;
			ResultSet rs;
			pst = con.prepareStatement("select * from invoice");
			rs = pst.executeQuery();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error");
			return null;
		}
	}
	public static ResultSet select_orderconfirm() {
		Connection con;
		con = Conn.getConn.getConnection();
		try {
			PreparedStatement pst;
			ResultSet rs;
			pst = con.prepareStatement("select * from order_confirmed");
			rs = pst.executeQuery();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error");
			return null;
		}
	}
}
