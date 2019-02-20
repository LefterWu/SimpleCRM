package com.lefter.crm.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.lefter.commons.CommonUtils;
import com.lefter.crm.beans.Customer;
import com.lefter.crm.beans.PageBean;
import com.lefter.jdbc.TxQueryRunner;


/**
* @Title: CustomerDao.java
* @Package com.lefter.crm.dao
* @Description: TODO
* @author wuleshen
* @date 2018年7月19日下午10:57:18
* @version V1.0
*/
public class CustomerDao {

	private QueryRunner qr = new TxQueryRunner();

	/* 
	 * 添加客户
	 */
	public void add(Customer c) {
		String sql = "INSERT INTO t_customer VALUES(?,?,?,?,?,?,?)";
		Object params[] = {
				c.getCid(), c.getCname(), c.getGender(),c.getBirthday(), 
				c.getCellphone(), c.getEmail(),c.getDescription()};
		try {
			qr.update(sql, params);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/*
	 * 查询所有
	 */
	public List<Customer> findAll() {
		String sql = "SELECT * FROM t_customer";
		try {
			return qr.query(sql, new BeanListHandler<Customer>(Customer.class));
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/*
	 * 根据页数查找
	 * page 页数
	 * pageSize 每页几条记录
	 */
	@SuppressWarnings("unchecked")
	public PageBean<Customer> findByPage(int page, int pageSize){
		try {
		//new一个pageBean对象
		PageBean<Customer> pageBean = new PageBean<>();
		pageBean.setPage(page);
		pageBean.setPageSize(pageSize);
		
		//得到总记录数
		String sql = "select count(*) from t_customer";
		Number num = (Number)qr.query(sql, new ScalarHandler());
		int tr = num.intValue();
		pageBean.setTotalRecord(tr);
		
		//进行分页查询
		sql = "SELECT * FROM t_customer LIMIT ?,?";
		Object[] params = {(page-1)*pageSize, pageSize};
		//将得到的beanList保存到pageBean对象
		List<Customer> beanList = qr.query(sql, new BeanListHandler<Customer>(Customer.class), params);
		pageBean.setBeanList(beanList);
		/*----------------------------------------------------------------------------------------*/
		for (Customer customer : beanList) {
			System.out.println(customer);
		}
		/*----------------------------------------------------------------------------------------*/
		//返回pageBean对象
		return pageBean;
		
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/*
	 * 加载客户
	 */
	public Customer load(String cid) {
		String sql = "SELECT * FROM t_customer WHERE cid = ?";
		try {
			return qr.query(sql, new BeanHandler<Customer>(Customer.class), cid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/*
	 * 编辑客户
	 */
	public void edit(Customer c) {
		try {
			String sql = "UPDATE t_customer SET cname=?, gender=?, birthday=?, " +
					"cellphone=?, email=?, description=? WHERE cid=?";
			Object[] params = {c.getCname(), c.getGender(),
					c.getBirthday(), c.getCellphone(), c.getEmail(),
					c.getDescription(), c.getCid()};
			qr.update(sql, params);
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/*
	 * 删除客户
	 */
	public void delete(String cid) {
		String sql = "DELETE FROM t_customer WHERE cid=?";
		try {
			qr.update(sql, cid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/*
	 * 高级搜索
	 */
	public List<Customer> query(Customer criteria){
		//给出sql模板
		StringBuilder sql = new StringBuilder("SELECT * FROM t_customer WHERE 1=1");
		//
		List<Object> params = new ArrayList<>();
		//客户姓名
		String cname = criteria.getCname();
		if(cname != null && !cname.trim().isEmpty()) {
			sql.append(" AND cname like ?");
			params.add("%" + cname + "%");
		}
		//客户性别
		String gender = criteria.getGender();
		if(gender != null && !gender.trim().isEmpty()) {
			sql.append(" AND gender=?");
			params.add(gender);
		}
		//客户生日
		Date birthday = criteria.getBirthday();
		if(birthday != null) {
			sql.append(" AND birthday=?");
			params.add(birthday);
		}
		//客户手机
		String cellphone = criteria.getCellphone();
		if(cellphone != null && !cellphone.trim().isEmpty()) {
			sql.append(" AND cellphone=?");
			params.add(cellphone);
		}
		//客户邮箱
		String email = criteria.getEmail();
		if(email != null && !email.trim().isEmpty()) {
			sql.append(" AND email=?");
			params.add(email);
		}
		try {
			return qr.query(sql.toString(), new BeanListHandler<Customer>(Customer.class), params.toArray());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/*
	 * 批量添加
	 */
	public void batchInsert() {
		String sql = "INSERT INTO t_customer(cid,cname,gender,birthday,cellphone,email) "
				+ "VALUES(?,?,?,?,?,?)";
		Object[][] params = new Object[100][];
		for (int i = 0; i < params.length; i++) {
			params[i] = new Object[] {
					CommonUtils.uuid(),
					"cstm" + i,
					i%2 == 0 ? "男": "女",
					CommonUtils.randomDateStr("1980-1-1", "2000-12-31"),
					"1880000" + (new Random().nextInt(8999)+1000),
					"test" + i + "@test.com"
			};
		}
		try {
			qr.batch(sql, params);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
