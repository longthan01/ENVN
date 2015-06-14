<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@	page import="pojo.Thematic"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="dao.ThematicsDAO"%>
<%@ page import="dao.Entities"%>
<%@ page import="pojo.User"%>
<%
	List<Thematic> listThematic = (List<Thematic>) request
	.getAttribute("listThematic");
%>
<html>
<head>
<title>Admin homepage</title>
<%@ include file="../../../layout/layout_admin/head.jsp"%>
<link
	href="/ENVN/AdminLTE-2.1.1/plugins/datatables/dataTables.bootstrap.css"
	rel="stylesheet" type="text/css" />
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
					<div class="col-lg-12"></div>
					<!-- /.col-lg-12 -->
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3>Danh sách nhân viên</h3>
							</div>
							<!-- /.panel-heading -->
							<button id="btnOpenAddModal" data-toggle="modal"
								data-target="#addEmployeeModal" class="btn btn-primary"
								style="margin-top: 16px; margin-left: 14px;">
								<i class="fa fa-plus-circle"></i>Add product
							</button>
							<div class="panel-body">
								<div class="dataTable_wrapper">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables">
										<thead>
											<tr>
												<th>Mã nhân viên</th>
												<th>Mã user</th>
												<th>Lương</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${listEmp != null }">
												<c:forEach var="emp" items="${listEmp}">
													<tr>
														<td>${emp.getEmployeeId()}</td>
														<td>${emp.getUserId()}</td>
														<td>${emp.getCoefficient()}</td>
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
	<div class="modal fade" id="addEmployeeModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">Add product</h4>
				</div>
				<div class="modal-body form-horizontal">
					<div class="form-group">

						<label for="TinyDes" class="col-sm-4 control-label">Tiny
							description:</label>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary" name="btnSubmit"
						id="btnSaveEdit" value="Update">Update</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!--  footer -->
	<%@ include file="../../../layout/layout_admin/footer.jsp"%>
	<!--  / -->
	<script type="text/javascript"
		src="/ENVN/AdminLTE-2.1.1/plugins/datatables/jquery.dataTables.min.js">
		
	</script>
	<script type="text/javascript"
		src="/ENVN/AdminLTE-2.1.1/plugins/datatables/dataTables.bootstrap.min.js">
	</script>

	<script>
		$(function() {
		$("#dataTables").dataTable();
		});
	</script>
</body>
</html>