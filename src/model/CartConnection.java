package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import controller.LoginInfo;
import controller.SearchInfo;
import db.DBConnection;

public class CartConnection {

	public String addToCart(LoginInfo userInfo, SearchInfo searchInfo) {
		// store user_id
		String userID = userInfo.getUserID();		
		// store game_id
		String gameID = searchInfo.getGameID();
		// intialize connection
		Connection con = null;
		// intialize sql
		ResultSet resultSet = null;		
		// connect to DB
		try {
			// establish a connection with the db
			con = DBConnection.createConnection();
			
			int quantity = 1;
			float price = 0;
			
			// get object information from game table using game_id
			PreparedStatement query = con.prepareStatement("SELECT * from game where game_id = ?");
			query.setString(1, gameID); 
		    resultSet = query.executeQuery();
		    System.out.println("got game");
		    while (resultSet.next()) {
		    	price = Float.parseFloat(resultSet.getString("price"));
		    }
		    
		    try {
		    	// establish a connection with the db
				con = DBConnection.createConnection();
				
				// insert game to cart table
				PreparedStatement ps = con.prepareStatement(
						"insert into cart values(?,?,?,?,?)");  
				ps.setString(1, userInfo.getUserID());  
				ps.setString(2, searchInfo.getGameID());
				ps.setInt(3, quantity);
				ps.setFloat(4, price);
				ps.setBoolean(5, false);
				ps.executeUpdate();
				System.out.println("Added Game to cart table");    		
		    }
			catch(SQLException e) {
				e.printStackTrace();
			}
			return "SUCCESS"; 	
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		// ERROR
		return null; 
	}

	public ResultSet getCartGamesCollection(LoginInfo userInfo) {
		// get user id
		String userID = userInfo.getUserID();
		// intialize connection
		Connection con = null;
		// intialize sql
		ResultSet resultSet = null;		
		// connect to DB
		try {
			// establish a connection with the db
			con = DBConnection.createConnection();
			//fetch  gameObject by game_id by sql query and store it in a resultSet
		    PreparedStatement query = con.prepareStatement("SELECT * from cart where user_id = ? and processed = ?");
		    query.setString(1, userID);
		    query.setBoolean(2, false);
			resultSet = query.executeQuery();
		    System.out.println("found cart games");
			return resultSet; 	
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		// no favourite game found
		return null; 
	}

	public String RemoveCartGame(LoginInfo userInfo, SearchInfo searchInfo) {
		// store user_id
		String userID = userInfo.getUserID();		
		// store game_id
		String gameID = searchInfo.getGameID();
		// intialize connection
		Connection con = null;
		// intialize sql
		ResultSet resultSet = null;		
		// connect to DB
		try {
			// establish a connection with the db
			con = DBConnection.createConnection();
					
			// remove game from cart table 
			PreparedStatement ps = con.prepareStatement(
					"delete from cart where user_id = ? and game_id = ? and processed = ?");  
			ps.setString(1, userInfo.getUserID());  
			ps.setString(2, searchInfo.getGameID());
			ps.setBoolean(3, false);
			ps.executeUpdate();
			System.out.println("Removed Game from cart table");    
			return "SUCCESS"; 	
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		// ERROR
		return null; 
	}

	public String saveCartGame(LoginInfo userInfo, SearchInfo gameInfo) {
		// intialize connection
		Connection con = null;
		// intialize sql
		PreparedStatement ps = null;
		//connect to DB
		try {
			// establish a connection with the db
			con = DBConnection.createConnection();
			ps = con.prepareStatement(
			"UPDATE cart SET user_id = ?, game_id = ?, quantity = ?, price = ?, processed = ?  WHERE cart.user_id = ? and cart.game_id = ? and cart.processed = ?" );  
			ps.setString(1, userInfo.getUserID());  
			ps.setString(2, gameInfo.getGameID());  
			ps.setInt(3, Integer.parseInt(gameInfo.getGameQuantity()));
			ps.setDouble(4, Double.parseDouble(gameInfo.getGamePrice()));  
			ps.setBoolean(5, false);  
			ps.setString(6, userInfo.getUserID());  
			ps.setString(7, gameInfo.getGameID());  
			ps.setBoolean(8, false);  
			ps.executeUpdate();  
			return "SUCCESS"; 		
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		// Error
		return null; 
	}
}