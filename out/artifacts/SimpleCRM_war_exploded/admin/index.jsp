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
<!-- 禁用浏览器缓存  -->
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="-1"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<!-- 响应式布局 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 引入jQuery和bootstrap -->
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/indexcss.css">
<title>CRM</title>
</head>
<body>																							
  <%@ include file="header.jsp" %>  
  <!-- 正文内容 -->
  <div class="container-fluid">
    <div class="row">
	  <!-- 边栏 -->
      <%@ include file="sidebar.jsp" %>
	  <!-- 显示内容 -->
      <div class="col-xs-9 col-xs-offset-3 col-md-10 col-md-offset-2 main">
      	<h2 class="page-welcome">欢迎使用本系统</h2>
      </div>
    </div>
  </div>
  
</body>
</html>