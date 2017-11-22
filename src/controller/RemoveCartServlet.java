package controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CartConnection;

public class RemoveCartServlet extends HttpServlet {

	public void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// GET user_id
		String userID = request.getParameter("user_id");
		// GET game_id
		String gameID = request.getParameter("game_id");
		// set game object with gameID
		LoginInfo userInfo = new LoginInfo();
		userInfo.setUserID(userID);
		SearchInfo searchInfo = new SearchInfo(); 
		searchInfo.setGameID(gameID);
		
		//creating object for FavouriteConnection which contains main logic for retriving detailed game information
		CartConnection cartConnection = new CartConnection(); 
		String removeCartGame = cartConnection.RemoveCartGame(userInfo,searchInfo); 
		if(removeCartGame.equals("SUCCESS")) {			
			response.sendRedirect("CartServlet?user_id=" + userID);
		}
		else {
			System.out.println("error while adding favourite games!");
		}
	}
}