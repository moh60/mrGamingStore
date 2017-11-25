package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import controller.LoginInfo;
import controller.OrderInfo;
import controller.SearchInfo;
import db.DBConnection;

public class PurchaseConnection {

	public ResultSet getPurchaseHistory(LoginInfo userInfo) {
		// store user_id
		String userID = userInfo.getUserID();		
		// intialize connection
		Connection con = null;
		// intialize sql
		ResultSet resultSet = null;		
		// connect to DB
		try {
			// establish a connection with the db
			con = DBConnection.createConnection();
			// get all user orders
			PreparedStatement query = con.prepareStatement("SELECT * from gameorder where user_id = ?");
			query.setString(1, userID); 
		    resultSet = query.executeQuery();
			return resultSet; 	
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		// ERROR
		return null; 			
	}

	public List<Object> getPurchaseGames(OrderInfo orderInfo) {
		// store order_id
		String orderID = orderInfo.getOrderID();	
		// intialize connection
		Connection con = null;
		// intialize sql
		ResultSet resultSet = null;
		ResultSet r = null;
		// connect to DB
		try {
			// establish a connection with the db
			con = DBConnection.createConnection();
			// get all games in with order_id from gameproduct table
			PreparedStatement query = con.prepareStatement("SELECT * from gameproduct where order_id = ?");
			query.setString(1, orderID); 
		    resultSet = query.executeQuery();
		    
		    // get list of games with their info from game table
		    List <Object> games = new ArrayList<Object>();
		    while(resultSet.next()) {
		    	try {
		    		PreparedStatement q = con.prepareStatement("SELECT * from game where game_id = ?");
				    // get games starting with
				    q.setString(1, resultSet.getString("game_id")); 
				    r = q.executeQuery();
				    while (r.next()) {
				    	SearchInfo gameInfo = new SearchInfo(); 
				    	gameInfo.setGameID(r.getString(1));
						gameInfo.setGameName(r.getString(2));
						gameInfo.setGameDescription(r.getString(3));
						gameInfo.setGameReleaseDate(r.getString(8));
						gameInfo.setGameFrontBoxArt(r.getString(11));
						games.add(gameInfo);
				    }
		    	}
		    	catch(SQLException e) {
					e.printStackTrace();
				}
		    }		    
			return games; 	
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		// ERROR
		return null; 
	}
}