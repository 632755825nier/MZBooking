package com.nier.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nier.entity.Manager;
import com.nier.entity.User;
import com.nier.service.UserService;
import com.nier.utils.HrmConstants;
import com.nier.utils.MD5Util;
import com.nier.utils.PageModel;

@Controller("userCtrl")
public class UserCtrl {
	
	@Resource(name="userService")
	private UserService userService;
	
	
	/**
	 * 处理登录请求
	 * @param String loginname  登录名
	 * @param String password 密码
	 * @return 跳转的视图
	 * */
	@RequestMapping("/login")
	 public ModelAndView login(@RequestParam("loginname") String loginname,
			 @RequestParam("password") String password,
			 HttpSession session,
			 ModelAndView mv){
		// 调用业务逻辑组件判断用户是否可以登录
		Manager manager = userService.login(loginname, password);
		if(manager != null){
			// 将用户保存到HttpSession当中
			session.setAttribute(HrmConstants.USER_SESSION, manager);
			// 客户端跳转到main页面
			mv.setViewName("redirect:/main");
//			System.out.println("成功了");
		}else{
			// 设置登录失败提示信息
			mv.addObject("message", "登录名或密码错误!请重新输入");
			// 服务器内部跳转到登录页面
			mv.setViewName("forward:/loginForm");
		}
//		System.out.println("进来了");
		return mv;
		
	}
	
	/**
	 * 处理查询请求
	 * @param pageIndex 请求的是第几页
	 * @param user 模糊查询参数
	 * @param Model model
	 * */
	@RequestMapping("/user/selectUser")
	 public String selectUser(Integer pageIndex,
			 @ModelAttribute User user,
			 Model model){
//		System.out.println("user = " + user);
		PageModel pageModel = new PageModel();
		if(pageIndex != null){
			pageModel.setPageIndex(pageIndex);
		}
		/** 查询用户信息     */
		List<User> users = userService.findUser(user, pageModel);
		model.addAttribute("users", users);
		model.addAttribute("pageModel", pageModel);
		return "user/user";
		
	}
	
	
	/**
	 * 处理删除用户请求
	 * @param String ids 需要删除的id字符串
	 * @param ModelAndView mv
	 * */
	@RequestMapping("/user/removeUser")
	 public ModelAndView removeUser(String ids,ModelAndView mv){
		// 分解id字符串
		String[] idArray = ids.split(",");
		for(String id : idArray){
			// 根据id删除员工
			userService.removeUserById(Integer.parseInt(id));
		}
		// 设置客户端跳转到查询请求
		mv.setViewName("redirect:/user/selectUser");
		// 返回ModelAndView
		return mv;
	}
	
	
	/**
	 * 处理修改用户请求
	 * @param String flag 标记， 1表示跳转到修改页面，2表示执行修改操作
	 * @param User user  要修改用户的对象
	 * @param ModelAndView mv
	 * @throws Exception 
	 * */
	@RequestMapping("/user/updateUser")
	 public String updateUser(
			 String flag,
			 @ModelAttribute User user,
			 Model mv) throws Exception{
		if(flag.equals("1")){
			// 根据id查询用户
//			System.out.println(user.getuserId());
			User target = userService.findUserById(user.getuserId());
			// 设置Model数据
			mv.addAttribute("user", target);
			// 返回修改员工页面
			return "user/showUpdateUser";
		}else{
		
			//md5加密
			String md5psw = MD5Util.md5Encode(user.getUserPassword());
			user.setUserPassword(md5psw);			
			// 执行修改操作
			userService.modifyUser(user);
			// 设置客户端跳转到查询请求
			return "redirect:/user/selectUser";
		}
		// 返回
	}
	
	
	/**
	 * 处理添加请求
	 * @param String flag 标记， 1表示跳转到添加页面，2表示执行添加操作
	 * @param User user  要添加用户的对象
	 * @param ModelAndView mv
	 * @throws Exception 
	 * */
	@RequestMapping("/user/addUser")
	 public String addUser(
			 String flag,
			 @ModelAttribute User user,
			 Model mv) throws Exception{
		if(flag.equals("1")){
			// 设置跳转到添加页面
			return "user/showAddUser";
		}else{
			//md5加密
			String md5psw = MD5Util.md5Encode(user.getUserPassword());
			user.setUserPassword(md5psw);
			// 执行添加操作
			userService.addUser(user);
			// 设置客户端跳转到查询请求
			return "redirect:/user/selectUser";
		}
	}
	
	/**
	  * 用户注销
	 * @param request
	 * @param response
	 * @param mv
	 * @return
	 */
	@RequestMapping(value="/user/logoff")
	public ModelAndView logoffUser(
			HttpServletRequest request, HttpServletResponse response,
			ModelAndView mv){
		Manager user = (Manager) request.getSession().getAttribute(HrmConstants.USER_SESSION);
   		if(user!=null) {
       		request.getSession().removeAttribute(HrmConstants.USER_SESSION);
   		}
			mv.setViewName("redirect:/index.jsp");
		return mv;
	}

}
