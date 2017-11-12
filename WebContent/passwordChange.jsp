<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reset Password</title>
</head>
<body>
	<form name="form" action="passwordChangeServlet" method="post">
		<input type="text" name="email" size="25" placeholder="Enter your email" class="user-info" id="user-email"/>
		<br/>
		<input type="submit" value="Submit" class="btn btn-primary btn-lg submit-button"></input>
	</form>
</body>
</html>