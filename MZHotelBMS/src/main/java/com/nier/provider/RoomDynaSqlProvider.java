package com.nier.provider;


import static com.nier.utils.HrmConstants.ROOMTABLE;

import java.util.Map;

import org.apache.ibatis.jdbc.SQL;

import com.nier.entity.Room;
import com.nier.entity.User;

/**
 * 
 * @author Nier
 *
 */
public class RoomDynaSqlProvider {
	// 分页动态查询
	public String selectWhitParam(Map<String, Object> params){
		String sql =  new SQL(){
			{
				SELECT("*");
				FROM(ROOMTABLE);
				if(params.get("room") != null){
					Room room = (Room)params.get("room");
					if(room.getRoomType() != null && !room.getRoomType().equals("")){
						WHERE("  RoomType LIKE CONCAT ('%',#{room.roomType},'%') ");
					}
				}
			}
		}.toString();
		
		if(params.get("pageModel") != null){
			sql += " limit #{pageModel.firstLimitParam} , #{pageModel.pageSize}  ";
		}
		
		return sql;
	}	
	
	
	
	
	// 动态查询总数量
	public String count(Map<String, Object> params){
		return new SQL(){
			{
				SELECT("count(*)");
				FROM(ROOMTABLE);
				if(params.get("room") != null){
					Room room = (Room)params.get("room");
					if(room.getRoomType() != null && !room.getRoomType().equals("")){
						WHERE(" RoomType LIKE CONCAT ('%',#{room.roomType},'%') ");
					}
				}
			}
		}.toString();
	}	
	
	// 动态插入
	public String insertRoom(Room room){
		return new SQL(){
			{
				INSERT_INTO(ROOMTABLE);
				if(room.getRoomType() != null && !room.getRoomType().equals("")){
					VALUES("RoomType", "#{roomType}");
				}	
				if(room.getRoomPrice() != -1){
					VALUES("RoomPrice", "#{roomPrice}");
				}	
				if(room.getSurplusRoomNumber() != -1){
					VALUES("SurplusRoomNumber", "#{surplusRoomNumber}");
				}	
				if(room.getDiscountTime() != null && !room.getDiscountTime().equals("")){
					VALUES("DiscountTime", "#{discountTime}");
				}	
				if(room.getDiscount() != -1){
					VALUES("Discount", "#{discount}");
				}	
				if(room.getRoomMin() != -1){
					VALUES("RoomMin", "#{roomMin}");
				}	
			}
		}.toString();
	}
	// 动态更新
		public String updateRoom(Room room){
			
			return new SQL(){
				{
					UPDATE(ROOMTABLE);
					if(room.getRoomType() != null){
						SET(" RoomType = #{roomType} ");
					}
					if(room.getRoomPrice() != -1){
						SET(" RoomPrice = #{roomPrice} ");
					}
					if(room.getSurplusRoomNumber() != -1){
						SET(" SurplusRoomNumber = #{surplusRoomNumber} ");
					}
					if(room.getDiscountTime() != null){
						SET(" DiscountTime = #{discountTime} ");
					}
					if(room.getDiscount() != -1){
						SET(" Discount = #{discount} ");
					}
					if(room.getRoomMin() != -1){
						SET(" RoomMin = #{roomMin} ");
					}
					WHERE(" RoomId = #{roomId} ");
				}
			}.toString();
		}
}
