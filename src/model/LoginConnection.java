package model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import controller.LoginInfo;
import db.DBConnection;
// this class handles the logic for login
public class LoginConnection {
	// authenticate user login
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
		String userID = "";
		
		//connect to DB
		try {
			// establish a connection with the db
			con = DBConnection.createConnection();
			// use to write sql queries
			statement = con.createStatement();	
			//fetch sql query result and store it in a resultSet
			PreparedStatement query = con.prepareStatement("SELECT * from users where email = ?");
			query.setString(1, userEmail); 
		    resultSet = query.executeQuery();
			while(resultSet.next()) {				
				// if user has forgot_pass
				if (resultSet.getBoolean("forgot_pass")) {
					userEmailDB = resultSet.getString("email"); 
					String updatedPassDB = "";
					Date tmpDate;
					DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
					Date currentDate = new Date();
					userID = resultSet.getString("user_id");
					String userRole = resultSet.getString("Role");
					PreparedStatement ps = con.prepareStatement("select * from temporarylogin where user_id = ?");  
					ps.setString(1, userID);  
					ResultSet rs = ps.executeQuery();
					while(rs.next()) {
						updatedPassDB = rs.getString("password");
						tmpDate = rs.getDate("timestamp");						
					}
					// check if tmp date is less then current date by 24hrs
					if(userEmail.equals(userEmailDB) && password.equals(updatedPassDB)) {
						// remove temporary user info
						ps = con.prepareStatement("Delete from temporarylogin where user_id = ?");
						ps.setString(1, userID);
						ps.executeUpdate();
						System.out.println("Removed temporary user info");						
						// update pass, reset lock counter, isLocked, forgot pass from user account
						String userLastLogin = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new Date());;
						ps = con.prepareStatement("UPDATE users SET password=?, lock_counter=?, forgot_pass=?, last_login=? WHERE users.user_id = ?");
						ps.setString(1,updatedPassDB);
						ps.setInt(2,0);
						ps.setBoolean(3,false);
						ps.setString(4,userLastLogin);
						ps.setString(5,userID);
						ps.executeUpdate();						
						System.out.println("User logged in with temporary password");
						return "SUCCESS:" + userID + ":" + userRole; 
					}	 
				}
				
				// if user account is not locked
				else if (!resultSet.getBoolean("isLocked")) {
					//fetch the values present in database
					userEmailDB = resultSet.getString("email"); 
					passwordDB = resultSet.getString("password");
					userID = resultSet.getString("user_id");
					String userRole = resultSet.getString("Role");
					if(userEmail.equals(userEmailDB) && password.equals(passwordDB)) {
						// update user last login
						String userLastLogin = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new Date());;
						PreparedStatement ps = con.prepareStatement("UPDATE users SET last_login=? WHERE users.user_id = ?");
						ps.setString(1, userLastLogin);
						ps.setString(2,userID);
						ps.executeUpdate();			
						// return "SUCCESS" if userEmail and userPassword are a match
						return "SUCCESS:" + userID + ":" + userRole; 
					}	
				}
				else {
					return "LOCKED";
				}				
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		// no match found
		return "Invalid user credentials"; 
	}
	
	// lock user implementation
	public String lockUser(LoginInfo loginInfo) {

		// store users login info in variables
		String userEmail = loginInfo.getUserEmail();
		// intialize connection
		Connection con = null;
		// intialize sql
		Statement statement = null;
		ResultSet resultSet = null;		
		PreparedStatement ps = null;
		int lockCounter = 0;
		//connect to DB
		try {
			// establish a connection with the db
			con = DBConnection.createConnection();			
			statement = con.createStatement();
			//fetch sql query result and store it in a resultSet
			PreparedStatement query = con.prepareStatement("SELECT * from users where email = ?");
			query.setString(1, userEmail); 
		    resultSet = query.executeQuery();
			while(resultSet.next()) {
				//fetch the values present in database
				lockCounter = resultSet.getInt("lock_counter"); 
				System.out.println(lockCounter);
			}
			// lock user
			if(lockCounter == 3) {
				ps = con.prepareStatement("UPDATE users SET isLocked = ? WHERE users.email = ?");
				ps.setInt(1, 1);  
				ps.setString(2, userEmail);
				ps.executeUpdate();
				System.out.print("User's account is locked");  
			}
			// increment user's lock counter
			else {				
				ps = con.prepareStatement("UPDATE users SET lock_counter = ? WHERE users.email = ?");
				ps.setInt(1, (lockCounter)+1);  
				ps.setString(2, userEmail);
				ps.executeUpdate();
				System.out.print("increment user's lock counter");  
				}							
		}
		catch(SQLException e) {
			e.printStackTrace();
		}				
		return null;
	}
	
	// load user info
	public ResultSet getUser(LoginInfo loginInfo) {
		// store users login info in variables
		String userID = loginInfo.getUserID();
		// intialize connection
		Connection con = null;
		// intialize sql
		ResultSet resultSet = null;		
		//connect to DB
		try {
			// establish a connection with the db
			con = DBConnection.createConnection();			
			//fetch sql query result and store it in a resultSet
			PreparedStatement query = con.prepareStatement("SELECT * from users where user_id = ?");
			query.setString(1, userID); 
		    resultSet = query.executeQuery();
		return resultSet;		
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return null;	
	}	
}