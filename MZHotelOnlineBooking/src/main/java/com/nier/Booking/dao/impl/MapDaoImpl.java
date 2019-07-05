package com.nier.Booking.dao.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.nier.Booking.dao.MapDao;
import com.nier.Booking.entity.HotelView;
import com.nier.Booking.entity.SearchHotel;
import com.nier.Booking.util.DataSourceUtil;

/**
 * Map查询窗口的Dao层实现类
 * @author Nier
 *
 */
public class MapDaoImpl implements MapDao {

//	查询所有该城市的酒店
	public List<HotelView> queryHotelToFrom(String destination) throws SQLException {
		QueryRunner runner = new QueryRunner();
		Connection conn = DataSourceUtil.getConnection();
//		String sql = "select * from hotel_eva_view where HotelDowntown=?";
//		String sql = "select * from hotel_room_view v1,hotel_eva_view v2  where v1.hotelId = v2.hotelId and HotelDowntown=?";
		String sql = "select * from eva_view e,hotel_view h where e.hotelId=h.hotelId and h.hotelDowntown=?";
		Object[] params = {destination};
		List<HotelView> mapHotels = new ArrayList<HotelView>();
		mapHotels = runner.query(conn, sql, new BeanListHandler<HotelView>(HotelView.class), params);
		return mapHotels;
	}

//	通过筛选栏筛选酒店
	public List<HotelView> queryHotelSecond(SearchHotel condictions, String destination) throws SQLException {
		QueryRunner runner = new QueryRunner();
		Connection conn = DataSourceUtil.getConnection();
		String sql = "select HotelId from SearchHotelList where 1=1";
		if(condictions.getRoomMin() != null) {
			sql += " and RoomMin>" +condictions.getRoomMin()[0]+ " and RoomMin<" +condictions.getRoomMin()[1];
		}
		if(condictions.getRoomRating() != null) {
			sql += " and RoomRating='"+condictions.getRoomRating()+"'";
		}
		if(condictions.getRelax() != null) {
			for(int i=0; i<condictions.getRelax().length; i++) {
				sql += " and Relax like '%"+condictions.getRelax()[i]+"%'";
			}
		}
		if(condictions.isRoomQuantity()) {
			sql += " and RoomQuantity=1";
		}
		if(condictions.isDiscount()) {
			sql += " and Discount=1";
		}
		if(condictions.isFrontDesk()) {
			sql += " and FrontDesk=1";
		}
		if(condictions.getCancelPrepay() != null) {
			sql += " and CancelPrepay='"+condictions.getCancelPrepay()+"'";
		}
		if(condictions.getMealDinner() != null) {
			sql += " and MealDinner='" +condictions.getMealDinner()+"'";
		}
		if(condictions.getRoomType() != null) {
			sql += " and RoomType='"+condictions.getRoomType()+"'";
		}
		if(condictions.getRating() != null) {
			sql += " and Rating="+condictions.getRating();
		}
		if(condictions.getChainHotels() != null) {
			sql += " and ChainHotels='"+condictions.getChainHotels()+"'";
		}
		List<Object[]> hotelIds = null;
		hotelIds = runner.query(conn, sql, new ArrayListHandler());
		
		String sql2 = "select * from hotel_view where ";
		sql2 += " HotelDowntown='"+destination+"' and (1=-1";
		for(Object[] hotelId:hotelIds) {
			sql2 += " or HotelId="+hotelId[0];
		}
		sql2 += ")";
		List<HotelView> mapHotels = new ArrayList<HotelView>();
		mapHotels = runner.query(conn, sql2, new BeanListHandler<HotelView>(HotelView.class));

		return mapHotels;
	}

}
