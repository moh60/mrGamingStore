<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="controller.OrderInfo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/orderHistory.css">
<title>Orders</title>
</head>
<body>
<%List ordersList = (List)request.getAttribute("orders");%>
 <div class="order-result-wrapper">
 <table>
    <% for(int i=0; i<ordersList.size(); i++){%>
	    <tr class="order-result">
		    <% OrderInfo orderInfo = (OrderInfo)ordersList.get(i); %>
			<td class="order-id"><a href="LoadOrderGamesServlet?order_id=<%out.print(orderInfo.getOrderID());%>"><%out.print(orderInfo.getOrderID()); %></a></td>
			<td class="user-id"><%out.print(orderInfo.getUserID()); %></td>
			<td class="order-total"><%out.print(orderInfo.getTotal()); %></td>
			<td class="order-timestamp"><%out.print(orderInfo.getTimestamp()); %></td>
	     </tr> 
    <%}%>
    </table>
 </div>
</body>
</html>