package controller;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.SignUpConnection;

// this class controlls user update profile process
public class updateProfileServlet extends HttpServlet {
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// GET user profile information
		String userID = request.getParameter("user_id");
		String userPassword = request.getParameter("password");
		String userFirstName = request.getParameter("firstname");
		String userLastName = request.getParameter("lastname");		
		String userEmail = request.getParameter("email");
		String userAdress1 = request.getParameter("address1");
		String userAddress2 = request.getParameter("address2");
		String userCity = request.getParameter("city");
		String userState = request.getParameter("state");
		String userZip = request.getParameter("zip");
		String userCountry = request.getParameter("country");
		String userCCtype = request.getParameter("credit_card_type");
		String userCCnumber = request.getParameter("credit_card_number");
		String userCCcvv = request.getParameter("credit_card_cvv");
		String userCCexpiry = request.getParameter("credit_card_expiry");
		// object which contains user's updadted information
		SignUpInfo signUpInfo = new SignUpInfo(); 
		//setting user's sign up info to store in DB
		signUpInfo.setUser_id(userID);
		signUpInfo.setUserPassword(userPassword);
		signUpInfo.setUserFirstName(userFirstName); 
		signUpInfo.setUserLastName(userLastName);
		signUpInfo.setUserEmail(userEmail);
		signUpInfo.setUserAdress1(userAdress1);
		signUpInfo.setUserAddress2(userAddress2);
		signUpInfo.setUserCity(userCity);
		signUpInfo.setUserState(userState);
		signUpInfo.setZip(userZip);
		signUpInfo.setUserCountry(userCountry);
		signUpInfo.setUserCCtype(userCCtype);
		signUpInfo.setUserCCnumber(userCCnumber);
		signUpInfo.setUserCCcvv(userCCcvv);
		signUpInfo.setUserCCexpiry(userCCexpiry);
		SignUpConnection signUpConnection= new SignUpConnection(); 
		String updateUser = signUpConnection.updateUser(signUpInfo);
		if(updateUser.equals("SUCCESS")) {
			System.out.println("User profile has been updated");
			response.sendRedirect("index.jsp");
		}
		else {
			System.out.println("Error while updating user profile ");
			//forwarding the request
			request.getRequestDispatcher("userProfile.jsp").forward(request, response);
		}
	}
}
