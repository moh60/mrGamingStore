package model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import controller.LoginInfo;
import controller.SearchInfo;
import db.DBConnection;

public class FavouriteConnection {
	public String addToFavouriteGame(LoginInfo userInfo, SearchInfo searchInfo) {
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
			
			// insert favourtire game to table link to user by user_id
			PreparedStatement ps = con.prepareStatement(
					"insert into favourite values(?,?)");  
			ps.setString(1, userInfo.getUserID());  
			ps.setString(2, searchInfo.getGameID());
			ps.executeUpdate();
			System.out.println("Added Games to favourites table");    
		    // 
			return "SUCCESS"; 	
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		// ERROR
		return null; 
	}

	public ResultSet FavouriteGameCollection(LoginInfo userInfo) {
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
		    PreparedStatement query = con.prepareStatement("SELECT game_id from favourite where user_id = ?");
		    query.setString(1, userID);
			resultSet = query.executeQuery();
		    // found favourite games
//			while(resultSet.next()) {
//				System.out.println(resultSet.getString("game_id"));
//			}
			return resultSet; 	
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		// no favourite game found
		return null; 
	}

	public ResultSet retriveFavouriteGames() {
		// intialize connection
		Connection con = null;
		// intialize sql
		ResultSet resultSet = null;		
		// connect to DB
		try {
			// establish a connection with the db
			con = DBConnection.createConnection();
			//fetch  gameObject by game_id by sql query and store it in a resultSet
		    PreparedStatement query = con.prepareStatement("SELECT * from game where discount > 0");
			resultSet = query.executeQuery();
		    // found games
			return resultSet; 	
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		// no match found
		return null; 
	}
}