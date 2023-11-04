<%@page import="Conn.Exam"%>
<%@page import="Conn.getConn"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Invoice</title>
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
		Connection con = getConn.getConnection();
		PreparedStatement pst = con
				.prepareStatement("select * from order_confirmed where order_id='"
						+ request.getParameter("orders") + "'");
		ResultSet rs = pst.executeQuery();
		PreparedStatement pst1, pst2;
		ResultSet rs1, rs2;
		String sname, cname, quan, pprice, dtype;
		sname = null;
		cname = null;
		quan = null;
		rs1 = null;
		pprice = null;
		dtype = null;
	%>
	<table width="60%" align="center" border="4">
		<tr>
			<td colspan="2">Order Details</td>
		</tr>
		<%
			while (rs.next()) {
				pst2 = con
						.prepareStatement("select state_name from state where state_id='"
								+ rs.getString("state_id") + "'");
				rs2 = pst2.executeQuery();
				while (rs2.next()) {
					sname = rs2.getString("state_name");
				}
				pst2 = con
						.prepareStatement("select city_name from city where city_id='"
								+ rs.getString("city_id") + "'");
				rs2 = pst2.executeQuery();
				while (rs2.next()) {
					cname = rs2.getString("city_name");
				}
				pst2 = con
						.prepareStatement("select amount from delivery_type where deliverytype_id='"
								+ rs.getString("deliverytype_id") + "'");
				rs2 = pst2.executeQuery();
				while (rs2.next()) {
					dtype = rs2.getString("amount");
				}
				quan = rs.getString("product_quantity");
		%>
		<tr>
			<td>
				<table>
					<tr>
						<td>Order ID :-</td>
						<td><%=rs.getString("order_id")%></td>
					</tr>
					<%
						pst1 = con
									.prepareStatement("select username from register where user_id='"
											+ rs.getString("user_id") + "'");
							rs1 = pst1.executeQuery();
							while (rs1.next()) {
					%>
					<tr>
						<td>Username :-</td>
						<td><%=rs1.getString("username")%></td>
					</tr>
					<%
						}
					%>
					<tr>
						<td>Order Date :-</td>
						<td><%=rs.getString("order_time")%></td>
					</tr>
					<%
						pst1 = con
									.prepareStatement("select amount from invoice where order_id='"
											+ rs.getString("order_id") + "'");
							rs1 = pst1.executeQuery();
							while (rs1.next()) {
					%>
					<tr>
						<td>Amount Paid :-</td>
						<td>RS. <%=rs1.getString("amount")%></td>
					</tr>
					<%
						}
					%>
				</table>
			</td>
			<td>
				<table>
					<tr>
						<td><%=rs.getString("name")%> <%=rs.getString("mobile_no")%></td>
					</tr>
					<tr>
						<td><%=rs.getString("address")%><br><%=cname%><br><%=sname%><br>India</td>
					</tr>
				</table>
			</td>
		</tr>
		<%
			pst1 = con
						.prepareStatement("select * from products where product_id='"
								+ rs.getString("product_id") + "'");
				rs1 = pst1.executeQuery();
			}
		%>
	<tr><th colspan="2">
	<%
		
	%>
	<table width="50%" align="center">
		<%
			while (rs1.next()) {
				pprice = rs1.getString("product_price");
		%>
		<tr>
			<td>
				<table align="center">
					<tr>
						<td><%=rs1.getString("product_name")%><br>Quantity :- <%=quan%><br>Price
							:- <%=rs1.getString("product_price")%></td>
						<%
							}
							pst = con.prepareStatement("select * from invoice where order_id='"
									+ request.getParameter("orders") + "'");
							rs = pst.executeQuery();
							while (rs.next()) {
						%>
						<td>
							<table border="2">
								<tr>
									<td colspan="2" align="center">Product Price</td>
									<td colspan="2" align="center"><%=pprice%></td>
								</tr>
								<tr>
									<td colspan="2" align="center">Quantity</td>
									<td colspan="2" align="center"><%=quan%></td>
								</tr>
								<tr>
									<td colspan="2" align="center">Delivery Cost</td>
									<td colspan="2" align="center"><%=dtype%></td>
								</tr>
								<tr>
									<td colspan="2" align="center">Amount</td>
									<td colspan="2" align="center"><%=rs.getString("amount")%></td>
								</tr>
							</table>
						</td>
						<%
							}
						%>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	</th></tr></table>
</body>
</html>