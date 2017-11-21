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

import model.CartConnection;
import model.FavouriteConnection;
import model.GameConnection;

public class CartServlet extends HttpServlet {

	public void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// GET user_id
		String userID = request.getParameter("user_id");
		LoginInfo userInfo = new LoginInfo();
		userInfo.setUserID(userID);
		
		// get cart games objects
		CartConnection cartConnection = new CartConnection(); 
		ResultSet cartGameCollection = cartConnection.getCartGamesCollection(userInfo); 
		if(cartGameCollection != null) {
			// get actual games result set
			List<Object> cartGames  = new ArrayList<Object>();
			try {
				while(cartGameCollection.next()){
					String gameID = cartGameCollection.getString("game_id");
					SearchInfo searchInfo = new SearchInfo();
					searchInfo.setGameID(gameID);
					GameConnection game = new GameConnection();
					ResultSet gameObject = game.retrieveGame(searchInfo);
					if(gameObject != null) {
						try {
							while(gameObject.next()) {
								SearchInfo gameInfo = new SearchInfo(); 
								gameInfo.setGameID(gameObject.getString(1));
								gameInfo.setGameName(gameObject.getString(2));
								gameInfo.setGameConsole(gameObject.getString(4));
								gameInfo.setGameGenre(gameObject.getString(7));				
								gameInfo.setGameReleaseDate(gameObject.getString(8));
								gameInfo.setGameDeveloper(gameObject.getString(9));
								gameInfo.setGamePublisher(gameObject.getString(10));
								gameInfo.setGameFrontBoxArt(gameObject.getString(11));
								gameInfo.setGamePrice(gameObject.getString(15));
								gameInfo.setGameDiscount(gameObject.getString(16));
								cartGames.add(gameInfo);
							}
						}
						catch (SQLException e1) {
							e1.printStackTrace();
						}
					} 
				}
			}
			catch (SQLException e1) {
				e1.printStackTrace();
			}
			request.setAttribute("cart", cartGames);
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		}
		else {
			System.out.println("error while loading cart");
		}
	}
}