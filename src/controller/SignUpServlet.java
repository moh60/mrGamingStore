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

// this class controlls the signup process
public class SignUpServlet extends HttpServlet {
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// GET user sign up information
		String userID = UUID.randomUUID().toString();
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
		String userCCexpiry = request.getParameter("credit_card_expiry_month")+"/"+request.getParameter("credit_card_expiry_year");
		String userLastLogin = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new Date());;
		int lockCounter = 0;
		String isLocked = "0";
		int forgotPass = 0;
		String role = "normal";
		int discountValue = 0;
		
		// object which contains user's sign up information
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
		signUpInfo.setUserLastLogin(userLastLogin);
		signUpInfo.setLockCounter(lockCounter);
		signUpInfo.setIsLocked(isLocked);
		signUpInfo.setForgotPass(forgotPass);
		signUpInfo.setRole(role);
		signUpInfo.setDiscountValue(discountValue);
		
		SignUpConnection signUpConnection= new SignUpConnection(); 
		String registerUser = 	signUpConnection.registerUser(signUpInfo);
		if(registerUser.equals("SUCCESS")) {
			System.out.println(" - user is now registered");
			response.sendRedirect("index.jsp");
		}
		else {
			//If authenticateUser() function returns other than SUCCESS string it will be sent to Login page again. Here the error message returned from function has been stored in a errMessage key.
			System.out.println("invalid registration");
			request.setAttribute("errMessage", registerUser); 
			//forwarding the request
			request.getRequestDispatcher("signup.jsp").forward(request, response);
		}
	}
}
