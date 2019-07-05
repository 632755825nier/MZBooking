package com.nier.Booking.service;

import java.util.List;

import com.nier.Booking.entity.HotelView;
import com.nier.Booking.entity.SearchHotel;

/**
 * 地图窗口的service接口
 * @author nier
 *
 */
public interface MapService {
	
	public List<HotelView> queryHotelsToMap(String destination);
	
	public List<HotelView> queryHotelSecond(SearchHotel condictions, String destination);

}
