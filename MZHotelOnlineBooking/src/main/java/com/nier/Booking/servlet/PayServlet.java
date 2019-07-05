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
import com.nier.Booking.util.PaymentUtil;


public class PayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PayServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				 String  p0_Cmd = "Buy"; //业务类型   固定值“Buy” 
		         String  p1_MerId = "10001126856";//商户编号 
		         String  p2_Order = request.getParameter("ORDER_ID");// 商户订单号(从订单表中获取)
//		         String p3_Amt = request.getParameter("ORDER_MONEY").split("元")[0];
		         String  p3_Amt = "0.01";// 支付金额
		         String  p4_Cur = "CNY"; // 固定值 ”CNY” 
		         String  p5_Pid = ""; // 商品名称(酒店名)(从订单表中获取)
		         String  p6_Pcat = ""; // 商品种类(从订单表中获取)
		         String  p7_Pdesc = ""; // 商品描述(从订单表中获取)
		         String  p8_Url = "http://localhost:8080/MZHotelOnlineBooking/view/PersonalCenter.jsp"; // 商户接收支付成功数据的地址(应该跳转到修改订单表的Servlet，把是否支付的字段改成已支付)
		         String  p9_SAF = ""; // 送货地址   为“1”: 需要用户将送货地址留在易宝支付系统;为“0”: 不需要，默认为 ”0”.
		         String  pa_MP = ""; // 商户扩展信息(从订单表中获取)
		         String  pd_FrpId = request.getParameter("pd_FrpId");;//支付通道编码
		         String  pr_NeedResponse = "1"; //固定值为“1”: 需要应答机制; 收到易宝支付服务器点对点支付成功通知，必须回写以”success”（无关大小写）开头的字符串，即使您收到成功通知时发现该订单已经处理过，也要正确回写”success”，否则易宝支付将认为您的系统没有收到通知，启动重发机制，直到收到”success”为止。 
		 		 String keyValue = "69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl";//密钥
		 		 String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt, p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP, pd_FrpId, pr_NeedResponse, keyValue);
//		 		 System.out.println(request.getParameter("USER_NAME"));

		 		 
		 		 
		 		 
		 		 /**
		 		  * 插入数据到订单表
		 		  */
		 		 
