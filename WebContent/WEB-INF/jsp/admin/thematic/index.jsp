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
												<th></th>
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
														<td><button 
																class="btn btn-primary" type="button" id="btnEdit${t.getThematicId()}">
																<i class="fa fa-edit"></i>
															</button></td>
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
	<input type="hidden" id="hden1" />
	<div class="modal fade" id="editThematicModal" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">Chỉnh sửa chuyên đề</h4>
					</div>
					<div class="modal-body form-horizontal">
						<div class="form-group">
							<label for="txtcontent" class="col-sm-2 control-label">Nội dung</label>
							<div class="col-sm-4" style="padding-bottom: 5px;">
								<input class="form-control" name="txtcontent" id="txtcontent" />
							</div>
							<label for="txttrainers" class="col-sm-2 control-label">Giáo viên</label>
							<div class="col-sm-4" style="padding-bottom: 5px;">	
							<input class="form-control" name="txttrainers" id="txttrainers" />						
							</div>
							
							<label for="txtdocuments" class="col-sm-2 control-label">Giáo viên</label>
							<div class="col-sm-4" style="padding-bottom: 5px;">	
							<input class="form-control" name="txtdocuments" id="txtdocuments" />						
							</div>
							<label for="txtdes" class="col-sm-2 control-label">Giáo viên</label>
							<div class="col-sm-4" style="padding-bottom: 5px;">	
							<input class="form-control" name="txtdes" id="txtdes" />						
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
						<button type="submit" class="btn btn-primary" id="btnSaveEdit">Lưu</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
	<%@ include file="../../../layout/layout_admin/footer.jsp"%>
	<script>
	jQuery(document).ready(function() {
    var tbl =  $("#dataTables").dataTable();

    $('#dataTables tbody').on('click', 'button[id*="btnEdit"]', function (e) {
    	var row = $(this).parents("tr").index();
    	var thmid = tbl.fnGetData(row, 0);
    	document.getElementById("hden1").value = thmid;
    	document.getElementById("txtsalaryedit").value = salary;
    	$('#editThematicModal').modal('show');
      });
	});
	</script>
</body>
</html>