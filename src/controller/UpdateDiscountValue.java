package controller;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.SignUpConnection;

// this class controlls user update profile process
public class UpdateDiscountValue extends HttpServlet {
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// GET game information
		int discountValue = Integer.parseInt(request.getParameter("discount_value"));
		// object which contains new game information
		SignUpInfo discountInfo = new SignUpInfo(); 
		//setting user's sign up info to store in DB
		discountInfo.setDiscountValue(discountValue);
		SignUpConnection discount = new SignUpConnection(); 
		String updatedDiscount = discount.updateDiscountValue(discountInfo);
		if(updatedDiscount.equals("SUCCESS")) {
			System.out.println("Updated discount value");
			response.sendRedirect("index.jsp");
		}
		else {
			System.out.println("Error while updating discount value");
		}
	}
}
