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

public class SearchConnection {
	public ResultSet authenticateGameSearch(SearchInfo searchInfo) {
		// store users query search info
		String gameName = searchInfo.getGameName();
		// intialize connection
		Connection con = null;
		// intialize sql
		ResultSet resultSet = null;
		
		// connect to DB
		try {
			// establish a connection with the db
			con = DBConnection.createConnection();
			//fetch sql query result and store it in a resultSet
		    PreparedStatement query = con.prepareStatement("SELECT * from game where game_name LIKE ?");
		    // get games starting with
		    query.setString(1, gameName+"%"); 
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