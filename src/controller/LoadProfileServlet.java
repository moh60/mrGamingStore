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

import model.LoginConnection;

// this class controlls the login process
public class LoadProfileServlet extends HttpServlet {
	//doPost
	public void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// GET user's id
		String userID = request.getParameter("user_id");
		// object which contains user's information
		LoginInfo loginInfo = new LoginInfo(); 
		//setting the username and password through the loginBean object then only you can get it in future.
		loginInfo.setUserID(userID);

		//creating object for LoginDao. This class contains main logic of the application.
		LoginConnection loginConnection = new LoginConnection(); 
		//Calling authenticateUser function
		ResultSet userObject = loginConnection.getUser(loginInfo); 
		List<Object> user  = new ArrayList<Object>();
		if(userObject != null) {
			try {
				while(userObject.next()) {
					SignUpInfo signUpInfo = new SignUpInfo(); 
					signUpInfo.setUser_id(userObject.getString(1));
					signUpInfo.setUserFirstName(userObject.getString(2));
					signUpInfo.setUserLastName(userObject.getString(3));
					signUpInfo.setUserEmail(userObject.getString(4));
					signUpInfo.setUserPassword(userObject.getString(5));
					signUpInfo.setUserAdress1(userObject.getString(6));
					signUpInfo.setUserAddress2(userObject.getString(7));
					signUpInfo.setUserCity(userObject.getString(8));
					signUpInfo.setUserState(userObject.getString(9));
					signUpInfo.setZip(userObject.getString(10));
					signUpInfo.setUserCountry(userObject.getString(11));
					signUpInfo.setUserCCtype(userObject.getString(12));
					signUpInfo.setUserCCnumber(userObject.getString(13));
					signUpInfo.setUserCCcvv(userObject.getString(14));
					signUpInfo.setUserCCexpiry(userObject.getString(15));
					user.add(signUpInfo);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("user", user);
			request.getRequestDispatcher("userProfile.jsp").forward(request, response);
		}
		else{
			System.out.println("No user Found");
		}
	}
}