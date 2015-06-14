<title>${title}</title>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="../template/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="../template/css/style.css" rel="stylesheet" type="text/css" />	
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); 
	 function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<link href="../template/fonts/css/font-awesome.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../template/js/jquery.min.js">
</script>
<script type="text/javascript" src="../template/js/bootstrap.min.js">
	
</script>
<link href="../template/css/slider.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="../template/js/modernizr.custom.28468.js">
</script>
<script type="text/javascript" src="../template/js/jquery.cslider.js">
	
</script>
<script type="text/javascript">
	$(function() {
	$('#da-slider').cslider({
		autoplay : true,
		bgincrement : 450
	});

	});
</script>
<link href="../template/css/owl.carousel.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="../template/js/owl.carousel.js">
	
</script>
<script>
	$(document).ready(function() {

	$("#owl-demo").owlCarousel({
		items : 4,
		lazyLoad : true,
		autoPlay : true,
		navigation : true,
		navigationText : [
				"", ""
		],
		rewindNav : false,
		scrollPerPage : false,
		pagination : false,
		paginationNumbers : false,
	});

	});
	var context = "${pageContext.request.contextPath}";
</script>

<style>
#register-button {
	z-index: 999;
	position: fixed;
	top: 40%;
	left: 0;
	width: 90px;
	background: #3B3B3B;
	color: #fff;
	padding: 15px;
	font-size: 12px;
	text-align: center;
	border-bottom: 4px solid #BF1E2D;
	border-radius: 0 6px 6px 0;
	font-size: 15px;
	text-decoration: none;
}

</style>