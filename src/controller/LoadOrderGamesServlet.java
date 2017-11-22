package controller;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.PurchaseConnection;

public class LoadOrderGamesServlet extends HttpServlet {

	public void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// GET user_id
		String orderID = request.getParameter("order_id");
		// set game object with gameID
		OrderInfo orderInfo = new OrderInfo();
		orderInfo.setOrderID(orderID);
		
		//creating object for PurchaseConnection
		PurchaseConnection purchaseConnection = new PurchaseConnection(); 
		List<Object> rs = purchaseConnection.getPurchaseGames(orderInfo);
		if(rs != null) {			
			request.setAttribute("games", rs);
			request.getRequestDispatcher("orderGames.jsp").forward(request, response);
		}
		else {
			System.out.println("no games found for the order");
		}
	}
}
