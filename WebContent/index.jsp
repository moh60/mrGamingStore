<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/index.css">
<title>mrGaming</title>
</head>
<body>
<div class="wrap">
	<div class="search">
		 <form class="search" action="SearchServlet" method="post" autocomplete="off">
		 	<input type="text" class="searchTerm" name="game_name" placeholder="Search Games...">
		 	<button type="submit" class="searchButton">
				<i class="glyphicon glyphicon-search"></i>
		 	</button>
		 <input type="hidden" name="function" value="Search">
		 </form>
	</div>
</div>
</body>
</html>