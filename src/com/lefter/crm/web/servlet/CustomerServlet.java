package com.lefter.crm.web.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lefter.commons.CommonUtils;
import com.lefter.crm.beans.Customer;
import com.lefter.crm.beans.PageBean;
import com.lefter.crm.service.CustomerService;
import com.lefter.servlet.BaseServlet;


/**
 * Servlet implementation class CustomerServlet
 */
@WebServlet("/CustomerServlet")
public class CustomerServlet extends BaseServlet {

	private CustomerService customerService = new CustomerService();
	
	/* 
	 * 添加客户
	 */
	public String add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//封装表单数据到JavaBean对象（Customer）
		Map<String, String[]> map = request.getParameterMap();
		
		/*for (String key: map.keySet()) {
			String[] val = map.get(key);
			System.out.println(key + " = " + val[0]);
		}*/
		
		Customer c = CommonUtils.toBean(map, Customer.class);
		//设置cid
		c.setCid(CommonUtils.uuid());
		//调用service方法添加客户
		customerService.add(c);
		//在request域中保存成功信息
		request.setAttribute("msg", "添加客户成功！");
		//转发到msg.jsp中
		return "f:/admin/msg.jsp";
	}
	
	/*
	 * 查找全部
	 */
	public String findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = 0;
		//设置每页记录数为10
		int pageSize = 10;
		//获得页码参数
		String value = request.getParameter("page");
		if(value==null || value.trim().isEmpty()) {	
			//如果页码为空，则默认页码为1
			page = 1;
		} else { //否则获得页码值
			page = Integer.parseInt(value);
		}
		//得到pageBean对象，并保存到request
		PageBean<Customer> pageBean = customerService.findByPage(page,pageSize);
		request.setAttribute("pageBean", pageBean);
		//转发到list.jsp
		return "f:/admin/list.jsp";
	}
	
	/*
	 * 编辑前的加载工作
	 * 将当前客户的信息保存到request域，并转发给编辑页面显示
	 */
	public String preEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//从URL得到cid
		String cid = request.getParameter("cid");
		//调用preEdit方法得到bean对象
		Customer c = customerService.preEdit(cid);
		//将bean对象保存到request域中
		request.setAttribute("cstm", c);
		return "f:/admin/edit.jsp";
	}
	
	/*
	 * 编辑客户
	 */
	public String edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//将表单数据封装到Customer对象中
		Map<String, String[]> map = request.getParameterMap();
		Customer c = CommonUtils.toBean(map, Customer.class);
		//将Customer对象添加到数据库中
		customerService.edit(c);
		//将成功信息保存到request域中
		request.setAttribute("msg", "编辑客户成功！");
		return "f:/admin/msg.jsp";
	}
	
	/*
	 * 删除客户
	 */
	public String delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cid = request.getParameter("cid");
		customerService.delete(cid);
		request.setAttribute("msg", "删除客户成功！");
		return "f:/admin/msg.jsp";
	}
	
	/*
	 * 高级搜索
	 */
	public String query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String[]> parameterMap = request.getParameterMap();
		Customer criteria = CommonUtils.toBean(parameterMap, Customer.class);
		//将查询结果保存到request域
		List<Customer> resultList = customerService.query(criteria);
		request.setAttribute("cstmList", resultList);
		//把输入信息存到request域，用于回显
		request.setAttribute("cstm", criteria);
		return "f:/admin/query.jsp";
	}
	
}
