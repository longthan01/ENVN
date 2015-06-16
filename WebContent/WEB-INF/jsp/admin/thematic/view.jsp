<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@	page import="pojo.Thematic"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="dao.ThematicsDAO"%>
<%@ page import="dao.Entities"%>
<%@ page import="pojo.User"%>
<%@ page import="pojo.Employee"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="envn" uri="/WEB-INF/tags/DropdownTag.tld"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin homepage</title>
<%@ include file="../../../layout/layout_admin/head.jsp"%>
</head>
<body>
<body class="skin-blue sidebar-mini">
	<div class="wrapper">
		<%@ include file="../../../layout/layout_admin/body_above.jsp"%>
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
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3>Danh sách chuyên đề</h3>
							</div>
							<!-- /.panel-heading -->
							
							<div class="panel-body">
								<div class="dataTable_wrapper">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables">
										<thead>
											<tr>
												<th>Mã chuyên đề</th>
												<th>Tên chuyên đề</th>
												<th>Nhân viên quản lý</th>
												<th>Nội dung</th>
												<th>Giáo viên</th>
												<th>Tài liệu</th>
												<th>Mô tả</th>
											</tr>
										</thead>
										<tbody>

											<c:if test="${listThms != null}">
												<c:forEach var="t" items="${listThms}">
													<tr>
														<td>${t.getThematicId() }</td>
														<td>${t.getThematicName() }</td>
														<td>${t.getEmployee().getUser().getFullName() }</td>
														<td>${t.getContentDescription() }</td>
														<td>${t.getTrainers() }</td>
														<td>${t.getDocuments() }</td>
														<td>${t.getTinyDes() }
													</tr>
												</c:forEach>

											</c:if>

										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<%@ include file="../../../layout/layout_admin/footer.jsp"%>
</body>
</html>