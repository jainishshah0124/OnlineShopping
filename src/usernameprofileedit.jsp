<%@page import="Selection.select"%>
<%@page import="Conn.Exam"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Conn.getConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Profile</title>
</head>
<body bgcolor="#FFD54F">
		<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);

  if(session.getAttribute("us")==null)
      response.sendRedirect("index.jsp");

 request.getRequestDispatcher("head_user.jsp").include(request,response);
%>

		<br> <br>
	<%
		Connection con=getConn.getConnection();
		PreparedStatement pst,pst1;
		ResultSet rs,rs1;
		String sname=null;
		String cname=null;
		String user=Exam.getusername();
		pst=con.prepareStatement("select * from register where username='"+user+"'");
		rs=pst.executeQuery();
		while(rs.next())
		{
	%>
		<form action="usernameprofileeditsuccess.jsp" method="post">
		<table border="0" align="center" border="">
			<tr><th align="center" colspan="2" height="80px">Edit Profile</th></tr>
			<tr>
				<th align="center">First Name :-</th>
				<td><input value="<%=rs.getString("first_name")%>" type="text" name="first_name" onkeyup="keyUP(event.keyCode);" onkeydown="return isAlpha(event.keyCode);" onpaste="return false;"></td>
			</tr>
			<tr>
				<th align="center">Last Name :-</th>
				<td><input value="<%=rs.getString("last_name")%>" type="text" name="last_name" onkeyup="keyUP(event.keyCode);" onkeydown="return isAlpha(event.keyCode);" onpaste="return false;"></td>
			</tr>
			<tr>
				<th align="center">Address :-</th>
				<td><textarea rows="5" cols="15" name="address"><%=rs.getString("address")%></textarea></td>
			</tr>
			<tr>
				<th align="center">Country :-</th>
				<th>India</th>
			</tr>
			<tr>
				<th align="center">State Name :-</th>
				<td><select name="state_name">
				<%
					pst1=con.prepareStatement("select state_name from state where state_id='"+rs.getString("state_id")+"'");
					rs1=pst1.executeQuery();
					while(rs1.next())
					{
						sname=rs1.getString("state_name");
					}
					rs1=select.select_state();
							while (rs1.next()) {
								if(rs1.getString("state_name").equals(sname))
								{
									%>
									<option selected="selected"><%=rs1.getString("state_name")%></option>
									<%
								}
								else
								{
									%>
									<option><%=rs1.getString("state_name")%></option>
									<%
								}
							}
						%>
				</select></td>
			</tr>
			<tr>
				<th align="center">Mobile Number :-</th>
				<td><input type="text" value="<%=rs.getString("mobile_no")%>" name="mobile" maxlength="10"  onkeyup="keyUP(event.keyCode);" onkeydown="return ismob(event.keyCode);" onpaste="return false;"></td>
			</tr>
			<tr>
				<th align="center">Date Of Birth :-</th>
				<td><input type="date" value="<%=rs.getString("birth_date")%>" name="dob"></td>
			</tr>
			<tr>
				<th align="center">Email-ID :-</th>
				<td><input type="email" name="email"  disabled="disabled" value="<%=rs.getString("e_mail")%>"></td>
			</tr>
			<tr>
				<th align="center">Gender :-</th>
				<td><input type="radio" name="gender" value="Male" checked="checked">Male
					<input type="radio" name="gender" value="Female">Female</td>
			</tr>
			<tr>
				<th align="center">User Name :-</th>
				<td><input type="text" name="username" disabled="disabled" value="<%=rs.getString("username")%>" readonly="readonly"></td>
			</tr>
			<tr>
				<th align="center">Role :-</th>
				<%
					pst1=con.prepareStatement("select rolename from role_master where role_id='"+rs.getString("role_id")+"'");
					rs1=pst1.executeQuery();
					while(rs1.next())
					{
				%>
				<th><input type="text" value="<%=rs1.getString("rolename")%>" name="role_name" disabled="disabled" readonly="readonly"></th>
				<%}%>
			</tr>
			<tr>
				<th colspan="2"></th>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" name="submit" value="Update"></th>
			</tr>
		</table>
		</form>
	<%} %>
</body>
</html>