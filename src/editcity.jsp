<%@page import="Conn.Exam"%>
<%@page import="Selection.select"%>
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
<title>Edit City</title>
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
<br><br>
	<form method="post" action="editcitysuccess.jsp">
		<center>
		<fieldset style="width: 50%">
		<legend>Edit City</legend>
			<%
				String cname = request.getParameter("id");
			%>
			<table align="center">
				<%
					Connection con = getConn.getConnection();
					PreparedStatement pst = con
							.prepareStatement("select * from city where city_id='"
									+ cname + "'");
					ResultSet rs = pst.executeQuery();
					while (rs.next()) {
				%>
				<tr>
					<th>City ID</th>
					<td><select name="cityid"><option><%=rs.getString("city_id")%></option></select></td>
				</tr>
				<tr>
					<th>City Name</th>
					<td><input type="text" name="cityname"
						value="<%=rs.getString("city_name")%>"></td>
				</tr>
				<tr>
				<%
					PreparedStatement pst1=con.prepareStatement("select state_name from state where state_id='"+rs.getString("state_id")+"'");
					ResultSet rs1=pst1.executeQuery();
					ResultSet rs2=select.select_state();
				%>
					<th>State Name</th>
					<td><select name="statename">
					<%
					while(rs1.next())
					{
						%>
						<option><%=rs1.getString("state_name")%></option>
						<%
					}
					while(rs2.next())
					{
					%>
					<option><%=rs2.getString("state_name")%></option>
					<%} %>
					</select></td>
				</tr>
				<%
					}
				%>
				<tr><td colspan="2" align="center"><input type="submit" value="Update"></td></tr>
			</table>
		</fieldset>
		</center>
	</form>
</body>
</html>