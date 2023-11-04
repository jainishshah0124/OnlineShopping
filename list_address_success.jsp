<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Conn.getConn"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		request.getRequestDispatcher("head_user.jsp").include(request,response);
		Connection con = getConn.getConnection();
		Statement stat;
		if (request.getParameter("id").equals("2")) {
			stat = con.createStatement();
			stat.executeUpdate("delete from adresses where address_id='"
					+ request.getParameter("addid") + "'");
			response.sendRedirect("list_address.jsp");
		} else if (request.getParameter("id").equals("1")) {
			PreparedStatement pst = con
					.prepareStatement("select * from adresses where address_id='"
							+ request.getParameter("addid") + "'");
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
	%>
	<br/>
	<br/>
	<form
		action="list_address_success_edit.jsp"
		method="get">
		<input type="hidden" name="id" value="<%=request.getParameter("addid")%>">
		<input type="text" name="address" value="<%=rs.getString("address")%>"><br />
		38<input type="text" name="pin" maxlength="4"><br /> <input type="submit"
			value="Edit">
	</form>
	<%
		}
		} else {
			String uid = null;
			PreparedStatement pst = con
					.prepareStatement("select user_id from register where username='"
							+ request.getSession().getAttribute("us") + "'");
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				uid = rs.getString("user_id");
			}
			String pin = 38 + request.getParameter("pin");
			String address = request.getParameter("address");
			stat = con.createStatement();
			stat.executeUpdate("insert into adresses(user_id,address,pin) value('"
					+ uid + "','" + address + "','" + pin + "')");
			response.sendRedirect("list_address.jsp");
		}
	%>
</body>
</html>