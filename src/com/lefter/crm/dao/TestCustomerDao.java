package com.lefter.crm.dao;

import java.util.List;

import org.junit.Test;

import com.lefter.crm.beans.Customer;
import com.lefter.crm.beans.PageBean;

/**
* @Title: TestCustomerDao.java
* @Package com.lefter.crm.dao
* @Description: TODO
* @author wuleshen
* @date 2018年8月6日下午9:51:28
* @version V1.0
*/
public class TestCustomerDao {
	private CustomerDao dao = new CustomerDao();

	@Test
	public void testBatchInsert() {
		dao.batchInsert();
	}
	
	@Test
	public void testFindByPage() {
		PageBean<Customer> pb = dao.findByPage(1, 10);
		List<Customer> beanList = pb.getBeanList();
		for (Customer customer : beanList) {
			System.out.println(customer);
		}
	}
}
