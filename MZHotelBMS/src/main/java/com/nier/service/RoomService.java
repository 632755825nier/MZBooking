package com.nier.service;

import java.util.List;

import com.nier.entity.Room;
import com.nier.utils.PageModel;

public interface RoomService {
	

	
	/**
	 * 根据id查询用户
	 * @param id
	 * @return 用户对象
	 * */
	Room findRoomById(Integer id);
	
	/**
	 * 获得所有用户
	 * @return Room对象的List集合
	 * */
	List<Room> findRoom(Room room,PageModel pageModel);
	
	/**
	 * 根据id增加和减少房间数量
	 * @param id
	 * */
	void addRoomNumById(Integer id);
	
	void decRoomNumById(Integer id);
	
	/**
	 * 修改用户
	 * @param Hotel 用户对象
	 * */
	void modifyRoom(Room room);
	
	/**
	 * 添加用户
	 * @param Hotel 用户对象
	 * */
	void addRoom(Room room);

}
