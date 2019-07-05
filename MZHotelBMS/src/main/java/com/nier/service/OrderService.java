package com.nier.service;

import java.util.List;

import com.nier.entity.Order;
import com.nier.utils.PageModel;

public interface OrderService {
	

	
	/**
	 * 根据id查询用户
	 * @param id
	 * @return 用户对象
	 * */
	Order findOrderById(Integer id);
	
	/**
	 * 获得所有用户
	 * @return Hotel对象的List集合
	 * */
	List<Order> findOrder(Order order,PageModel pageModel);
	
	/**
	 * 根据id删除用户
	 * @param id
	 * */
	void removeOrderById(Integer id);
	
	/**
	 * 修改订单
	 * @param Order 用户对象
	 * */
	void modifyOrder(Order order);
	
	/**
	 * 添加用户
	 * @param Order 用户对象
	 * */
//	void addOrder(Order order);

}
