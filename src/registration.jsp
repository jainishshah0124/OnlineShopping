<%@page import="Selection.select"%>
<%@page import="Conn.getConn"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="java.sql.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<noscript>
	<div
		style="position: fixed; top: 0px; left: 0px; z-index: 3000; height: 100%; width: 100%; background-color: #FFFFFF">
		<p style="margin-left: 10px">JavaScript is not enabled,please
			enable your javascript to surf our website.</p>
	</div>
</noscript>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7; IE=EmulateIE9">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>

<title>Registration</title>

<style>
     <%@ include file="css/style.css"%>
</style>
<style type="text/css">
</style>
 <link rel="stylesheet" type="text/css" href="reg_style.css" media="all" />
<link rel="stylesheet" type="text/css" href="js/bootstrap.min.js" media="all" /> 
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" media="all" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" media="all" />
    <link rel="stylesheet" type="text/css" href="reg_demo.css" media="all" />

<script type="text/javascript">
    function isAlpha(keyCode) {
        return ((keyCode >= 65 && keyCode <= 90) || keyCode == 8 || keyCode == 32 || keyCode == 9)
    }
    function ismob(keyCode) {
        return ((keyCode >= 48 && keyCode <= 57) || keyCode == 9 || keyCode == 8)
    }
    function error() {
        if (document.myform.fname.value == null
				|| document.myform.fname.value == '') {
            alert("Enter First Name");
            document.myform.fname.focus();
            return false;
        } else if (document.myform.lname.value == null
				|| document.myform.lname.value == '') {
            alert("Enter Last Name");
            document.myform.lname.focus();
            return false;
        } else if (document.myform.address.value == null
				|| document.myform.address.value == '') {
            alert("Enter address");
            document.myform.address.focus();
            return false;
        } else if (document.myform.state_name.value == "-1") {
            alert("Select State");
            document.myform.state_name.focus();
            return false;
        } else if (document.myform.city_name.value == "-1") {
            alert("Select City");
            document.myform.city_name.focus();
            return false;
        } else if (document.myform.mobile.value == null
				|| document.myform.mobile.value == '') {
            alert("Enter Mobile");
            document.myform.mobile.focus();
            return false;
        } else if (document.myform.dob.value == null
				|| document.myform.dob.value == '') {
            alert("Enter Date Of Birth");
            document.myform.dob.focus();
            return false;
        } else if (document.myform.username.value == null
				|| document.myform.username.value == '') {
            alert("Enter Username");
            document.myform.username.focus();
            return false;
        } else if (document.myform.password.value == null
				|| document.myform.password.value == '') {
            alert("Enter Password");
            document.myform.password.focus();
            return false;
        } else if (document.myform.cpassword.value != document.myform.password.value) {
            alert("Password Doesn't Match");
            document.myform.cpassword.focus();
            return false;
        }
    }
</script>
</head>
<body>
<div id="container">
				<!-- <center><font size="8">Registration</font></center>-->
				<h1>Registration</h1>      
	<div id="form">
	<form name="myform" action="registration_success.jsp" method="post"
		onsubmit="return error()" id="contactform">
		<center>
			<fieldset>
					<%
						if(request.getSession().getAttribute("registration_error")!=null)
						{
							%>
							<p class="contact"><label for="name">Name</label></p> <u><font color="red"><%=request.getSession().getAttribute("registration_error")%><%request.getSession().setAttribute("registration_error",null);%></font></u>
							<%
						}
					%>
					<table>
					<tr height="50"><td><p class="contact"><label for="name">First Name :-</label></p></td>
						<td><input type="text" class="form-control" name="fname"
							onkeyup="keyUP(event.keyCode);"
							onkeydown="return isAlpha(event.keyCode);"
							onpaste="return false;"></td></tr>
					
					<tr height="50"><td><p class="contact"><label for="name">Last Name :-</label></p></td>
						<td><input type="text" class="form-control" name="lname"
							onkeyup="keyUP(event.keyCode);"
							onkeydown="return isAlpha(event.keyCode);"
							onpaste="return false;"></td></tr>
					<tr height="50"><td><p class="contact"><label for="name">Address :-</label></p></td> 
						
						<td><textarea class="form-control" rows="5" cols="15" name="address"></textarea></td></tr>
					
					<tr height="50"><td><p class="contact"><label for="name">PIN :-</label></p></td> 
						
						<td><div class="input-group"><span class="input-group-addon" id="basic-addon2">38</span><input type="text" class="form-control" name="pin" maxlength="4"
							onkeyup="keyUP(event.keyCode);"
							onkeydown="return ismob(event.keyCode);" onpaste="return false;"></div></td></tr>
					
					<tr height="50"><td><p class="contact"><label for="name">Country :-</label></p></td> 
						
						<!-- <td><label class="month">India</label></td></tr>-->
						<td><div class="input-group"><span class="input-group-addon" id="basic-addon2">India</span></div></td></tr>
					<tr height="50"><td><p class="contact"><label for="name">State Name :-</label></p></td> 
						<td><label class="month">						
						<%
							ResultSet rs = select.select_state();
						%>
						</label>
						<select class="form-control" name="state_name">
								<option class="form-control" value="-1">Select State</option>
								<%
									while (rs.next()) {
								%>
								<option class="form-control"><%=rs.getString("state_name")%></option>
								<%
									}
								%>
						</select></td></tr>
					
					<tr height="50"><td><p class="contact"><label for="name">Mobile Number :-</label></p></td> 
						
						<td><input type="text" class="form-control" name="mobile" maxlength="10"
							onkeyup="keyUP(event.keyCode);"
							onkeydown="return ismob(event.keyCode);" onpaste="return false;"></td></tr>
					
					<tr height="50"><td><p class="contact"><label for="name">Date Of Birth :-</label></p></td> 
						<td><input type="date" class="form-control" name="dob"></td></tr>
					
					<tr height="50"><td><p class="contact"><label for="name">Email-ID :-</label></p></td> 
						
						<td><div class="input-group"><input type="email" class="form-control" name="email"><span class="input-group-addon" id="basic-addon2">@example.com</span></div></td></tr>
					
					<tr height="50"><td><p class="contact"><label for="name">Gender :-</label></p></td> 
						
						<td><input type="radio" width="100%" name="gender" value="Male"
							checked="checked">Male <input type="radio" name="gender"
							value="Female">Female</td></tr>
					
					<tr height="50"><td><p class="contact"><label for="name">User Name :-</label></p></td> 
						
						<td><input type="text" class="form-control" name="username"></td></tr>
					
					<tr height="50"><td><p class="contact"><label for="name">Role :-</label></p></td> 
						
						<!-- <td><label class="month">User</label></td></tr>-->
						<td><div class="input-group"><span class="input-group-addon" id="basic-addon2">User</span></div></td></tr>
					
					<tr height="50"><td><p class="contact"><label for="name">Password :-</label></p></td> 
						
						<td><input type="password" class="form-control" name="password"></td></tr>
					
					<tr height="50"><td><p class="contact"><label for="name">Confirm Password :-</label></p></td> 
						
						<td><input type="password" class="form-control" name="cpassword"></td></tr>
					
						
						<tr height="50">
							<td><input type="button" value="Back" class="form-control" onclick="window.open('index.jsp','_top')"></td>
							<td><input type="submit" class="form-control" name="submit"
							value="Sign Up"></td>
							</tr>
					
					</table>
			</fieldset>
			</center>
	</form>
</div>
</div>
</body>
</html>