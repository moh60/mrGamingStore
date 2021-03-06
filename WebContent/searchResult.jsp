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
<title>Games Result</title>
</head>
<body>
<%List gamesList = (List)request.getAttribute("games");%>
 <div class="game-result-wrapper">
    <% for(int i=0; i<gamesList.size(); i++){%>
	    <div class="game-result">
		    <% SearchInfo gameInfo = (SearchInfo)gamesList.get(i); %>
		    <div class="game-cover"><img src="<%=gameInfo.getGameFrontBoxArt()%>" class="front-box-art" height="102" width="102" alt="gameCover"></div>		    
			<span class="game-release"><%out.print(gameInfo.getGameReleaseDate().substring(0, gameInfo.getGameReleaseDate().indexOf("-"))); %></span>
			<h3 class="game-title"><a href="GameServlet?game_id=<%=gameInfo.getGameID()%>" class="game-title-link"><%out.print(gameInfo.getGameName().toUpperCase()); %></a></h3>
			<p class="game-description" maxlength="100"><%out.print(gameInfo.getGameDescription()); %></p>
	      </div> 
      <%}%>
 </div>
</body>
</html>