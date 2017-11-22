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
<link rel="stylesheet" type="text/css" href="css/orderHistory.css">
<title>Order Games</title>
</head>
<body>
<%List gameList = (List)request.getAttribute("games");%>
 <div class="order-result-wrapper">
 <table>
    <% for(int i=0; i<gameList.size(); i++){%>
	    <tr class="order-result">
		    <% SearchInfo gameInfo = (SearchInfo)gameList.get(i); %>
			<td class="game-title"><%out.print(gameInfo.getGameName()); %></td>
		</tr> 
    <%}%>
    </table>
 </div>
</body>
</html>