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
<link rel="stylesheet" type="text/css" href="css/lastLogin.css">
<title>Last Login</title>
</head>
<body>
<%List userList = (List)request.getAttribute("users");%>
 <div class="users-result-wrapper">
 <table>
    <% for(int i=0; i<userList.size(); i++){%>
	    <tr class="user-result">
		    <% SignUpInfo userInfo = (SignUpInfo)userList.get(i); %>
			<td class="user-email"><a href="LoadProfileServlet?user_id=<%out.print(userInfo.getUser_id());%>"><%out.print(userInfo.getUserEmail()); %></a></td>
			<td class="user-purchase"><a href="PurchaseServlet?user_id=<%out.print(userInfo.getUser_id());%>">Purchase History</a></td>
			<td class="user-last-login"><%out.print(userInfo.getUserLastLogin()); %></td>
	      </tr> 
      <%}%>
    </table>
 </div>
</body>
</html>