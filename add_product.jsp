<%@page import="Selection.select"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="java.sql.*" import="Conn.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Product</title>
<script>function isAlpha(keyCode)
{
	return((keyCode >= 65 && keyCode <= 90) || keyCode == 8 || keyCode == 32)
}
function ismob(keyCode)
{
	return((keyCode >= 48 && keyCode <= 57) || keyCode == 8)
}
	function error() {
		if (document.myform.productname.value == null
				|| document.myform.productname.value == "") {
			alert("Enter Product Name");
			document.myform.productname.focus;
			return false;
		} else if (document.myform.productprice.value == null
				|| document.myform.productprice.value == "") {
			alert("Enter Product Price");
			document.myform.productprice.focus;
			return false;
		}

		else if (document.myform.city.value == "-1") {
			alert("Select City");
			document.myfor.city.focus;
			return false;
		} else if (document.myform.productquantity.value == null
				|| document.myform.productquantity.value == "") {
			alert("Enter Product Quanaity");
			document.myform.productquantity.focus;
			return false;
		} else if (document.myform.weight.value == null
				|| document.myform.weight.value == "") {
			alert("Enter Product weight");
			document.myform.weight.focus;
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

	<%
		ResultSet rs = select.select_city();
	%>
	<form onsubmit="return error()" action="add_product_success.jsp"
		method="post">
		<center>
			<fieldset style="width: 70%;">
				<h2>Add Product</h2>
				<table align="center" width="60%">
					<tr>
						<th>Product Name</th>
						<th><input type="text" name="productname"  onkeyup="keyUP(event.keyCode);" onkeydown="return isAlpha(event.keyCode);" onpaste="return false;"></th>

					</tr>
					<tr>
						<th>Product Price</th>
						<th><input type="text" name="productprice"></th>
					</tr>
					<tr>
						<th>City Speciality</th>
						<th><select name="city">
								<option value="-1">Select City</option>
								<%
									while (rs.next()) {
								%>
								<option><%=rs.getString("city_name")%></option>
								<%
									}
								%>
						</select></th>
					</tr>
					<tr>
						<th>Product Quantity</th>
						<th><input type="text" name="productquantity"></th>
					</tr>
					<tr>
						<th>Weight</th>
						<th><input type="text" name="weight"></th>
					</tr>
					<tr>
						<td align="center" colspan="4"><input type="submit"
							value="Add Product"></td>
					</tr>


				</table>
	</form>
	<br>
	<form action="editproduct.jsp" method="post">
		<%
			rs = select.select_products();
		%>
		<table align="center" border="1">
			<tr>
				<th>Product ID</th>
				<th>Product Name</th>
				<th>Product Price</th>
				<th>City Name</th>
				<th>Product Quantity</th>
				<th>Weight</th>
				<th colspan="2" align="center">Update</th>
			</tr>
			<%
				try {
					while (rs.next()) {
			%>
			<tr>
				<td align="center"><%=rs.getString("product_id")%></td>
				<td align="center"><%=rs.getString("product_name")%></td>
				<td align="center"><%=rs.getString("product_price")%></td>
				<td align="center"><%=rs.getString("city_id")%></td>
				<td align="center"><%=rs.getString("product_quantity")%></td>
				<td align="center"><%=rs.getString("weight")%> g</td>
				<td><a href="editproduct.jsp?productID=<%=rs.getString("product_id")%>"><img src="Upload/edit.png" width="60" height="30"></a></td>
				<td><a href="deleteproductname.jsp?productID=<%=rs.getString("product_id")%>"><img src="Upload/del.png" width="30" height="30"></a></td>
			</tr>
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
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