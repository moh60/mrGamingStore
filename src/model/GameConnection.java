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
}