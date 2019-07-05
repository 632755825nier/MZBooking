package com.nier.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nier.entity.Hotel;
import com.nier.service.HotelService;
import com.nier.utils.PageModel;

@Controller("hotelCtrl")
public class HotelCtrl {
	
	@Resource(name="hotelService")
	private HotelService hotelService;

	/**
	 * 处理查询请求
	 * @param pageIndex 请求的是第几页
	 * @param employee 模糊查询参数
	 * @param Model model
	 * */
	@RequestMapping("/hotel/selectHotel")
	 public String selectUser(Integer pageIndex,
			 @ModelAttribute Hotel hotel,
			 Model model){
//		System.out.println("hotel = " + hotel);
		PageModel pageModel = new PageModel();
		if(pageIndex != null){
			pageModel.setPageIndex(pageIndex);
		}
		/** 查询用户信息     */
		List<Hotel> hotels = hotelService.findHotel(hotel, pageModel);
		model.addAttribute("hotels", hotels);
		model.addAttribute("pageModel", pageModel);
		return "hotel/hotel";
		
	}
	


	/**
	 * 处理删除用户请求
	 * @param String ids 需要删除的id字符串
	 * @param ModelAndView mv
	 * */
	@RequestMapping("/hotel/removeHotel")
	 public ModelAndView removeHotel(String ids,ModelAndView mv){
		// 分解id字符串
		String[] idArray = ids.split(",");
		for(String id : idArray){
			// 根据id删除员工
			hotelService.removeHotelById(Integer.parseInt(id));
		}
		// 设置客户端跳转到查询请求
		mv.setViewName("redirect:/hotel/selectHotel");
		// 返回ModelAndView
		return mv;
	}
	
	
	/**
	 * 处理修改用户请求
	 * @param String flag 标记， 1表示跳转到修改页面，2表示执行修改操作
	 * @param User user  要修改用户的对象
	 * @param ModelAndView mv
	 * */
	@RequestMapping("/hotel/updateHotel")
	 public String updateUser(
			 String flag,
			 @ModelAttribute Hotel hotel,
			 Model mv){
		if(flag.equals("1")){
			// 根据id查询用户
//			System.out.println(hotel.getHotelId());
			Hotel target = hotelService.findHotelById(hotel.getHotelId());
			// 设置Model数据
			mv.addAttribute("hotel", target);
			// 返回修改员工页面
			return "hotel/showUpdateHotel";
		}else{
			// 执行修改操作
//			System.out.println(hotel);
			hotelService.modifyHotel(hotel);
			// 设置客户端跳转到查询请求
			return "redirect:/hotel/selectHotel";
		}
		// 返回
	}
	
	
	/**
	 * 处理添加请求
	 * @param String flag 标记， 1表示跳转到添加页面，2表示执行添加操作
	 * @param Hotel hotel  要添加用户的对象
	 * @param ModelAndView mv
	 * */
	@RequestMapping("/hotel/addHotel")
	 public String addUser(
			 String flag,
			 @ModelAttribute Hotel hotel,
			 Model mv){
		if(flag.equals("1")){
			// 设置跳转到添加页面
			return "hotel/showAddHotel";
		}else{
			// 执行添加操作
//			System.out.println(user);
			hotelService.addHotel(hotel);
			// 设置客户端跳转到查询请求
			return "redirect:/hotel/selectHotel";
		}
	}
	


}
