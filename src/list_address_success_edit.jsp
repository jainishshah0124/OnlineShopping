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
		try{
		Connection con=getConn.getConnection();
		String address=request.getParameter("address");
		String pin=38+request.getParameter("pin");
		Statement stat=con.createStatement();
		stat.executeUpdate("update adresses set address='"+address+"',pin='"+pin+"' where address_id='"+request.getParameter("id")+"'");
		response.sendRedirect("list_address.jsp");
		}
		catch(Exception e)
	{
			e.printStackTrace();
	}
	%>
</body>
</html>