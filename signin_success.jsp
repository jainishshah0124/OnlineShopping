<%@page import="java.awt.Window"%>
<%@page import="Selection.select"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="java.sql.*" import="Conn.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="#FFD54F">
	<table align="center" background="images/bgnoise_lg.jpg">
		<tr>
			<td width="10%" rowspan="2"><img src="Upload/LeelamrutLogo.png"
				onclick="window.open('index.jsp','_top')"></td>
			<th><a href="index.jsp"
				onclick="window.open('index.jsp','_top')" shape="rect">HOME</a></th>
			<th><a href="aboutus.jsp">ABOUT US</a></th>
			<th><a href="contactus.jsp">CONTACT US</a></th>
			<th><a href="signin.jsp">LOG-IN</a></th>
			<th><a href="registration.jsp">REGISTRATION</a></th>
		</tr>
	</table>
	<%
		Connection con;
		con = getConn.getConnection();
		PreparedStatement pst, pst1;
		ResultSet rs, rs1;
		String us = request.getParameter("user");
		String ps = request.getParameter("pass");
		try {
			rs=select.select_user();
			while(rs.next())
			{
				String flag;
				if(rs.getString("username").equals(us))
				{
					flag="1";
				}
				else
				{flag="0";}
				if(flag.equals("0"))
				{
					request.getSession().setAttribute("error","Invalid Username And Password");
					%>
					<script type="text/javascript">
					window.open("signin.jsp","_top");
					</script>
					<%
				}
			}
			rs = select.select_user();
			String a;
	%>
	<%
		while (rs.next()) {
				if (rs.getString("username").equals(us)) {
					pst1 = con
							.prepareStatement("select AES_DECRYPT(password,'key') as password from user where username='"
									+ rs.getString("username") + "'");
					rs1 = pst1.executeQuery();
					while (rs1.next()) {
						if (rs1.getString("password").equals(ps)) {
							a = rs.getString("rolename");
							if (a.equals("Admin")) {
								Exam.setusername(us);
								request.getSession().setAttribute("us",us);
								response.sendRedirect("adminhomepage.jsp");
							} else if (a.equals("User")) {
								Exam.setusername(us);
								request.getSession().setAttribute("us",us);
								response.sendRedirect("userhomepage.jsp");
							}
						} else {
							request.getSession().setAttribute("error","Invalid Username And Password");
							%>
							<script type="text/javascript">
							window.open("signin.jsp","_top");
							</script>
							<%
	}
					}
				}
				else
				{
					request.getSession().setAttribute("error","Invalid Username And Password");
					%>
					<script type="text/javascript">
					window.open("signin.jsp","_top");
					</script>
					<%
					}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
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