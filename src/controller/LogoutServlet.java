package controller;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
// this class handles logging out and terminates the session
public class LogoutServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException	{ 
		//Fetch session object
		HttpSession session = request.getSession(); 
		//If session is not null
		if(session!=null) {
			System.out.println(session);
			//removes all session attributes bound to the session
			session.invalidate(); 
			request.setAttribute("errMessage", "You have logged out successfully");
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
			requestDispatcher.forward(request, response);
			System.out.println("Logged out");
		}
	}
}
