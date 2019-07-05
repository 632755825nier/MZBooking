package com.nier.mapper;

import static com.nier.utils.HrmConstants.ROOMTABLE;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.nier.entity.Room;
import com.nier.provider.RoomDynaSqlProvider;

@Repository("roomMapper")
public interface RoomMapper {
	
		// 根据id查询房间
	@Select("select * from "+ROOMTABLE+" where RoomId = #{roomId}")
	Room selectById(Integer roomId);
	
//	// 根据id增加房间数量
	@Update(" update  "+ROOMTABLE+" set SurplusRoomNumber = SurplusRoomNumber + 1  where RoomId = #{roomId} ")
	void addRoomNumById(Integer roomId);
			
	@Update(" update  "+ROOMTABLE+" set SurplusRoomNumber = SurplusRoomNumber - 1  where RoomId = #{roomId} ")
	void decRoomNumById(Integer roomId);
	
	// 动态修改用户
	@SelectProvider(type=RoomDynaSqlProvider.class,method="updateRoom")
	void update(Room room);
		
	
	
	
	// 动态查询
	@SelectProvider(type=RoomDynaSqlProvider.class,method="selectWhitParam")
	List<Room> selectByPage(Map<String, Object> params);
	
	// 根据参数查询用户总数
	@SelectProvider(type=RoomDynaSqlProvider.class,method="count")
	Integer count(Map<String, Object> params);
	
	// 动态插入用户
	@SelectProvider(type=RoomDynaSqlProvider.class,method="insertRoom")
	void save(Room room);
	

}
