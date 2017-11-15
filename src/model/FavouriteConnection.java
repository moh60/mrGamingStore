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
}