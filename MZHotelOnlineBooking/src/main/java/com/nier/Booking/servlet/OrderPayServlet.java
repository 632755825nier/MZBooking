package com.nier.Booking.servlet;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nier.Booking.entity.User;

/**
 * personInfor2页面超链接跳转过来处理数据
 *获取保存到cookie中的数据，保存到Order表
 *Service层调用Dao层的插入方法 ，插入数据到订单表（字段相对应）
	重定向跳转到OrderPay页面，
	在OrderPay页面用JS获取Cookie的数据。
 * @author Nier
 *
 */
public class OrderPayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
    public OrderPayServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		  		response.setCharacterEncoding("UTF-8");
		        response.setContentType("text/html;charset=utf-8");
       
		       User user =(User)request.getSession().getAttribute("loginUser");
		       System.out.println("用户ID:"+user.getUserId());  //可以获取用户ID
		       
	
		       Random random = new Random();
		       String result="";
		       for (int i=0;i<6;i++) 
		       {
		       	result+=random.nextInt(10);
		       }
			
		    request.getSession().setAttribute("OrderId", result);
		       
			response.sendRedirect("view/OrderPay.jsp");
 
	   }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		this.doGet(request, response);

	}

}
