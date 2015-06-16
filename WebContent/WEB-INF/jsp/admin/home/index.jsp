<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@	page import="pojo.Thematic"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="dao.ThematicsDAO"%>

<html>
<head>
<title>Admin homepage</title>
<%@ include file="../../../layout/layout_admin/head.jsp"%>
</head>
<body class="skin-blue sidebar-mini">
	<div class="wrapper">
		<!-- sidebar -->
		<%@ include file="../../../layout/layout_admin/body_above.jsp"%>
		<!-- / -->
		<div class="content-wrapper">
			<!-- content header (site map) -->
			<section class="content-header">
				<h1>
					Dashboard <small>Control panel</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Dashboard</li>
				</ol>
			</section>

			<!--  / -->
			<!-- main content - bootstrap -->
			<section class="content">
				<div class="row">
					
				</div>
			</section>
		</div>
	</div>
	<!--  footer -->
	<%@ include file="../../../layout/layout_admin/footer.jsp"%>
	<!--  / -->
</body>
</html>