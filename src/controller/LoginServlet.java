package controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.LoginConnection;

// this class controlls the login process
public class LoginServlet extends HttpServlet {
	//doPost
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// GET user's email
		String userEmail = request.getParameter("email");
		// GET user's password
		String password = request.getParameter("password");
		
		// object which contains user's information
		LoginInfo loginInfo = new LoginInfo(); 
		//setting the username and password through the loginBean object then only you can get it in future.
		loginInfo.setUserEmail(userEmail); 
		loginInfo.setPassword(password);
		
		//creating object for LoginDao. This class contains main logic of the application.
		LoginConnection loginConnection = new LoginConnection(); 
		//Calling authenticateUser function
		String userValidate = loginConnection.authenticateUser(loginInfo); 
		//If function returns success string then user will be rooted to Home page
		if(userValidate.equals("SUCCESS")) {
			System.out.println("logged in");
			//with setAttribute() you can define a "key" and value pair so that you can get it in future using getAttribute("key")
			request.setAttribute("userEmail", userEmail); 
			// create a session for user
			HttpSession session = request.getSession();
			//set a string session attribute
			session.setAttribute("userEmail", userEmail);
			//RequestDispatcher is used to send the control to the invoked page.
			request.getRequestDispatcher("index.jsp").forward(request, response);
			
		}
		else {
			//If authenticateUser() function returns other than SUCCESS string it will be sent to Login page again. Here the error message returned from function has been stored in a errMessage key.
			System.out.println("invalid");
			request.setAttribute("errMessage", userValidate); 
			//forwarding the request
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}
}