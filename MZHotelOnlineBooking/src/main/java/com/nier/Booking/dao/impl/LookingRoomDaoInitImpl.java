package com.nier.Booking.dao.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.nier.Booking.entity.CommentView;
import com.nier.Booking.entity.Hotel;
import com.nier.Booking.entity.Room;
import com.nier.Booking.util.DataSourceUtil;

public class LookingRoomDaoInitImpl {

	public Hotel getHotelMessage(String hotelId) {
		System.out.println("LookingRoomDaoInitImpl_getHotelMessage"+hotelId);
		Hotel returnHotel = new Hotel();
		int hotelIdIn = Integer.parseInt(hotelId);
		QueryRunner runner = new QueryRunner();
		Connection conn;
		try {
			conn = DataSourceUtil.getConnection();
			
			String sql = "select * from HotelList where HotelId = ?";
			Object[] params = {hotelIdIn};
		
			List<Hotel> hotelQuery = runner.query(conn, sql,new BeanListHandler<Hotel>(Hotel.class),params);
			
			
			for(Hotel hotel: hotelQuery) {
				
					returnHotel=hotel;
					System.out.println(returnHotel.getHotelFacilities());
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
			return returnHotel;
	}
	
	public List<Room> getRoomMessage() {
		QueryRunner runner = new QueryRunner();
		Connection conn;
		List<Room> roomQuery = new ArrayList<Room>();
		try {
			conn = DataSourceUtil.getConnection();
			
			String sql = "select * from RoomList";
		
		roomQuery = runner.query(conn, sql,new BeanListHandler<Room>(Room.class));
			
			
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
			return roomQuery;
	}
	
	
	//获取评论信息
	public List<CommentView> getCommentView(int pageNum,int page) {
		QueryRunner runner = new QueryRunner();
		Connection conn;
		List<CommentView> commentQuery = new ArrayList<CommentView>();
		List<CommentView> returncommentQuery = new ArrayList<CommentView>();
		
		conn = DataSourceUtil.getConnection();
		
		String sql = "select * from view_rightComment";

		try {
			commentQuery = runner.query(conn, sql,new BeanListHandler<CommentView>(CommentView.class));
		} catch (SQLException e) {
		}

		int n=0;
		for(CommentView cv: commentQuery) {
			n++;
		
			if(n<=pageNum*page&&n>=(pageNum*page-1)){
				System.out.println(n);
				returncommentQuery.add(cv);
			}
		}
	
		
		return returncommentQuery;
	}
	
	

}
