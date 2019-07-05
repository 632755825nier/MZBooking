package com.nier.Booking.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nier.Booking.entity.User;
import com.nier.Booking.service.impl.RegisterServiceImpl;
import com.nier.Booking.util.MD5Util;
import com.nier.Booking.util.VerifyUtil;

/**
 * Session来保存用户登录状态，如果有登录信息，则显示头像那个div，不然就显示注册和登录的盒子
 * @author Nier 
 *
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		VerifyUtil verifyUtil = new VerifyUtil();
		User user = new User();
		
		String phoneNum = null;
		String userEmail = null;
		String userPassword = null;
		String path = request.getParameter("url");
		User userReturn = new User();
		
		if(request.getParameter("phoneNum") != null) {
			phoneNum = request.getParameter("phoneNum");
			
			user.setUserPhoneNumber(phoneNum);
			userReturn = new RegisterServiceImpl().PhoneLogin(phoneNum);

		} else {
			userEmail = request.getParameter("emailOrphone");
			userPassword = request.getParameter("pwd");
			/**
			 * 正则表达式判断输入进来的是手机号还是邮箱
			 */
			if(verifyUtil.checkEmail(userEmail)) {
				user.setUserEmail(userEmail);
			} else if(verifyUtil.checkPhone(userEmail)) {
				user.setUserPhoneNumber(userEmail);
			} else {
				out.print("alert('请输入正确格式！！！')");
				response.sendRedirect(request.getContextPath()+path);
				return;
			}
			
			String userPswMD5 = null;
			try {
				userPswMD5 = MD5Util.md5Encode(userPassword);
				System.out.println(userPswMD5);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
			user.setUserPassword(userPswMD5);
	
			userReturn = new RegisterServiceImpl().UserLogin(user);
		}
		if(userReturn == null) {
			//登录失败
			out.print("alert('该账号不存在！！！')");
		} else if(userReturn.getUserPassword() == null) {
			out.print("alert('账号或密码错误！！！')");
		} else {
			HttpSession hs = request.getSession(true);
			hs.setAttribute("loginUser", userReturn);
		}
		response.sendRedirect(request.getContextPath()+path);
	}

}
