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
		String filter_type = searchInfo.getFilter_type();
		String querySearch = searchInfo.getQuery();
		// intialize connection
		Connection con = null;
		// intialize sql
		ResultSet resultSet = null;
		
		// connect to DB
		try {
			// establish a connection with the db
			con = DBConnection.createConnection();
			System.out.println(filter_type);
			
			// get by game_name
			if (filter_type == null){
				//fetch sql query result and store it in a resultSet
			    PreparedStatement query = con.prepareStatement("SELECT * from game where game_name LIKE ?");
				// get games starting with
				query.setString(1, querySearch+"%"); 
			    resultSet = query.executeQuery();
			    // found games
				return resultSet; 
			}			
			// filter equals console
			else if (filter_type.equals("console")) {
				//fetch sql query result and store it in a resultSet
			    PreparedStatement query = con.prepareStatement("SELECT * from game where console LIKE ?");
			    // get games starting with
			    query.setString(1, querySearch+"%"); 
			    resultSet = query.executeQuery();
				// found games
				return resultSet; 
			}
			// filter equals year
			else if (filter_type.equals("year")) {
				//fetch sql query result and store it in a resultSet
			    PreparedStatement query = con.prepareStatement("SELECT * from game where release_date LIKE ?");
			    // get games starting with
			    query.setString(1, querySearch+"%"); 
			    resultSet = query.executeQuery();
				// found games
				return resultSet; 
			}
			// filter equals genre
			else if (filter_type.equals("genre")) {
				//fetch sql query result and store it in a resultSet
			    PreparedStatement query = con.prepareStatement("SELECT * from game where genre LIKE ?");
			    // get games starting with
			    query.setString(1, querySearch+"%"); 
			    resultSet = query.executeQuery();
				// found games
				return resultSet; 
			}
			// filter equals publisher
			else if (filter_type.equals("publisher")) {
				//fetch sql query result and store it in a resultSet
			    PreparedStatement query = con.prepareStatement("SELECT * from game where publisher LIKE ?");
			    // get games starting with
			    query.setString(1, querySearch+"%"); 
			    resultSet = query.executeQuery();
				// found games
				return resultSet; 
			}			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		// no match found
		return null; 
	}
}