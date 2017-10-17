<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/screen.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="icon" href="favicon.ico" /> 
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
</head>
<body>
	<!--header-->
	<nav class="navbar navbar-default navbar-fixed-top nav-login" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<!-- logo -->
				<a class="navbar-brand" href="index.jsp">
					<img src="assets/images/icon.jpg" height="45" alt="mrGaming logo">
				</a>		
				<!-- slogan -->
				<p class="nav_tagline">An open, online video games store</p>		
			</div>
		<div id="navbar-collapse">
			<!-- menu -->
			<a class="btn btn-primary btn-lg menu-button" role="button">
				<i class="glyphicon glyphicon-chevron-right"></i>
				Menu			
			</a>	
			<%
				//out.print(request.getSession().getAttribute("userEmail"));
				if(request.getSession().getAttribute("userEmail") != null){  
				    out.print("<a class='btn btn-primary btn-lg signup-button' href='LogoutServlet' role='button'>Logout</a>");
	 			 } 
				else {
					out.print("<a class='btn btn-primary btn-lg login-button' href='login.jsp' role='button'> Log in</a>");
				 	out.print("<a class='btn btn-primary btn-lg signup-button' href='signup.jsp' role='button'> Sign Up</a>");
				}		 
			%>			
		</div>
		</div>		
	</nav>	

			
</body>
</html>