package com.nier.Booking.servlet;


import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nier.Booking.util.VerifyCode;


public class GetImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetImage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//动态生成验证码图片
		VerifyCode v = new VerifyCode();  
		BufferedImage bi = v.getImage();
		System.out.println("验证码上的文本内容："+v.getText());
		request.getSession().setAttribute("Vtext", v.getText());
		VerifyCode.output(bi, response.getOutputStream());
	}

	
}
