package com.lefter.crm.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//得到表单中的用户密码信息
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		if(username.trim().equalsIgnoreCase("lefter") && password.trim().equals("admin")) {
			//校验通过，则保存用户信息到session域，进入主页
			request.getSession().setAttribute("username", username);
			request.getRequestDispatcher("/admin/index.jsp").forward(request, response);
		} else {
			//校验失败，提示错误信息，转发到登录页面
			request.getSession().setAttribute("errMsg", "您的用户名或密码不正确，请重新输入");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
	}

}
