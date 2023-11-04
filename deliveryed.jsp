<%@page import="java.sql.PreparedStatement"%>
<%@page import="Conn.getConn"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="Selection.select"%>
<%@page import="java.sql.ResultSet"%>
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
		PreparedStatement pst = con
				.prepareStatement("select * from orders where order_id='"
						+ orderid + "'");
		ResultSet rs = pst.executeQuery();
		String a, b, c, d, e, f, g, h, i, j, k, l, m;
		a = null;
		b = null;
		c = null;
		d = null;
		e = null;
		f = null;
		g = null;
		h = null;
		i = null;
		j = null;
		k = null;
		l = null;
		m = null;
		try
		{
		while (rs.next()) {
			a = rs.getString("user_id");
			b = rs.getString("product_id");
			c = rs.getString("product_quantity");
			d = rs.getString("name");
			e = rs.getString("address");
			f = rs.getString("state_id");
			h = rs.getString("city_id");
			j = rs.getString("mobile_no");
			k = rs.getString("e_mail");
			l = rs.getString("deliverytype_id");
			m = rs.getString("order_time");
		}
		Statement stat = con.createStatement();
		stat.executeUpdate("insert into order_confirmed(order_id,user_id,product_id,product_quantity,name,address,state_id,city_id,mobile_no,e_mail,deliverytype_id,order_time) values('"+orderid+"','"
				+ a
				+ "','"
				+ b
				+ "','"
				+ c
				+ "','"
				+ d
				+ "','"
				+ e
				+ "','"
				+ f
				+ "','"
				+ h
				+ "','"
				+ j
				+ "','"
				+ k
				+ "','"
				+ l + "','" + m + "')");
		PreparedStatement pst1 = con
				.prepareStatement("select product_price from products where product_id='"
						+ b + "'");
		ResultSet rs1 = pst1.executeQuery();
		float price=0;
		while (rs1.next()) {
			price = rs1.getFloat("product_price");
		}
		pst1 = con
				.prepareStatement("select amount from delivery_type where deliverytype_id='"
						+ l + "'");
		rs1 = pst1.executeQuery();
		float dtype = 0;
		while (rs1.next()) {
			dtype = rs1.getFloat("amount");
		}
		float qprice=0;
		pst1=con.prepareStatement("select product_quantity from orders where order_id='"+orderid+"'");
		rs1=pst1.executeQuery();
		while(rs1.next())
		{
			qprice=rs1.getFloat("product_quantity");
		}
		float amount = (price * qprice) + dtype;
		pst1=con.prepareStatement("select order_id from order_confirmed");
		stat = con.createStatement();
		stat.executeUpdate("insert into invoice(user_id,order_id,product_id,time,amount,address,mobile_no,deliverytype_id) values('"
				+ a + "','" + orderid + "','"+b+"',now(),'"+amount+"','"+e+"','"+j+"','"+l+"')");
		stat = con.createStatement();
		stat.executeUpdate("delete from orders where order_id='" + orderid
				+ "'");
		response.sendRedirect("listorders.jsp");
		}
		catch(Exception ee)
		{
			ee.printStackTrace();
		}
	%>
</body>
</html>