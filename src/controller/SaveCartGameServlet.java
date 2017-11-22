package controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CartConnection;

public class SaveCartGameServlet extends HttpServlet {

	public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// user_id
		String userID = request.getParameter("user_id");
		LoginInfo userInfo = new LoginInfo();
		userInfo.setUserID(userID);
		// game_id
		String gameID = request.getParameter("game_id");
		// quantity
		String gameQuantity = request.getParameter("game_quantity");
		// price
		String gamePrice = request.getParameter("game_price");
		SearchInfo gameCartInfo = new SearchInfo();
		gameCartInfo.setGameID(gameID);
		gameCartInfo.setGameQuantity(gameQuantity);
		gameCartInfo.setGamePrice(gamePrice);
		
		// get cart games objects
		CartConnection cartConnection = new CartConnection(); 
		String saveCartGame = cartConnection.saveCartGame(userInfo, gameCartInfo); 
		if(saveCartGame.equals("SUCCESS")) {
			response.sendRedirect("CartServlet?user_id=" + userID);
		}
		else {
			System.out.println("error while saving game cart");
		}
	}
}