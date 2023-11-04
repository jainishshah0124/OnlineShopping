<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
		Statement stat;
		String city_id = request.getParameter("deletecityname");
		PreparedStatement pst=con.prepareStatement("select city_id from city where city_name='"+city_id+"'");
		ResultSet rs=pst.executeQuery();
		while(rs.next())
		{
			city_id=rs.getString("city_id");
		}
		try {
			stat = con.createStatement();
			stat.executeUpdate("delete from register where city_id='"
					+ city_id + "'");
			stat = con.createStatement();
			stat.executeUpdate("delete from products where city_id='"
					+ city_id + "'");
			stat = con.createStatement();
			stat.executeUpdate("delete from order_confirmed where city_id='"
					+ city_id + "'");
			stat = con.createStatement();
			stat.executeUpdate("delete from orders where city_id='"
					+ city_id + "'");
			stat = con.createStatement();
			stat.executeUpdate("delete from city where city_id='" + city_id
					+ "'");
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("add_city.jsp");
	%>
</body>
</html>