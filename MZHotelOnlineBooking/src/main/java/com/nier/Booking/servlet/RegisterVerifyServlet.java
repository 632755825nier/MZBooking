package com.nier.Booking.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nier.Booking.service.impl.RegisterServiceImpl;
import com.nier.Booking.util.VerifyUtil;

public class RegisterVerifyServlet extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		VerifyUtil verifyUtil = new VerifyUtil();
		PrintWriter out = response.getWriter();
		
		int tip = 1;
		if(request.getParameter("EOP") != null) {
			String eop = request.getParameter("EOP");
			boolean iseop = false;
			
			/**
			 * 正则表达式判断输入进来的是手机号还是邮箱
			 */
			if(verifyUtil.checkEmail(eop) || verifyUtil.checkPhone(eop)) {
				iseop = new RegisterServiceImpl().userExist(eop);
				if(iseop) {
					tip = 1;
				} else {
					tip = 2;
				}
			} else {
				tip = 0;
			}
			
		}
		out.print(tip);
		out.flush();
		out.close();
	}

}
