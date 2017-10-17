package controller;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.SearchConnection;

public class SearchServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// GET user search info
		String game_name = request.getParameter("game_name");
		System.out.println("1 " + game_name);
		// object which contains user's sign up information
		SearchInfo searchInfo = new SearchInfo(); 
		searchInfo.setGameName(game_name);
		//creating object for SearchConnection. This class contains main logic for retriving game search result
		SearchConnection searchConnection = new SearchConnection(); 
		//Calling authenticateUser function
		ResultSet searchQuery = searchConnection.authenticateGameSearch(searchInfo); 
		List<Object> games  = new ArrayList();
		if(searchQuery != null) {
			try {
				while(searchQuery.next()) {
					SearchInfo gameInfo = new SearchInfo(); 
//					System.out.println(searchQuery.getString(1) + " " + searchQuery.getString(2));
					gameInfo.setGameID(searchQuery.getString(1));
					gameInfo.setGameName(searchQuery.getString(2));
					games.add(gameInfo);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("games", games);
			request.getRequestDispatcher("searchResult.jsp").forward(request, response);
		}
		else {
			System.out.println("invalid search!");
		}
	}
}
