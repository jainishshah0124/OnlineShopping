<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Conn.getConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);

if(session.getAttribute("us")==null)
    response.sendRedirect("index.jsp");
	
request.getRequestDispatcher("head_user.jsp").include(request,response);
%>
<br/><br/>
<%
	Connection con=getConn.getConnection();
	String uid=null;
	PreparedStatement pst=con.prepareStatement("select user_id from register where username='"+request.getSession().getAttribute("us")+"'");
	ResultSet rs=pst.executeQuery();
	while(rs.next())
	{
		uid=rs.getString("user_id");
	}
	pst=con.prepareStatement("select * from orders where user_id='"+uid+"'");
	rs=pst.executeQuery();
	while(rs.next())
	{
		int amount=0;
		int pprice=0;
		PreparedStatement pst2=con.prepareStatement("select * from products where product_id='"+rs.getString("product_id")+"'");
		ResultSet rs2=pst2.executeQuery();
		while(rs2.next())
		{
			pprice=rs2.getInt("product_price");
		}
		amount=pprice*rs.getInt("product_quantity");
		%>
		<table border="0" align="center" rules="rows" width="80%" class="table">
		<tr>
		<%
		PreparedStatement pst1=con.prepareStatement("select * from product_image where product_id='"+rs.getString("product_id")+"'");
		ResultSet rs1=pst1.executeQuery();
		while(rs1.next())
		{
			%>
			<td align="center"><a href="product_details.jsp?id=<%=rs1.getString("product_id")%>"><img src="<%=rs1.getString("image_url")%>" width="150" height="150"></a></td>
			<%
		}
		pst1=con.prepareStatement("select * from products where product_id='"+rs.getString("product_id")+"'");
		rs1=pst1.executeQuery();
		while(rs1.next())
		{
			%><td width="20%"><b><%=rs1.getString("product_name")%><br/><%
		}
		%>
			<br/>QTY :- <%=rs.getString("product_quantity")%></b>
		</td>
		<td width="20%"><b>
			<%=rs.getString("name")%><br/>
			<%=rs.getString("address")%>
			</b>
		</td>
		<td>
			<%
				if(rs.getString("approval").equals("0"))
				{
					%>
					Order Yet To Approve<br/>
					<%
				}
				else
				{
					%>
					Order Approved<br/>
					<%
				}
				if(rs.getString("order_confirmed").equals("0"))
				{
					%>
					<br/>Order Yet To be Delivered<br/>
					<%
				}
				else
				{
					%>
					<br/>Order Delivered<br/>
					<br><blink >Generate Invoice</blink><br/>
					<%
				}
			%>
		</td>
		</tr>
		</table>
		<br/><br/>
		<%
	}
%>
</body>
</html>