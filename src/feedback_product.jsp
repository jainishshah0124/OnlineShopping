<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
	if(request.getSession().getAttribute("us")==null)
	{
		request.getSession().setAttribute("error", "Please Login First");
		response.sendRedirect("signin.jsp");
	}
	else
	{
		try
	{
		Connection con=getConn.getConnection();
		String uid=null;
		PreparedStatement pst=con.prepareStatement("select user_id from register where username='"+request.getParameter("uname")+"'");
		ResultSet rs=pst.executeQuery();
		while(rs.next())
		{
			uid=rs.getString("user_id");
		}
		Statement stat=con.createStatement();
		stat.executeUpdate("insert into feedback_product(product_id,user_id,description,date) values('"+request.getParameter("id")+"','"+uid+"','"+request.getParameter("description")+"',now())");
		response.sendRedirect("userhomepage.jsp");
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	}
	%>
</body>
</html>