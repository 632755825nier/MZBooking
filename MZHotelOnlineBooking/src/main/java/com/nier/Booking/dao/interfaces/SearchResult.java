package com.nier.Booking.dao.interfaces;

import java.sql.SQLException;
import java.util.List;

import com.nier.Booking.entity.AutoComplete;
import com.nier.Booking.entity.HotelEva;
import com.nier.Booking.entity.HotelSearchHotelView;

public interface SearchResult {
		//通过地址查询酒店的抽象方法
		public abstract List<HotelSearchHotelView> HotelSearchByAdress (String province, String downtown,int currentPage,int pageSize) throws SQLException;
		//通过酒店Id查询评论
		public abstract List<HotelEva> HotelEvaByHotelId(int hotelId) throws SQLException;
		//统计通过地址查询记录的总记录数
		public abstract int getHotelCount(String province, String downtown) throws SQLException;
		//首页的自动补全和模糊搜索的抽象方法
		public abstract List<AutoComplete> getAutoComplete(String address) throws SQLException; 
		//酒店价格从低到高排序
		public List<HotelSearchHotelView> HotelSortByPrice(String province, String downtown,int currentPage,int pageSize) throws SQLException;
}
