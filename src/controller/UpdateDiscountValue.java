package controller;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.GameConnection;

// this class controlls user update profile process
public class UpdateDiscountValue extends HttpServlet {
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// GET game information
		String gameID = request.getParameter("game_id");
		String gameName = request.getParameter("game_name");
		String gameDescription = request.getParameter("game_description");
		String gameConsole = request.getParameter("console");
		String gameNumOfPlayers = request.getParameter("num_players");
		String gameCoop = request.getParameter("coop");
		String gameGenre = request.getParameter("genre");
		String gameReleaseDate = request.getParameter("release_date");
		String gameDeveloper = request.getParameter("developer");
		String gamePublisher = request.getParameter("publisher");
		String gameFrontBoxArt = request.getParameter("front_box_art");
		String gameBackBoxArt = request.getParameter("back_box_art");
		String gameLogo = request.getParameter("logo");
		String gameDeveloperLogo = request.getParameter("developer_logo");
		String gamePrice = request.getParameter("price");
		String gameDiscount = request.getParameter("discount");
		String gameQuantity = request.getParameter("quantity");
		
		// object which contains new game information
		SearchInfo gameInfo = new SearchInfo(); 
		//setting user's sign up info to store in DB
		gameInfo.setGameID(gameID);
		gameInfo.setGameName(gameName);
		gameInfo.setGameDescription(gameDescription);
		gameInfo.setGameConsole(gameConsole);
		gameInfo.setGameNumOfPlayers(gameNumOfPlayers);
		gameInfo.setGameCoop(gameCoop);
		gameInfo.setGameGenre(gameGenre);				
		gameInfo.setGameReleaseDate(gameReleaseDate);
		gameInfo.setGameDeveloper(gameDeveloper);
		gameInfo.setGamePublisher(gamePublisher);
		gameInfo.setGameFrontBoxArt(gameFrontBoxArt);
		gameInfo.setGameBackBoxArt(gameBackBoxArt);
		gameInfo.setGameLogo(gameLogo);
		gameInfo.setGameDeveloperLogo(gameDeveloperLogo);
		gameInfo.setGamePrice(gamePrice);
		gameInfo.setGameDiscount(gameDiscount);
		gameInfo.setGameQuantity(gameQuantity);

		GameConnection gameConnection = new GameConnection(); 
		String addGame = gameConnection.updateGame(gameInfo);
		if(addGame.equals("SUCCESS")) {
			System.out.println(" Updated Game");
			response.sendRedirect("index.jsp");
		}
		else {
			System.out.println("Error while updating game");
		}
	}
}
