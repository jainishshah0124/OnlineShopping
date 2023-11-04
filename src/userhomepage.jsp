<%@page import="java.sql.PreparedStatement"%>
<%@page import="Conn.getConn"%>
<%@page import="java.sql.Connection"%>
<%@page import="Conn.Exam"%>
<%@page import="com.counter.counter"%>
<%@page import="Selection.select"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript">
function isAlpha(keyCode)
{
	return((keyCode >= 65 && keyCode <= 90) || keyCode == 8 || keyCode == 32)
}
function ismob(keyCode)
{
	return((keyCode >= 48 && keyCode <= 57) || keyCode == 8)
}
function URL(dest) {

	goSection = dest.options[dest.selectedIndex].value;

	if (goSection) {

		top.location = goSection;

	}
</script>
<noscript>
	<div
		style="position: fixed; top: 0px; left: 0px; z-index: 3000; height: 100%; width: 100%; background-color: #FFFFFF">
		<p style="margin-left: 10px">JavaScript is not enabled,please
			enable your javascript to surf our website.</p>
	</div>
</noscript>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Leelamrut</title>

<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" media="all" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" media="all" />
</head>
<body bgcolor="#FFD54F" onload="return URL();">
		<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);

  if(session.getAttribute("us")==null)
      {response.sendRedirect("index.jsp");}
  else
  {
	  try{
		  Connection con=getConn.getConnection();
		  PreparedStatement pst=con.prepareStatement("select * from user where username='"+request.getSession().getAttribute("us")+"'");
		  ResultSet rs=pst.executeQuery();
		  while(rs.next())
		  {
			  if(rs.getString("rolename").equals("Admin"))
			  {
				  response.sendRedirect("adminhomepage.jsp");
			  }
		  }
	  }
	  catch(Exception e)
	  {
		  e.printStackTrace();
	  }
  }

  %>
		<%
			request.getRequestDispatcher("head_user.jsp").include(request,response);
		%>
		
		<hr><br>
		<%
			ResultSet rs = select.select_products();
			String uid=null;
			int lo=0;
			Connection con=getConn.getConnection();
			PreparedStatement pst11=con.prepareStatement("select * from register where username='"+request.getSession().getAttribute("us")+"'");
			ResultSet rs11=pst11.executeQuery();
			while(rs11.next())
			{
				uid=rs11.getString("user_id");
			}
			PreparedStatement pstlo=con.prepareStatement("select * from orders where user_id='"+uid+"'");
			ResultSet rslo=pstlo.executeQuery();
			while(rslo.next())
			{
				lo++;
			}
		%>
		<ul class="nav nav-pills" role="tablist">
  		<li role="presentation" class="active" style="padding-left:330px"><a href="list_address.jsp"> List of Address</a></li>
  		<li role="presentation" class="active"><a href="usernameprofileedit.jsp">Update Profile</a></li>
  		<li role="presentation" class="active"><a href="listordersuser.jsp">List Of Orders<span class="badge"><%=lo%></span></a></li>
		</ul>
		<!-- <table>
			<tr>
				<td><input type="button" value="List Of Address" onclick="window.open('list_address.jsp','_top')"></td>
				<td><input type="button" value="Update Profile" onclick="window.open('usernameprofileedit.jsp','_top')"></td>
				<td><input type="button" value="List Of Orders" onclick="window.open('listordersuser.jsp','_top')"></td>
			</tr>
		</table> -->
		<br> <br> <br>
		<br> <br>
		<form action="product_details.jsp" method="post">
		<table align="center">
			<tr>
				<th style="padding-right:25px;">Product Name</th>
				<th>
					<select name="id" class="form-control">
						<%
							while(rs.next())
							{
						%>
							<option value="<%=rs.getString("product_id")%>"><%=rs.getString("Product_name")%></option>
						<%
							}
						%>
					</select>
				</th>
			</tr>
		</table>
		<%
			rs = select.select_city();
		%>
		<br>
		<table align="center">
			<tr>
				<td colspan="2"><input type="submit" name="submit" class="form-control"
					value="Search"></td>
			</tr>
		</table>
		<br/>
		<table align="center">
			<tr height="30">
				<%
					try {
						con = getConn.getConnection();
						rs = select.select_product_image();
						int i = 0;
						while (rs.next()) {
				%>
				<th><a
					href="product_details.jsp?id=<%=rs.getString("product_id")%>"><img border="3"
						src="<%=rs.getString("image_url")%>" width="200" height="200"></a>
					<%
						PreparedStatement pst = con
										.prepareStatement("select * from products where product_id='"
												+ rs.getString("product_id") + "'");
								ResultSet rs1 = pst.executeQuery();
								while (rs1.next()) {
					%><br><%=rs1.getString("product_name")%> <%
 	}
 %></th>
				<td>&nbsp &nbsp &nbsp &nbsp</td>
				<%
					i++;
							if (i == 4) {
				%>
			</tr>
			<tr height="300">
				<%
					i = 0;
							}
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>
			</tr>
		</table>
	</form>
</html>