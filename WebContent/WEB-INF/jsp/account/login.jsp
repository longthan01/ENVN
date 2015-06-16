<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha"%>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link
	href="../login_form/assets/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="../login_form/assets/plugins/bootstrap/css/bootstrap-responsive.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="../login_form/assets/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<link href="../login_form/assets/css/style-metro.css" rel="stylesheet"
	type="text/css" />
<link href="../login_form/assets/css/style.css" rel="stylesheet"
	type="text/css" />
<link
	href="../bootstrap-datepicker-1.4.0-dist/css/bootstrap-datepicker3.standalone.min.css"
	rel="stylesheet" type="text/css" />
<link href="../login_form/assets/css/pages/login-soft.css"
	rel="stylesheet" type="text/css" />
<!--  google recaptcha -->
<!--  /google recaptcha -->
<link href="/ENVN/ENVN_Utils/Notify.css" rel="stylesheet" type="text/css"/>
</head>
<body class="login">
	<c:choose>
		<c:when test="${code == 'login' }">
			<input id="Hidden1" type="hidden" value="1" />
		</c:when>
		<c:when test="${code == 'regis' }">
			<input id="Hidden1" type="hidden" value="0" />
		</c:when>

	</c:choose>
	<!-- BEGIN LOGO -->
	<div class="logo" hidden="hidden">
		<!-- PUT YOUR LOGO HERE -->
	</div>
	<!-- END LOGO -->
	<!-- BEGIN LOGIN -->
	<div class="content" style="margin-top: 50px;">
		<!-- BEGIN LOGIN FORM -->
		<form class="form-vertical login-form" action="#" method="post">
			<h3 class="form-title">Login to your account</h3>
			<div class="alert alert-error hide">
				<button class="close" data-dismiss="alert"></button>
				<span>Enter any username and password.</span>
			</div>
			<div class="control-group">
				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				<label class="control-label visible-ie8 visible-ie9">Email</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-user"></i> <input class="m-wrap placeholder-no-fix"
							type="text" id="txtemail" placeholder="example@domain.com"
							name="uemail" />
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">Password</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-lock"></i> <input class="m-wrap placeholder-no-fix"
							type="password" id="txtpwd" autocomplete="off"
							placeholder="Password" name="upassword" />
					</div>
				</div>
			</div>
			<div class="form-actions">
				<label class="checkbox"> <input type="checkbox"
					name="remember" id="chkremember" value="0" /> Remember me
				</label>
				<button type="submit" class="btn blue pull-right" id="btnlogin">
					<img src="../Images/Icons/loading.gif" style="width: 17px;"
						hidden="hidden" id="loading1" /> Login <i
						class="m-icon-swapright m-icon-white"></i>
				</button>
			</div>
			<div class="forget-password">
				<h4>Forgot your password ?</h4>
				<p>
					No worries, click <a href="javascript:;" id="forget-password"
						style="color: darkblue;">here</a> to reset your password.
				</p>
			</div>
			<div class="create-account">
				<p>
					Don't have an account yet ?&nbsp;<a href="javascript:;"
						id="register-btn" style="color: darkblue;">Create an account</a>
				</p>
			</div>
		</form>
		<!-- END LOGIN FORM -->
		<!-- BEGIN FORGOT PASSWORD FORM -->
		<form class="form-vertical forget-form" action="#" method="post">
			<h3>Forget Password ?</h3>
			<p>Enter your e-mail address below to reset your password.</p>
			<div class="control-group">
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-envelope"></i> <input
							class="m-wrap placeholder-no-fix" type="text" placeholder="Email"
							autocomplete="off" name="semail" />
					</div>
				</div>
			</div>
			<div class="form-actions">
				<button type="button" id="back-btn" class="btn">
					<i class="m-icon-swapleft"></i>Back
				</button>
				<button type="submit" class="btn blue pull-right">
					Submit <i class="m-icon-swapright m-icon-white"></i>
				</button>
			</div>
		</form>
		<!-- END FORGOT PASSWORD FORM -->
		<!-- BEGIN REGISTRATION FORM -->
		<form class="form-vertical register-form" action="#"
			style="margin-top: 0px;">
			<h3>Sign Up</h3>
			<p>Enter your account details below:</p>
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">Email</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-user"></i> <input class="m-wrap placeholder-no-fix"
							type="text" id="register_email" autocomplete="on"
							placeholder="Email" name="useremail" />
					</div>
					<span id="emailexists" style="color: red;" hidden="hidden">Email
						already exists, please choose another.</span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">Password</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-lock"></i> <input class="m-wrap placeholder-no-fix"
							type="password" autocomplete="off" id="register_password"
							placeholder="Password" name="userpassword" />
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">Re-type
					Your Password</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-ok"></i> <input class="m-wrap placeholder-no-fix"
							type="password" id="register_retype_password" autocomplete="off"
							placeholder="Re-type Your Password" name="rpassword" />
					</div>
				</div>
			</div>

			<p>Enter your personal details below:</p>
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">Full
					Name</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-font"></i> <input class="m-wrap placeholder-no-fix"
							type="text" id="register_fullname" placeholder="Full Name"
							name="userfullname" />
					</div>
				</div>
			</div>
			<div class="control-group">
				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				<label class="control-label visible-ie8 visible-ie9">Date of
					birth</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-calendar"></i> <input
							class="m-wrap placeholder-no-fix" id="register_dob" type="text"
							placeholder="Date of birth" name="userdob" />
					</div>
				</div>
			</div>
			<div class="control-group">
				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				<label class="control-label visible-ie8 visible-ie9">Date of
					birth</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-road"></i> <input class="m-wrap placeholder-no-fix"
							id="register_addr" type="text" placeholder="Address"
							name="useraddr" />
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">Phone
					number</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-phone"></i> <input
							class="m-wrap placeholder-no-fix" type="text" id="register_phone"
							placeholder="Phone number" name="userphoneno" />
					</div>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<%
						ReCaptcha c = ReCaptchaFactory.newReCaptcha(
								"6Lc7_wcTAAAAAFfHzAFqbeWPHy8dG-pPJ9FWtWGH",
								"6Lc7_wcTAAAAAMDq0gLl0dK5J5bWC3oVVNU7f8Z2", false);
						out.print(c.createRecaptchaHtml(null, null));
					%>
					<span id="captchaerr" hidden="hidden" style="color: red;">Invalid
						captcha code.</span>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<label class="checkbox"> <input type="checkbox" name="tnc"
						checked="checked" /> I agree to the <a href="#">Terms of
							Service</a> and <a href="#">Privacy Policy</a>
					</label>
					<div id="register_tnc_error"></div>
				</div>
			</div>
			<div class="form-actions">
				<button id="register-back-btn" type="button" class="btn">
					<i class="m-icon-swapleft"></i>Back
				</button>
				<button type="submit" id="register-submit-btn"
					class="btn green pull-right">
					<img src="<c:url value="/Images/Icons/loading.gif" />"
						style="width: 20px;" hidden="hidden" id="loading2" /> Sign Up <i
						class="m-icon-swapright m-icon-white"></i>
				</button>
			</div>

		</form>
		<!-- END REGISTRATION FORM -->
	</div>
	<!-- END LOGIN -->
	<div class="modal fade" id="regissuccessmodal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body form-horizontal">
					<div class="form-group">
						<label class="col-sm-12" style="font-size: 16px;"> Chúc
							mừng bạn đã đăng ký thành công, email của bạn là: <a href="#"
							id="successmail"></a> <br /> mời <a href="@Url.Action("
							Index", "Account", new { id=1})">đăng nhập</a> và tận hưởng tiệc
							rượu cùng chúng tôi. hoặc bấm Close để quay về trang chủ.
						</label>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						id="btncloseregis">Close</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- BEGIN COPYRIGHT -->

	<!-- END COPYRIGHT -->
	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
	<!-- BEGIN CORE PLUGINS -->
	<script src="../login_form/assets/plugins/jquery-1.10.1.min.js"
		type="text/javascript"></script>
	<script
		src="../login_form/assets/plugins/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<script
		src="../login_form/assets/plugins/jquery-validation/dist/jquery.validate.min.js"
		type="text/javascript"></script>
	<script
		src="../login_form/assets/plugins/backstretch/jquery.backstretch.min.js"
		type="text/javascript"></script>
	<script
		src="../bootstrap-datepicker-1.4.0-dist/js/bootstrap-datepicker.min.js"></script>
	<script src="../login_form/assets/scripts/login-soft.js"
		type="text/javascript"></script>
	<script type="text/javascript"
		src="<c:url value="/ENVN_Utils/Login_regis.js"/>">
		
	</script> 
	<script type="text/javascript" src="/ENVN/ENVN_Utils/Notify.js">
	</script>
	<script>
		var context = "${pageContext.request.contextPath}";
		$('#register_dob').datepicker({
			todayBtn : "linked",
			format : "dd/mm/yyyy",
			autoclose : true,
		});
		jQuery(document).ready(function() {

		Login1.init();

		$("#btncloseregis").click(function() {
		location.href = "/Home/Index";
		});
		$("#chkremember").change(function() {
		this.value = this.checked ? 1 : 0;
		});
		$('#txtemail').focus();
		});

		function islog() {
		var log = document.getElementById("Hidden1").value;
		if (log == 0) {
			jQuery('.login-form').hide();
			jQuery('.register-form').show();
		}
		}
		window.onload = islog;
	</script>
	<!-- END JAVASCRIPTS -->
</body>
</html>