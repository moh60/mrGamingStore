jQuery(document).ready(function() {
	jQuery('.tabs .tab-links a').on('click', function(e)  {
	    var currentAttrValue = jQuery(this).attr('href');
	 
	        // Show/Hide Tabs
	    jQuery('.tabs ' + currentAttrValue).show().siblings().hide();
	 
	        // Change/remove current tab to active
	    jQuery(this).parent('li').addClass('active').siblings().removeClass('active');
	 
	        e.preventDefault();
	});
});

function validate() { 
	var password = document.form.password.value; 
	var firstname = document.form.firstname.value;
	var lastname = document.form.lastname.value;
	if (password=="" || firstname=="" || lastname=="") { 
		document.form.password.focus();
		return false;
	} 
}

