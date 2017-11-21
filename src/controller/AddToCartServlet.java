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

public class AddToCartServlet extends HttpServlet {

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
		
		//creating object for CartConnection
		CartConnection cartConnection = new CartConnection(); 
		String addtoCart = cartConnection.addToCart(userInfo,searchInfo); 
		if(addtoCart.equals("SUCCESS")) {			
			response.sendRedirect("index.jsp");
		}
		else {
			System.out.println("error while adding game to cart");
		}
	}
}
