<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="java.sql.*" import="Conn.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
		Connection con;
		con = getConn.getConnection();
		String str = request.getParameter("city");
		Statement stat;
		String strin = request.getParameter("productprice");
		int pp = Integer.parseInt(strin);
		PreparedStatement pst;
		String pn=request.getParameter("productname");
		String pq=request.getParameter("productquantity");
		String w=request.getParameter("weight");
		ResultSet rs;
		try {
			pst = con
					.prepareStatement("select city_id from city where city_name='"
							+ str + "'");
			rs = pst.executeQuery();
			while (rs.next()) {
	%>
	<%=str = rs.getString("city_id")%>
	<%
		}
			stat = con.createStatement();
			stat.executeUpdate("insert into products(product_name,product_price,city_id,product_quantity,weight) values('"+pn+"','"+pp+"','"+str+"','"+pq+"','"+w+"')");
			response.sendRedirect("add_product.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error");
		}
	%>
</body>
</html>