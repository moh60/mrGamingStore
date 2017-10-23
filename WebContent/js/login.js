function validate() { 
	var email = document.form.email.value; 
	var password = document.form.password.value;	
    var emailRegex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	var emailValidation = emailRegex.test(email);
	
	if (email==null || email=="" || emailValidation==false) { 
		$('#user-email').attr('style', "border-bottom:1px solid red;");		
		return false; 
	}
	else if(password==null || password=="") { 
		$('#user-password').attr('style', "border-bottom:1px solid red;");
		return false; 
	} 
}