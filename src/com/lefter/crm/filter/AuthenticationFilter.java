package com.lefter.crm.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class AuthenticationFilter
 * 用户验证过过滤器
 */
@WebFilter("/admin/*")
public class AuthenticationFilter implements Filter {

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//从session中得到用户登录信息
		HttpServletRequest req = (HttpServletRequest) request;
		String username = (String) req.getSession().getAttribute("username");
		//如果session中存在用户信息，说明登录成功，放行
		if( username!=null ) {
			chain.doFilter(request, response);
		} else {
			//否则，保存错误信息，转到登录页面
			req.setAttribute("errMsg", "您没有登录权限，请先用管理员账号登录");
			req.getRequestDispatcher("/login.jsp").forward(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
