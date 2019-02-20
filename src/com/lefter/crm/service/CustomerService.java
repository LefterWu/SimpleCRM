package com.lefter.crm.service;

import java.util.List;

import com.lefter.crm.beans.Customer;
import com.lefter.crm.beans.PageBean;
import com.lefter.crm.dao.CustomerDao;

/**
* @Title: CustomerService.java
* @Package com.lefter.crm.service
* @Description: TODO
* @author wuleshen
* @date 2018年7月19日下午10:56:41
* @version V1.0
*/
public class CustomerService {

	private CustomerDao customerDao = new CustomerDao();
	
	/**
	 * 添加客户
	 */
	public void add(Customer c) {
		customerDao.add(c);
	}
	
	/**
	 * 查询所有
	 * @return Customer的List
	 */
	public List<Customer> findAll(){
		return customerDao.findAll();
	}
	
	/**
	 * 预加载客户
	 * @param cid 客户id
	 */
	public Customer preEdit(String cid) {
		return customerDao.load(cid);
	}
	
	/**
	 * 更新客户
	 */
	public void edit(Customer c) {
		customerDao.edit(c);
	}
	
	/**
	 * 删除客户
	 */
	public void delete(String cid) {
		customerDao.delete(cid);
	}
	
	/**
	 * 高级搜索
	 * @param criteria
	 * @return Customer的List
	 */
	public List<Customer> query(Customer criteria){
		return customerDao.query(criteria);
	}

	public PageBean<Customer> findByPage(int page, int pageSize) {
		return customerDao.findByPage(page, pageSize);
	}
}
