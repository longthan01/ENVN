<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin homepage</title>
<%@ include file="../../layout/layout_admin/head.jsp"%>
</head>
<body>
<body class="skin-blue sidebar-mini">
	<div class="wrapper">
		<%@ include file="../../layout/layout_admin/body_above.jsp"%>
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
	<%@ include file="../../layout/layout_admin/footer.jsp"%>
</body>
</html>