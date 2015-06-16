<%@page import="dao.PermissionsDAO"%>
<%@page import="pojo.Permission"%>
<%@page import="utils.StringUtils"%>
<%@page import="utils.CurrentContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="pojo.User"%>
<header class="main-header">
	<!-- Logo -->
	<a href="/ENVN/home/index" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
		<span class="logo-mini"><b>A</b>LT</span> <!-- logo for regular state and mobile devices -->
		<span class="logo-lg"><b>Về trang chủ</b></span>
	</a>
	<!-- Header Navbar: style can be found in header.less -->
	<nav class="navbar navbar-static-top" role="navigation">
		<!-- Sidebar toggle button-->
		<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
			role="button"> <span class="sr-only">Toggle navigation</span>
		</a>
		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
				<!-- Messages: style can be found in dropdown.less-->
				<li class="dropdown messages-menu"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <i
						class="fa fa-envelope-o"></i> <span class="label label-success">4</span>
				</a>
					<ul class="dropdown-menu">
						<li class="header">You have 4 messages</li>
						<li>
							<!-- inner menu: contains the actual data -->
							<ul class="menu">
								<!-- end message -->
							</ul>
						</li>
						<li class="footer"><a href="#">See All Messages</a></li>
					</ul></li>

				<!-- User Account: style can be found in dropdown.less -->

				<li class="dropdown user user-menu"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <img
						src="/ENVN/AdminLTE-2.1.1/dist/img/user2-160x160.jpg"
						class="user-image" alt="User Image" /> <span class="hidden-xs">Alexander
							Pierce</span>
				</a>
					<ul class="dropdown-menu">
						<!-- User image -->
						<li class="user-header"><img
							src="/ENVN/AdminLTE-2.1.1/dist/img/user2-160x160.jpg"
							class="img-circle" alt="User Image" />
							<p>
								Alexander Pierce - Web Developer <small>Member since
									Nov. 2012</small>
							</p></li>
						<!-- Menu Body -->
						<li class="user-body">
							<div class="col-xs-4 text-center">
								<a href="#">Followers</a>
							</div>
							<div class="col-xs-4 text-center">
								<a href="#">Sales</a>
							</div>
							<div class="col-xs-4 text-center">
								<a href="#">Friends</a>
							</div>
						</li>
						<!-- Menu Footer-->
						<li class="user-footer">
							<div class="pull-left">
								<a href="#" class="btn btn-default btn-flat">Profile</a>
							</div>
							<div class="pull-right">
								<a href="#" class="btn btn-default btn-flat">Sign out</a>
							</div>
						</li>
					</ul></li>
				<!-- Control Sidebar Toggle Button -->
				<li><a href="#" data-toggle="control-sidebar"><i
						class="fa fa-gears"></i></a></li>
			</ul>
		</div>
	</nav>
</header>
<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="pull-left image">
				<img src="/ENVN/AdminLTE-2.1.1/dist/img/user2-160x160.jpg"
					class="img-circle" alt="User Image" />
			</div>
			<div class="pull-left info">
				<p>
					<%
						User u = CurrentContext.getCurrentUser(request);
						if (u!=null)
						{
							out.print(StringUtils.upperFirstCase(u.getFullName()));
						}
					%>					
				</p>
				<a href="#"><i class="fa fa-circle text-success"></i>Online</a>
			</div>
		</div>
		<!-- search form -->
		<form action="#" method="get" class="sidebar-form">
			<div class="input-group">
				<input type="text" name="q" class="form-control"
					placeholder="Search..." /> <span class="input-group-btn">
					<button type='submit' name='search' id='search-btn'
						class="btn btn-flat">
						<i class="fa fa-search"></i>
					</button>
				</span>
			</div>
		</form>
		<!-- /.search form -->
		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">
			<li class="header">Main navigation</li>
			<%
				User user = CurrentContext.getCurrentUser(request);
				if (user.getPermission().getPermissionId() == PermissionsDAO.PERMISSION_CONTENT_ADMIN)
				{
					%>
						<%@ include file="./contentAdminFunction.jsp" %>
					<%
				}
				if (user.getPermission().getPermissionId() == PermissionsDAO.PERMISSION_WEB_ADMIN)
				{
					%>
						<%@ include file="./webAdminFunction.jsp" %>
					<%
				}
			%>
		</ul>
	</section>
	<!-- /.sidebar -->
</aside>