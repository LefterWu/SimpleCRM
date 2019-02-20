<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!-- 引入jstl标签 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 引入jQuery和bootstrap -->
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/signin.css">

<title>CRM</title>
</head>
<body>
<div class="container">
	<form action="<c:url value='/LoginServlet'/>" method="POST" role="form" class="form-signin text-center">
		<legend>Customer Relationship Managerment</legend>

		<label for="username" class="sr-only">Username</label>
		<input type="text" class="form-control" name="username" id="username" placeholder="Username" required autofocus>
	
		<label for="password" class="sr-only">Password</label>
		<input type="password" class="form-control" name="password" id="password" placeholder="Password" required>
	
		<button type="submit" class="btn btn-primary btn-block">Login</button>
		<span id="errMsg" style="color: red">${errMsg }</span>
	</form>
</div>
	
</body>
</html>