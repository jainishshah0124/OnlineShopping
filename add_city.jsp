<%@page import="Conn.Exam"%>
<%@page import="Selection.select"%>
<%@page import="Conn.getConn" import="Selection.select.*"%>
<%@page import="java.util.Date"%>
<%@ page language="java" import="java.sql.*"
	import="Com.database.leelamrut.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add City</title>
<script>
	function error() {
		if (document.myform.CITY.value == null
				|| document.myform.CITY.value == "") {
			alert("Enter City");
			document.myform.CITY.value.focus;
			return false;
		} else if (document.myform.state.value == "-1") {
			alert("Select State");
			document.myform.state.value.focus;
			return false;
		}
	}
	function go() {
		response.sendRedirect("editcity.jsp");
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

	<form name="myform" action="editcity.jsp" method="post">


		<center>
			<h2>ADD CITY</h2>
			<fieldset style="width: 50%;">
				<table align="center" height="35px">
					<tr>
						<th align="center" height="35px">City Name</th>
						<th align="center" height="35px"><input type="text" placeholder="City Name"
							name="CITY"></th>
						<th align="center" height="35px" rowspan="2"><input type="submit"
							value="Add City" onclick="return error()"></th>
					</tr>
					<tr>
						<th align="center" height="35px">State</th>
						<th align="center" height="35px"><select name="state">
								<option value="-1">Select State</option>
								<%
									try {
										ResultSet rs = select.select_state();
										while (rs.next()) {
								%>
								<option><%=rs.getString("state_name")%></option>
								<%
									}
									} catch (Exception e) {
										e.printStackTrace();
										System.out.println("error");
									}
								%>
						</select></th>
					</tr>
				</table>
	</form>
	<table align="center" border="3">
		<tr>
			<th>City ID</th>
			<th>City Name</th>
			<th>State Name</th>
			<th>Edit</th>
		</tr>
		<%
			try {
				ResultSet rs2 = select.select_city();
				while (rs2.next()) {
		%>
		<tr>
			<td align="center"><%=rs2.getString("city_id")%></td>
			<td align="center"><%=rs2.getString("city_name")%></td>

			<%
				Connection con = getConn.getConnection();
						PreparedStatement pst1;
						pst1 = con
								.prepareStatement("select state_name from state where state_id='"
										+ rs2.getString("state_id") + "'");
						ResultSet rs1 = pst1.executeQuery();
						while (rs1.next()) {
			%>
			<td align="center"><%=rs1.getString("state_name")%></td>
			<td><a href="editcity.jsp?id=<%=rs2.getString("city_id")%>"><img src="Upload/editic.jpg" width="30" height="25"></a></td>
			</tr>
		<%
			}
		%>
		<%
			}
		%>
		<%
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("error");
			}
		%>
	</table>
	</fieldset>
	</center>
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