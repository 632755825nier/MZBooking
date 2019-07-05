package com.nier.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.nier.entity.Order;
import com.nier.mapper.OrderMapper;
import com.nier.service.OrderService;
import com.nier.utils.PageModel;

@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
@Service("orderService")
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper;

	

	@Override
	public Order findOrderById(Integer orderId) {
		// TODO Auto-generated method stub
		return orderMapper.selectById(orderId);
	}

	@Transactional(readOnly=true)
	@Override
	public List<Order> findOrder(Order order,PageModel pageModel) {
		/** 当前需要分页的总数据条数  */
		Map<String,Object> params = new HashMap<>();
		params.put("order", order);
		int recordCount = orderMapper.count(params);
		pageModel.setRecordCount(recordCount);
		if(recordCount > 0){
	        /** 开始分页查询数据：查询第几页的数据 */
		    params.put("pageModel", pageModel);
	    }
		List<Order> orders = orderMapper.selectByPage(params);
		 
		return orders;
	}


	@Override
	public void removeOrderById(Integer orderId) {
		orderMapper.deleteById(orderId);
	}

	@Override
	public void modifyOrder(Order order) {
		System.out.println("进来HotelServiceImpl了！！");
		System.out.println("HotelServiceImpl"+order);
		orderMapper.update(order);
	}

//	@Override
//	public void addOrder(OrderView order) {
//		orderMapper.save(order);
//	}


}
