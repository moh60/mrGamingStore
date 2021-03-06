package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.mail.smtp.SMTPMessage;

import model.temporaryChangeConnection;

//this class controlls the password change process
public class passwordChangeServlet extends HttpServlet {
	// doPost
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// GET user's email
		String userEmail = request.getParameter("email");
		String updatedUserPass = "";
		// object which contains user's information
		LoginInfo userInfo = new LoginInfo();
		userInfo.setUserEmail(userEmail);
		// creating model object for temporary user.
		temporaryChangeConnection temporaryUser = new temporaryChangeConnection();
		updatedUserPass = temporaryUser.createTemporaryUser(userInfo);
		String toEmail = userEmail;
		String subject = "Reset Password";
		String msg = "This is a one time temporary password, please change your password: " + updatedUserPass;
		Mail.sendEmail(toEmail, subject, msg);
		response.sendRedirect("index.jsp");
	}
}
