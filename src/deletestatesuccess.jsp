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
<title>Insert title here</title>
</head>
<body>
	<%
		Connection con=getConn.getConnection();
		String state=request.getParameter("deletestatename");
		String sid=null;
		try
		{
		PreparedStatement pst=con.prepareStatement("select state_id from state where state_name='"+state+"'");
		ResultSet rs=pst.executeQuery();
		while(rs.next())
		{
			sid=rs.getString("state_id");
		}
		Statement stat;
		stat=con.createStatement();
		stat.executeUpdate("delete from city where state_id='"+sid+"'");
		stat=con.createStatement();
		stat.executeUpdate("delete from order_confirmed where state_id='"+sid+"'");
		stat=con.createStatement();
		stat.executeUpdate("delete from orders where state_id='"+sid+"'");
		stat=con.createStatement();
		stat.executeUpdate("delete from register where state_id='"+sid+"'");
		stat=con.createStatement();
		stat.executeUpdate("delete from state where state_id='"+sid+"'");
		response.sendRedirect("add_state.jsp");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	%>
</body>
</html>