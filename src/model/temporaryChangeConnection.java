package model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import controller.LoginInfo;
import db.DBConnection;

//this class handles the logic for creating temporary user with password
public class temporaryChangeConnection {
	public ResultSet createTemporaryUser(LoginInfo passInfo) {
		// store users login info in variables
		String userEmail = passInfo.getUserEmail();
		// intialize connection
		Connection con = null;
		// intialize sql
		PreparedStatement ps = null;
		ResultSet resultSet = null;
		String user_id_DB = "";
		String userPassDB = "";
		String dateDB = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new Date());

		//connect to DB
		try {
			// establish a connection with the db
			con = DBConnection.createConnection();
			PreparedStatement query = con.prepareStatement("SELECT * from Users where email = ?");
			query.setString(1, userEmail); 
		    resultSet = query.executeQuery();
			//fetch the values present in database
			while(resultSet.next()) {
			user_id_DB = resultSet.getString("user_id"); 
			userPassDB = "test"; // random create password
			}			
			System.out.println(user_id_DB);
			
			//  create temporary user
//			ps = con.prepareStatement(
//					"insert into temporarylogin values(?,?,?)");  
//			ps.setString(1, user_id_DB);  
//			ps.setString(2, userPassDB);  
//			ps.setString(3, dateDB);  		
//			int i = ps.executeUpdate();  
//			if(i>0) {
//				System.out.print("Successfully registered temporary user");  
//			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return resultSet;	
	}
}
