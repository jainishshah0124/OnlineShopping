<%@page import="Conn.getConn"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Selection.select"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Conn.Exam"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<noscript>
    <div style="position: fixed; top: 0px; left: 0px; z-index: 3000; 
                height: 100%; width: 100%; background-color: #FFFFFF">
        <p style="margin-left: 10px">JavaScript is not enabled,please enable your javascript to surf our website.</p>
    </div>
</noscript>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Homepage</title>

<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" media="all" />
<script>
function error()
{
	if(document.myform.add.value=="-1")
	{
		alert("Select From DropDownList")
		document.myform.add.focus;
		return false;
	}
	else if(document.myform.add.value=="city")
	{
		window.open("add_city.jsp","_self");
	}
	else if(document.myform.add.value=="state")
	{
		window.open("add_state.jsp","_self");
	}
	else if(document.myform.add.value=="product")
	{
		window.open("add_product.jsp","_self");
	}
	
}
</script>
<style type="text/css">
td{
	text-align:center;
}
</style>
</head>
<body bgcolor="#FFD54F">
	<form name="myform" method="post">
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
			  if(rs.getString("rolename").equals("User"))
			  {
				  response.sendRedirect("userhomepage.jsp");
			  }
		  }
	  }
	  catch(Exception e)
	  {
		  e.printStackTrace();
	  }
  }

 request.getRequestDispatcher("head.jsp").include(request,response);
%>
<br><br>
		<fieldset>
		<table width="100%" align="center">
			<tr>
				</td>
			</tr>
				<!-- <td><input type="button" value="List Of Orders" onclick="window.open('listorders.jsp','_self')"></td>
				<td><input type="button" value="Manage User" onclick="window.open('manage_user.jsp','_self')"></td>
				<td><input type="button" value="Invoice" onclick="window.open('invoice.jsp','_self')"></td>
				<td><input type="button" value="Order Payment Confirm" onclick="window.open('orderconfirm.jsp','_self')"></td> -->
				<%
					int IN=0;
					int LO=0;
					int MU=0;
					int OPC=0;
					Connection con=getConn.getConnection();
					PreparedStatement pst=con.prepareStatement("select * from orders where approval='0'");
					ResultSet rs=pst.executeQuery();
					while(rs.next())
					{
						LO++;
					}
					rs=select.select_user();
					while(rs.next())
					{
						MU++;
					}
					rs=select.select_invoice();
					while(rs.next())
					{
						IN++;
					}
					pst=con.prepareStatement("select * from orders where order_confirmed='0' && approval='1'");
					rs=pst.executeQuery();
					while(rs.next())
					{
						OPC++;
					}
				%>
				<ul class="nav nav-pills" role="tablist">
  			<li role="presentation" class="active" style="padding-left:80px"><a href="listorders.jsp">List of Orders<span class="badge"><%=LO%></span></a></li>
  		<li role="presentation" class="active"><a href="manage_user.jsp">Manage User<span class="badge"><%=MU%></span></a></li>
  		<li role="presentation" class="active"><a href="invoice.jsp">Invoice<span class="badge"><%=IN%></span></a></li>
  		<li role="presentation" class="active"><a href="orderconfirm.jsp">Order Payment Confirm<span class="badge"><%=OPC%></span></a></li>
  		<li role="presentation" class="active"><select name="add" class="form-control">
						<option value="-1">ADD</option>
						<option value="city">Add City</option>
						<option value="state">Add State</option>
						<option value="product">Add Product</option>
				</select><br> <br> <input type="button" onclick="return error()" class="form-control"
					value="Submit"></li>
		</ul>
		</table>
		</fieldset>
		<br><br>
		<table width="100%" align="center">
		<tr>
		<td><img alt="" src="Upload/admin.png" width="150" ></td>
		</tr>
		</table>
		<table width="100%" align="right">
		<% Date date=new Date(); %>
		<tr>
		<th align="right"><%=date %></th>
		</tr>
		</table>
	</form>
</body>
</html>