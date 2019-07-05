package com.nier.service;

import java.util.List;

import com.nier.entity.Hotel;
import com.nier.utils.PageModel;

public interface HotelService {
	

	
	/**
	 * 根据id查询用户
	 * @param id
	 * @return 用户对象
	 * */
	Hotel findHotelById(Integer id);
	
	/**
	 * 获得所有用户
	 * @return Hotel对象的List集合
	 * */
	List<Hotel> findHotel(Hotel hotel,PageModel pageModel);
	
	/**
	 * 根据id删除用户
	 * @param id
	 * */
	void removeHotelById(Integer id);
	
	/**
	 * 修改用户
	 * @param Hotel 用户对象
	 * */
	void modifyHotel(Hotel hotel);
	
	/**
	 * 添加用户
	 * @param Hotel 用户对象
	 * */
	void addHotel(Hotel hotel);

}
