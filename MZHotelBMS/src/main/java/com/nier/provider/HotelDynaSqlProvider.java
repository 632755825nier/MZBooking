package com.nier.provider;


import static com.nier.utils.HrmConstants.HOTELTABLE;

import java.util.Map;

import org.apache.ibatis.jdbc.SQL;

import com.nier.entity.Hotel;

/**
 * 
 * @author Nier
 *
 */
public class HotelDynaSqlProvider {
	// 分页动态查询
	public String selectWhitParam(Map<String, Object> params){
		String sql =  new SQL(){
			{
				SELECT("*");
				FROM(HOTELTABLE);
				if(params.get("hotel") != null){
					Hotel hotel = (Hotel)params.get("hotel");
					if(hotel.getHotelName() != null && !hotel.getHotelName().equals("")){
						WHERE("  HotelName LIKE CONCAT ('%',#{hotel.hotelName},'%') ");
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
				FROM(HOTELTABLE);
				if(params.get("hotel") != null){
					Hotel hotel = (Hotel)params.get("hotel");
					if(hotel.getHotelName() != null && !hotel.getHotelName().equals("")){
						WHERE(" HotelName LIKE CONCAT ('%',#{hotel.hotelName},'%') ");
					}
				}
			}
		}.toString();
	}	
	
	// 动态插入
	public String insertHotel(Hotel hotel){
		
		return new SQL(){
			{
				INSERT_INTO(HOTELTABLE);
				if(hotel.getHotelName() != null && !hotel.getHotelName().equals("")){
					VALUES("HotelName", "#{hotelName}");
				}	
				if(hotel.getHotelPer() != null && !hotel.getHotelPer().equals("")){
					VALUES("HotelPer", "#{hotelPer}");
				}
				
				if(hotel.getHotelAdress() != null && !hotel.getHotelAdress().equals("")){
					VALUES("HotelAdress", "#{hotelAdress}");
				}	
				if(hotel.getHotelPicture() != null && !hotel.getHotelPicture().equals("")){
					VALUES("HotelPicture", "#{hotelPicture}");
				}
				if(hotel.getHotelType() != null && !hotel.getHotelType().equals("")){
					VALUES("HotelType", "#{hotelType}");
					
				}if(hotel.getOnlineTime() != null && !hotel.getOnlineTime().equals("")){
					VALUES("OnlineTime", "#{onlineTime}");
					
				}if(hotel.getRoomGrade() != -1){
					VALUES("RoomGrade", "#{roomGrade}");
					
				}if(hotel.getIsBreakfast() != null && !hotel.getIsBreakfast().equals("")){
					VALUES("IsBreakfast", "#{isBreakfast}");
				}if(hotel.getPet() != null && !hotel.getPet().equals("")){
					VALUES("Pet", "#{pet}");
				}if(hotel.getHotelProvince() != null && !hotel.getHotelProvince().equals("")){
					VALUES("HotelProvince", "#{hotelProvince}");
				}if(hotel.getHotelDowntown() != null && !hotel.getHotelDowntown().equals("")){
					VALUES("HotelDowntown", "#{hotelDowntown}");
				}if(hotel.getHotelArea() != null && !hotel.getHotelArea().equals("")){
					VALUES("HotelArea", "#{hotelArea}");
				}if(hotel.getLongitude() != -1 ){
					VALUES("Longitude", "#{longitude}");
				}if(hotel.getLatitude() != -1 ){
					VALUES("Latitude", "#{latitude}");
				}
			}
		}.toString();
	}
	// 动态更新
		public String updateHotel(Hotel hotel){
			
			return new SQL(){
				{
					UPDATE(HOTELTABLE);
					if(hotel.getHotelName() != null){
						SET(" HotelName = #{hotelName} ");
					}
					if(hotel.getHotelPer() != null){
						SET(" HotelPer = #{hotelPer} ");
					}
					if(hotel.getHotelAdress() != null){
						SET(" HotelAdress = #{hotelAdress} ");
					}
					if(hotel.getHotelPicture() != null){
						SET(" HotelPicture = #{hotelPicture} ");
					}
					if(hotel.getHotelType() != null){
						SET(" HotelType = #{hotelType} ");
					}
					
					if(hotel.getIsBreakfast() != null){
						SET(" IsBreakfast = #{isBreakfast} ");
					}
					if(hotel.getPet() != null){
						SET(" Pet = #{pet} ");
					}
					if(hotel.getHotelProvince() != null){
						SET(" HotelProvince = #{hotelProvince} ");
					}
					if(hotel.getHotelDowntown() != null){
						SET(" HotelDowntown = #{hotelDowntown} ");
					}
					
					if(hotel.getHotelArea() != null){
						SET(" HotelArea = #{hotelArea} ");
					}
					if(hotel.getLongitude() != -1 ){
						SET(" Longitude = #{longitude} ");
					}
					if(hotel.getLatitude() != -1 ){
						SET(" Latitude = #{latitude} ");
					}
					WHERE(" HotelId = #{hotelId} ");
				}
			}.toString();
		}
}
