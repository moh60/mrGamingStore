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
<title>Game</title>
</head>
<body>
<%List gamesList = (List)request.getAttribute("game");%>
 <div class="game-wrapper">
    <% for(int i=0; i<gamesList.size(); i++){%>
    <div class="game-head">
	<% SearchInfo gameInfo = (SearchInfo)gamesList.get(i); %>
    	<div class="game-title"><%out.print(gameInfo.getGameName().toUpperCase()); %></div>
	    	<div class="game-cover-wrapper">
	    			<div class="game-cover"><img src="<%=gameInfo.getGameFrontBoxArt()%>" class="box-art" height="102" width="102" alt="gameFrontCover"></div>		    
					<div class="game-cover"><img src="<%=gameInfo.getGameBackBoxArt()%>" class="box-art" height="102" width="102" alt="gameBackCover"></div>		    
    		</div>
   		<div class="game-info">
			<p class="game-description"><%out.print(gameInfo.getGameDescription()); %></p>
   		</div>
   		<div class="game-vitals">
   			<p>
   				<span class="game-players">Players: <%out.print(gameInfo.getGameNumOfPlayers()); %></span>
   			    <span class="game-coop">Coop: <%out.print(gameInfo.getGameCoop()); %></span>
   			    <span class="game-release">Release Date: <%out.print(gameInfo.getGameReleaseDate()); %></span>
   			    <span class="game-developer">Developer: <%out.print(gameInfo.getGameDeveloper()); %></span>
   			    <span class="game-developer-logo"><img src="<%=gameInfo.getGameDeveloperLogo()%>" class="logo" height="102" width="102" alt="developerLogo"></span>		    
				<span class="game-publisher">Publisher: <%out.print(gameInfo.getGamePublisher()); %></span>
				<span class="game-pubisher-logo"><img src="<%=gameInfo.getGameLogo()%>" class="logo" height="102" width="102" alt="publisherLogo"></span>		    
   			</p>
   		</div>
	</div> 
      <%}%>
 </div>
</body>
</html>