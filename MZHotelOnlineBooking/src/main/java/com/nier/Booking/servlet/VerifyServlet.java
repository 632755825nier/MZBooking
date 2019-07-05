package com.nier.Booking.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 验证码判断Servlet
 * @author Nier
 *
 */
public class VerifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String verifyCode = request.getParameter("VC");
		String tureVerify = (String) request.getSession().getAttribute("Vtext"); //验证码文本
		String isTrue;
		//忽略大小写判断
		if(verifyCode.equalsIgnoreCase(tureVerify)) {
			isTrue = "√";
		} else {
			isTrue = "验证码输入错误";
		}
		
		out.print(isTrue);
		out.flush();
		out.close();
		
	}

}
