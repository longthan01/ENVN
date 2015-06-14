<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="pojo.User"%>
<%@page import="java.util.List"%>
<%@page import="org.springframework.ui.Model"%>

<html>
<head>
<title>Home</title>
<%@include file="../../layout/head.jsp"%>
	<script type="text/javascript" src="../ENVN_Utils/account.js">
	</script>
<style>
.fa {
  display: inline-block;  
  font-family: FontAwesome;
  font-style: normal;
  line-height: inherit;
  font-weight: normal;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
</style>
</head>
<body>
	<%@include file="../../layout/body_above.jsp"%>
</body>
</html>