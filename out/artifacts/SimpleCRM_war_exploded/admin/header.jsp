<%@page pageEncoding="UTF-8"%>
<!-- 顶部导航栏 -->
	<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Customer Relationship Management</a>
        </div>
        <!-- 响应式布局的navbar -->
        <div id="navbar" class="collapse navbar-collapse navbar-right">
    	<!-- 导航栏链接 -->
          <ul class="nav navbar-nav">
            <li class="active"><a href="${pageContext.request.contextPath }/admin/index.jsp">Home</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#">Contact</a></li>
            <li>
              <a href="<c:url value='/LogoutServlet'/>">
                <span class="glyphicon glyphicon-log-out"></span>
                Logout
              </a>
            </li>
          </ul>
        </div>
      </div>
    </nav>