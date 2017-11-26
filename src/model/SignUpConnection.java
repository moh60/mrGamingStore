package model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import controller.SignUpInfo;
import db.DBConnection;

//this class handles the logic for sign up
public class SignUpConnection {
	
	public String registerUser(SignUpInfo signUpInfo) {
		// intialize connection
		Connection con = null;
		// intialize sql
		PreparedStatement ps = null;
		
		//connect to DB
		try {
			// establish a connection with the db
			con = DBConnection.createConnection();
			ps = con.prepareStatement(
					"insert into users values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");  
			ps.setString(1, signUpInfo.getUser_id());  
			ps.setString(2, signUpInfo.getUserPassword());  
			ps.setString(3, signUpInfo.getUserFirstName());  
			ps.setString(4, signUpInfo.getUserLastName());
			ps.setString(5, signUpInfo.getUserEmail());  
			ps.setString(6, signUpInfo.getUserAdress1());  
			ps.setString(7, signUpInfo.getUserAddress2());  
			ps.setString(8, signUpInfo.getUserCity());  
			ps.setString(9, signUpInfo.getUserState());  
			ps.setString(10, signUpInfo.getZip());  
			ps.setString(11, signUpInfo.getUserCountry());  
			ps.setString(12, signUpInfo.getUserCCtype());  
			ps.setString(13, signUpInfo.getUserCCnumber());  
			ps.setString(14, signUpInfo.getUserCCcvv());  
			ps.setString(15, signUpInfo.getUserCCexpiry());  
			ps.setString(16, signUpInfo.getUserLastLogin());
			ps.setInt(17, signUpInfo.getLockCounter());
			ps.setInt(18, Integer.parseInt(signUpInfo.getIsLocked()));
			ps.setInt(19, signUpInfo.getForgotPass());
			ps.setString(20, signUpInfo.getRole());
			ps.setInt(21, signUpInfo.getDiscountValue());

			int i = ps.executeUpdate();  
			if(i>0) {
				System.out.print("You are successfully registered");  
			}
			return "SUCCESS"; 
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		// no match found
		return "Invalid user credentials"; 
	}

	public String updateUser(SignUpInfo signUpInfo) {
		// intialize connection
		Connection con = null;
		// intialize sql
		PreparedStatement ps = null;
		//connect to DB
		try {
			// establish a connection with the db
			con = DBConnection.createConnection();
			ps = con.prepareStatement(
			"UPDATE users SET password = ?, firstname = ?,lastname = ?, email = ?, address1 = ?, address2 = ?, city = ?, state = ?, zip = ?, country = ?, credit_card_type = ?, credit_card_number = ?, credit_card_cvv = ?, credit_card_expiry = ?, isLocked = ? WHERE users.user_id = ?");  
			ps.setString(1, signUpInfo.getUserPassword());  
			ps.setString(2, signUpInfo.getUserFirstName());  
			ps.setString(3, signUpInfo.getUserLastName());
			ps.setString(4, signUpInfo.getUserEmail());  
			ps.setString(5, signUpInfo.getUserAdress1());  
			ps.setString(6, signUpInfo.getUserAddress2());  
			ps.setString(7, signUpInfo.getUserCity());  
			ps.setString(8, signUpInfo.getUserState());  
			ps.setString(9, signUpInfo.getZip());  
			ps.setString(10, signUpInfo.getUserCountry());  
			ps.setString(11, signUpInfo.getUserCCtype());  
			ps.setString(12, signUpInfo.getUserCCnumber());  
			ps.setString(13, signUpInfo.getUserCCcvv());  
			ps.setString(14, signUpInfo.getUserCCexpiry());
			ps.setString(15, signUpInfo.getIsLocked());
			ps.setString(16, signUpInfo.getUser_id());  
			ps.executeUpdate();						
			System.out.println("User profile updated successfully");
			return "SUCCESS"; 
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		// no match found
		return "Invalid user credentials"; 
	}

	public ResultSet getAllUsers() {
		// intialize connection
		Connection con = null;
		// intialize sql
		ResultSet resultSet = null;		
		// connect to DB
		try {
			// establish a connection with the db
			con = DBConnection.createConnection();
			//fetch  userObject for last login page and store it in a resultSet
		    PreparedStatement query = con.prepareStatement("SELECT * from users");
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

	public String updateDiscountValue(SignUpInfo discountInfo) {
		// intialize connection
		Connection con = null;
		// connect to DB
		try {
			// establish a connection with the db
			con = DBConnection.createConnection();
			// update admin discount value
		    PreparedStatement query = con.prepareStatement("Update users SET discount_value = ? where Role = ?");
			query.setInt(1, discountInfo.getDiscountValue());
			query.setString(2, "admin");		    
		    query.executeUpdate();
			return "SUCCESS"; 	
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		// no match found
		return null; 
	}

	public int getDiscountValue() {
		// intialize connection
		Connection con = null;
		// intialize sql
		ResultSet resultSet = null;		
		// connect to DB
		try {
			// establish a connection with the db
			con = DBConnection.createConnection();
			//fetch admin userObject and store it in a resultSet
		    PreparedStatement query = con.prepareStatement("Select * from users where Role = ?");
			query.setString(1, "admin");		    
		    resultSet = query.executeQuery();
		    int discountValue = 0;
		    while(resultSet.next()) {
		    	discountValue = Integer.parseInt(resultSet.getString("discount_value"));
		    }	
		    return discountValue; 	
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		// no match found
		return 0; 
	}	
}