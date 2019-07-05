package com.nier.Booking.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.nier.Booking.dao.impl.OrderDaoImpl;
import com.nier.Booking.entity.Hotel;
import com.nier.Booking.entity.Order;
import com.nier.Booking.util.DataSourceUtil;

public class OrderService {

	//调用Dao层的：根据用户ID和是否支付获取订单信息
	public List<Order> getOrderIfmbyUserIdandPay(int UserId,int OrderIsPay){
		OrderDaoImpl orderDao = new OrderDaoImpl();
		List<Order> orders = null;
		try {
			orders = orderDao.queryAllOrderbyOrderIdandPay(UserId,OrderIsPay); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DataSourceUtil.close();
		}
		return orders;
	}
	
	//调用Dao层的：根据用户ID获取订单信息
		public List<Order> getOrderIfmbyUserId(int UserId){
			OrderDaoImpl orderDao = new OrderDaoImpl();
			List<Order> orders = null;
			try {
				orders = orderDao.queryAllOrderbyOrderId(UserId); 
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DataSourceUtil.close();
			}
			return orders;
		}
	
		public List<Hotel> getHotelIfmbyHotelId(int Hotel){
			OrderDaoImpl orderDao = new OrderDaoImpl();
			List<Hotel> hotels = null;
			try {
				hotels = orderDao.queryHotelImgByHotelId(Hotel); 
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DataSourceUtil.close();
			}
			return hotels;
		}
		
	
	
	//调用Dao层的订单插入到数据库的方法
	public void OrderInsertOrderList(Order order) {
		OrderDaoImpl orderInsert = new OrderDaoImpl();
		try {
			orderInsert.orderInsert(order);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DataSourceUtil.close();

		}
	}
	
	//调用Dao层的酒店信息，根据酒店ID查询
	public Hotel grtHotelByHotelId(int HotelId){
		OrderDaoImpl orderDao = new OrderDaoImpl();
		Hotel hotel = new Hotel();
		try {
			hotel = orderDao.queryAllHotelbyhotelId(HotelId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return hotel;
	}
	
	//修改订单状态的方法
	public int updateOrder(int orderIsPay,int isChargeback,int orderId) {
		OrderDaoImpl orderDao = new OrderDaoImpl();
		int count = 0;
		try {
			 count = orderDao.orderUpdate(orderIsPay,isChargeback,orderId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DataSourceUtil.close();
		}
		return count;
	}
	
}
