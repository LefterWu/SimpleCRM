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
<style type="text/css">
.query-main{
	padding-left: 20px;
	padding-top: 20px;
}
div.form-group{
	margin-right: 20px;
}
div > label{
	padding-right: 5px;
}
div.table-responsive{
	margin-left: 30px !important;
}
</style>
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
      	<form class="form-inline query-main" action="<c:url value='/CustomerServlet'/>" method="post">
      	<input type="hidden" name="method" value="query">
		  <div class="form-group">
		    <label for="cname">姓名</label>
		    <input type="text" class="form-control" name="cname" id="cname" value="${cstm.cname }" placeholder="姓名">
		  </div>
		  <div class="form-group">
		    <label for="gender">性别</label>
		    <select class="form-control" name="gender">
		    	<c:if test="${empty cstm.gender }">
		    		<option value="男" selected="selected">男</option>
	    			<option value="女">女</option>
		    	</c:if>
		    	<c:if test="${cstm.gender eq '男' }">
					<option value="男" selected="selected">男</option>
	    			<option value="女">女</option>
		    	</c:if>
		    	<c:if test="${cstm.gender eq '女' }">
					<option value="男">男</option>
	    			<option value="女" selected="selected">女</option>
		    	</c:if>
			</select>
		  </div>
		  <div class="form-group">
		    <label for="birthday">生日</label>
		    <input type="date" name="birthday" id="birthday" value="${cstm.birthday }">
		  </div>
		   <div class="form-group">
		    <label for="birthday">手机</label>
		    <input type="text" name="cellphone" id="cellphone" placeholder="手机" value="${cstm.cellphone }"
			maxlength="11" pattern="^[1][3,4,5,7,8][0-9]{9}$" title="请填写正确的11位手机号">
		  </div>
		  <div class="form-group">
		    <label for="email">Email</label>
		    <input type="email" class="form-control" name="email" id="email" value="${cstm.email }" placeholder="email@example.com">
		  </div>
		  
		  <button type="submit" class="btn btn-primary">搜索</button>
		</form>
		
	    <!-- 展示结果  -->
		<!-- 判断搜索是否有结果  -->
		<c:choose>
			<%-- 如果没有结果，将相应提示显示在页面上 --%>
			<c:when test="${empty requestScope.cstmList }">
				<div class="result-list">
		    		<h2 class="page-header" style="width: 280px;">没有搜索到相关客户</h2>
	    		</div>
			</c:when>
			<%-- 如果搜索到相关信息，则显示出来  --%>
			<c:otherwise>
				<div class="result-list">
				    <h2 class="page-header">客户列表</h2>
				  		<div class="table-responsive">
				        <table class="table table-striped table-hover">
				          <thead>
				            <tr>
				              <th>客户姓名</th>
				              <th>性别</th>
				              <th>生日</th>
				              <th>手机</th>
				              <th>邮箱</th>
				              <th>描述</th>
				              <th>操作</th>
				            </tr>
				          </thead>
				          
				          <%-- 循环遍历结果 --%>
				          <tbody>
				           <c:forEach items="${requestScope.cstmList }" var="cstm">
				             <tr>
				               <td class="list-items">${cstm.cname }</td>
				               <td class="list-items">${cstm.gender }</td>
				               <td class="list-items">${cstm.birthday }</td>
				               <td class="list-items">${cstm.cellphone }</td>
				               <td class="list-items">${cstm.email }</td>
				               <td class="list-items">${cstm.description }</td>
				               <td>
				               <%--  将超链接设置成按钮的样式  --%>
				               <a class="btn btn-primary" href="<c:url value='/CustomerServlet?method=preEdit&cid=${cstm.cid }'/>">编辑</a>
				               <a class="btn btn-danger" href="<c:url value='/CustomerServlet?method=delete&cid=${cstm.cid }'/>">删除</a>
				               </td>
				             </tr>
				           </c:forEach>
				          </tbody>
				        </table>  
				      </div>
				</div>
			</c:otherwise>
		</c:choose>
      </div>
    </div>
  </div>
  
</body>
</html>