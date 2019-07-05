package com.nier.Booking.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;



/**
 * 短信验证码发送请求类
 * @author kavstall
 *
 */
public class SendSms extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//获取到页面传递过来的手机号
		String phone = req.getParameter("phone");
		//根据获取到的手机号发送验证码，后台获取验证码
		String code;
		try {
			code = GetMessageCode.getCode(phone);
			//判断验证码是否发送成功
			if(code == "验证码发送失败"){
				System.out.println("验证码发送失败");
			}else{
				//把验证码返回到前端
				System.out.println(code);
				
				Cookie phoneCode = new Cookie("phoneCode", code);
				
				resp.getWriter().print(code);
			}
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	//获取浏览器页面传输过来的参数（手机号）
	/**
	 * 
	 */
}