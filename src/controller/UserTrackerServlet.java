package controller;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.SignUpConnection;

public class UserTrackerServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get users object
		SignUpConnection userCollection = new SignUpConnection(); 
		//Calling authenticateUser function
		ResultSet usersObject = userCollection.getAllUsers(); 
		List<Object> users  = new ArrayList();
		if(usersObject != null) {
			try {
				while(usersObject.next()) {
					SignUpInfo userInfo = new SignUpInfo(); 
					userInfo.setUser_id(usersObject.getString("user_id"));
					userInfo.setUserEmail(usersObject.getString("email"));
					userInfo.setUserLastLogin(usersObject.getString("last_login"));
					users.add(userInfo);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("users", users);
			request.getRequestDispatcher("lastLogin.jsp").forward(request, response);
		}
		else {
			System.out.println("invalid search!");
		}
	}
}
