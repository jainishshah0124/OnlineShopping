<%@page import="Conn.Exam"%>
<%@page import="Selection.select"%>
<%@page import="java.sql.PreparedStatement"%>
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
<title>List Invoice</title>
<style type="text/css">
table{
	width:100%;
}
th{
	height:50px;
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

		<br><br>
	<br>
	<br>
	<%
		Connection con;
		con = getConn.getConnection();
		ResultSet rs, rs1;
		PreparedStatement pst;
		rs=select.select_invoice();
	%>
	<table border="1">
		<tr>
			<th>Invoice ID</th>
			<th>Username</th>
			<th>Order ID</th>
			<th>Product Name</th>
			<th>Time</th>
			<th>Amount</th>
			<th>Address</th>
			<th>Mobile No</th>
			<th>Delivery Type</th>
		</tr>
		<%
		try
		{
		while(rs.next())
		{
			%>
			<tr>
			<td><%=rs.getString("invoice_id") %></td>
			<%
				pst=con.prepareStatement("select username from register where user_id='"+rs.getString("user_id")+"'");
				rs1=pst.executeQuery();
				while(rs1.next())
				{
					%>
					<td><%=rs1.getString("username") %></td>
					<%
				}
			%>
			<td><%=rs.getString("order_id") %></td>
			<%
				pst=con.prepareStatement("select product_name from products where product_id='"+rs.getString("product_id")+"'");
				rs1=pst.executeQuery();
				while(rs1.next())
				{
					%>
					<td><%=rs1.getString("product_name") %></td>
					<%
				}
			%>
			<td><%=rs.getString("time") %></td>
			<td><%=rs.getString("amount") %></td>
			<td><%=rs.getString("address") %></td>
			<td><%=rs.getString("mobile_no") %></td>
			<%
				pst=con.prepareStatement("select type from delivery_type where deliverytype_id='"+rs.getString("deliverytype_id")+"'");
				rs1=pst.executeQuery();
				while(rs1.next())
				{
					%>
					<td><%=rs1.getString("type") %></td>
					<%
				}
			%>
			</tr>
			<%
		}
		}
		catch(Exception e)
		{
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