<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@	page import="pojo.Thematic"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator" %>
<%@ page import="dao.ThematicsDAO"%>
<%@ page import="dao.Entities"%>
<%@ page import="pojo.User"%>
<%@ page import="pojo.Employee"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="envn" uri="/WEB-INF/tags/DropdownTag.tld"%>
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
								<i class="fa fa-plus-circle"></i>Thêm nhân viên
							</button>
							<div class="panel-body">
								<div class="dataTable_wrapper">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables">
										<thead>
											<tr>
												<th>Mã nhân viên</th>
												<th>Mã user</th>
												<th>Email</th>
												<th>Tên nhân viên</th>
												<th>Chuyên đề phụ trách</th>
												<th>Lương</th>
												<th></th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<%																																																																																											
												List<Employee> listEmployees = (List<Employee>)request.getAttribute("listEmp");
												if (listEmployees != null)
												{
													for(Employee emp : listEmployees)
													{
														%>
														<tr>
														<td><% out.print(emp.getEmployeeId()); %></td>
														<td><% out.print(emp.getUser().getUserId()); %></td>
														<td><% out.print(emp.getUser().getEmail());%></td>
														<td><% out.print(emp.getUser().getFullName()); %></td>
														<% 
															Iterator iter = emp.getThematics().iterator();
															if (iter.hasNext())
															{
																%>
																<td>
																<select class="form-control">
																<%
																while (iter.hasNext())
																{
																	Thematic tm = (Thematic)iter.next(); 
																	%>
																		<option><% out.print(tm.getThematicName());%></option>
																	<%
																}
																%>
																</select>
																</td>
																<%
																
															}
															else
															{
																%>
																<td></td>
																<%
															}
														%>
														<td><%out.print(emp.getCoefficient()); %></td>																							
														<td><button 
																class="btn btn-primary" type="button" id="btnEdit${emp.getEmployeeId() }">
																<i class="fa fa-edit"></i>
															</button></td>
														<td><button
																class="btn btn-danger" type="button" id="btnRemove${emp.getEmployeeId() }">
																<i class="fa fa-remove"></i>
														</button></td>
													</tr>
														<%
														
													}
												}
											 %>
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
	<form id="frmAddEmp" action="#">
		<div class="modal fade" id="addEmployeeModal" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">Thêm nhân viên</h4>
					</div>
					<div class="modal-body form-horizontal">
						<div class="form-group">
							<label for="email" class="col-sm-2 control-label">Email</label>
							<div class="col-sm-4" name="email" style="padding-bottom: 5px;">
								<input class="form-control" id="txtemail" name="txtemail" />
							</div>
							<label for="pwd" class="col-sm-2 control-label">Mật khẩu</label>
							<div class="col-sm-4" name="pwd" style="padding-bottom: 5px;">
								<input class="form-control" id="txtpwd" name="txtpwd" />
							</div>

							<label for="slary" class="col-sm-2 control-label">Lương</label>
							<div class="col-sm-4" style="padding-bottom: 5px;">
								<input class="form-control" name="txtsalary" id="txtsalary" />
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
						<button type="submit" class="btn btn-primary" id="btnSave">Thêm</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
	</form>
	<input type="hidden" id="hden1" />
	<form id="frmEditEmp" action="#">
		<div class="modal fade" id="editEmployeeModal" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">Thêm nhân viên</h4>
					</div>
					<div class="modal-body form-horizontal">
						<div class="form-group">
							<label for="slary" class="col-sm-2 control-label">Lương</label>
							<div class="col-sm-4" style="padding-bottom: 5px;">
								<input class="form-control" name="txtsalaryedit" id="txtsalaryedit" />
							</div>
							<label for="slary" class="col-sm-2 control-label">Chuyên đề</label>
							<div class="col-sm-4" style="padding-bottom: 5px;">
							<select class="form-control" id="cbxthematic">
								<%
									
									Entities ctx = new Entities();
									List<Thematic> list = ctx.getThematics().toList();
									if (list.isEmpty())
									{
										out.print("<option value='0'>Không có chuyên đề trống</option>");
									}
									else
									{
										out.print("<option value='0'>Chọn 1 chuyên đề</option>");
										for(Thematic thm : list)
										{
											if (thm.getEmployee() != null)
											{
												out.print("<option disabled value='" + thm.getThematicId() + "'>");
												out.print(thm.getThematicName());
												out.print("(Đã có quản lý)</option>");
											}
											else
											{
												out.print("<option value='" + thm.getThematicId() + "'>");
												out.print(thm.getThematicName());
												out.print("</option>");
											}
										}
									}
								%>
								</select>
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
	</form>
	<!--  footer -->
	<%@ include file="../../../layout/layout_admin/footer.jsp"%>
	<!--  / -->
	
	<script>
    jQuery(document).ready(function() {
      var tbl =  $("#dataTables").dataTable();
      
      $('#dataTables tbody').on('click', 'button[id*="btnEdit"]', function (e) {
    	var row = $(this).parents("tr").index();
    	var data = tbl.fnGetData(row, 0);
    	var salary = tbl.fnGetData(row,5);
    	document.getElementById("hden1").value = data;

    	document.getElementById("txtsalaryedit").value = salary;
    	$('#editEmployeeModal').modal('show');
      });
      
      $('#dataTables tbody').on('click', 'button[id*="btnRemove"]', function (e) {
	      	var row = $(this).parents("tr").index();
	      	var data = tbl.fnGetData(row, 0);
	      	document.getElementById("hden1").value = data;
			var email = tbl.fnGetData(row,2);
	      	 swal({
	           title: "Are you sure?",
	           text: "You will not be able to recover this user on database!",
	           type: "warning",
	           showCancelButton: true,
	           confirmButtonColor: "#DD6B55",
	           confirmButtonText: "Yes, delete it!",
	           cancelButtonText: "No, cancel!",
	           closeOnConfirm: true,
	           closeOnCancel: true
	       },
	       function () {
	           $.ajax(
	           {
	               url: context + '/admin/employee/removeEmp',
	               type: "GET",
	               data: {empId: document.getElementById("hden1").value},
	               contentType: "application/json; charset=utf-8",
	               dataType: "json",
	               success: function (result) {
	                 if (result.code > 0) {
	                   notify("Xóa thành nhân viên " + email + " thành công", "success");
	                   setTimeout(function() {
	                     location.href = context + "/admin/employee/index";
	                   }, 1100);
	                 } else {
	                   	notify(result.details, "error");
	                   }
	               },
	               error: function (data) { alert(data.error); }
	           });
	       });
        });
      //*****************//

      $("#frmEditEmp").validate({
        errorElement: 'span',    
        errorClass: 'validate-error', 
        focusInvalid: false, 
        rules: {
          txtsalaryedit: {
            required: false,
            number: true,
            max: 1000000000,
            min: 1
          }
        },
        submitHandler: function() {
          $.ajax({
            url: context + "/admin/employee/updateEmp",
            type: "GET",
            data: {
              empId: document.getElementById("hden1").value,
              salary: document.getElementById("txtsalaryedit").value,
              thematicId: document.getElementById("cbxthematic").value
            },
            dataType: 'json',
            contentType: "application/json; charset=utf-8",
            beforeSend: function() {

            },
            success: function(result) {
              if (result.code > 0) {
                notify("Cập nhật thành công!", "success");
                setTimeout(function() {
                  location.href = context + "/admin/employee/index";
                }, 1100);
              } else {
                	notify(result.details, "error");
                }
            },
            error: function(req, status, err) {
              console.log('Something went wrong', status, err);
            }
          });
        }
      });
      
      $("#frmAddEmp").validate({
        errorElement: 'span', // default input error
        // message container
        errorClass: 'validate-error', // default input error
        // message class
        focusInvalid: false, // do not focus the last invalid input
        rules: {
          txtemail: {
            required: true,
            email: true
          },
          txtpwd: {
            required: true,
            minlength: 6
          },
          txtsalary: {
            required: false,
            number: true,
            max: 1000000000,
            min: 1
          }
        },

        messages: {
          txtemail: {
            required: "Email is required.",
            email: "Invalid email address."
          },
          txtpwd: {
            required: "Password is required.",
            minlength: "Password must be over than 6 characters."
          }
        },
        submitHandler: function() {
          $.ajax({
            url: context + "/admin/employee/add",
            type: "GET",
            data: {
              usrEmail: document.getElementById("txtemail").value,
              usrPwd: document.getElementById("txtpwd").value,
              salary: document.getElementById("txtsalary").value
            },
            dataType: 'json',
            contentType: "application/json; charset=utf-8",
            beforeSend: function() {

            },
            success: function(result) {
              if (result.code > 0) {
                notify("Thêm nhân viên thành công!", "success");
                setTimeout(function() {
                  location.href = context + "/admin/employee/index";
                }, 1100);
              } else {
                if (result.code == -1) {
                  $("#txtemail").addClass("validate-error");
                  notify(result.details, "error");
                } else {
                  console.log(result);
                }
              }
            },
            error: function(req, status, err) {
              console.log('Something went wrong', status, err);
            }
          });
        }
      });
    });
  </script>
</body>
</html>