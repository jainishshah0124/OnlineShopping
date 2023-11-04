<%@page import="java.sql.ResultSet"%>
<%@page import="Conn.getConn"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit State</title>
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
	<%
		Connection con = getConn.getConnection();
		PreparedStatement pst = con
				.prepareStatement("select * from state where state_id='"
						+ request.getParameter("id") + "'");
		ResultSet rs = pst.executeQuery();
	%>
	<form action="editstatesuccess.jsp">
		<center>
			<fieldset style="width: 60%">
				<table align="center">
					<%
						while (rs.next()) {
					%>
					<tr>
						<th>State ID</td>
						<td><select name="stateid">
								<option><%=rs.getString("state_id") %></option>
						</select></td>
					</tr>
					<tr>
						<th>State Name</th>
						<td><input type="text" name="statename"
							value="<%=rs.getString("state_name")%>"></td>
						<%
							}
						%>
					</tr>
					<tr>
						<td align="center" colspan="2"><input type="submit"
							value="Update"></td>
					</tr>
				</table>
			</fieldset>
		</center>
	</form>
</body>
</html>