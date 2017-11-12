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
		String query = request.getParameter("query");
		String filter_type = request.getParameter("filter-game");
		
		// object which contains search information
		SearchInfo searchInfo = new SearchInfo(); 
		searchInfo.setQuery(query);
		searchInfo.setFilter_type(filter_type);
		
		//creating object for SearchConnection. This class contains main logic for retriving game search result
		SearchConnection searchConnection = new SearchConnection(); 
		//Calling authenticateUser function
		ResultSet searchQuery = searchConnection.authenticateGameSearch(searchInfo); 
		List<Object> games  = new ArrayList();
		if(searchQuery != null) {
			try {
				while(searchQuery.next()) {
					SearchInfo gameInfo = new SearchInfo(); 
					gameInfo.setGameID(searchQuery.getString(1));
					gameInfo.setGameName(searchQuery.getString(2));
					gameInfo.setGameDescription(searchQuery.getString(3));
					gameInfo.setGameReleaseDate(searchQuery.getString(8));
					gameInfo.setGameFrontBoxArt(searchQuery.getString(11));
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
