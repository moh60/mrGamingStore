<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/screen.min.css">
<link rel="stylesheet" type="text/css" href="css/header.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="shortcut icon" href="assets/images/icon.jpg?"
	type="image/x-icon" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript"
	src="js/header.js"></script>
</head>
<body>
	<!--header-->
	<nav class="navbar navbar-default navbar-fixed-top nav-login"
		role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<!-- logo -->
			<a class="navbar-brand" href="index.jsp"> <img
				src="assets/images/icon.jpg" height="45" alt="mrGaming logo">
			</a>
			<!-- slogan -->
			<p class="nav_tagline">An open, online video games store</p>
		</div>
		<div id="navbar-collapse">
		
		<input type="hidden" name="user_id" id="id" value="<%=request.getSession().getAttribute("user_id")%>" />
		<input type="hidden" name="user_role" id="role" value="<%=request.getSession().getAttribute("Role")%>" />
		
			<!-- menu -->
			<button type="button" class="btn btn-primary btn-lg advance-search" id="admin-button"
				role="button" data-toggle="collapse" data-target="#admin-menu">ADMIN</button>
			<button type="button" class="btn btn-primary btn-lg advance-search" id="menu-button"
				role="button" data-toggle="collapse" data-target="#menu-search">MENU</button>
			<%
				//out.print(request.getSession().getAttribute("user_id"));
				if (request.getSession().getAttribute("userEmail") != null) {
					out.print("<a class='btn btn-primary btn-lg signup-button' href='LogoutServlet' role='button'>Logout</a>");
					out.print("<div id='menu-search' class='collapse'>"
							+ "<a href=CartServlet?user_id="
							+ request.getSession().getAttribute("user_id")
							+ ">Cart</a></br>"
							+ "<a href='DiscountsServlet'>Discounts</a></br>"
							+ "<a href=FavouriteServlet?user_id="
							+ request.getSession().getAttribute("user_id")
							+ ">Favourites</a></br>"
							+ "<a href=LoadProfileServlet?user_id="
							+ request.getSession().getAttribute("user_id")
							+ ">Update Profile</a></div>");
					if (request.getSession().getAttribute("Role").equals("admin")) {
						out.print("<div id='admin-menu' class='collapse'>"
								+ "<a href='InventoryPageServlet'>Inventory</a></br>"
								+ "<a href='addGame.jsp'>Add Game</a></br>"
								+ "<a href='discountAdmin.jsp'>Discount Setting</a></br>"
								+ "<a href='UserTrackerServlet'>Users Tracker</a></div>");
					}
				} else {
					out.print("<a class='btn btn-primary btn-lg login-button' href='login.jsp' role='button'> Log in</a>");
					out.print("<a class='btn btn-primary btn-lg signup-button' href='signup.jsp' role='button'> Sign Up</a>");
				}
			%>
		</div>
	</div>
	</nav>
</body>
</html>