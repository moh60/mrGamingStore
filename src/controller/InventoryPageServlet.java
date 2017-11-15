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

public class InventoryPageServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//creating object for SearchConnection. This class contains main logic for retriving game search result
		SearchConnection searchConnection = new SearchConnection(); 
		//Calling authenticateUser function
		ResultSet searchQuery = searchConnection.getAllGames(); 
		List<Object> games  = new ArrayList();
		if(searchQuery != null) {
			try {
				while(searchQuery.next()) {
					SearchInfo gameInfo = new SearchInfo(); 
					gameInfo.setGameID(searchQuery.getString("game_id"));
					gameInfo.setGameName(searchQuery.getString("game_name"));
					gameInfo.setGameQuantity(searchQuery.getString("quantity"));
					games.add(gameInfo);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("games", games);
			request.getRequestDispatcher("inventory.jsp").forward(request, response);
		}
		else {
			System.out.println("invalid search!");
		}
	}
}
