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
<title>Cart</title>
</head>
<body>
<%List gamesList = (List)request.getAttribute("cart");%>
 <div class="game-result-wrapper">
    <% for(int i=0; i<gamesList.size(); i++){%>
	    <div class="game-result">
		    <% SearchInfo gameInfo = (SearchInfo)gamesList.get(i); %>
		    <div class="game-cover"><img src="<%=gameInfo.getGameFrontBoxArt()%>" class="front-box-art" height="102" width="102" alt="gameCover"></div>		    			
			<form name="form" action="SaveCartGameServlet" method="post">
				<h3 class="game-title"><a href="GameServlet?game_id=<%=gameInfo.getGameID()%>" class="game-title-link"><%out.print(gameInfo.getGameName().toUpperCase()); %></a></h3>				
				<input type="hidden" name="user_id" value="<%= request.getSession().getAttribute("user_id") %>" size="25" maxlength="20" />
				<input type="hidden" name="game_id" value="<%= gameInfo.getGameID()%>" size="25" maxlength="20" />
				<input type="text" name="game_quantity" value="<%= gameInfo.getGameQuantity() %>" size="5" maxlength="20" placeholder="Quantity" class="game-quantity" />
				<input type="hidden" class="game-price" name="game_price" value="<%= gameInfo.getGamePrice()%>"></input>
				<input type="text" class="game-sub-total" name="game_sub_total" value="<%= Integer.parseInt(gameInfo.getGamePrice()) * Double.parseDouble(gameInfo.getGameQuantity()) %>"></input>
				<button class="glyphicon glyphicon-save" id="save-cart-game"></button>	
				<%out.print("<button class='remove-game'><a href='RemoveCartServlet?game_id=" + gameInfo.getGameID() +
					"&user_id=" + request.getSession().getAttribute("user_id") + 
					"'class='glyphicon glyphicon-remove'></a></button>"); %>							
			</form>
      </div> 
    <%}%>
 </div>
</body>
</html>