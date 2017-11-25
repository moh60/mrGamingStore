<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="header.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="controller.SignUpInfo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/defaultForm.css">
<title>Profile</title>
</head>
<body>
<%List userList = (List)request.getAttribute("user");%>
<div class="main-wrapper">
	<div class="text">Profile</div>
	   <% for(int i=0; i<userList.size(); i++){%>
	   		<% SignUpInfo signUpInfo = (SignUpInfo)userList.get(i); %>
				<form name="form" action="updateProfileServlet" method="post">
					<input type="hidden" name="user_id" value="<%= signUpInfo.getUser_id()%>" size="25" class="user-info"  />
					<input type="text" name="firstname" value="<%= signUpInfo.getUserFirstName()%>" size="25" maxlength="20" placeholder="First name" class="user-info"  /><br/>
					<input type="text" name="lastname" value="<%= signUpInfo.getUserLastName()%>" size="25" maxlength="20" placeholder="Last name" class="user-info"  /><br/>
					<input type="text" name="email" value="<%= signUpInfo.getUserEmail()%>" size="25" maxlength="20" placeholder="Email" class="user-info" /><br/>
					<input type="password" name="password" value="<%= signUpInfo.getUserPassword()%>" size="25" maxlength="20" placeholder="Password" class="user-info"  /><br/>
					<input type="text" name="address1" value="<%= signUpInfo.getUserAdress1()%>" size="25" maxlength="20" placeholder="Address 1" class="user-info"  /><br/>
				    <input type="text" name="address2" value="<%= signUpInfo.getUserAddress2()%>" size="25" maxlength="20" placeholder="Address 2" class="user-info" /><br/>
					<input type="text" name="city" value="<%= signUpInfo.getUserCity()%>" size="25" maxlength="20" placeholder="City" class="user-info" /><br/>
					<input type="text" name="state" value="<%= signUpInfo.getUserState()%>" size="25" maxlength="20" placeholder="State" class="user-info" /><br/>	
					<input type="text" name="zip" value="<%= signUpInfo.getZip()%>" size="25" maxlength="20" placeholder="Zip" class="user-info"  /><br/>
					<input type="text" name="country" value="<%= signUpInfo.getUserCountry()%>"size="25" maxlength="20" placeholder="Country" class="user-info"  /><br/>
					<input type="text" name="credit_card_type" value="<%= signUpInfo.getUserCCtype()%>"size="25" maxlength="20" placeholder="Credit Card Type" class="user-info"  /><br/>
					<input class="user-info" type="text" value="<%= signUpInfo.getUserCCnumber()%>"placeholder="Cerdit Card Number" name="credit_card_number" maxlength="16" size="25" class="user-info" /><br/>										
					<input type="text" value="<%= signUpInfo.getUserCCcvv()%>" placeholder="cvv" name="credit_card_cvv" size="3" maxlength="3" class="user-info" />						
					<input class="user-info" type="text" value="<%= signUpInfo.getUserCCexpiry()%>" name="credit_card_expiry" size="16" class="user-info"/><br/>
					<%if(request.getSession().getAttribute("Role").equals("admin"))
						out.print("<input class='user-info' type='text' placeholder='Account Lock = 1 / Unlock = 0' value='" + signUpInfo.getIsLocked() + "' name='isLocked' size='25' id='isLocked-input'/><br/>");
					 %>
					<!-- submit sign up form -->
					<input type="submit" name="submit" value="Submit" class="btn btn-primary btn-lg submit-button" id="submit-button"/>						
				</form>
</div>		
<%}%>
</body>
</html>