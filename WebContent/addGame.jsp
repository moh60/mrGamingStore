<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/signup.css">
<title>Add Game</title>
</head>
<body>
<div class="main">
	<form name="form" action="AddGameServlet" method="post">
		<input type="text" name="game_name" value="" size="25" maxlength="20" placeholder="Game Name" class="user-info"  /><br/>
		<input type="text" name="game_description" value="" size="25" maxlength="20" placeholder="Game Description" class="user-info"  /><br/>
		<input type="text" name="console" value="" size="25" maxlength="20" placeholder="Console" class="user-info" /><br/>
		<input type="text" name="num_players" value="" size="25" maxlength="20" placeholder="Number of Players" class="user-info"  /><br/>
		<input type="text" name="coop" value="" size="25" maxlength="20" placeholder="Coop" class="user-info"  /><br/>
	    <input type="text" name="genre" value="" size="25" maxlength="20" placeholder="Genre" class="user-info" /><br/>
		<input type="text" name="release_date" value="" size="25" maxlength="20" placeholder="Release Date" class="user-info" /><br/>
		<input type="text" name="developer" value="" size="25" maxlength="20" placeholder="Developer" class="user-info" /><br/>	
		<input type="text" name="publisher" value="" size="25" maxlength="20" placeholder="Publisher" class="user-info"  /><br/>
		<input type="text" name="front_box_art" value=""size="25" maxlength="20" placeholder="Front box art" class="user-info"  /><br/>
		<input type="text" name="back_box_art" value=""size="25" maxlength="20" placeholder="Back box art" class="user-info"  /><br/>
		<input type="text" name="logo" class="credit-type" id="credit-input"  value="" size="25" placeholder="Logo" class="user-info"  /><br/>
		<input type="text" name="developer_logo" class="credit-type" id="credit-input"  value="" size="25" placeholder="Developer Logo" class="user-info"  /><br/>
		<input type="text" name="price" class="credit-type" id="credit-input"  value="" size="25" placeholder="Price" class="user-info"  /><br/>
		<input type="text" name="discount" class="credit-type" id="credit-input"  value="" size="25" placeholder="Discount" class="user-info"  /><br/>
		<input type="text" name="quantity" class="credit-type" id="credit-input"  value="" size="25" placeholder="Quantity" class="user-info"  /><br/>
		
		<!-- submit add game form -->
		<input type="submit" name="submit" value="Submit" class="btn btn-primary btn-lg submit-button" />						
	</form>
</div>
</body>
</html>