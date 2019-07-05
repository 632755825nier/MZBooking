package com.nier.Booking.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nier.Booking.util.MailUtil;

public class SendEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SendEmailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String userName = request.getParameter("userName");
		String userEmail = request.getParameter("userEmail");
		String hotelAdress = request.getParameter("hotelAdress");
		String hotelName = request.getParameter("hotelName");
		String roomType = request.getParameter("roomType");
		String orderRoomin = request.getParameter("orderRoomin");
		String orderRoomout = request.getParameter("orderRoomout");
		String orderprices = request.getParameter("orderprices");
		String orderNumber = request.getParameter("orderNumber");
		
		System.out.println("发送邮箱servlet");
		System.out.println("orderRoomin="+orderRoomin+",orderRoomout="+orderRoomout+",orderprices="+orderprices);
//		new MailUtil(userEmail,userName,hotelAdress,hotelName,roomType).sendEmail();
			new MailUtil(userEmail,userName,hotelAdress,hotelName,roomType,orderRoomin,orderRoomout,orderprices,orderNumber).sendEmail();
		out.print(userName);
		out.flush();
		out.close();
	}

	
}
