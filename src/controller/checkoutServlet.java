package controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CartConnection;

public class checkoutServlet extends HttpServlet {

	public void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// GET user_id
		String userID = request.getParameter("user_id");
		// set game object with gameID
		LoginInfo userInfo = new LoginInfo();
		userInfo.setUserID(userID);
		
		//creating object for CartConnection
		CartConnection cartConnection = new CartConnection(); 
		String checkout = cartConnection.checkout(userInfo); 
		if(checkout.equals("SUCCESS")) {			
			response.sendRedirect("index.jsp");
		}
		else {
			System.out.println("error while checking out");
		}
	}
}
