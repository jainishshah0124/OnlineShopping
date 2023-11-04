<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Contact Us</title>
<script>

function ismob(keyCode) {
	return ((keyCode >= 48 && keyCode <= 57) || keyCode == 8)
}
function error()
{
	if(document.myform.name.value==null || document.myform.name.value=="")
	{
		alert("Enter name");
		document.myform.name.value.focus;
		return false;
	}
	else if(document.myform.email.value==null || document.myform.email.value=="")
	{
		alert("Enter email");
		document.myform.email.value.focus;
		return false;
	}
	else if(document.myform.phone.value==null || document.myform.phone.value=="")
	{
		alert("Enter Phone");
		document.myform.phone.value.focus;
		return false;
	}
	if(document.myform.address.value==null || document.myform.address.value=="")
	{
		alert("Enter address");
		document.myform.address.value.focus;
		return false;
	}
	if(document.myform.message.value==null || document.myform.message.value=="")
	{
		alert("Enter Message");
		document.myform.name.value.focus;
		return false;
	}
}
</script>
</head>
<body  background="images/bgnoise_lg.jpg">
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
				<th><a href="registration.jsp">REGISTRATION</a></th>
				<%
					if(request.getSession().getAttribute("us")!=null)
					{
						%>
						<th><a href="logout.jsp">Logout</a></th>
						<%
					}
				%>
			</tr>
		</table>
<form action="contactus_success.jsp" method="post" onsubmit="return error()" name="myform">
	
	<table align="center">
	<tr>
		<td colspan="5"><img alt="" src="Upload/contact-us_2.jpg" width="1300" height="300"></td>
	</tr>
	<tr>
	<td align="center">
	<img alt="" src="Upload\contct.png" width="150">
	</td>
	<td align="center">
	<table align="center">
	<tr>
	<th>Contact Us</th>
	</tr><tr><td></td></tr>
	<tr>
	<td>Shop No.9, Balaji Avenue,</td>
	</tr>
	<tr><td>Opp. Sunrise Mall,</td></tr>
	<tr>
	<td> Nr. Mansi Circle, Vastrapur,</td>
	</tr>
	<tr><td> Ahmedabad-15, Gujarat.</td></tr>
	</table>
	</td>
	<td>
	<table align="center">
	<tr><th colspan="3">Feel Free For Inquiry</th></tr>
	<tr>
	<th>Name</th>
	<th><input type="text" name="name"></th>
	<td rowspan="6" align="center"><input type="submit" name="submit" value="submit"></td>
	</tr>
	<tr>
	<th>Email</th>
	<th><input type="email" name="email"></th>
	</tr>
	<tr>
	<th>Phone</th>
	<th><input type="text" name="phone" maxlength="10" onkeyup="keyUP(event.keyCode);"
							onkeydown="return ismob(event.keyCode);" onpaste="return false;"></th>
	</tr>
	<tr>
	<th>Address</th>
	<th><textarea rows="2" cols="21" name="address"></textarea></th>
	</tr>
	<tr>
	<th>Message</th>
	<th><input type="text" name="message"></th>
	</tr>
	<%
		if(request.getSession().getAttribute("contact_us_phone")!=null)
		{
			%>
	<tr>
	<th colspan="2"><font color="red"><%=request.getSession().getAttribute("contact_us_phone")%></font></th>
	</tr>
			<%	
			request.getSession().setAttribute("contact_us_phone", null);
		}
	%>
	</table>
	</td>
	</tr>
	</table>
	</form>
	<table width="100%" align="right">
		<% Date date=new Date(); %>
		<tr>
		<th align="right"><%=date %></th>
		</tr>
		</table>
</body>
</html>