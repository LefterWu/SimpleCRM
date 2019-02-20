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

<style type="text/css">
.list-items{
	padding-top: 15px !important;
}
ul.pagination{
	width: 250px;
	position: absolute;
	left: 40%;
}
div.table-responsive{
	margin-left: 30px !important;
}
</style>
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
	            <tbody>
	              <!-- 循环遍历结果 -->
	              <c:forEach items="${pageBean.beanList }" var="cstm">
	                <tr>
	                  <td class="list-items">${cstm.cname }</td>
	                  <td class="list-items">${cstm.gender }</td>
	                  <td class="list-items">${cstm.birthday }</td>
	                  <td class="list-items">${cstm.cellphone }</td>
	                  <td class="list-items">${cstm.email }</td>
	                  <td class="list-items">${cstm.description }</td>
	                  <td>
	                  <!-- 将超链接设置成按钮的样式  -->
	                  <a class="btn btn-primary" href="<c:url value='/CustomerServlet?method=preEdit&cid=${cstm.cid }'/>">编辑</a>
	                  <a class="btn btn-danger" href="<c:url value='/CustomerServlet?method=delete&cid=${cstm.cid }'/>" onclick="delConfirm()">删除</a>
	                  </td>
	                </tr>
	              </c:forEach>
	            </tbody>
	          </table>  
	        </div>
        
        <!-- 分页  -->
        <%-- 计算begin、end --%>
		<c:choose>
			<%-- 如果总页数不足5页，那么把所有的页数都显示出来 --%>
			<c:when test="${pageBean.totalPage <= 5 }">
				<c:set var="begin" value="1" />
				<c:set var="end" value="${pageBean.totalPage }" />
			</c:when>
			<c:otherwise>
				<%-- 当总页数>5时，通过公式计算出begin和end --%>
				<c:set var="begin" value="${pageBean.page-2 }" />
				<c:set var="end" value="${pageBean.page+2 }" />	
				<%-- 头溢出 --%>
				<c:if test="${begin < 1 }">
					<c:set var="begin" value="1" />
					<c:set var="end" value="5" />
				</c:if>	
				<%-- 尾溢出 --%>
				<c:if test="${end > pageBean.totalPage }">
					<c:set var="begin" value="${pageBean.totalPage - 4 }" />
					<c:set var="end" value="${pageBean.totalPage }" />
				</c:if>	
			</c:otherwise>
		</c:choose>
		
        <nav aria-label="Page navigation">
		  <ul class="pagination">
		    <!-- 上一页   -->
		    <li>
		      <c:if test="${pageBean.page == 1 }">
		     	 <a href="javascript:void(0);" aria-label="Previous">
	    		     <span aria-hidden="true">&laquo;</span>
		     	 </a>
		      </c:if>
		      <c:if test="${pageBean.page > 1 }">
			      <a href="${pageContext.request.contextPath }/CustomerServlet?method=findAll&page=${pageBean.page-1}" aria-label="Previous">
	    		      <span aria-hidden="true">&laquo;</span>
			      </a>
		      </c:if>
		    </li>
		    <%-- 循环遍历页码列表 --%>
			<c:forEach var="i" begin="${begin }" end="${end }">
				<li><a href="${pageContext.request.contextPath }/CustomerServlet?method=findAll&page=${i }">${i }</a></li>
			</c:forEach>
			<!-- 下一页   -->		    
		    <li>
		      <c:if test="${pageBean.page < pageBean.totalPage }">
			      <a href="${pageContext.request.contextPath }/CustomerServlet?method=findAll&page=${pageBean.page+1}" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
		      </c:if>
		      <c:if test="${pageBean.page >= pageBean.totalPage }">
		       	  <a href="javascript:void(0);" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
		      </c:if>
		    </li>
		  </ul>
	    </nav>
    </div>
  </div>
</div>

</body>
<script type="text/javascript">
	function delConfirm(){
		if (!confirm("确认要删除？")) {
            window.event.returnValue = false;
        }
	}
</script>
</html>