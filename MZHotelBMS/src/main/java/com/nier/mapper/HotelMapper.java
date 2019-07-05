package com.nier.mapper;

import static com.nier.utils.HrmConstants.HOTELTABLE;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.springframework.stereotype.Repository;

import com.nier.entity.Hotel;
import com.nier.provider.HotelDynaSqlProvider;

@Repository("hotelMapper")
public interface HotelMapper {
	
		// 根据id查询酒店
	@Select("select * from "+HOTELTABLE+" where HotelId = #{hotelId}")
	Hotel selectById(Integer hotelId);
	
	// 根据id删除酒店
	@Delete(" delete from "+HOTELTABLE+" where HotelId = #{hotelId} ")
	void deleteById(Integer hotelId);
			
	// 动态修改酒店
	@SelectProvider(type=HotelDynaSqlProvider.class,method="updateHotel")
	void update(Hotel hotel);
		
	
	
	
	// 动态查询
	@SelectProvider(type=HotelDynaSqlProvider.class,method="selectWhitParam")
	List<Hotel> selectByPage(Map<String, Object> params);
	
	// 根据参数查询酒店总数
	@SelectProvider(type=HotelDynaSqlProvider.class,method="count")
	Integer count(Map<String, Object> params);
	
	// 动态插入酒店
	@SelectProvider(type=HotelDynaSqlProvider.class,method="insertHotel")
	void save(Hotel hotel);
	

}
