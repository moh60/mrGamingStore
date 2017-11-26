<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="controller.SearchInfo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/defaultForm.css">
<title>Discount Admin</title>
</head>
<body>
<div class="main-wrapper">	
	<div class="text">Discount Value</div>
	<form name="form" action="UpdateDiscountValue" method="post">
		<input type="text" name="discount_value" value="" size="25" maxlength="20" placeholder="Discount Value" class="user-info" /><br/>
		<input type="submit" name="submit" value="Submit" class="btn btn-primary btn-lg submit-button" id="submit-button" />						
	</form>
</div>
<div class="main-wrapper">	
	<div class="text">Send Discount Mail</div>
	<form name="form" action="SendDiscountServlet" method="post">
		<input type="submit" name="submit" value="Send" class="btn btn-primary btn-lg submit-button" id="submit-button" />						
	</form>
 </div>
</body>
</html>