<%@page import="com.counter.Product_id"%>
<%@page import="Conn.Exam"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Conn.getConn"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.counter.counter"%>
<%@page import="Selection.select"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<noscript>
	<div
		style="position: fixed; top: 0px; left: 0px; z-index: 3000; height: 100%; width: 100%; background-color: #FFFFFF">
		<p style="margin-left: 10px">JavaScript is not enabled,please
			enable your javascript to surf our website.</p>
	</div>
</noscript>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Leelamrut</title>
<style type="text/css">
li{
	padding-right:110px;
}
</style>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" media="all" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" media="all" />
<style type="text/css">
td {
	height: 30px;
}

th {
	height: 30px;
}
</style>
<script>
	function ismob(keyCode) {
		return ((keyCode >= 48 && keyCode <= 57) || keyCode == 8)
	}
</script>
</head>
<body background="images/bgnoise_lg.jpg">
	<jsp:useBean id="count_id" class="com.counter.counter"
		scope="application" />
	<form method="post" action="product_details.jsp">
		<!-- <table align="center" background="images/bgnoise_lg.jpg">
			<tr>
				<td width="10%" rowspan="2"><img src="Upload/LeelamrutLogo.png"
					onclick="window.open('index.jsp','_top')"></td>
				<th><a href="index.jsp"
					onclick="window.open('index.jsp','_top')" shape="rect">HOME</a></th>
				<th><a href="aboutus.jsp">ABOUT US</a></th>
				<th><a href="contactus.jsp">CONTACT US</a></th>
				<th><a href="signin.jsp">LOG-IN</a></th>
				<th><a href="registration.jsp">REGISTRATION</a></th>
			</tr> -->
			<ul class="nav nav-pills">
		<li><img src="Upload/LeelamrutLogo.png"
					onclick="window.open('userhomepage.jsp','_top')"></li>
  		<li role="presentation" class="active" style="padding-top:50px;"><a href="userhomepage.jsp">Home</a></li>
  		<li role="presentation" class="active" style="padding-top:50px;"><a href="aboutus.jsp">About Us</a></li>
  		<li role="presentation" class="active" style="padding-top:50px;"><a href="contactus.jsp">Contact Us</a></li>
  		<li role="presentation" class="active" style="padding-top:50px;"><a href="signin.jsp">Log-In</a></li>
  		<li role="presentation" class="active" style="padding-top:50px;"><a href="registration.jsp">Registration</a></li>
		</ul>
		<br> <br>
		<%
			ResultSet rs2 = select.select_city();
		%>
		<hr>
		<br> <br>
		<%
			ResultSet rs=select.select_products();
		%>
		<table align="center">
			<tr>
				<th style="padding-right:25px;">Product Name</th>
				<th>
					<select name="id" class="form-control">
						<%
							while(rs.next())
							{
						%>
							<option value="<%=rs.getString("product_id")%>"><%=rs.getString("Product_name")%></option>
						<%
							}
						%>
					</select>
				</th>
			</tr>
		</table>
		<br>
		<table align="center">
			<tr>
				<td colspan="2"><input type="submit" class="form-control" name="submit"
					value="Search"></td>
			</tr>
		</table>
		<br>
		<br>
		<table align="center">
			<tr height="30">
				<%
					try {
						Connection con = getConn.getConnection();
						rs = select.select_product_image();
						int i = 0;
						while (rs.next()) {
				%>
				<td>
				<a	href="product_details.jsp?id=<%=rs.getString("product_id")%>"><img border="7"
						src="<%=rs.getString("image_url")%>" width="200" height="200"></a>
					<%
						PreparedStatement pst = con
										.prepareStatement("select * from products where product_id='"
												+ rs.getString("product_id") + "'");
								ResultSet rs1 = pst.executeQuery();
								while (rs1.next()) {
					%><br><%=rs1.getString("product_name")%> <%
 	}
 %></td>
				<td>&nbsp &nbsp &nbsp &nbsp</td>
				<%
					i++;
							if (i == 4) {
				%>
			</tr>
			<tr height="300">
				<%
					i = 0;
							}
						}
					} catch (Exception e) {
					}
				%>
			</tr>
		</table>
		<table width="100%" align="right">
			<%
				Date date = new Date();
			%>
			<tr>
				<th align="right"><%=date%></th>
			</tr>
		</table>
	</form>
</html>