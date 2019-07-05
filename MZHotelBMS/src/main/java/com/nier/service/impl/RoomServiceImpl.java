package com.nier.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.nier.entity.Room;
import com.nier.mapper.RoomMapper;
import com.nier.service.RoomService;
import com.nier.utils.PageModel;

@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
@Service("roomService")
public class RoomServiceImpl implements RoomService {

	@Autowired
	private RoomMapper roomMapper;

	

	@Override
	public Room findRoomById(Integer roomId) {
		// TODO Auto-generated method stub
		return roomMapper.selectById(roomId);
	}

	@Transactional(readOnly=true)
	@Override
	public List<Room> findRoom(Room room,PageModel pageModel) {
		/** 当前需要分页的总数据条数  */
		Map<String,Object> params = new HashMap<>();
		params.put("room", room);
		int recordCount = roomMapper.count(params);
		pageModel.setRecordCount(recordCount);
		if(recordCount > 0){
	        /** 开始分页查询数据：查询第几页的数据 */
		    params.put("pageModel", pageModel);
	    }
		List<Room> rooms = roomMapper.selectByPage(params);
		 
		return rooms;
	}

	@Override
	public void addRoomNumById(Integer roomId) {
		// TODO Auto-generated method stub
		roomMapper.addRoomNumById(roomId);
	}

	@Override
	public void decRoomNumById(Integer roomId) {
		// TODO Auto-generated method stub
		roomMapper.decRoomNumById(roomId);
	}

	@Override
	public void addRoom(Room room) {
		roomMapper.save(room);		
	}
	
	

	@Override
	public void modifyRoom(Room room) {
		System.out.println("进来RoomServiceImpl了！！");
		System.out.println("RoomServiceImpl"+room);
		roomMapper.update(room);
	}



}
