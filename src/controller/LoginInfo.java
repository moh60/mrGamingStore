package controller;

// stores user login information
public class LoginInfo {
	private String userID;
	private String userEmail;
	private String password;
	
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail (String userEmail) {
		this.userEmail = userEmail;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
}