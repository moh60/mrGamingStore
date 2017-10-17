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
<title>Games Result</title>
</head>
<body>
<%= request.getAttribute("games")%>
<%List eList = (List)request.getAttribute("games");%>
    
<table>
<%  %>
    <% for(int i=0; i<eList.size();i++){%>
        <tr>
            <td>
            <%
            SearchInfo gameInfo = (SearchInfo)eList.get(i);
            out.print(gameInfo.getGameName());            	
            %>
            </td>
        </tr>
      <%}%>
</table>
</body>
</html>