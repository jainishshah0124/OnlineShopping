<%@page import="Conn.getConn"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Selection.select"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order</title>
<script type="text/javascript">
function isAlpha(keyCode)
{
	return((keyCode >= 65 && keyCode <= 90) || keyCode == 8 || keyCode == 32)
}
function ismob(keyCode)
{
	return((keyCode >= 48 && keyCode <= 57) || keyCode == 8)
}
</script>
<style type="text/css">
tr{
	height:35px;
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
{
	response.sendRedirect("signin.jsp");
}
request.getRequestDispatcher("head_user.jsp").include(request,response);
%>
	<center>
		<fieldset style="width:60%">
			<legend>Order</legend>
			<%
				Connection con=getConn.getConnection();
				ResultSet rs = select.select_products();
			%>
			<form action="orderproductprocess.jsp?id=<%=request.getParameter("id")%>" method="post">
				<table align="center">
					<tr>
						<th>Product Name</th>
						<td><%
								PreparedStatement pst3=con.prepareStatement("select * from products where product_id='"+request.getParameter("id")+"'");
								ResultSet rs3=pst3.executeQuery();
								while(rs3.next())
								{
									%>
									<%=rs3.getString("product_name")%>
									<%
								}
							%>
							
						</td>
					</tr>
					<tr>
						<th>Product Quantity</th>
						<td><select name="orderquantity">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
						</select></td>
					</tr>
					<tr>
						<th>Name</th>
						<td><input type="text" name="ordername" onkeyup="keyUP(event.keyCode);" onkeydown="return isAlpha(event.keyCode);" onpaste="return false;"></td>
					</tr>
					
					<tr>
						<th>Address</th>
						<%
							String uid=null;
							PreparedStatement pst4=con.prepareStatement("select user_id from register where username='"+request.getSession().getAttribute("us")+"'");
							ResultSet rs4=pst4.executeQuery();
							while(rs4.next())
							{
								uid=rs4.getString("user_id");
							}
							pst4=con.prepareStatement("select * from adresses where user_id='"+uid+"'");
							rs4=pst4.executeQuery();
						%>
						<td>
							<select size="4" name="address" id="drop_address" onchange="document.getElementById('orderaddress').value=''+document.getElementById('drop_address').value;alert(''+document.getElementById('drop_address').value)">
								<%
									while(rs4.next())
									{
										%>
										<option value="<%=rs4.getString("address")%> <%=rs4.getString("pin")%>"><%=rs4.getString("address")%> <%=rs4.getString("pin")%></option>
										<%
									}
								%>
							</select><br/>
							<textarea rows="5" cols="15" name="orderaddress" readonly="readonly" id="orderaddress"></textarea>
						</td>
					</tr>
					<%
						rs = select.select_state();
					%>
					<tr>
						<th>State Name</th>
						<td><select name="orderstate">
								<%
									while (rs.next()) {
								%>
								<option><%=rs.getString("state_name")%></option>
								<%
									}
								%>
						</select></td>
					</tr>

					<%
						rs = select.select_city();
					%>
					<tr>
						<th>City Name</th>
						<td><select name="ordercity">
								<%
									while (rs.next()) {
								%>
								<option><%=rs.getString("city_name")%></option>
								<%
									}
								%>
						</select></td>
					</tr>

					<tr>
						<th>Mobile No</th>
						<td><input type="text" maxlength="10" name="ordermob"  onkeyup="keyUP(event.keyCode);" onkeydown="return ismob(event.keyCode);" onpaste="return false;"></td>
					</tr>

					<tr>
						<th>Email ID</th>
						<td><input type="email" name="orderemail"></td>
					</tr>
					<%
						rs = select.select_deliverytype();
					%>
					<tr>
					<th>DeliveryType</th>
					<td>
					<select name="ordertype">
					<%
					while(rs.next())
					{
						%>
						<option><%=rs.getString("type") %></option>
						<%
					}
					%>
					</select>
					</td>
					</tr>
					<tr>
						<th colspan="2"><input type="submit" value="Order"></th>
					</tr>
				</table>
			</form>
		</fieldset>
	</center>
</body>
</html>