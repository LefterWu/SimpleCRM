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
	      	<h2 class="page-header">添加客户</h2>
	      	<!-- 水平表单  -->
	        <form class="form-horizontal" action="<c:url value='/CustomerServlet'/>" method="post">
	        <!-- 向servlet传递一个名为method的参数，其值表示要调用servlet的哪一个方法,post表单不能在url后加参数！ -->
			<input type="hidden" name="method" value="add"/>		
	          <!-- 客户姓名  -->
	          <div class="form-group">
	            <label for="cname" class="col-xs-3 col-md-2 control-label">客户姓名</label>
	            <input type="text" name="cname" id="cname" class="form-control col-xs-3 col-md-4" 
	            required="required" title="请输入客户姓名">
	          </div>
	          <!-- 性别  -->
	          <div class="form-group">
	            <label for="gender" class="col-xs-3 col-md-2 control-label">性别</label>
	          	<div class="radio">
	            <label class="radio-inline">
					<input type="radio" name="gender" id="male" value="男" checked="checked"> 男
				</label>
				<label class="radio-inline">
					<input type="radio" name="gender" id="female" value="女"> 女
				</label>
	          	</div>
			  </div>
			      <!-- 生日  -->
	          <div class="form-group">
	            <label for="birthday" class="col-xs-3 col-md-2 control-label">生日</label>
	            <input type="date" name="birthday" id="birthday" value="null" class="form-control col-xs-3 col-md-4">
	          </div>
	          <!-- 手机  -->
	          <div class="form-group">
	            <label for="cellphone" class="col-xs-3 col-md-2 control-label">手机</label>
	            <input type="text" name="cellphone" id="cellphone" class="form-control col-xs-3 col-md-4" 
	            maxlength="11" pattern="^[1][3,4,5,7,8][0-9]{9}$" title="请填写正确的11位手机号" required="required">
	          </div>
	          <!-- 邮箱  -->
	          <div class="form-group">
	            <label for="email" class="col-xs-3 col-md-2 control-label">邮箱</label>
	            <input type="email" name="email" id="email" class="form-control col-xs-3 col-md-4" required="required">
	          </div>
	          <!-- 描述  -->
	          <div class="form-group">
	            <label for="descriptiondescription" class="col-xs-3 col-md-2 control-label">描述</label>
	            <textarea rows="5" cols="20" name="description" id="description" class="form-control col-xs-3 col-md-4">
	            </textarea>
	          </div>
	          <!-- 提交  -->
	          <div class="form-group">
	          	<label class="col-xs-3 col-md-2 control-label">&nbsp;</label>
	          	<button class="btn btn-primary" type="submit" style="margin-left: 25px;">提交</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	          	<button class="btn btn-primary" type="reset">重置</button>
	          </div>
	        </form>
	      </div>
	    </div>
 	 </div>
</body>
</html>