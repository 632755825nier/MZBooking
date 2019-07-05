package com.nier.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.nier.entity.Hotel;
import com.nier.mapper.HotelMapper;
import com.nier.service.HotelService;
import com.nier.utils.PageModel;

@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
@Service("hotelService")
public class HotelServiceImpl implements HotelService {

	@Autowired
	private HotelMapper hotelMapper;

	

	@Override
	public Hotel findHotelById(Integer hotelId) {
		// TODO Auto-generated method stub
		return hotelMapper.selectById(hotelId);
	}

	@Transactional(readOnly=true)
	@Override
	public List<Hotel> findHotel(Hotel hotel,PageModel pageModel) {
		/** 当前需要分页的总数据条数  */
		Map<String,Object> params = new HashMap<>();
		params.put("hotel", hotel);
		int recordCount = hotelMapper.count(params);
		pageModel.setRecordCount(recordCount);
		if(recordCount > 0){
	        /** 开始分页查询数据：查询第几页的数据 */
		    params.put("pageModel", pageModel);
	    }
		List<Hotel> hotels = hotelMapper.selectByPage(params);
		 
		return hotels;
	}


	@Override
	public void removeHotelById(Integer hotelId) {
		hotelMapper.deleteById(hotelId);
	}

	@Override
	public void modifyHotel(Hotel hotel) {
		System.out.println("进来HotelServiceImpl了！！");
		System.out.println("HotelServiceImpl"+hotel);
		hotelMapper.update(hotel);
	}

	@Override
	public void addHotel(Hotel hotel) {
		hotelMapper.save(hotel);
	}


}
