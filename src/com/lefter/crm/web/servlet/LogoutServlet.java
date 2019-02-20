package com.lefter.crm.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//得到session域中的username对象
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		if( username==null ) {
			//如果session中没有username（session过期自动注销）,重定向到登录界面重新登录
			response.sendRedirect(request.getContextPath() + "/login.jsp");
		} else {
			//否则，执行注销
			session.removeAttribute("username");
			request.removeAttribute("errMsg");	//清除用户密码错误的提示信息
			response.sendRedirect(request.getContextPath() + "/login.jsp");
		}
	}
}
