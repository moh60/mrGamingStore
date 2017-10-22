<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/signup.css">
<script type="text/javascript" src="js/signup.js"></script>
<script>
</script>
<title>Sign Up</title>
</head>
<body>
<div class="signup">
	<div class="tabs">
		<ul class="tab-links">
	        <li class="active"><a href="#tab1">Account</a></li>
	        <li><a href="#tab2">Address</a></li>
	        <li><a href="#tab3">Payment</a></li>
	    </ul>
	        <div class="tab-content">	    
				<form name="form" action="SignUpServlet" method="post" onsubmit="return validate()">
					<div id="tab1" class="tab active">
						<input type="text" name="firstname" value="" size="25" maxlength="20" placeholder="First name" class="user-info"  />
						<input type="text" name="lastname" value="" size="25" maxlength="20" placeholder="Last name" class="user-info"  />
						<br/><input type="text" name="email" value="" size="25" maxlength="20" placeholder="Email" class="user-info" />
						<input type="password" name="password" value="" size="25" maxlength="20" placeholder="Password" class="user-info"  />
					</div>	
					<div id="tab2" class="tab">
						<input type="text" name="address1" value="" size="25" maxlength="20" placeholder="Address 1" class="user-addr"  />
					    <input type="textarea" name="address2" value="" size="25" maxlength="20" placeholder="Address 2" class="user-addr" />
						<br/><input type="text" name="city" value="" size="25" maxlength="20" placeholder="City" class="user-addr" />
						<input type="text" name="state" value="" size="25" maxlength="20" placeholder="State" class="user-addr" />			
						<br/><input type="text" name="zip" value="" size="25" maxlength="20" placeholder="Zip" class="user-addr"  />			
						<input type="text" name="country" size="25" maxlength="20" placeholder="Country" class="user-addr"  />
					</div>
					<div id="tab3" class="tab">
						<select name="credit_card_type" class="credit-type" id="credit-input">
    						<option value="" disabled selected>Select Credit Card Type</option>
					        <option value="master">Master Card</option>
					        <option value="visa">Visa</option>
					     </select><br/>
					    <input class="inputCard" type="text" placeholder="Cerdit Card Number" name="credit_card_number" maxlength="16" id="credit-input" /><br/>										
						<input type="text" placeholder="cvv" name="credit_card_cvv" size="3" maxlength="3" id="credit-input" />						
						<input class="inputCard" type="text" placeholder="mm" name="credit_card_expiry_month" size="4" maxlength="2" id="credit-input"/>
						<input class="inputCard" type="text" placeholder="yyyy" name="credit_card_expiry_year" size="4" maxlength="4" id="credit-input"/><br/>			
						
						<!-- submit sign up form -->
						<input type="submit" name="submit" value="Submit" class="btn btn-primary btn-lg submit-button" />						
					</div>
				</form>
		</div>
	</div>
</div>
</body>
</html>