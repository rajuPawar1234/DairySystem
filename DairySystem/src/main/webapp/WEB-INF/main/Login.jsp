<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
		<!-- Basic -->
		<meta charset="UTF-8">

		<meta name="keywords" content="HTML5 Admin Template" />
		<meta name="description" content="Porto Admin - Responsive HTML5 Template">
		<meta name="author" content="okler.net">

		<!-- Mobile Metas -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

		<!-- Web Fonts  -->
		<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css">

		<!-- Vendor CSS -->
		<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.css" />
		<link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.css" />
		<link rel="stylesheet" href="assets/vendor/magnific-popup/magnific-popup.css" />
		<link rel="stylesheet" href="assets/vendor/bootstrap-datepicker/css/datepicker3.css" />

		<!-- Theme CSS -->
		<link rel="stylesheet" href="assets/stylesheets/theme.css" />

		<!-- Skin CSS -->
		<link rel="stylesheet" href="assets/stylesheets/skins/default.css" />

		<!-- Theme Custom CSS -->
		<link rel="stylesheet" href="assets/stylesheets/theme-custom.css">

		<!-- Head Libs -->
		<script src="assets/vendor/modernizr/modernizr.js"></script>
	
</head>
<body>
<!-- start: page -->
		<section class="body-sign">
			<div class="center-sign">
				<h1 class="logo pull-left" style="font-family: cursive;">
					<!-- <img src="assets/images/logo13.png" height="60" alt="Porto Admin" /> -->
					DAIRY SYSTEM
				</h1>

				<div class="panel panel-sign">
					<div class="panel-title-sign mt-xl text-right">
						<h2 class="title text-uppercase text-bold m-none"><i class="fa fa-user mr-xs"></i> Sign In</h2>
					</div>
					<div class="panel-body">
						<form action="toHomePage" method="post">
							<div class="form-group mb-lg">
								<label>Username</label>
								<div class="input-group input-group-icon">
									<input name="username" type="text" class="form-control input-lg" value="Admin"/>
									<span class="input-group-addon">
										<span class="icon icon-lg">
											<i class="fa fa-user"></i>
										</span>
									</span>
								</div>
							</div>

							<div class="form-group mb-lg">
								<div class="clearfix">
									<label class="pull-left">Password</label>
									<a href="#" class="pull-right">Lost Password?</a>
								</div>
								<div class="input-group input-group-icon">
									<input name="password" type="password" id="" class="form-control input-lg" value="Admin"/>
									<span class="input-group-addon">
										<span class="icon icon-lg">
										    <!-- <i class="fa fa-lock" style="cursor: pointer;"></i> -->
											 <i onclick="onOneClick()" id="one" style="" class="ace-icon fa fa-eye" style="cursor: pointer;"></i>
											<i onclick="onTwoClick()" id="two" style="display:none;" class="ace-icon fa fa-eye-slash" style="cursor: pointer;"></i> 
										</span>
									</span>
								</div>
							</div>

							<div class="row">
								<div class="col-sm-8">
									<div class="checkbox-custom checkbox-default">
										<!-- <input id="RememberMe" name="rememberme" type="checkbox"/>
										<label for="RememberMe">Remember Me</label> -->
									</div>
								</div>
								<div class="col-sm-4 text-right">
									<button type="submit" class="btn btn-primary hidden-xs">Sign In</button>
									<button type="submit" class="btn btn-primary btn-block btn-lg visible-xs mt-lg">Sign In</button>
								</div>
							</div><br><span style="color: red;">${Message}</span><br>

							<!-- <p class="text-center">Don't have an account yet? <a href="pages-signup.html">Sign Up!</a> -->

						</form>
					</div>
				</div>

				<p class="text-center text-muted mt-md mb-md">&copy; Copyright 2020. All rights reserved. developed by <a href="#">Raju Pawar</a>.</p>
			</div>
		</section>
		
		<script>
		function onOneClick() {
			var x = document.getElementById("two");
			var y = document.getElementById("one");
			var z = document.getElementById("pwd");
			if (x.style.display === "none") {
				x.style.display = "block";
				y.style.display = "none";
				z.type = "text";
			} else {
				x.style.display = "none";
				y.style.display = "none";
				z.type = "password";
			}
		}
	</script>
	<script>
		function onTwoClick() {
			var x = document.getElementById("two");
			var y = document.getElementById("one");
			var z = document.getElementById("pwd");
			if (y.style.display === "none") {
				y.style.display = "block";
				x.style.display = "none";
				z.type = "password";
			} else {
				y.style.display = "none";
				x.style.display = "none";
				z.type = "text";
			}
		}
	</script>
		
		<!-- end: page -->

		<!-- Vendor -->
		<script src="assets/vendor/jquery/jquery.js"></script>
		<script src="assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
		<script src="assets/vendor/bootstrap/js/bootstrap.js"></script>
		<script src="assets/vendor/nanoscroller/nanoscroller.js"></script>
		<script src="assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
		<script src="assets/vendor/magnific-popup/magnific-popup.js"></script>
		<script src="assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>
		
		<!-- Theme Base, Components and Settings -->
		<script src="assets/javascripts/theme.js"></script>
		
		<!-- Theme Custom -->
		<script src="assets/javascripts/theme.custom.js"></script>
		
		<!-- Theme Initialization Files -->
		<script src="assets/javascripts/theme.init.js"></script>

	</body><!-- <img src="http://www.ten28.com/fref.jpg"> -->
</body>
</html>
