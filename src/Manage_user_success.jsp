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
<title>Manage_user_success</title>
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
		String uid=null;
		Statement stat=null;
		PreparedStatement pst;
		String username=null;
		ResultSet rs;
		try {

			uid=request.getParameter("id");
			stat = con.createStatement();
			stat.executeUpdate("delete from feedback where user_id='"
					+uid+ "'");
			stat = con.createStatement();
			stat.executeUpdate("delete from feedback_product where user_id='"
					+uid+ "'");
			stat = con.createStatement();
			stat.executeUpdate("delete from request_product where user_id='"
					+uid+ "'");
			stat = con.createStatement();
			stat.executeUpdate("delete from wishlist where user_id='"
					+uid+ "'");
			stat = con.createStatement();
			stat.executeUpdate("delete from invoice where user_id='"
					+uid+ "'");
			stat=con.createStatement();
			stat.executeUpdate("delete from adresses where user_id='"+uid+"'");
			stat = con.createStatement();
			stat.executeUpdate("delete from orders where user_id='"
					+uid+ "'");
			pst=con.prepareStatement("select username from register where user_id='"+uid+"'");
			rs=pst.executeQuery();
			while(rs.next())
			{
				username=rs.getString("username");
			}
			stat = con.createStatement();
			stat.executeUpdate("delete from user where username='"
					+ username + "'");
			stat = con.createStatement();
			stat.executeUpdate("delete from register where username='"
					+ username + "'");
			response.sendRedirect("manage_user.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error");
		}
	%>
</body>
</html>