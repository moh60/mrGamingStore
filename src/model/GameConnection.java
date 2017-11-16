package model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import controller.SearchInfo;
import db.DBConnection;

public class GameConnection {
	public ResultSet retrieveGame(SearchInfo searchInfo) {
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
			//fetch  gameObject by game_id by sql query and store it in a resultSet
		    PreparedStatement query = con.prepareStatement("SELECT * from game where game_id = ?");
			query.setString(1, gameID); 
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
	
	public ResultSet retriveDiscountGames() {
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

	public String addGame(SearchInfo gameInfo) {
		// intialize connection
		Connection con = null;
		// intialize sql
		PreparedStatement ps = null;		
		//connect to DB
		try {
			// establish a connection with the db
			con = DBConnection.createConnection();
			ps = con.prepareStatement(
					"insert into game values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");  
			ps.setString(1, gameInfo.getGameID());  
			ps.setString(2, gameInfo.getGameName());  
			ps.setString(3, gameInfo.getGameDescription());  
			ps.setString(4, gameInfo.getGameConsole());
			ps.setString(5, gameInfo.getGameNumOfPlayers());  
			ps.setString(6, gameInfo.getGameCoop());  
			ps.setString(7, gameInfo.getGameGenre());  
			ps.setString(8, gameInfo.getGameReleaseDate());  
			ps.setString(9, gameInfo.getGameDeveloper());  
			ps.setString(10, gameInfo.getGamePublisher());  
			ps.setString(11, gameInfo.getGameFrontBoxArt());
			ps.setString(12, gameInfo.getGameBackBoxArt());  
			ps.setString(13, gameInfo.getGameLogo());  
			ps.setString(14, gameInfo.getGameDeveloperLogo());  
			ps.setString(15, gameInfo.getGamePrice());  
			ps.setString(16, gameInfo.getGameDiscount());  
			ps.setString(17, gameInfo.getGameQuantity());
			ps.executeUpdate();  
			return "SUCCESS"; 
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		// no match found
		return "Invalid game"; 
	}

	public ResultSet getEditGame(SearchInfo gameInfo) {
		// store game info in variables
		String gameID = gameInfo.getGameID();
		// intialize connection
		Connection con = null;
		// intialize sql
		ResultSet resultSet = null;		
		//connect to DB
		try {
			// establish a connection with the db
			con = DBConnection.createConnection();			
			//fetch sql query result and store it in a resultSet
			PreparedStatement query = con.prepareStatement("SELECT * from game where game_id = ?");
			query.setString(1, gameID); 
		    resultSet = query.executeQuery();
		return resultSet;		
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}