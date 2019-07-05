package com.nier.Booking.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nier.Booking.entity.Order;
import com.nier.Booking.entity.User;
import com.nier.Booking.service.impl.OrderService;

import net.sf.json.JSONArray;

public class ShowOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ShowOrderServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("我的订单进来了！！");
		PrintWriter out = response.getWriter();
		
		User user =(User)request.getSession().getAttribute("loginUser");
		int userId =user.getUserId(); 
		int orderIsPay = Integer.parseInt(request.getParameter("orderIsPay"));
		List<Order> orders = new ArrayList<Order>();
		OrderService os = new OrderService();
		
		if(orderIsPay == 2) {
			orders = os.getOrderIfmbyUserId(userId); 
		} else {
			orders = os.getOrderIfmbyUserIdandPay(userId, orderIsPay);
		}
		
		//转换为json数组 
		JSONArray jsonArray=JSONArray.fromObject(orders);
		
		out.print(jsonArray);//返回json数组
		out.flush();
		out.close();
	}

}
