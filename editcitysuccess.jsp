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
		String cid, cname, sname;
		cid = request.getParameter("cityid");
		cname = request.getParameter("cityname");
		sname = request.getParameter("statename");
		String sid=null;
		Connection con=getConn.getConnection();
		PreparedStatement pst=con.prepareStatement("select state_id from state where state_name='"+sname+"'");
		ResultSet rs=pst.executeQuery();
		while(rs.next())
		{
			sid=rs.getString("state_id");
		}
		Statement stat=con.createStatement();
		stat.executeUpdate("update city set city_name='"+cname+"',state_id='"+sid+"' where city_id='"+cid+"'");
		response.sendRedirect("add_city.jsp");
	%>
</body>
</html>