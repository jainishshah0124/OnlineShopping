<%@page import="java.awt.Window"%>
<%@page import="Conn.getConn"%>
<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Success</title>

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
		con = getConn.getConnection();
		String s1 = request.getParameter("CITY");
		String s2 = request.getParameter("state");
		String s3 = null;
		Statement stat;
		PreparedStatement pst;
		ResultSet rs;
		try{
		pst = con
				.prepareStatement("select state_id from state where state_name='"
						+ s2 + "'");
		rs = pst.executeQuery();
		while (rs.next()) {
			s3 = rs.getString("state_id");
		}
		stat = con.createStatement();
		stat.executeUpdate("insert into city(city_name,state_id) values('"
				+ s1 + "','" + s3 + "')");
		response.sendRedirect("add_city.jsp");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	%>
</body>
</html>