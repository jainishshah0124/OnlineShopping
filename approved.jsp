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
		String orderid=request.getParameter("id");
		Connection con=getConn.getConnection();
		Statement stat=con.createStatement();
		stat.executeUpdate("update orders set approval='1' where order_id='"+orderid+"'");
		response.sendRedirect("orders_approval.jsp");
	%>
</body>
</html>