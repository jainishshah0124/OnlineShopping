<%@page import="Conn.Exam"%>
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
<title>Order_Confirm</title>
<style type="text/css">
th{
	height:50px;
}
table{
	width:100%;
}
td{
	height:50px;
	text-align:center;
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
	<%
		Connection con;
		con = getConn.getConnection();
		PreparedStatement pst=con.prepareStatement("select * from orders where order_confirmed='0' && approval='1'");
		ResultSet rs=pst.executeQuery();
		PreparedStatement pst1;
		ResultSet rs1;
	%>
	<table border="1">
		<tr>
			<th>Order ID</th>
			<th>User Name</th>
			<th>Product Name</th>
			<th>Product Quantity</th>
			<th>Name</th>
			<th>Address</th>
			<th>State Name</th>
			<th>City Name</th>
			<th>Mobile No</th>
			<th>Email ID</th>
			<th>Delivery Type</th>
			<th>Order Time</th>
			<th>Order Delivered</th>
		<%
				try {
					while (rs.next()) {
			%>
				<tr>
				<td><%=rs.getString("order_id") %></td>
				<%
				pst1=con.prepareStatement("select username from register where user_id='"+rs.getString("user_id")+"'");
				rs1=pst1.executeQuery();
				while(rs1.next()){
				%>
				<td><%=rs1.getString("username")%></td>
				<%}
				pst1=con.prepareStatement("select product_name from products where product_id='"+rs.getString("product_id")+"'");
				rs1=pst1.executeQuery();
				while(rs1.next()){
				%>
				<td><%=rs1.getString("product_name") %></td><%} %>
				<td><%=rs.getString("product_quantity") %></td>
				<td><%=rs.getString("name") %></td>
				<td><%=rs.getString("address") %></td>
				<%
				pst1=con.prepareStatement("select state_name from state where state_id='"+rs.getString("state_id")+"'");
				rs1=pst1.executeQuery();
				while(rs1.next()){
				%>
				<td><%=rs1.getString("state_name") %></td>
				<%}
				pst1=con.prepareStatement("select city_name from city where city_id='"+rs.getString("city_id")+"'");
				rs1=pst1.executeQuery();
				while(rs1.next()){
				%>
				<td><%=rs1.getString("city_name") %></td><%} %>
				<td><%=rs.getString("mobile_no") %></td>
				<td><%=rs.getString("e_mail") %></td>
				<%
				pst1=con.prepareStatement("select type from delivery_type where deliverytype_id='"+rs.getString("deliverytype_id")+"'");
				rs1=pst1.executeQuery();
				while(rs1.next()){
				%>
				<td><%=rs1.getString("type") %></td><%} %>
				<td><%=rs.getString("order_time") %></td>
				<td><a href="orderconfirmsuccess.jsp?id=<%=rs.getString("order_id")%>"><img src="Upload/tick.png" width="80" height="50"></a></td>
				</tr>
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
	</table>
	<table width="100%" align="right">
		<% Date date=new Date(); %>
		<tr>
		<th align="right"><%=date %></th>
		</tr>
		</table>
</body>
</html>