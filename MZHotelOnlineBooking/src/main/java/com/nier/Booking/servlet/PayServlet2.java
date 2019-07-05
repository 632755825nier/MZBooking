package com.nier.Booking.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nier.Booking.entity.Hotel;
import com.nier.Booking.entity.Order;
import com.nier.Booking.entity.User;
import com.nier.Booking.service.impl.OrderService;

/**
 * Servlet implementation class PayServlet2
 */
public class PayServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PayServlet2() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 User user =(User)request.getSession().getAttribute("loginUser");
 		 int userId =user.getUserId() ;		//用户ID
 		 int orderId = Integer.parseInt(request.getParameter("ORDER_ID"));	//订单ID
 		 int hotelId = Integer.parseInt(request.getParameter("HotelId"));	//酒店ID
 		 String orderTime = request.getParameter("ORDER_TIME").split(" ")[0].replaceAll("/","-");	//订单时间
 		 double orderMoney = Double.parseDouble(request.getParameter("ORDER_MONEY").split("元")[0]);	//订单总金额
 		 int orderIsPay = 1;		//订单是否支付
 		 int isChargeback = 0;	//订单是否已经退单
 		 String inDate = request.getParameter("IN_DATE");		//入住日期
 		 String outDate = request.getParameter("OUT_DATE");		//退房日期
 		 int roomNum = Integer.parseInt(request.getParameter("ROOM_NUM").split("间")[0]);		//订单房间数量
 		 String contactNum = request.getParameter("CONTACT_NUM").split(" ")[1];	//订房联系人号码
 		 String orderEmail = request.getParameter("ORDER_ID"); 	//订单人邮箱	 		
 		 int orderDay = Integer.parseInt(request.getParameter("ORDER_Allday").split("天")[0]);//入住总天数
 		 String peopleNum = request.getParameter("orderNumber");		//入住人数（成人+小孩）
 		String roomType = request.getParameter("ROOM_TYPE");	//订单房间类型
 		 
 		 /**
 		  * 通过查询酒店ID来查找
 		  */
 		 String hotelName;		//酒店名称
 		 String hotelType;		//酒店类型
 		String hotelAdress;		//酒店地址
 		float roomGrade;		//酒店等级
 		String hotelImg;		//酒店地址

 		 String orderUserName = request.getParameter("USER_NAME");	//订单联系人
 		 
 		 OrderService orderService = new OrderService();
 		 Hotel hotel =  orderService.grtHotelByHotelId(hotelId);
 		 
 		hotelName = hotel.getHotelName();
 		hotelType = hotel.getHotelType();
 		roomGrade = hotel.getRoomGrade();
 		hotelAdress = hotel.getHotelAdress();
 		hotelImg = hotel.getHotelPicture();

 		 
 		//将订单数据打包
 		Order order = new Order();
 		order.setContactNum(contactNum);
 		order.setHotelAdress(hotelAdress);
 		order.setHotelId(hotelId);
 		order.setHotelName(hotelName);
 		order.setHotelType(hotelType);
 		order.setInDate(inDate);
 		order.setIsChargeback(isChargeback);
 		order.setOrderDay(orderDay);
 		order.setOrderEmail(orderEmail);
 		order.setOrderId(orderId);
 		order.setOrderIsPay(orderIsPay);
 		order.setOrderUserName(contactNum);
 		order.setOrderTime(orderTime);
 		order.setOutDate(outDate);
 		order.setPeopleNum(peopleNum);
 		order.setRoomGrade(roomGrade);
 		order.setRoomNum(roomNum);
 		order.setUserId(userId);
 		order.setOrderUserName(orderUserName);
 		order.setOrderMoney(orderMoney);
 		order.setRoomType(roomType);
 		order.setHotelImg(hotelImg);

 		orderService.OrderInsertOrderList(order); 
 		
 		try {
			Thread.sleep(5000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("view/PersonalCenter.jsp");

	}

}
