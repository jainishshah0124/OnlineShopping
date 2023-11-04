<%@page import="Conn.getConn"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="java.sql.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="#FFD54F">
	<table align="center" bgcolor="#FFD54F">
		<tr>
			<td width="10%" rowspan="2"><img src="Upload/LeelamrutLogo.png"
				onclick="window.open('index.jsp','_top')"></td>
			<th><a href="index.jsp"
				onclick="window.open('index.jsp','_top')" shape="rect">HOME</a></th>
			<th><a href="aboutus.jsp">ABOUT US</a></th>
			<th><a href="contactus.jsp">CONTACT US</a></th>
			<th><a href="signin.jsp">LOG-IN</a></th>
			<th><a href="registration.jsp">REGISTRATION</a></th>
		</tr>
	</table>
	<%
		Connection con;
		con=getConn.getConnection();
		Statement stat;
		stat=con.createStatement();
		String str;
		str=request.getParameter("statename");
		stat.executeUpdate("insert into state(state_name) values('"+str+"')");
		response.sendRedirect("add_state.jsp");
	%>
</body>
</html>