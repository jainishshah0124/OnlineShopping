<%@page import="Selection.select"%>
<%@page import="Conn.getConn"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="java.sql.*" pageEncoding="ISO-8859-1" import="Conn.getConn.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
</head>
<body bgcolor="#FFD54F">
	<table align="center" bgcolor="#FFD54F">
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
		if(request.getParameter("mobile").length()<10)
		{
			String a="Please Enter valid Number";
			request.getSession().setAttribute("registration_error", a);
			response.sendRedirect("registration.jsp");
		}
		else if(request.getParameter("pin").length()<4)
		{
			String a="Please Enter Valid Pin";
			request.getSession().setAttribute("registration_error", a);
			response.sendRedirect("registration.jsp");
		}
		else
		{
		Connection con;
		con = getConn.getConnection();
		PreparedStatement pst;
		ResultSet rs, rs1;
		Statement stat;
		String idstate, idcity, role;
		idstate = null;
		idcity = null;
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String address = request.getParameter("address");
		String mobile = request.getParameter("mobile");
		String dob = request.getParameter("dob");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String pin = request.getParameter("pin");
		pin="38"+pin;
		String fav_food = request.getParameter("fav_food");
		String fav_sports = request.getParameter("fav_sports");
		try {
			rs1 = select.select_register();
			while (rs1.next()) {
				if (rs1.getString("username").equals(username)) {
	%>
	<script type="text/javascript">
		alert("Username Already Registered");
		window.open("registration.jsp", "_self");
	</script>
	<%
		}
				else if(rs1.getString("e_mail").equals(email))
				{
					%>
					<script type="text/javascript">
						alert("EmailID Already Registered");
						window.open("registration.jsp", "_self");
					</script>
					<%					
				}
			}
			pst = con
					.prepareStatement("select state_id from state where state_name='"
							+ request.getParameter("state_name") + "'");
			rs = pst.executeQuery();
			while (rs.next()) {
	%>
	<%
		idstate = rs.getString("state_id");
	%>
	<%
		}

			pst = con
					.prepareStatement("select city_id from city where city_name='"
							+ request.getParameter("city_name") + "'");
			rs = pst.executeQuery();
			while (rs.next()) {
	%>
	<%
		idcity = rs.getString("city_id");
	%>
	<%
		}
			stat = con.createStatement();
			stat.executeUpdate("insert into register(first_name,last_name,address,country_name,state_id,mobile_no,birth_date,e_mail,gender,username,role_id,password) values('"
					+ fname
					+ "','"
					+ lname
					+ "','"
					+ address
					+ "','India','"
					+ idstate
					+ "','"
					+ mobile
					+ "','"
					+ dob
					+ "','"
					+ email
					+ "','"
					+ gender
					+ "','"
					+ username
					+ "','2','"
					+ password
					+ "')");
			String uid = null;
			pst = con
					.prepareStatement("select user_id from register where username='"
							+ username + "'");
			rs = pst.executeQuery();
			while (rs.next()) {
				uid = rs.getString("user_id");
			}
			stat = con.createStatement();
			stat.executeUpdate("update register set password=AES_ENCRYPT('"
					+ password + "','key') where user_id='" + uid + "'");
			stat = con.createStatement();
			stat.executeUpdate("insert into user(username,password,rolename) values('"
					+ username + "','" + password + "','User')");
			stat = con.createStatement();
			stat.executeUpdate("update user set password=AES_ENCRYPT('"
					+ password + "','key') where username='" + username
					+ "'");
			stat=con.createStatement();
			stat.executeUpdate("insert into adresses(user_id,address,pin) values('"+uid+"','"+address+"','"+pin+"')");
	%>
	<script type="text/javascript">
		alert("Regisered Successfully");
		window.open("signin.jsp", "_self");
	</script>
	<%
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		}
	%>
</body>
</html>