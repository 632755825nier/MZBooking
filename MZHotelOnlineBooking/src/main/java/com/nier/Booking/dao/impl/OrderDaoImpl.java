package com.nier.Booking.dao.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.nier.Booking.dao.interfaces.OrderDao;
import com.nier.Booking.entity.Hotel;
import com.nier.Booking.entity.Order;
import com.nier.Booking.util.DataSourceUtil;

public class OrderDaoImpl implements OrderDao{
	
//	查询所有该用户的订单根据用户ID和是否支付来查询
	public List<Order> queryAllOrderbyOrderIdandPay(int UserId,int OrderIsPay) throws SQLException {
		QueryRunner runner = new QueryRunner();
		Connection conn = DataSourceUtil.getConnection();
		String sql = "select * from OrderList where UserId=? and OrderIsPay = ?"; 
		Object[] params = {UserId,OrderIsPay};
		List<Order> Orders = new ArrayList<Order>();
		Orders = runner.query(conn, sql, new BeanListHandler<Order>(Order.class), params);

		return Orders;
	}
	
	public List<Hotel> queryHotelImgByHotelId(int hotelId) throws SQLException {
		QueryRunner runner = new QueryRunner();
		Connection conn = DataSourceUtil.getConnection();
		String sql = "select * from hotellist where HotelId = ?"; 
		Object[] params = {hotelId};
		List<Hotel> Hotels = new ArrayList<Hotel>();
		Hotels = runner.query(conn, sql, new BeanListHandler<Hotel>(Hotel.class), params);
		return Hotels;
	}
	
	
	
//	查询所有该用户的订单根据用户ID来查询
	public List<Order> queryAllOrderbyOrderId(int UserId) throws SQLException {
		QueryRunner runner = new QueryRunner();
		Connection conn = DataSourceUtil.getConnection();
		String sql = "select * from OrderList where UserId=?"; 
		Object[] params = {UserId};
		List<Order> Orders = new ArrayList<Order>();
		Orders = runner.query(conn, sql, new BeanListHandler<Order>(Order.class), params);
		
		return Orders;
	}
	
	//根据酒店ID查询酒店相关信息
	public Hotel queryAllHotelbyhotelId(int hotelId) throws SQLException {
		QueryRunner runner = new QueryRunner();
		Connection conn = DataSourceUtil.getConnection();
		String sql = "select * from HotelList where hotelId=?"; 
		Object[] params = {hotelId};
		Hotel hotel = new Hotel();
		hotel = runner.query(conn, sql, new BeanHandler<Hotel>(Hotel.class),params);
		
		return hotel ;
	}
	
	//生成的订单存储到订单表中
	//用户ID，酒店ID可以相同，只要保证订单号不相同就行
	public void orderInsert(Order order) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSourceWithC3P0ByXML());
		String insertSql = "insert into OrderList(UserId,OrderId,HotelId,OrderTime,OrderMoney,OrderIsPay,IsChargeback,InDate,OrderDay,OutDate,RoomNum,PeopleNum,ContactNum"
				+ ",OrderEmail,HotelName,HotelType,RoomGrade,HotelAdress,OrderUserName,RoomType,HotelImg) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params = {order.getUserId(),order.getOrderId(),order.getHotelId(),order.getOrderTime(),order.getOrderMoney(),order.getOrderIsPay(),order.getIsChargeback(),order.getInDate(),order.getOrderDay(),
				order.getOutDate(),order.getRoomNum(),order.getPeopleNum(),order.getContactNum(),order.getOrderEmail(),order.getHotelName(),order.getHotelType(),
				order.getRoomGrade(),order.getHotelAdress(),order.getOrderUserName(),order.getRoomType(),order.getHotelImg()};
			
			int count = runner.update(insertSql,params);
			System.out.println("orderInsert成功增加"+count+"条订单！");
			orderRoomNumUpdate(order.getRoomNum(),order.getRoomType());

	
	}
	
	//下单之后对应房间数量的减少
	public void orderRoomNumUpdate(Integer roomNum,String roomType) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSourceWithC3P0ByXML());
		String updateSql = "update RoomList set SurplusRoomNumber=SurplusRoomNumber - ? where RoomType=?";
		Object[] params = {roomNum,roomType};
		int updatecount = runner.update(updateSql,params);
		System.out.println("订单成功，成功减少了对应的房间数量！");
	}
	
	
	
	
	
	//修改订单支付状态未支付改为支付
	public int orderUpdate(int orderIsPay,int isChargeback,int orderId) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSourceWithC3P0ByXML());
		String updateSql = "update OrderList set OrderIsPay=?,IsChargeback=? where OrderId=?";
		Object [] params = {orderIsPay,isChargeback,orderId};
			int count = runner.update(updateSql,params);
			System.out.println("orderUpdate成功修改"+count+"条数据！");		
			return count;
	}
	
	
	
}
