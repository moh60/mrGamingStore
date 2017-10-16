package db;
import java.sql.Connection;
import java.sql.DriverManager;
// this class handles db connection
public class DBConnection {
	public static Connection createConnection() {
		// intialize connection
		Connection con = null;
		// mysql url followed by db name
		String url = "jdbc:mysql://localhost:3306/videogamestore";
		// //MySQL username username and password
		String username = "root"; 
		String password = "password"; 
		
		try {
			try {
				//load mysql driver
				Class.forName("com.mysql.jdbc.Driver");  
			} 
			catch (ClassNotFoundException e) {
				e.printStackTrace();
			} 
			// establish a connection with MYSQL database
			con = DriverManager.getConnection(url, username, password); 
			System.out.println("Printing connection object "+con);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		// returning connection object
		return con; 
	}
}