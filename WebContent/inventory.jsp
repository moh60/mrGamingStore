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
<link rel="stylesheet" type="text/css" href="css/searchResult.css">
<title>Inventory</title>
</head>
<body>
<%List gamesList = (List)request.getAttribute("games");%>
 <div class="game-result-wrapper">
 <table>
    <% for(int i=0; i<gamesList.size(); i++){%>
	    <tr class="game-result">
		    <% SearchInfo gameInfo = (SearchInfo)gamesList.get(i); %>
			<td class="game-title"><a href="GameServlet?game_id=<%=gameInfo.getGameID()%>" class="game-title-link"><%out.print(gameInfo.getGameName().toUpperCase()); %></a></td>
			<td class="game-quantity"><%out.print(gameInfo.getGameQuantity()); %></td>
	      </tr> 
      <%}%>
    </table>
 </div>
</body>
</html>