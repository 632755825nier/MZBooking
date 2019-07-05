package com.nier.Booking.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nier.Booking.entity.User;
import com.nier.Booking.service.impl.ChangeInfoService;

public class ChangeInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession hs = request.getSession();
		User user = (User)hs.getAttribute("loginUser");
		
		PrintWriter out = response.getWriter();
		
		boolean isChanged = false;
		String changeValue = null;
		
		if(request.getParameter("userNickName") != null) {
			changeValue = request.getParameter("userNickName");
			System.out.println(changeValue);
			isChanged = new ChangeInfoService().ChangeUserInfo("UserNickName", changeValue, user.getUserId());
			user.setUserNickName(changeValue);
		}
		if(request.getParameter("userName") != null) {
			changeValue = request.getParameter("userName");
			System.out.println(changeValue);
			isChanged = new ChangeInfoService().ChangeUserInfo("UserName", changeValue, user.getUserId());
			user.setUserName(changeValue);
		}
		if(request.getParameter("userSurnme") != null) {
			changeValue = request.getParameter("userSurnme");
			System.out.println(changeValue);
			isChanged = new ChangeInfoService().ChangeUserInfo("UserSurnme", changeValue, user.getUserId());
			user.setUserSurnme(changeValue);
		}
		if(request.getParameter("userPhoneNumber") != null) {
			changeValue = request.getParameter("userPhoneNumber");
			System.out.println(changeValue);
			isChanged = new ChangeInfoService().ChangeUserInfo("UserPhoneNumber", changeValue, user.getUserId());
			user.setUserPhoneNumber(changeValue);
		}
		if(request.getParameter("userEmail") != null) {
			changeValue = request.getParameter("userEmail");
			System.out.println(changeValue);
			isChanged = new ChangeInfoService().ChangeUserInfo("UserEmail", changeValue, user.getUserId());
			user.setUserEmail(changeValue);
		}
		if(request.getParameter("userBirthday") != null) {
			changeValue = request.getParameter("userBirthday");
			System.out.println(changeValue);
			isChanged = new ChangeInfoService().ChangeUserInfo("UserBirthday", changeValue, user.getUserId());
			user.setUserBirthday(changeValue);
		}
		if(request.getParameter("userCountry") != null) {
			changeValue = request.getParameter("userCountry");
			System.out.println(changeValue);
			isChanged = new ChangeInfoService().ChangeUserInfo("UserCountry", changeValue, user.getUserId());
			user.setUserCountry(changeValue);
		}
		if(request.getParameter("userSex") != null) {
			changeValue = request.getParameter("userSex");
			System.out.println(changeValue);
			isChanged = new ChangeInfoService().ChangeUserInfo("userSex", changeValue, user.getUserId());
			user.setUserSex(changeValue);
		}
		System.out.println(isChanged);
		
		hs.setAttribute("loginUser", user);
		
		out.print(isChanged);
		out.flush();
		out.close();		
	}
}
