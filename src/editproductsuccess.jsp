<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Conn.getConn"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<script>
	function error()
	{
		alert("Success");
	}
</script>
</head>
<body onload="return error()">
	<%
		Connection con=getConn.getConnection();
		Statement stat=con.createStatement();
		String pid=request.getParameter("productid");
		String pname=request.getParameter("productname");
		String pprice=request.getParameter("productprice");
		String pquantity=request.getParameter("productquantity");
		String pcity=request.getParameter("city");
		String pweight=request.getParameter("weight");
		String cid=null;
		try
		{
		PreparedStatement pst=con.prepareStatement("select city_id from city where city_name='"+pcity+"'");
		ResultSet rs=pst.executeQuery();
		while(rs.next())
		{
			cid=rs.getString("city_id");
		}
		stat.executeUpdate("update products set product_name='"+pname+"',product_price='"+pprice+"',product_quantity='"+pquantity+"',city_id='"+cid+"',weight='"+pweight+"' where product_id='"+pid+"'");
		response.sendRedirect("add_product.jsp");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	%>
</body>
</html>