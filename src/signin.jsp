<%@page import="Selection.select"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="java.sql.*" import="Conn.*" pageEncoding="ISO-8859-1"%>
	<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="shortcut icon" href="Upload/LeelamrutLogo.png"/>
<title>Sign In</title>

<style>
     <%@ include file="style.css"%>
</style>
<script type="text/javascript">
function URL(dest) {

	goSection = dest.options[dest.selectedIndex].value;

	if (goSection) {

		top.location = goSection;

	}
</script>
</head>
<body onload="return URL();">
<br><br><br>
	<section class="container">
    <div class="login">
	<form action="signin_success.jsp" name="myform" method="post">
	<center>
		<table align="center">
			<tr>
			<th colspan="2"><img src="Upload/LeelamrutLogo.png"></th>
			</tr>
			<tr>
			<th colspan="2"><p><font size="4"><b>Sign In To Your Account</b></font></p><br/></th>
			</tr>
			<tr align="center">
				<td><p><input type="text" name="user" placeholder="Username"></p><br/></td>
			</tr>
			<tr align="center">
				<td><p><input type="password" name="pass" placeholder="Password"><br/><p></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><p class="submit"><input type="submit" name="Submit" value="Sign In" class="login login-submit"></p></td>
			</tr>
			<tr>
			<td colspan="2"></td>
			</tr>
		</table>
		</center>
	</form>
	</div>
	<div class="login-help">
	<a href="registration.jsp">Create A Account</a><br/>
	<a href="index.jsp">Home</a>
	</div>
	<%
		if(request.getSession().getAttribute("error")!=null)
		{
			%>
			<center>
	<font color="red" size="4"><%=request.getSession().getAttribute("error")%></font></center>	
			<%
			request.getSession().setAttribute("error", null);
		}
	%>
	</section>
	<table width="100%" align="right">
		<% Date date=new Date(); %>
		<tr>
		<th align="right"><%=date %></th>
		</tr>
		</table>
</body>
</html>