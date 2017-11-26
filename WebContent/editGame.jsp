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
<title>Edit Game</title>
</head>
<body>
<%List gameList = (List)request.getAttribute("games");%>
<div class="main-wrapper">
	<div class="text">Edit Game</div>
	   <% for(int i=0; i<gameList.size(); i++){%>
	   		<% SearchInfo gameInfo = (SearchInfo)gameList.get(i); %>
				<form name="form" action="UpdateGameServlet" method="post">
					<input type="hidden" name="game_id" value="<%= gameInfo.getGameID()%>" size="25" maxlength="20" placeholder="Game ID" class="user-info"  /><br/>
					<input type="text" name="game_name" value="<%= gameInfo.getGameName()%>" size="25" maxlength="20" placeholder="Game Name" class="user-info"  /><br/>
					<input type="text" name="game_description" value="<%= gameInfo.getGameDescription()%>" size="25" maxlength="20" placeholder="Game Description" class="user-info"  /><br/>
					<input type="text" name="console" value="<%= gameInfo.getGameConsole()%>" size="25" maxlength="20" placeholder="Console" class="user-info" /><br/>
					<input type="text" name="num_players" value="<%= gameInfo.getGameNumOfPlayers()%>" size="25" maxlength="20" placeholder="Number of Players" class="user-info"  /><br/>
					<input type="text" name="coop" value="<%= gameInfo.getGameCoop()%>" size="25" maxlength="20" placeholder="Coop" class="user-info"  /><br/>
				    <input type="text" name="genre" value="<%= gameInfo.getGameGenre()%>" size="25" maxlength="20" placeholder="Genre" class="user-info" /><br/>
					<input type="text" name="release_date" value="<%= gameInfo.getGameReleaseDate()%>" size="25" maxlength="20" placeholder="Release Date" class="user-info" /><br/>
					<input type="text" name="developer" value="<%= gameInfo.getGameDeveloper()%>" size="25" maxlength="20" placeholder="Developer" class="user-info" /><br/>	
					<input type="text" name="publisher" value="<%= gameInfo.getGamePublisher()%>" size="25" maxlength="20" placeholder="Publisher" class="user-info"  /><br/>
					<input type="text" name="front_box_art" value="<%= gameInfo.getGameFrontBoxArt()%>"size="25" maxlength="20" placeholder="Front box art" class="user-info"  /><br/>
					<input type="text" name="back_box_art" value="<%= gameInfo.getGameBackBoxArt()%>"size="25" maxlength="20" placeholder="Back box art" class="user-info"  /><br/>
					<input type="text" name="logo" value="<%= gameInfo.getGameLogo()%>" size="25" placeholder="Logo" class="user-info"  /><br/>
					<input type="text" name="developer_logo" value="<%= gameInfo.getGameDeveloperLogo()%>" size="25" placeholder="Developer Logo" class="user-info"  /><br/>
					<input type="text" name="price" value="<%= gameInfo.getGamePrice()%>" size="25" placeholder="Price" class="user-info"  /><br/>
					<input type="text" name="discount" value="<%= gameInfo.getGameDiscount()%>" size="25" placeholder="Discount" class="user-info"  /><br/>
					<input type="text" name="quantity" value="<%= gameInfo.getGameQuantity()%>" size="25" placeholder="Quantity" class="user-info"  /><br/>
					<!-- submit sign up form -->
					<input type="submit" name="submit" value="Submit" class="btn btn-primary btn-lg submit-button" id="submit-button" />						
				</form>
</div>		
<%}%>
</body>
</html>