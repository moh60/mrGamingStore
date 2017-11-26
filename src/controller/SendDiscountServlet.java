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

// this class controlls user update profile process
public class SendDiscountServlet extends HttpServlet {
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// get admin set discount value
		SignUpConnection discountInfo = new SignUpConnection();
		int discountValue = discountInfo.getDiscountValue();
	
		// get all registerd users
		SignUpConnection users = new SignUpConnection();
		ResultSet registeredUsers = users.getAllUsers();
		
		GameConnection gameConnection = new GameConnection(); 
		// get all discounted games
		ResultSet gameObject = gameConnection.retriveDiscountGames(discountValue); 
		
		// for each user send list of discounted games via email
		try {
			while (registeredUsers.next()) {
				String toEmail = registeredUsers.getString("email");
				String subject = "Discounted Games";
				String msg = "";
				List <String> discountedGames = new ArrayList<String>();
				
				// for each discounted game, get title
				while (gameObject.next()) {
					discountedGames.add(gameObject.getString("game_name"));
				}
				
				msg = discountedGames.toString();
				
				// send mail
				Mail.sendEmail(toEmail, subject, msg);
			}
			response.sendRedirect("index.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
