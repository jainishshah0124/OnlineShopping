<%@page import="Conn.Exam"%>
<%@page import="java.sql.Statement"%>
<%@page import="Selection.select"%>
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
		Connection con;
		con = getConn.getConnection();
		PreparedStatement pst, pst1;
		ResultSet rs, rs1;
		String us = request.getSession().getAttribute("us").toString();
		String uid = null;
		String pid = null;
		String sid = null;
		String cid = null;
		String did = null;
		int pprice=0;
		int amount=0;
		try {
			pid = request.getParameter("id");
			PreparedStatement pst6=con.prepareStatement("select * from products where product_id='"+pid+"'");
			ResultSet rs6=pst6.executeQuery();
			while(rs6.next())
			{
				pprice=rs6.getInt("product_price");
			}
			int pquantity = Integer.parseInt(request.getParameter("orderquantity"));
			String oname = request.getParameter("ordername");
			String oaddress = request.getParameter("orderaddress");
			String ostate = request.getParameter("orderstate");
			String ocity = request.getParameter("ordercity");
			String omob = request.getParameter("ordermob");
			String oemail = request.getParameter("orderemail");
			String otype = request.getParameter("ordertype");
			pst1 = con
					.prepareStatement("select user_id from register where username='"
							+ us + "'");
			rs1 = pst1.executeQuery();
			while (rs1.next()) {
				uid = rs1.getString("user_id");
			}
			int dprice=0;
			pst6=con.prepareStatement("select * from delivery_type where deliverytype_id='"+did+"'");
			rs6=pst6.executeQuery();
			while(rs6.next())
			{
				dprice=rs6.getInt("amount");
			}
			amount=pprice*pquantity;
			amount=amount+dprice;
			pst1 = con
					.prepareStatement("select state_id from state where state_name='"
							+ ostate + "'");
			rs1 = pst1.executeQuery();
			while (rs1.next()) {
				sid = rs1.getString("state_id");
			}
			pst1 = con
					.prepareStatement("select city_id from city where city_name='"
							+ ocity + "'");
			rs1 = pst1.executeQuery();
			while (rs1.next()) {
				cid = rs1.getString("city_id");
			}
			pst1 = con
					.prepareStatement("select deliverytype_id from delivery_type where type='"
							+ otype + "'");
			rs1 = pst1.executeQuery();
			while (rs1.next()) {
				did = rs1.getString("deliverytype_id");
			}
			Statement stat = con.createStatement();
			stat.executeUpdate("insert into orders(user_id,product_id,product_quantity,name,address,state_id,city_id,mobile_no,e_mail,deliverytype_id,order_time,amount) values('"
					+ uid
					+ "','"
					+ pid
					+ "','"
					+ pquantity
					+ "','"
					+ oname
					+ "','"
					+ oaddress
					+ "','"
					+ sid
					+ "','"
					+ cid
					+ "','"
					+ omob
					+ "','"
					+ oemail
					+ "','"
					+ did
					+ "',now(),'"+amount+"')");
	%>
	<script type="text/javascript">
		window.open("userhomepage.jsp", "_top");
	</script>
	<%
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>