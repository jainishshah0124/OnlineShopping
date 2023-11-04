<%@page import="javax.swing.text.Document"%>
<%@page import="Conn.Exam"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="Conn.getConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Profile</title>
<meta http-equiv="refresh" content="0;url=userhomepage.jsp">
</head>
<body bgcolor="#FFD54F">
	<table align="center" bgcolor="#FFD54F">
		<tr>
			<td width="10%" rowspan="2"><img src="Upload/LeelamrutLogo.png"
				onclick="window.open('userhomepage.jsp.jsp','_top')"></td>
			<th><a href="index.jsp"
				onclick="window.open('userhomepage.jsp','_top')" shape="rect">HOME</a></th>
			<th><a href="aboutus.jsp">ABOUT US</a></th>
			<th><a href="contactus.jsp">CONTACT US</a></th>
			<th colspan="2">HI <%=Exam.getusername()%></th>
			<th><a href="logout.jsp">LogOut</a></th>
		</tr>
	</table>
	<br>
	<br>
	<%
		Connection con = getConn.getConnection();
		String sname = null;
		String cname = null;
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String address = request.getParameter("address");
		String mobile_no = request.getParameter("mobile");
		String dob = request.getParameter("dob");
		String gender = request.getParameter("gender");
		Statement stat = con.createStatement();
		PreparedStatement pst = con
				.prepareStatement("select state_id from state where state_name='"
						+ request.getParameter("state_name") + "'");
		ResultSet rs = pst.executeQuery();
		while (rs.next()) {
			sname = rs.getString("state_id");
		}
		pst = con
				.prepareStatement("select city_id from city where city_name='"
						+ request.getParameter("city_name") + "'");
		rs = pst.executeQuery();
		while (rs.next()) {
			cname = rs.getString("city_id");
		}
		stat.executeUpdate("update register set first_name='" + first_name
				+ "',last_name='" + last_name + "',address='" + address
				+ "',state_id='" + sname + "',city_id='" + cname
				+ "',mobile_no='" + mobile_no + "',birth_date='" + dob
				+ "',gender='" + gender
				+ "' where username='" + request.getSession().getAttribute("us") + "'");
	%>
	<script type="text/javascript">
		alert("Updated Successfully");
	</script>
</body>
</html>