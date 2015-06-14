<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- thematic info -->
<li class="treeview"><a href="#"> <i class="fa fa-dashboard"></i>
		<span>Chuyên đề</span> <i class="fa fa-angle-left pull-right"></i>
</a>
	<ul class="treeview-menu">
		<c:if test="${listThematic != null}">
			<c:forEach var="thm" items="${listThematic}">
				<li><a href="/admin/thematic/index"><i class="fa fa-edit"></i>
						${thm.getThematicName()} </a></li>
			</c:forEach>
		</c:if>
	</ul></li>
<!-- / -->
<!-- registration info -->
<li class="treeview"><a href="#"> <i class="fa fa-dashboard"></i>
		<span>Học viên</span> <i class="fa fa-angle-left pull-right"></i>
</a>
	<ul class="treeview-menu">
		<li><a href=""><i class="fa fa-edit"></i>Thông tin đăng ký</a></li>
		<li><a href="index2.html"><i class="fa fa-edit"></i>Lịch học</a></li>
		<li><a href="index2.html"><i class="fa fa-edit"></i>Thêm
				thông báo</a></li>
	</ul></li>
<!-- / -->