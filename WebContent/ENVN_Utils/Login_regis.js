var Login1 = function() {
var handleLogin = function() {
$('.login-form').validate(
		{
			errorElement : 'label', // default input error
			// message container
			errorClass : 'help-inline', // default input error
			// message class
			focusInvalid : false, // do not focus the last
			// invalid input
			rules : {
				uemail : {
					required : true,
					email : true
				},
				upassword : {
					required : true,
					minlength : 6
				},
				remember : {
					required : false
				}
			},

			messages : {
				uemail : {
					required : "Email is required.",
					email : "Invalid email address."
				},
				upassword : {
					required : "Password is required.",
					minlength : "Password must be over than 6 characters."
				}
			},

			invalidHandler : function(event, validator) { // display
			// error
			// alert on form
			// submit
			$('.alert-error', $('.login-form')).show();
			},

			highlight : function(element) { // hightlight error
			// inputs
			$(element).closest('.control-group').addClass('error'); // set error

			},

			success : function(label) {
			label.closest('.control-group').removeClass('error');
			label.remove();
			},

			errorPlacement : function(error, element) {
			error.addClass('help-small no-left-padding').insertAfter(
					element.closest('.input-icon'));
			},

			submitHandler : function(form) {
			$("#loading1").show();
			$.ajax({
				url : context + "/account/trylogin",
				type : "GET",
				/*
				 * headers: { Accept : "application/json; charset=utf-8", },
				 */
				data : {
					email : document.getElementById("txtemail").value,
					pwd : document.getElementById("txtpwd").value,
					isRemember : document.getElementById("chkremember").value
				},
				dataType : 'json',
				contentType : "application/json; charset=utf-8",
				beforeSend : function() {

				},
				success : function(loginSuccess) {
				$("#loading1").hide();
				if (loginSuccess.code == 1) {
				  notify("Đăng nhập thành công!", "success");
				  setTimeout(function(){
            location.href = "/ENVN/home/index";
          }, 1500);
				} else {
				    notify(loginSuccess.details, "error");
				  }
				},
				error : function(req, status, err) {
				console.log('Something went wrong', status, err);
				}
			});
			}
		});

$('.login-form input').keypress(function(e) {
if (e.which == 13) {
	if ($('.login-form').validate().form()) {
		$('.login-form').submit();
	}
	return false;
}
});
}

var handleForgetPassword = function() {
$('.forget-form').validate(
		{
			errorElement : 'label', // default input error message
			// container
			errorClass : 'help-inline', // default input error message
			// class
			focusInvalid : false, // do not focus the last invalid
			// input
			ignore : "",
			rules : {
				semail : {
					required : true,
					email : true
				}
			},

			messages : {
				semail : {
					required : "Email is required."
				}
			},

			invalidHandler : function(event, validator) { // display
			// error
			// alert on form
			// submit

			},

			highlight : function(element) { // hightlight error inputs
			$(element).closest('.control-group').addClass('error'); // set
			// error
			// class to
			// the
			// control
			// group
			},

			success : function(label) {
			label.closest('.control-group').removeClass('error');
			label.remove();
			},

			errorPlacement : function(error, element) {
			error.addClass('help-small no-left-padding').insertAfter(
					element.closest('.input-icon'));
			}

		// submitHandler: function (form) {
		// form.submit();
		// }
		});

$('.forget-form input').keypress(function(e) {
if (e.which == 13) {
	if ($('.forget-form').validate().form()) {
		$('.forget-form').submit();
	}
	return false;
}
});

jQuery('#forget-password').click(function() {
jQuery('.login-form').hide();
jQuery('.forget-form').show();
});

jQuery('#back-btn').click(function() {
jQuery('.login-form').show();
jQuery('.forget-form').hide();
});

}

var handleRegister = function() {

function format(state) {
if (!state.id)
	return state.text; // optgroup
return "<img class='flag' src='assets/img/flags/" + state.id.toLowerCase()
		+ ".png'/>&nbsp;&nbsp;" + state.text;
}

$('.register-form')
		.validate(
				{
					errorElement : 'label', // default input error
					// message container
					errorClass : 'help-inline', // default input error
					// message class
					focusInvalid : false, // do not focus the last
					// invalid input
					ignore : "",
					rules : {

						userfullname : {
							required : true
						},
						useremail : {
							required : true,
							email : true
						},
						userpassword : {
							required : true,
							minlength : 6
						},
						rpassword : {
							equalTo : "#register_password"
						},
						userdob : {
							required : true
						},
						useraddr : {
							required : true
						},
						userphoneno : {
							required : true,
							maxlength : 11
						},
						tnc : {
							required : true
						}
					},

					messages : {
						tnc : {
							required : "Please accept TNC first."
						}
					},

					invalidHandler : function(event, validator) { // display
					// error
					// alert on form
					// submit

					},

					highlight : function(element) { // hightlight error
					// inputs
					$(element).closest('.control-group').addClass('error'); // set
					// error
					// class to
					// the
					// control
					// group
					},

					success : function(label) {
					label.closest('.control-group').removeClass('error');
					label.remove();
					},

					errorPlacement : function(error, element) {
					if (element.attr("name") == "tnc") { // insert
						// checkbox
						// errors after the
						// container
						error.addClass('help-small no-left-padding')
								.insertAfter($('#register_tnc_error'));
					} else if (element.closest('.input-icon').size() === 1) {
						error.addClass('help-small no-left-padding')
								.insertAfter(element.closest('.input-icon'));
					} else {
						error.addClass('help-small no-left-padding')
								.insertAfter(element);
					}
					},

					submitHandler : function(form) {
					$("#loading2").show();
					document.getElementById("captchaerr").hidden = "hidden";
					$("#emailexists").hide();
					$.ajax({
								url : context + "/account/tryregis",
								type : 'GET',
								data : {
									email : document
											.getElementById("register_email").value,
									pwd : document
											.getElementById("register_password").value,
									fullName : document
											.getElementById("register_fullname").value,
									dob : document
											.getElementById("register_dob").value,
									addr : document
											.getElementById("register_addr").value,
									phoneNumber : document
											.getElementById("register_phone").value,
									recaptcha_challenge_field : document
											.getElementById("recaptcha_challenge_field").value,
									recaptcha_response_field : document
											.getElementById("recaptcha_response_field").value,
								},
								dataType : 'json',
								contentType : "application/json; charset=utf-8",
								beforeSend : function() {

								},
								success : function(resp) {
								$('#loading2').hide();
								if (resp.code < 1) {
									if (resp.code == -1) {
										document.getElementById("emailexists").hidden = "";
									}
									if (resp.code == -2) {
										document.getElementById("captchaerr").hidden = "";
									}

									alert(resp.details);
								} else {
									alert("Regis successfully.");
								}
								},
								error : function(req, status, err) {
								console.log(err + status);
								}
							});
					}
				});

$('.register-form input').keypress(function(e) {
if (e.which == 13) {
	if ($('.register-form').validate().form()) {
		$('.register-form').submit();
	}
	return false;
}
});

jQuery('#register-btn').click(function() {
jQuery('.login-form').hide();
jQuery('.register-form').show();
});

jQuery('#register-back-btn').click(function() {
jQuery('.login-form').show();
jQuery('.register-form').hide();
});
}

return {
	// main function to initiate the module
	init : function() {

	handleLogin();
	handleForgetPassword();
	handleRegister();
	$.backstretch([
			"/ENVN/Images/Banner/baner1.jpg", "/ENVN/Images/Banner/baner2.jpg",
			"/ENVN/Images/Banner/baner3.jpg",
			"/ENVN/Images/Banner/banner4.jpg",
	], {
		fade : 1000,
		duration : 8000
	});

	}

};

}(jQuery);
