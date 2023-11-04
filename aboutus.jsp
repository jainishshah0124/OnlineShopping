<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>About Us</title>
</head>
<body bgcolor="#FCCB0F">
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
<table align="center">
<tr>
<td bgcolor="#FCCB0F"><img alt="" src="Upload/combo430.jpg" width="400"></td>
<td bgcolor="#FCCB0F">All die-hard food lovers, are you tired of waiting for your relatives and friends to bring that 
well-known food item of their city to you? Well then, those times have lived out their fame. Leelamrut, an initiative by Narayankrupa Universal; a well-established group of companies engaged in multifaceted business verticals; now offers you all those sweet, spicy, delicious and mouthwatering food items from around all the cities at one junction. We offer you specialty beyond choice by bringing the choicest food items of each city of Gujarat on one menu. Want famous Chatni of Rajkot, come to Leelamrut; want tasteful Nankhatai of Vapi, come to Leelamrut; in short everything from everywhere at one destination for you</td>
<td><img alt="" src="Upload/About Us.png" width="100" onclick=""></td>
</tr>
<tr>
<td>The inspiration behind the birth of Leelamrut is in lacking penetration of local-food-culture. You could find Italian Pizza or French Fries or Chinese Noodles even in distant corners of the city. But what about those dishes that have been at the heart of Gujarat and Gujaratis? There are hardly any stops where you could find them all piled together. This is the very sentiment that led us to establish Leelamrut.</td>
<td colspan="3" align="center" rowspan="3"><img alt="" src="Upload/about-us-banner.jpg" width="900" height="300"></td>
</tr>
<tr>
<td colspan="1"><p>Each variety of food is required to be tended with different approach and technique to keep them fresh and tasteful. Dealing particularly in specialty food, at Leelamrut we take extreme measures for cleanliness and safety of food. From storage to packaging each element has been customized and specially taken care of.</p></td>
</tr>
</table>
<table align="right" width="100%">
		<% Date date=new Date(); %>
		<tr>
		<th align="right"><%=date %></th>
		</tr>
	</table>
</body>
</html>