//		 		 System.out.println(request.getParameter("HotelId"));
			     User user =(User)request.getSession().getAttribute("loginUser");
		 		 int userId =user.getUserId() ;		//用户ID
		 		 int orderId = Integer.parseInt(request.getParameter("ORDER_ID"));	//订单ID
		 		 int hotelId = Integer.parseInt(request.getParameter("HotelId"));	//酒店ID
		 		 String orderTime = request.getParameter("ORDER_TIME").split(" ")[0].replaceAll("/","-");	//订单时间
		 		 double orderMoney = Double.parseDouble(request.getParameter("ORDER_MONEY").split("元")[0]);	//订单总金额
		 		 int orderIsPay = 1;		//订单是否支付
		 		 int isChargeback = 0;	//订单是否可以退单
		 		 String inDate = request.getParameter("IN_DATE");		//入住日期
		 		 String outDate = request.getParameter("OUT_DATE");		//退房日期
		 		 int roomNum = Integer.parseInt(request.getParameter("ROOM_NUM").split("间")[0]);		//订单房间数量
		 		 String contactNum = request.getParameter("CONTACT_NUM").split(" ")[1];	//订房联系人号码
		 		 String orderEmail = request.getParameter("ORDER_ID"); 	//订单人邮箱	 		
		 		 int orderDay = Integer.parseInt(request.getParameter("ORDER_Allday").split("天")[0]);//入住总天数
		 		 String peopleNum = request.getParameter("orderNumber");		//入住人数（成人+小孩）
		 		String roomType = request.getParameter("ROOM_TYPE");	//订单房间类型
		 		 
		 		 System.out.println("peopleNum:"+peopleNum);
		 		 /**
		 		  * 通过查询酒店ID来查找
		 		  */
		 		 String hotelName;		//酒店名称
		 		 String hotelType;		//酒店类型
		 		String hotelAdress;		//酒店地址
		 		String hotelImg;		//酒店地址
		 		float roomGrade;		//酒店等级
		 		 
		 		 String orderUserName = request.getParameter("USER_NAME");	//订单联系人
		 		 
		 		 OrderService orderService = new OrderService();
		 		 Hotel hotel =  orderService.grtHotelByHotelId(hotelId);
		 		 
		 		hotelName = hotel.getHotelName();
		 		hotelType = hotel.getHotelType();
		 		roomGrade = hotel.getRoomGrade();
		 		hotelAdress = hotel.getHotelAdress();
		 		hotelImg = hotel.getHotelPicture();
		 		System.out.println("查询酒店表：hotelName："+hotelName);
		 		System.out.println("查询酒店表图片地址：hotelImg："+hotelImg);
		 		 
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
		 		
		 		 
		         /**
		          * 把组织好的数据重定向到正式请求地址：https://www.yeepay.com/app-merchant-proxy/node 
		             商户：把交易信息明文加密--->密文    然后把明文和密文都交给发送给第三方易宝
		                   第三方易宝拿到数据后,把传过来的明文和传过来密文比较,
		                    如果数据相同，则说明没有被篡改 (易宝与商家加密时都用的商户注册时给的相同key)    
		          */
		         response.sendRedirect("https://www.yeepay.com/app-merchant-proxy/node?" +
		                 "p0_Cmd="+p0_Cmd+"&p1_MerId="+p1_MerId+"&p2_Order="+p2_Order+"&p3_Amt="+p3_Amt+"&p4_Cur="+p4_Cur+
		                 "&p5_Pid="+p5_Pid+"&p6_Pcat="+p6_Pcat+"&p7_Pdesc="+p7_Pdesc+"&p8_Url="+p8_Url+"&p9_SAF="+p9_SAF+
		                 "&pa_MP="+pa_MP+"&pd_FrpId="+pd_FrpId+"&pr_NeedResponse="+pr_NeedResponse+"&hmac="+hmac);
		
		
		
//		         response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println(request.getCookies());
		doGet(request, response);
	}
	
	
	
	public void back(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String p1_MerId = request.getParameter("p1_MerId");
		String r0_Cmd = request.getParameter("r0_Cmd");
		String r1_Code = request.getParameter("r1_Code");
		String r2_TrxId = request.getParameter("r2_TrxId");
		String r3_Amt = request.getParameter("r3_Amt");
		String r4_Cur = request.getParameter("r4_Cur");
		String r5_Pid = request.getParameter("r5_Pid");
		String r6_Order = request.getParameter("r6_Order");
		String r7_Uid = request.getParameter("r7_Uid");
		String r8_MP = request.getParameter("r8_MP");
		String r9_BType = request.getParameter("r9_BType");
		//校验访问者是否为易宝
		String keyValue = "69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl";//密钥
		String hmac = request.getParameter("hmac");
		
		
		boolean bool = PaymentUtil.verifyCallback(hmac, p1_MerId, r0_Cmd, r1_Code, r2_TrxId, r3_Amt, r4_Cur, r5_Pid, r6_Order, r7_Uid, r8_MP, r9_BType, keyValue);
		if(!bool) {
			request.setAttribute("msg", "糟糕，您支付错了！");
		}
		 /**
		  * 修改订单状态
		  */
		OrderService order = new OrderService();
		order.updateOrder(1,1,Integer.parseInt(request.getParameter("ORDER_ID")));
		  
		/**
		 * 判断当前回调方式
		 * 如果为点对点，需要回调以success开头的字符串
		 */
		if(r9_BType.equals("2")) {
			response.getWriter().print("success");
		}
		/**
		 * 保存成功信息，转发到resultPay.jsp
		 */
		request.setAttribute("msg", "支付成功！");
		
		response.sendRedirect("view/resultPay.jsp");
	}
	

}
