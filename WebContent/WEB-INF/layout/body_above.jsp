<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="header_bg">
	<div class="container">
		<div style="float: right;">
			<c:choose>
			<c:when test="${user != null && user.getPermission().getPermissionId() > 0}">
					<strong>
						<a href="../user/profile"
							style="font-size: 14px; color: black;"> Xin chào <c:out
									value="${user.getFullName()}"></c:out>
						</a> |
						<a href="../admin/home/index"
							style="font-size: 14px; color: black;">Quản lý website
						</a> |
						<a href="" onclick="logout();"
							style="font-size: 14px; color: black;"> Đăng xuất </a>
					</strong>
				</c:when>
				<c:when test="${user != null}">
					<strong>
						<a href="../user/profile"
							style="font-size: 14px; color: black;"> Xin chào <c:out
									value="${user.getFullName()}"></c:out>
						</a> |
						<a href="" onclick="logout();"
							style="font-size: 14px; color: black;"> Đăng xuất </a>
					</strong>
				</c:when>
				<c:when test="${user == null }">
					<strong><a href="../account/login?flag=1"
						style="font-size: 14px; color: black;"> Đăng nhập </a>
						
						</strong>
						|
						<strong><a href="../account/login?flag=2"
						style="font-size: 14px; color: black;"> Đăng ký </a></strong>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>

		</div>
		<div class="row header">
			<a href="/dang-ky-hoc-thu-mien-phi" id="register-button"> Đăng Ký
				Học Thử Miễn Phí </a>
			<div class="logo navbar-left">
				<h1>
					<a href="/ENVN/home/index">Hội anh văn ENVN</a>
				</h1>
			</div>
			<div class="h_search navbar-right">
				<form>
					<input type="text" class="text" placeholder="Tìm kiếm"> <input
						type="submit" value="Tìm kiếm">
				</form>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<div class="container">
	<div class="row h_menu">
		<nav class="navbar navbar-default navbar-left" role="navigation">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="/ENVN/home/index">Trang chủ</a></li>
					<li><a href="/ENVN/Info/about_us">Giới thiệu</a></li>
					<li><a href="/ENVN/Course/index">Khoá học</a></li>
					<li><a href="#">Thư viện</a></li>
					<li><a href="#">Liên hệ</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
			<!-- start soc_icons -->
		</nav>
		<div class="soc_icons navbar-right">
			<ul class="list-unstyled text-center">
				<li><a href="#"><i class="fa fa-twitter"></i></a></li>
				<li><a href="#"><i class="fa fa-facebook"></i></a></li>
				<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
				<li><a href="#"><i class="fa fa-youtube"></i></a></li>
				<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
			</ul>
		</div>
	</div>
</div>

<div class="slider_bg">
	<!-- start slider -->
	<div class="container">
		<div id="da-slider" class="da-slider text-center">
			<div class="da-slide">
				<h2>education portal</h2>
				<p>
					Lorem Ipsum is simply dummy text of the printing and typesetting
					industry.<span class="hide_text"> Lorem Ipsum has been the
						industry's standard dummy text ever since the 1500s, when an
						unknown printer took a galley of type and scrambled it to make a
						type specimen book.</span>
				</p>
				<h3 class="da-link">
					<a href="single-page.html" class="fa-btn btn-1 btn-1e">Xem thêm</a>
				</h3>
			</div>
			<div class="da-slide">
				<h2>online educations</h2>
				<p>
					Lorem Ipsum is simply dummy text of the printing and typesetting
					industry.<span class="hide_text">Lorem Ipsum has been the
						industry's standard dummy text ever since the 1500s, when an
						unknown printer took a galley of type and scrambled it to make a
						type specimen book.</span>
				</p>
				<h3 class="da-link">
					<a href="single-page.html" class="fa-btn btn-1 btn-1e">Xem thêm</a>
				</h3>
			</div>
			<div class="da-slide">
				<h2>education portal</h2>
				<p>
					Lorem Ipsum is simply dummy text of the printing and typesetting
					industry.<span class="hide_text"> Lorem Ipsum has been the
						industry's standard dummy text ever since the 1500s, when an
						unknown printer took a galley of type and scrambled it to make a
						type specimen book.</span>
				</p>
				<h3 class="da-link">
					<a href="single-page.html" class="fa-btn btn-1 btn-1e">Xem thêm</a>
				</h3>
			</div>
			<div class="da-slide">
				<h2>online educations</h2>
				<p>
					Lorem Ipsum is simply dummy text of the printing and typesetting
					industry.<span class="hide_text"> Lorem Ipsum has been the
						industry's standard dummy text ever since the 1500s, when an
						unknown printer took a galley of type and scrambled it to make a
						type specimen book.</span>
				</p>
				<h3 class="da-link">
					<a href="single-page.html" class="fa-btn btn-1 btn-1e">Xem thêm</a>
				</h3>
			</div>
		</div>
	</div>
</div>
<!-- end slider -->
