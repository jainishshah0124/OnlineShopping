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
<title>Edit Product</title>
<style type="text/css">
td {
	text-align: center;
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
		int product = Integer.parseInt(request.getParameter("productID"));
		Connection con = getConn.getConnection();
		PreparedStatement pst = con
				.prepareStatement("select * from products where product_id='"
						+ product + "'");
		ResultSet rs = pst.executeQuery();
	%>
	<center>
		<fieldset style="width: 50%">
		<legend>Edit Details</legend>
			<form action="editproductsuccess.jsp" method="post">
				<table align="center">
					<%
						while (rs.next()) {
					%>
					<tr>
						<th>Product ID</th>
						<td><select name="productid"><option><%=rs.getString("product_id")%></option></select></td>
					</tr>
					<tr>
						<th>Product Name</th>
						<td><input type="text"
							value="<%=rs.getString("product_name")%>" name="productname"></td>
					</tr>
					<tr>
						<th>Product Price</th>
						<td><input type="text"
							value="<%=rs.getString("product_price")%>" name="productprice"></td>
					</tr>
					<%
						PreparedStatement pst2=con.prepareStatement("select city_name from city where city_id='"+rs.getString("city_id")+"'");
						ResultSet rs2=pst2.executeQuery();
						ResultSet rs1 = select.select_city();
					%>
					<tr>
						<th>City Speciality</th>
						<td><select name="city">
								<%while(rs2.next())
								{
									%>
									<option><%=rs2.getString("city_name") %></option>
									<%
								}
									while (rs1.next()) {
								%>
								<option><%=rs1.getString("city_name")%></option>
								<%
									}
								%>
						</select></td>
					</tr>
					<tr>
						<th>Product Quantity</th>
						<td><input type="text"
							value="<%=rs.getString("product_quantity")%>"
							name="productquantity"></td>
					</tr>
					<tr>
						<th>Weight</th>
						<td><input type="text" value="<%=rs.getString("weight")%>"
							name="weight"></td>
					</tr>
					<%
						}
					%>
					<tr>
						<td colspan="2"><input type="submit" value="Update"></td>
					</tr>
				</table>
			</form>
		</fieldset>
	</center>
</body>
</html>
