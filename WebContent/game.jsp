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
<link rel="stylesheet" type="text/css" href="css/detailedGame.css">
<title>Game</title>
</head>
<body>
<%List gamesList = (List)request.getAttribute("game");%>
<div class="main">
	<div class="game-wrapper">
	   <% for(int i=0; i<gamesList.size(); i++){%>
	   <div class="game-head">
	<% SearchInfo gameInfo = (SearchInfo)gamesList.get(i); %>
		<% if(request.getSession().getAttribute("userEmail") != null){  
			out.print("<button class='game-favourite'><a href='AddToFavouriteServlet?game_id=" + gameInfo.getGameID() +
					"&user_id=" + request.getSession().getAttribute("user_id") + 
					"'class='game-favourite-link'>Add to favourites</a></button>");
			out.print("<button class='game-cart'><a href='AddToCartServlet?game_id=" + gameInfo.getGameID() +
					"&user_id=" + request.getSession().getAttribute("user_id") + 
					"'class='cart-link'>Add to Cart</a></button>");
			}
		%>
		<% 
		// edit game button
		try{
			if(request.getSession().getAttribute("Role").equals("admin")){
				out.print("<button class='edit-game'><a href='loadGameServlet?game_id=" + gameInfo.getGameID() + 
						"'class='game-favourite-link'>Edit Game</a></button>");
			}
		}
		catch(Exception e){
			
		}
		%>
		
	   	<div class="game-title"><%out.print(gameInfo.getGameName().toUpperCase()); %></div>
	    	<div class="game-cover-wrapper">
	    			<div class="game-cover"><img src="<%=gameInfo.getGameFrontBoxArt()%>" class="box-art" height="424" width="300" alt="gameFrontCover"></div>		    
					<div class="game-cover"><img src="<%=gameInfo.getGameBackBoxArt()%>" style="display: none;" class="box-art" height="424" width="300" alt="gameBackCover"></div>		    
	   		</div>
	  		<div class="game-info">
			<p class="game-description"><%out.print(gameInfo.getGameDescription()); %></p>
	  		<div class="game-vitals">
	  			<div>
	  				<span class="game-sub-info">Console: <%out.print(gameInfo.getGameConsole()); %></span><br/>
	  				<span class="game-sub-info">Players: <%out.print(gameInfo.getGameNumOfPlayers()); %></span><br/>
	  			    <span class="game-sub-info">Coop: <%out.print(gameInfo.getGameCoop()); %></span><br/>
	  			    <span class="game-sub-info">Release Date: <%out.print(gameInfo.getGameReleaseDate()); %></span><br/>
	  			    <span class="game-sub-info">Genre: <%out.print(gameInfo.getGameGenre()); %></span><br/>
	  			    <span class="game-sub-info">Developer: <%out.print(gameInfo.getGameDeveloper()); %></span>
	  			    <div class="logo"><img src="<%=gameInfo.getGameDeveloperLogo()%>" class="logo" height="78" width="auto" alt="developerLogo"></div><br/>		       			    	  			  
	  			    <span class="game-sub-info">Publisher: <%out.print(gameInfo.getGamePublisher()); %></span>
	  			    <div class="logo"><img src="<%=gameInfo.getGameLogo()%>" class="logo" height="78" width="auto" alt="logo"></div><br/>
	  			</div>
	  		</div>
	  		</div>
  		</div>		
	   <%}%>
	</div>
</div>
</body>
</html>