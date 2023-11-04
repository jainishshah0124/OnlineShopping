<%@page import="Conn.Exam"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<script type="text/javascript">
function URL(dest) {

	goSection = dest.options[dest.selectedIndex].value;

	if (goSection) {

		top.location = goSection;

	}
</script>
</head>
<body onload="return URL()">
	<%
		String a = null;
		Exam.setusername(a);
		request.getSession().invalidate();
		response.sendRedirect("index.jsp");
	%>
</body>
</html>