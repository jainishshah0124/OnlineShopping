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
		request.getRequestDispatcher("head_user.jsp").include(request, response);
	%>
	<br/><br/>
	<table border="2" width="35%">
		<tr>
			<th>Address</th>
			<th>Pin</th>
			<th colspan="2">Update</th>
		</tr>
		<%
			Connection con = getConn.getConnection();
			PreparedStatement pst = con
					.prepareStatement("select user_id from register where username='"
							+ request.getSession().getAttribute("us") + "'");
			ResultSet rs = pst.executeQuery();
			String uid = null;
			while (rs.next()) {
				uid = rs.getString("user_id");
			}
			pst = con.prepareStatement("select * from adresses where user_id='"
					+ uid + "'");
			rs = pst.executeQuery();
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("address")%></td>
			<td><%=rs.getString("pin")%></td>
			<td><a href="list_address_success.jsp?id=1&&addid=<%=rs.getString("address_id")%>"><img
					src="Upload/edit.png" width="50" height="50"></a></td>
			<td><a href="list_address_success.jsp?id=2&&addid=<%=rs.getString("address_id")%>"><img
					src="Upload/del.png" width="50" height="50"></a></td>
		</tr>
		<%
			}
		%>
		</table>
		<br/>
		<b>Add New</b><br/><br/>
		<form action="list_address_success.jsp">
		<table>
		<tr>
		<td><textarea name="address" cols="17" id="address" rows="10" placeholder="address"></textarea></td>
		<td>38<input type="text" id="pin" name="pin" maxlength="4" placeholder="Pin" onkeyup="keyUP(event.keyCode);" onkeydown="return ismob(event.keyCode);" onpaste="return false;"></td>
		<td><input type="hidden" name="id" value="3"></td>
		<td><input type="submit" value="Add"></td>
		</tr>
		</table>
		</form>
</body>
</html>