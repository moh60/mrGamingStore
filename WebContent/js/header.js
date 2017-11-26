window.onload = function() {
	var id = document.getElementById('id').value;
	if (id != "null") {
		// show menu 
		$('#menu-button').show();
	}
	var role = document.getElementById('role').value;
	if (role == "admin") {
		// show admin menu 
		$('#admin-button').show();
	}
};

