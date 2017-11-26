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

import model.GameConnection;
import model.SignUpConnection;

public class DiscountsServlet extends HttpServlet {

	public void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// get admin set discount value
		SignUpConnection discountInfo = new SignUpConnection();
		int discountValue = discountInfo.getDiscountValue();
		
		//creating object for GameConnection which contains main logic for retriving detailed game information
		GameConnection gameConnection = new GameConnection(); 
		//Calling authenticateUser function
		ResultSet gameObject = gameConnection.retriveDiscountGames(discountValue); 
		List<Object> dicountGames  = new ArrayList<Object>();
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
					dicountGames.add(gameInfo);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("discountGames", dicountGames);
			request.getRequestDispatcher("discountGames.jsp").forward(request, response);
		}
		else {
			System.out.println("invalid game!");
		}
	}
}
