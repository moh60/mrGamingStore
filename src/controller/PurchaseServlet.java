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

public class PurchaseServlet extends HttpServlet {

	public void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// GET user_id
		String userID = request.getParameter("user_id");
		// set game object with gameID
		LoginInfo userInfo = new LoginInfo();
		userInfo.setUserID(userID);
		
		//creating object for PurchaseConnection
		PurchaseConnection purchaseConnection = new PurchaseConnection(); 
		ResultSet rs = purchaseConnection.getPurchaseHistory(userInfo);
		List<Object> orders  = new ArrayList<Object>();
		if(rs != null) {
			try {
				while(rs.next()) {
					OrderInfo orderInfo = new OrderInfo(); 
					orderInfo.setOrderID(rs.getString(1));
					orderInfo.setUserID(rs.getString(2));
					orderInfo.setTotal(Double.parseDouble(rs.getString(3)));
					orderInfo.setTimestamp(rs.getString(4));
					orders.add(orderInfo);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("orders", orders);
			request.getRequestDispatcher("purchaseHistory.jsp").forward(request, response);
		}
		else {
			System.out.println("no orders found");
		}
	}
}
