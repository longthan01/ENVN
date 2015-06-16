<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="pojo.Thematic" %>
<%@ page import="java.util.List" %>
<!-- thematic info -->
<li class="treeview"><a href="#"> <i class="fa fa-dashboard"></i>
		<span>Chuyên đề</span> <i class="fa fa-angle-left pull-right"></i>
</a>
<% 
	List<Thematic> list = (List<Thematic>)session.getAttribute("list");
%>
	<ul class="treeview-menu">
		<c:if test="${list != null}">
			<c:forEach var="thm" items="${list}">
				<li><a href="/admin/thematic/view"><i class="fa fa-edit"></i>
						${thm.getThematicName()} </a></li>
			</c:forEach>
		</c:if>
	</ul></li>
<!-- / -->
<!-- employee management -->
<li><a href="../../admin/employee/index"> <i
		class="fa fa-dashboard"></i> <span>Quản lý nhân viên</span>
</a></li>
<!-- / -->

<!-- user feedback management -->
<li class="treeview"><a href="#"> <i class="fa fa-dashboard"></i>
		<span>Thông tin phản hồi</span> <i class="fa fa-angle-left pull-right"></i>
</a>
	<ul class="treeview-menu">
		<li><a href="index.html"><i class="fa fa-edit"></i>Xem</a></li>
	</ul></li>
<!-- / -->