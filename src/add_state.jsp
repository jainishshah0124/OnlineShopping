<%@page import="Conn.Exam"%>
<%@page import="Selection.select"%>
<%@page import="Conn.getConn"%>
<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add State</title>
<script>
	function error() {
		if (document.myform.statename.value == null
				|| document.myform.statename.value == "") {
			alert("Enter Statename");
			document.myform.statename.focus;
			return false;
		}
	}
</script>
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

	<center>
		<fieldset style="width: 60%;">
			<form name="myform" action="add_state_success.jsp" method="post"
				onsubmit="return error()">

				<center>
					<h2>ADD STATE</h2>
				</center>
				<table align="center">
					<tr>

						<th>StateName :-</th>
						<th><input type="text" name="statename"
							placeholder="Statename"></th>
						<th><input type="submit" value="Add State"></th>
					</tr>
				</table>
			</form>
			<br/>
			<table>
				<tr>
					<td colspan="3"><table align="center" border="3">
							<tr>
								<th>State ID</th>
								<th>State Name</th>
								<th>Edit</th>
							</tr>
							<%
								ResultSet rs = select.select_state();
								while (rs.next()) {
							%>
							<tr>
								<td align="center"><%=rs.getString("state_id")%></td>
								<td align="center"><%=rs.getString("state_name")%></td>
								<td><a href="editstate.jsp?id=<%=rs.getString("state_id")%>"><img src="Upload/editic.jpg" width="30" height="25"></a></td>
							</tr>
							<%
								}
							%>
						</table></td>
				</tr>
				<tr>

				</tr>
			</table>
		</fieldset>
	</center>
	<br>
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