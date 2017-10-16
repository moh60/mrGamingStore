package model;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
					"insert into users values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");  
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
}