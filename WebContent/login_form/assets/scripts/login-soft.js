var Login1 = function () {

	var handleLogin = function() {
		$('.login-form').validate({
	            errorElement: 'label', //default input error message container
	            errorClass: 'help-inline', // default input error message class
	            focusInvalid: false, // do not focus the last invalid input
	            rules: {
	                uemail: {
	                    required: true,
                        email: true
	                },
	                password: {
	                    required: true,
	                    minlength: 8
	                },
	                remember: {
	                    required: false
	                }
	            },

	            messages: {
	                uemail: {
	                    required: "Email is required.",
	                    email: "Invalid email address."
	                },
	                password: {
	                    required: "Password is required.",
                        minlength: "Password must be over than 8 characters."
	                }
	            },

	            invalidHandler: function (event, validator) { //display error alert on form submit   
	                $('.alert-error', $('.login-form')).show();
	            },

	            highlight: function (element) { // hightlight error inputs
	                $(element)
	                    .closest('.control-group').addClass('error'); // set error class to the control group
	            },

	            success: function (label) {
	                label.closest('.control-group').removeClass('error');
	                label.remove();
	            },

	            errorPlacement: function (error, element) {
	                error.addClass('help-small no-left-padding').insertAfter(element.closest('.input-icon'));
	            }

	            //submitHandler: function (form) {
	            //    form.submit();
	            //}
	        });

	        $('.login-form input').keypress(function (e) {
	            if (e.which == 13) {
	                if ($('.login-form').validate().form()) {
	                    $('.login-form').submit();
	                }
	                return false;
	            }
	        });
	}

	var handleForgetPassword = function () {
		$('.forget-form').validate({
	            errorElement: 'label', //default input error message container
	            errorClass: 'help-inline', // default input error message class
	            focusInvalid: false, // do not focus the last invalid input
	            ignore: "",
	            rules: {
	                semail: {
	                    required: true,
	                    email: true
	                }
	            },

	            messages: {
	                semail: {
	                    required: "Email is required."
	                }
	            },

	            invalidHandler: function (event, validator) { //display error alert on form submit   

	            },

	            highlight: function (element) { // hightlight error inputs
	                $(element)
	                    .closest('.control-group').addClass('error'); // set error class to the control group
	            },

	            success: function (label) {
	                label.closest('.control-group').removeClass('error');
	                label.remove();
	            },

	            errorPlacement: function (error, element) {
	                error.addClass('help-small no-left-padding').insertAfter(element.closest('.input-icon'));
	            }

	            //submitHandler: function (form) {
	            //    form.submit();
	            //}
	        });

	        $('.forget-form input').keypress(function (e) {
	            if (e.which == 13) {
	                if ($('.forget-form').validate().form()) {
	                    $('.forget-form').submit();
	                }
	                return false;
	            }
	        });

	        jQuery('#forget-password').click(function () {
	            jQuery('.login-form').hide();
	            jQuery('.forget-form').show();
	        });

	        jQuery('#back-btn').click(function () {
	            jQuery('.login-form').show();
	            jQuery('.forget-form').hide();
	        });

	}   
    return {
        //main function to initiate the module
        init: function () {
        	
            handleLogin();
            handleForgetPassword();    
            $.backstretch([
		        "/login_form/assets/img/bg/1.jpg",
		        "/login_form/assets/img/bg/2.jpg",
		        "/login_form/assets/img/bg/3.jpg",
		        "/login_form/assets/img/bg/4.jpg"
		        ], {
		          fade: 1000,
		          duration: 8000
		    });
	       
        }

    };

}(jQuery);