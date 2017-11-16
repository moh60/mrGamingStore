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
import model.LoginConnection;

// this class controlls the login process
public class loadGameServlet extends HttpServlet {
	//doPost
	public void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// GET game id
		String gameID = request.getParameter("game_id");
		// object which contains game information
		SearchInfo gameInfo = new SearchInfo(); 
		//setting the game id
		gameInfo.setGameID(gameID);

		//creating object gameObject
		GameConnection gameConnection = new GameConnection(); 
		ResultSet gameObject = gameConnection.getEditGame(gameInfo); 
		List<Object> games  = new ArrayList<Object>();
		if(gameObject != null) {
			try {
				while(gameObject.next()) {
					SearchInfo game = new SearchInfo(); 
					game.setGameID(gameObject.getString(1));
					game.setGameName(gameObject.getString(2));
					game.setGameDescription(gameObject.getString(3));
					game.setGameConsole(gameObject.getString(4));
					game.setGameNumOfPlayers(gameObject.getString(5));
					game.setGameCoop(gameObject.getString(6));
					game.setGameGenre(gameObject.getString(7));				
					game.setGameReleaseDate(gameObject.getString(8));
					game.setGameDeveloper(gameObject.getString(9));
					game.setGamePublisher(gameObject.getString(10));
					game.setGameFrontBoxArt(gameObject.getString(11));
					game.setGameBackBoxArt(gameObject.getString(12));
					game.setGameLogo(gameObject.getString(13));
					game.setGameDeveloperLogo(gameObject.getString(14));
					game.setGamePrice(gameObject.getString(15));
					game.setGameDiscount(gameObject.getString(16));
					game.setGameQuantity(gameObject.getString(17));
					games.add(game);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("games", games);
			request.getRequestDispatcher("editGame.jsp").forward(request, response);
		}
		else{
			System.out.println("No user Found");
		}
	}
}