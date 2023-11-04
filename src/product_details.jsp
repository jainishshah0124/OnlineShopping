<%@page import="Conn.Exam"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Selection.select"%>
<%@page import="Conn.getConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product</title>
<script>
function error()
{
	if (document.myform.uname.value == null
			|| document.myform.fname.value == '') {
		alert("Enter User Name");
		document.myform.fname.focus();
		return false;
	}
}
</script>
</head>
<body background="images/bgnoise_lg.jpg">
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
				<%
					if(request.getSession().getAttribute("us")!=null)
					{
						
					}
					else
					{
						%>
							<th><a href="registration.jsp">REGISTRATION</a></th>	
						<%
					}
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
<%
  
		String pid = request.getParameter("id");
		String ppath = null;
		String pname = null;
		String pprice = null;
		String pweight = null;
		Connection con = getConn.getConnection();
		PreparedStatement pst = con
				.prepareStatement("select * from product_image where product_id='"
						+ pid + "'");
		ResultSet rs = pst.executeQuery();
		while (rs.next()) {
			ppath = rs.getString("image_url");
		}
		pst = con
				.prepareStatement("select * from products where product_id='"
						+ pid + "'");
		rs = pst.executeQuery();
		while (rs.next()) {
			pname = rs.getString("product_name");
			pprice = rs.getString("product_price");
			pweight = rs.getString("weight");
		}
	%>
	<table width="50%" align="center">
		<tr>
			<td><a href="#"><img src="<%=ppath%>" width="300" height="300" border="3"></a></td>
			<th>Name :- <%=pname%><br /> Price :- <%=pprice%><br /> Weight
				:- <%=pweight%> g<br /><br/>
				<a href="orderproductsuccess.jsp?id=<%=pid%>"><img src="Upload/buy-now.png" width="230" height="130"></a>
			</th>
		</tr>
	</table>
	<fieldset>
	<legend align="top">Review</legend>
	<form name="myform" action="feedback_product.jsp?id=<%=pid%>" method="post" onsubmit="return error()">
	<center>Give Review :-<br/>
	<%
		if(request.getSession().getAttribute("us")==null)
		{
			%>
			<input type="text" name="uname" placeholder="Username"><br/><br/>
			<%
		}
		else{
	%>
					<input type="text" name="uname" value="<%=request.getSession().getAttribute("us")%>" readonly="readonly"><%}%><br/><br/>
					<textarea rows="10" cols="30" name="description"></textarea><br/><br/>
					<input type="submit" value="SUBMIT"></center>
	<table width="60%" align="center">
	<%
		String uname=null;
		int i=1;
		pst=con.prepareStatement("select * from feedback_product where product_id='"+pid+"'");
		rs=pst.executeQuery();
		while(rs.next())
		{
			PreparedStatement pst1=con.prepareStatement("select username from register where user_id='"+rs.getString("user_id")+"'");
			ResultSet rs1=pst1.executeQuery();
			while(rs1.next())
			{
				uname=rs1.getString("username");
			}
	%>
		<tr>
			<td>
				<fieldset>
				Username :- <%=uname%><br/>
				Time :- <%=rs.getString("date")%><br/>
				Comment :- <%=rs.getString("description")%><br/>
				</fieldset>
			</td>
		</tr>
	<%} %>
	</table>
	</form>
	</fieldset>
</body>
</html>