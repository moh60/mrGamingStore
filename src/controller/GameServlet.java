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

public class GameServlet extends HttpServlet {

	public void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// GET game_id
		String gameID = request.getParameter("game_id");
		// set game object with gameID
		SearchInfo searchInfo = new SearchInfo(); 
		searchInfo.setGameID(gameID);
		
		//creating object for GameConnection which contains main logic for retriving detailed game information
		GameConnection gameConnection = new GameConnection(); 
		//Calling authenticateUser function
		ResultSet gameObject = gameConnection.retrieveGame(searchInfo); 
		List<Object> game  = new ArrayList<Object>();
		if(gameObject != null) {
			try {
				while(gameObject.next()) {
					SearchInfo gameInfo = new SearchInfo(); 
					gameInfo.setGameID(gameObject.getString(1));
					gameInfo.setGameName(gameObject.getString(2));
					gameInfo.setGameDescription(gameObject.getString(3));
					gameInfo.setGameReleaseDate(gameObject.getString(8));
					gameInfo.setGameFrontBoxArt(gameObject.getString(11));
					game.add(gameInfo);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("game", game);
			request.getRequestDispatcher("game.jsp").forward(request, response);
		}
		else {
			System.out.println("invalid game!");
		}
	}
}
