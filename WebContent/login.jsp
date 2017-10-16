<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<script type="text/javascript" src="js/login.js"></script> 
<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
	<div class="login-wrapper">
		<form name="form" action="LoginServlet" method="post" onsubmit="return validate()">
			<input type="text" name="email" size="25" maxlength="40" placeholder="Email" class="user-info"  />
			<input type="password" name="password" size="25" maxlength="20" placeholder="Password" class="user-info" />
			<br/><input type="submit" value="Login" class="login-button"></input>
			<input type="reset" value="Reset" class="reset-button"></input>
		</form>
	</div>
</body>
</html>