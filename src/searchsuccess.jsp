<%@page import="Selection.select"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Conn.getConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Success</title>
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
<table align="center">
			<tr>
				<%if(request.getSession().getAttribute("us")==null)
				{
				%>
				<td width="10%" rowspan="2"><img src="Upload/LeelamrutLogo.png"
					onclick="window.open('index.jsp','_top')"></td>
				<th><a href="index.jsp" shape="rect">HOME</a></th>
				<%
				}
				else
				{
					%>
					<td width="10%" rowspan="2"><img src="Upload/LeelamrutLogo.png"
					onclick="window.open('userhomepage.jsp','_top')"></td>
				<th><a href="userhomepage.jsp" shape="rect">HOME</a></th>
					<%
				}
				%>
				<th><a href="aboutus.jsp">ABOUT US</a></th>
				<th><a href="contactus.jsp">CONTACT US</a></th>
				<%
					if(request.getSession().getAttribute("us")==null)
					{
						%>
				<th><a href="signin.jsp">LOG-IN</a></th>
						<%
					}
					else
					{
						%>
						<th>Hi <%=request.getSession().getAttribute("us")%></th>
						<%
					}
				%>
				<th><a href="registration.jsp">REGISTRATION</a></th>
				<%
					if(request.getSession().getAttribute("us")!=null)
					{
						%>
						<th><a href="logout.jsp">Logout</a></th>
						<%
					}
				%>
			</tr>
		</table>
	<br>
	<br>
	<br>
	<%
		String xyz = request.getParameter("sortprice");
		String search;
		String search1 = request.getParameter("sortsearch");
		Connection con;
		con = getConn.getConnection();
		PreparedStatement pst, ps1;
		ResultSet rs, rs1;
		if (xyz == null || xyz == "") {
	%>
	<table width="100%" border="6">
		<tr>
			<th>Product ID</th>
			<th>Product Name</th>
			<th>Product Price</th>
			<th>City Name</th>
			<th>Product Quantity</th>
			<th>Weight</th>
		</tr>
		<%
			try {
					pst = con
							.prepareStatement("select * from products where product_name like '%"
									+ search1.trim() + "%'");
					rs = pst.executeQuery();
					while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("product_id")%></td>
			<th><a href="product_details.jsp?id=<%=rs.getString("product_id")%>"><%=rs.getString("product_name")%></a></th>
			<td><%=rs.getString("product_price")%></td>
			<%
				ps1 = con
									.prepareStatement("select city_name from city where city_id='"
											+ rs.getString("city_id") + "'");
							rs1 = ps1.executeQuery();
							while (rs1.next()) {
			%>
			<td><%=rs1.getString("city_name")%></td>
			<%
				}
			%>
			<td><%=rs.getString("product_quantity")%></td>
			<td><%=rs.getString("weight")%></td>
		</tr>
		<%
			}
					search = request.getParameter("sortcity");
					pst = con
							.prepareStatement("select city_id from city where city_name='"
									+ search + "'");
					rs = pst.executeQuery();
					while (rs.next()) {
						search = rs.getString("city_id");
					}
					pst = con
							.prepareStatement("select * from products where city_id='"
									+ search + "'");
					rs = pst.executeQuery();
					while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("product_id")%></td>
			<td><a href="product_details.jsp?id=<%=rs.getString("product_id")%>"><%=rs.getString("product_name")%></a></td>
			<td><%=rs.getString("product_price")%></td>
			<%
				ps1 = con
									.prepareStatement("select city_name from city where city_id='"
											+ rs.getString("city_id") + "'");
							rs1 = ps1.executeQuery();
							while (rs1.next()) {
			%>
			<th><%=rs1.getString("city_name")%></th>
			<%
				}
			%>
			<td><%=rs.getString("product_quantity")%></td>
			<td><%=rs.getString("weight")%></td>
		</tr>
		<%
			}
				} catch (Exception e) {
					e.printStackTrace();
				}
		%>
	</table>
	<%
		}

		else {
	%>
	<table width="100%" border="6">
		<tr>
			<th>Product ID</th>
			<th>Product Name</th>
			<th>Product Price</th>
			<th>City Name</th>
			<th>Product Quantity</th>
			<th>Weight</th>
		</tr>
		<%
			int price = Integer.parseInt(xyz);
				try {
					pst = con
							.prepareStatement("select * from products where product_name='"
									+ search1 + "'");
					rs = pst.executeQuery();
					while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("product_id")%></td>
			<td><a href="product_details.jsp?id=<%=rs.getString("product_id")%>"><%=rs.getString("product_name")%></a></td>
			<td><%=rs.getString("product_price")%></td>
			<%
				ps1 = con
									.prepareStatement("select city_name from city where city_id='"
											+ rs.getString("city_id") + "'");
							rs1 = ps1.executeQuery();
							while (rs1.next()) {
			%>
			<td><%=rs1.getString("city_name")%></td>
			<%
				}
			%>
			<td><%=rs.getString("product_quantity")%></td>
			<td><%=rs.getString("weight")%></td>
		</tr>
		<%
			}
					search = request.getParameter("sortcity");
					pst = con
							.prepareStatement("select city_id from city where city_name='"
									+ search + "'");
					rs = pst.executeQuery();
					while (rs.next()) {
						search = rs.getString("city_id");
					}
					pst = con
							.prepareStatement("select * from products where product_name='%"+request.getParameter("sortsearch")+"%' || city_id='"
									+ search
									+ "' || product_price<='"
									+ price
									+ "'");
					rs = pst.executeQuery();
					while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("product_id")%></td>
			<td><a href="product_details.jsp?id=<%=rs.getString("product_id")%>"><%=rs.getString("product_name")%></a></td>
			<th><%=rs.getString("product_price")%></th>
			<%
				ps1 = con
									.prepareStatement("select city_name from city where city_id='"
											+ rs.getString("city_id") + "'");
							rs1 = ps1.executeQuery();
							while (rs1.next()) {
			%>
			<th><%=rs1.getString("city_name")%></th>
			<%
				}
			%>
			<td><%=rs.getString("product_quantity")%></td>
			<td><%=rs.getString("weight")%></td>
		</tr>
		<%
			}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		%>
	</table>
	<br>
	<br>
	<br>
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