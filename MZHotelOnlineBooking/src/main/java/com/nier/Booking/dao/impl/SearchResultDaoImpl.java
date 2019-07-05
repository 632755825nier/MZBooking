package com.nier.Booking.dao.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.nier.Booking.dao.interfaces.SearchResult;
import com.nier.Booking.entity.AutoComplete;
import com.nier.Booking.entity.HotelEva;
import com.nier.Booking.entity.HotelSearchHotelView;
import com.nier.Booking.util.DataSourceUtil;


public class SearchResultDaoImpl implements SearchResult {
	
	//通过地址（省，市在数据库查询酒店表酒店）
	public List<HotelSearchHotelView> HotelSearchByAdress(String province, String downtown,int currentPage,int pageSize) throws SQLException {
		QueryRunner runner = new QueryRunner();
		
		Connection conn = null;
		List<HotelSearchHotelView> hotelSearchList = null;
		
			conn = DataSourceUtil.getConnection();
		
			//查询数据库sql语句
//			String sql = "select * from hotel_searchhotel_view where HotelProvince = ? and HotelDowntown = ? limit ?,?";
			String sql = "select * from hotel_searchhotel_view1 v1 left join  hotel_searchhotel_view2 v2 on v1.HotelId = v2.HotelId and v1.HotelProvince = ? and v1.HotelDowntown = ? limit ?,?";
			Object[] params = {province,downtown,(currentPage-1)*pageSize,pageSize};
			//返回的数据被封装成List<JavaBean>
			hotelSearchList = runner.query(conn, sql,new BeanListHandler<HotelSearchHotelView>(HotelSearchHotelView.class),params);
			
		return hotelSearchList;
	}
	//酒店价格从低到高排序
	public List<HotelSearchHotelView> HotelSortByPrice(String province, String downtown,int currentPage,int pageSize) throws SQLException{
		System.out.println("SearchResultDaoImplPrice");
		QueryRunner runner = new QueryRunner();
		
		Connection conn = null;
		List<HotelSearchHotelView> hotelSearchList = null;
		
			conn = DataSourceUtil.getConnection();
			
			//查询数据库sql语句
			//select hotelId,hotelName,RoomMin from hotel_searchhotel_view where HotelProvince = "广东省" and HotelDowntown = "广州市" order by RoomMin desc limit 2,5;
//			String sql = "select * from hotel_searchhotel_view where HotelProvince = ? and HotelDowntown = ? order by RoomMin asc limit ?,?";
			String sql = "select * from hotel_searchhotel_view1 h1,hotel_searchhotel_view2 h2 where h1.hotelId = h2.hotelId and HotelProvince = ? and HotelDowntown = ? order by RoomMin asc limit ?,?";
			Object[] params = {province,downtown,(currentPage-1)*pageSize,pageSize};
			//返回的数据被封装成List<JavaBean>
			hotelSearchList = runner.query(conn, sql,new BeanListHandler<HotelSearchHotelView>(HotelSearchHotelView.class),params);
		
		return hotelSearchList;
	}
	//酒店价格从高到低排序
	public List<HotelSearchHotelView> HotelSortByPrice2(String province, String downtown,int currentPage,int pageSize) throws SQLException{
		System.out.println("SearchResultDaoImplPrice");
		QueryRunner runner = new QueryRunner();
		
		Connection conn = null;
		List<HotelSearchHotelView> hotelSearchList = null;
		
		conn = DataSourceUtil.getConnection();
		
		String sql = "select * from hotel_searchhotel_view1 h1,hotel_searchhotel_view2 h2 where h1.hotelId = h2.hotelId and HotelProvince = ? and HotelDowntown = ? order by RoomMin desc limit ?,?";
		Object[] params = {province,downtown,(currentPage-1)*pageSize,pageSize};
		//返回的数据被封装成List<JavaBean>
		hotelSearchList = runner.query(conn, sql,new BeanListHandler<HotelSearchHotelView>(HotelSearchHotelView.class),params);
		
		return hotelSearchList;
	}
		
	
	//通过酒店ID来查询评论
	public List<HotelEva> HotelEvaByHotelId(int hotelId) throws SQLException{
		
		QueryRunner runner = new QueryRunner();
		Connection conn = null;
		List<HotelEva> hotelEvaList = null;
		
			conn = DataSourceUtil.getConnection();
			//查询数据库sql语句
			String sql = "select * from hotel_eva_user_view where HotelId = ?";
			Object[] params = {hotelId};
			
			//返回的数据被封装成List<JavaBean>
			hotelEvaList = runner.query(conn, sql,new BeanListHandler<HotelEva>(HotelEva.class),params);
		
		return hotelEvaList;
		
	}

	//统计通过地址查询记录的总记录数
	public int getHotelCount(String province, String downtown) throws SQLException {

		QueryRunner runner = new QueryRunner();
		Connection conn = null;
		Object hotelCount = 0;
	
			conn = DataSourceUtil.getConnection();
//			String sql = "select count(*) from hotel_searchhotel_view where HotelProvince = ? and HotelDowntown = ? ";
			String sql = "select count(*) from hotel_searchhotel_view1 where   HotelProvince = ? and HotelDowntown = ? ";
			Object[] params = {province,downtown};
			hotelCount = runner.query(conn,sql,new ScalarHandler<Object>(),params);
	
		int value = 0;
		System.out.println("酒店数量"+hotelCount);
		if(hotelCount instanceof Long)
		    value = Integer.parseInt(String.valueOf(hotelCount));
		return value;
	}

	//首页的自动补全和模糊搜索的方法
	public List<AutoComplete> getAutoComplete(String address) throws SQLException {
		QueryRunner runner = new QueryRunner();
		Connection conn = null;
		List<AutoComplete> autoCompleteList = null;
		
		
		//返回的数据被封装成List<JavaBean>
		
			conn = DataSourceUtil.getConnection();
			//查询数据库sql语句
			String sql = "select AutoAddress from AutoCompleteList where AutoAddress Like ?";
			Object[] params = {"%"+address+"%"};
			autoCompleteList = runner.query(conn, sql,new BeanListHandler<AutoComplete>(AutoComplete.class),params);
//			autoCompleteList = runner.query(conn, sql,new ColumnListHander(object),params);
		
		
		return autoCompleteList;
	}

}
