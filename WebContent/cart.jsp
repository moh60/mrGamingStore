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
<link rel="stylesheet" type="text/css" href="css/signup.css">
<script type="text/javascript" src="js/signup.js"></script>
<title>Cart</title>
</head>
<body>
<div class="tabs">
	<ul class="tab-links">
		<li class="active"><a href="#tab1">Cart</a></li>
		<li><a href="#tab2">Payment</a></li>
	</ul>	
	<div class="tab-content">	    
		<div id="tab1" class="tab active">
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
		</div>
		<div id="tab2" class="tab">
			<select name="credit_card_type" class="credit-type" id="credit-input">
				<option value="" disabled selected>Select Credit Card Type</option>
			    <option value="master">Master Card</option>
			    <option value="visa">Visa</option>
			</select><br/>
			<input class="inputCard" type="text" placeholder="Cerdit Card Number" name="credit_card_number" maxlength="16" id="credit-input" /><br/>										
			<input type="text" placeholder="cvv" name="credit_card_cvv" size="3" maxlength="3" id="credit-input" />						
			<input class="inputCard" type="text" placeholder="mm" name="credit_card_expiry_month" size="4" maxlength="2" id="credit-input"/>
			<input class="inputCard" type="text" placeholder="yyyy" name="credit_card_expiry_year" size="4" maxlength="4" id="credit-input"/><br/>			
			<button class="game-checkout">
		    	<a href="checkoutServlet?user_id=<%=request.getSession().getAttribute("user_id")%>">Checkout</a>
		    </button>	
		</div>
	</div>
</div>
</body>
</html>