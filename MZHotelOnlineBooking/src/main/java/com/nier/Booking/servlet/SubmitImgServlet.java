package com.nier.Booking.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nier.Booking.entity.User;
import com.nier.Booking.service.impl.SubmitImgService;

import sun.misc.BASE64Decoder;

public class SubmitImgServlet extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("进来了");
		HttpSession hs = request.getSession();
		User user = (User)hs.getAttribute("loginUser");
		
		String base64Img = request.getParameter("source").replace(" ", "+");
		String imgFilePath = null;
        try {    
        	if(base64Img != null) {
        		base64Img = base64Img.split(",")[1];
        	}
            // Base64解码    
        	BASE64Decoder decoder = new BASE64Decoder();
            byte[] b = decoder.decodeBuffer(base64Img);
            for (int i = 0; i < b.length; ++i) {
                if (b[i] < 0) {// 调整异常数据    
                    b[i] += 256;    
                }    
            }    
            // 生成png图片    
            imgFilePath = request.getServletContext().getRealPath("/")+"\\"+user.getUserId()+"img.png";
            System.out.println(imgFilePath);
            OutputStream out = new FileOutputStream(imgFilePath);    
            out.write(b);    
            out.flush();    
            out.close();    
        } catch (Exception e) {    
            e.printStackTrace();    
        }
		
        String imgURL = user.getUserId()+"img.png";
        boolean isSaved = new SubmitImgService().SaveHead(imgURL, user.getUserId());
        
        user.setUserPicture(imgURL);
        hs.setAttribute("loginUser", user);
		
		PrintWriter write = response.getWriter();
		write.print(isSaved);
		write.flush();
		write.close();
	}

}
