<%@page import="java.sql.PreparedStatement"%>
<%@page import="Selection.select"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Conn.getConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		Connection con = getConn.getConnection();
		String orderid = request.getParameter("id");
		String uid = null;
		String pid = null;
		int amount = 0;
		int pprice = 0;
		int pquantity = 0;
		String address = null;
		String mobile = null;
		String did = null;
		PreparedStatement pst = con.prepareStatement("select * from orders where order_id='"
				+ orderid + "'");
		ResultSet rs = pst.executeQuery();
		while (rs.next()) {
			pquantity = rs.getInt("product_quantity");
			uid = rs.getString("user_id");
			pid = rs.getString("product_id");
			address = rs.getString("address");
			mobile = rs.getString("mobile_no");
			did = rs.getString("deliverytype_id");
		}
		pst = con
				.prepareStatement("select * from products where product_id='"
						+ pid + "'");
		rs = pst.executeQuery();
		while (rs.next()) {
			pprice = rs.getInt("product_price");
		}
		Statement stat = con.createStatement();
		stat.executeUpdate("update orders set order_confirmed='1' where order_id='"
				+ orderid + "'");
		PreparedStatement pst3=con.prepareStatement("select * from delivery_type where deliverytype_id='"+did+"'");
		ResultSet rs3=pst3.executeQuery();
		while(rs3.next())
		{
			pprice=pprice+rs3.getInt("amount");
		}
		amount = pprice * pquantity;
		stat = con.createStatement();
		stat.executeUpdate("insert into invoice(user_id,order_id,product_id,time,amount,address,mobile_no,deliverytype_id) values('"
				+ uid
				+ "','"
				+ orderid
				+ "','"
				+ pid
				+ "',now(),'"
				+ amount
				+ "','"
				+ address
				+ "','"
				+ mobile
				+ "','"
				+ did
				+ "')");
		response.sendRedirect("orderconfirm.jsp");
	%>
</body>
</html>