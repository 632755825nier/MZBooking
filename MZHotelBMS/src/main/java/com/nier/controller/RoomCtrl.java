package com.nier.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nier.entity.Room;
import com.nier.service.RoomService;
import com.nier.utils.PageModel;

@Controller("roomCtrl")
public class RoomCtrl {
	
	@Resource(name="roomService")
	private RoomService roomService;

	/**
	 * 处理查询请求
	 * @param pageIndex 请求的是第几页
	 * @param employee 模糊查询参数
	 * @param Model model
	 * */
	@RequestMapping("/room/selectRoom")
	 public String selectRoom(Integer pageIndex,
			 @ModelAttribute Room room,
			 Model model){
//		System.out.println("room = " + room);
		PageModel pageModel = new PageModel();
		if(pageIndex != null){
			pageModel.setPageIndex(pageIndex);
		}
		/** 查询用户信息     */
		List<Room> rooms = roomService.findRoom(room, pageModel);
		model.addAttribute("rooms", rooms);
		model.addAttribute("pageModel", pageModel);
		return "room/room";
		
	}
	


//	/**
//	 * 处理增加房间请求
//	 * @param String ids 需要增加的id字符串
//	 * @param ModelAndView mv
//	 * */
	@RequestMapping("/room/addRoomNum")
	 public ModelAndView removeRoom(String ids,ModelAndView mv){
		// 分解id字符串
		String[] idArray = ids.split(",");
		for(String id : idArray){
			// 根据id删除员工
			roomService.addRoomNumById(Integer.parseInt(id));
		}
		// 设置客户端跳转到查询请求
		mv.setViewName("redirect:/room/selectRoom");
		// 返回ModelAndView
		return mv;
	}
	
	
	@RequestMapping("/room/decRoomNum")
	public ModelAndView decRoomNum(String ids,ModelAndView mv){
		// 分解id字符串
		String[] idArray = ids.split(",");
		for(String id : idArray){
			// 根据id删除员工
			roomService.decRoomNumById(Integer.parseInt(id));
		}
		// 设置客户端跳转到查询请求
		mv.setViewName("redirect:/room/selectRoom");
		// 返回ModelAndView
		return mv;
	}
	
	/**
	 * 处理修改用户请求
	 * @param String flag 标记， 1表示跳转到修改页面，2表示执行修改操作
	 * @param Room room  要修改用户的对象
	 * @param ModelAndView mv
	 * */
	@RequestMapping("/room/updateRoom")
	 public String updateRoom(
			 String flag,
			 @ModelAttribute Room room,
			 Model mv){
		if(flag.equals("1")){
			// 根据id查询用户
//			System.out.println(room.getRoomId());
			Room target = roomService.findRoomById(room.getRoomId());
			// 设置Model数据
			mv.addAttribute("room", target);
			// 返回修改员工页面
			return "room/showUpdateRoom";
		}else{
			// 执行修改操作
//			System.out.println(room);
			roomService.modifyRoom(room);
			// 设置客户端跳转到查询请求
			return "redirect:/room/selectRoom";
		}
		// 返回
	}
	
	
	/**
	 * 处理添加请求
	 * @param String flag 标记， 1表示跳转到添加页面，2表示执行添加操作
	 * @param Room room  要添加用户的对象
	 * @param ModelAndView mv
	 * */
	@RequestMapping("/room/addRoom")
	 public String addRoom(
			 String flag,
			 @ModelAttribute Room room,
			 Model mv){
		if(flag.equals("1")){
			// 设置跳转到添加页面
			return "room/showAddRoom";
		}else{
			// 执行添加操作
//			System.out.println(user);
			roomService.addRoom(room);
			// 设置客户端跳转到查询请求
			return "redirect:/room/selectRoom";
		}
	}
//	


}
