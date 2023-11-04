<%@page import="java.sql.Statement"%>
<%@page import="Conn.getConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>contactus_success</title>
</head>
<body bgcolor="#FFD54F">
	<%
		if(request.getParameter("phone").length()<10)
		{
			String contact_us_phone="Please Enter Valid Mobile No";
			request.getSession().setAttribute("contact_us_phone", contact_us_phone);
			response.sendRedirect("contactus.jsp");
		}
		else
		{
		Connection con;
		con = getConn.getConnection();
		Statement stat;
		try {
			stat = con.createStatement();
			stat.executeUpdate("insert into inquiry(name,email,phone,address,message) values('"
					+ request.getParameter("name")
					+ "','"
					+ request.getParameter("email")
					+ "','"
					+ request.getParameter("phone").trim()
					+ "','"
					+ request.getParameter("address")
					+ "','"
					+ request.getParameter("message") + "')");
			response.sendRedirect("contactus.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error");
		}
		}
	%>
</body>
</html>