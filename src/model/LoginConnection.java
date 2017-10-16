package model;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import controller.LoginInfo;
import db.DBConnection;
// this class handles the logic for login
public class LoginConnection {
	
	public String authenticateUser(LoginInfo loginInfo) {
		// store users login info in variables
		String userEmail = loginInfo.getUserEmail();
		String password = loginInfo.getPassword();
		// intialize connection
		Connection con = null;
		// intialize sql
		Statement statement = null;
		ResultSet resultSet = null;
		String userEmailDB = "";
		String passwordDB = "";
		
		//connect to DB
		try {
			// establish a connection with the db
			con = DBConnection.createConnection();
			// use to write sql queries
			statement = con.createStatement();
			//fetch sql query result and store it in a resultSet
			resultSet = statement.executeQuery("select email,password from Users");
			while(resultSet.next()) {
				//fetch the values present in database
				userEmailDB = resultSet.getString("email"); 
				passwordDB = resultSet.getString("password");
				if(userEmail.equals(userEmailDB) && password.equals(passwordDB)) {
					// return "SUCCESS" if userEmail and userPassword are a match
					//Fetch session object					
					return "SUCCESS"; 
				}
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		// no match found
		return "Invalid user credentials"; 
	}
}