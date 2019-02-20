<%@page pageEncoding="UTF-8"%>

<div class="col-xs-3 col-md-2 sidebar">
	<ul class="nav nav-sidebar">
		<li><a href="${pageContext.request.contextPath }/CustomerServlet?method=findAll">查询客户</a></li>
		<li><a href="${pageContext.request.contextPath }/admin/add.jsp">添加客户</a></li>
		<li><a href="${pageContext.request.contextPath }/admin/query.jsp">高级搜索</a></li>
	</ul>
</div>