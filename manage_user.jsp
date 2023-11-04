<%@page import="java.sql.PreparedStatement"%>
<%@page import="Selection.select"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Conn.getConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage User</title>

<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" media="all" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" media="all" />
<style type="text/css">
td {
	text-align: center;
	height: 50px;
}

th {
	height: 50px;
}
</style>
</head>
<body bgcolor="#FFD54F">
	<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);

  if(session.getAttribute("us")==null)
      response.sendRedirect("index.jsp");

 request.getRequestDispatcher("head.jsp").include(request,response);
%>

	<br>
	<br>
	<br>
	<br>
	<%
		Connection con;
		con = getConn.getConnection();
		ResultSet rs = select.select_register();
		ResultSet rs1;
		PreparedStatement pst1;
	%>
	<table border="1" width="100%">
		<tr>
			<th>User ID</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Address</th>
			<th>Country Name</th>
			<th>State Name</th>
			<th>Mobile No</th>
			<th>Birthdate</th>
			<th>Email</th>
			<th>Gender</th>
			<th>Username</th>
			<th>Role Name</th>
			<th>Delete</th>
		</tr>
		<%
			try {
				while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("user_id")%></td>
			<td><%=rs.getString("first_name")%></td>
			<td><%=rs.getString("last_name")%></td>
			<td><%=rs.getString("address")%></td>
			<td>India</td>
			<%
				pst1 = con
								.prepareStatement("select state_name from state where state_id='"
										+ rs.getString("state_id") + "'");
						rs1 = pst1.executeQuery();
						while (rs1.next()) {
			%>
			<td><%=rs1.getString("state_name")%></td>
			<%
				}
			%>
			<td><%=rs.getString("mobile_no")%></td>
			<td><%=rs.getString("birth_date")%></td>
			<td><%=rs.getString("e_mail")%></td>
			<td><%=rs.getString("gender")%></td>
			<td><%=rs.getString("username")%></td>
			<%
				pst1 = con
								.prepareStatement("select rolename from role_master where role_id='"
										+ rs.getString("role_id") + "'");
						rs1 = pst1.executeQuery();
						while (rs1.next()) {
			%>
			<td><%=rs1.getString("rolename")%></td>
			<td><a href="Manage_user_success.jsp?id=<%=rs.getString("user_id")%>"><img src="Upload/del.png" width="40" height="30"></a></td>
			<%
				}
			%>
		</tr>
		<%
			}
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</table>
	<table width="100%" align="right">
		<%
			Date date = new Date();
		%>
		<tr>
			<th align="right"><%=date%></th>
		</tr>
	</table>
</body>
</html>