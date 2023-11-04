<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>leelamrut</title>
<style type="text/css">
li{
	padding-right:110px;
}
</style>

<link rel="shortcut icon" href="Upload/LeelamrutLogo.png"/>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" media="all" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" media="all" />
</head>
<body  background="images/bgnoise_lg.jpg">
<!--<table align="center">
			<tr>
				<td width="10%" rowspan="2"><img src="Upload/LeelamrutLogo.png"
					onclick="window.open('adminhomepage.jsp','_top')"></td>
				<th><a href="adminhomepage.jsp" shape="rect">HOME</a></th>
				<th><a href="aboutus.jsp">ABOUT US</a></th>
				<th><a href="contactus.jsp">CONTACT US</a></th>
				<th>HI <%//request.getSession().getAttribute("us")%></th>
				<th><a href="logout.jsp">Logout</a></th>
			</tr>
		</table>-->
		
		<ul class="nav nav-pills">
		<li><img src="Upload/LeelamrutLogo.png"
					onclick="window.open('adminhomepage.jsp','_top')"></li>
  		<li role="presentation"  class="active" style="padding-top:50px;"><a href="adminhomepage.jsp">Home</a></li>
  		<li role="presentation" class="active" style="padding-top:50px;"><a href="aboutus.jsp">About Us</a></li>
  		<li role="presentation" class="active" style="padding-top:50px;"><a href="contactus.jsp">Contact Us</a></li>
  		<li role="presentation" style="padding-top:50px;"><label class="month">HI <%=request.getSession().getAttribute("us")%></label></li>
  		<li role="presentation" class="active" style="padding-top:50px;"><a href="logout.jsp">Logout</a></li>
		</ul>
</body>
</html>