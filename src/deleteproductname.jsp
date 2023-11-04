<%@page import="java.sql.Statement"%>
<%@page import="Conn.getConn"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
		int id= Integer.parseInt(request.getParameter("productID"));
		Connection con = getConn.getConnection();
		PreparedStatement pst;
		ResultSet rs;
		try {
			Statement stat;
			stat = con.createStatement();
			stat.executeUpdate("delete from feedback_product where product_id='"
					+ id + "'");

			stat = con.createStatement();
			stat.executeUpdate("delete from invoice where product_id='"
					+ id + "'");

			stat = con.createStatement();
			stat.executeUpdate("delete from order_confirmed where product_id='"
					+ id + "'");

			stat = con.createStatement();
			stat.executeUpdate("delete from orders where product_id='" + id
					+ "'");

			stat = con.createStatement();
			stat.executeUpdate("delete from product_image where product_id='"
					+ id + "'");

			stat = con.createStatement();
			stat.executeUpdate("delete from request_product where product_id='"
					+ id + "'");

			stat = con.createStatement();
			stat.executeUpdate("delete from wishlist where product_id='"
					+ id + "'");

			stat = con.createStatement();
			stat.executeUpdate("delete from products where product_id='"
					+ id + "'");
			response.sendRedirect("add_product.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>