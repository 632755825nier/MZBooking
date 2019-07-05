package com.nier.Booking.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nier.Booking.entity.CommentView;
import com.nier.Booking.entity.Hotel;
import com.nier.Booking.entity.Room;
import com.nier.Booking.service.impl.LookingRoomInitServiceImpl;

public class LookingroomInitServlet  extends HttpServlet{

	    public LookingroomInitServlet() {
	    
	        super();
	    }

		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			this.doPost(request, response);
			
			}

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			String hotelId = request.getParameter("hotelId");
			System.out.println("LookingroomInitServlet:hotelId="+hotelId);
			Hotel hotel = new Hotel();
			LookingRoomInitServiceImpl lris = new LookingRoomInitServiceImpl();
			hotel = lris.getHotelMessage(hotelId);
			Cookie c6;
			Cookie c7;

			
			request.getSession().setAttribute("hotelPer", hotel.getHotelPer());
			request.getSession(true).setAttribute("hotelId", hotel.getHotelId());
			
			String hotelProvice = URLEncoder.encode(hotel.getHotelProvince(),"utf-8");
			String hotelDowntown = URLEncoder.encode(hotel.getHotelDowntown(),"utf-8");
			String hotelArea = URLEncoder.encode(hotel.getHotelArea(),"utf-8");
			String hotelType = URLEncoder.encode(hotel.getHotelType(),"utf-8");
			String hotelAdress = URLEncoder.encode(hotel.getHotelAdress(),"utf-8");
			String hotelName = URLEncoder.encode(hotel.getHotelName(),"utf-8");
			//String hotelPer = URLEncoder.encode(hotel.getHotelPer(),"utf-8");
	
			Cookie c1 = new Cookie("hotelProvice",hotelProvice);
			Cookie c2 = new Cookie("hotelDowntown",hotelDowntown);
			Cookie c3 = new Cookie("hotelArea",hotelArea);
			Cookie c4 = new Cookie("hotelType",hotelType);
			Cookie c5 = new Cookie("hotelAdress",hotelAdress);
			Cookie c9 = new Cookie("hotelName",hotelName);
			//Cookie c6 = new Cookie("hotelPer",hotelPer);
			
			response.addCookie(c1);
			response.addCookie(c2);
			response.addCookie(c3);
			response.addCookie(c4);
			response.addCookie(c5);
			response.addCookie(c9);
			//response.addCookie(c6);
			
			
			//获取房间信息
			List<Room> rooms = new ArrayList<Room>();
			rooms = lris.getRoomMessage();
			int n = 0;
		
			for(Room room: rooms) {
				String roomType = URLEncoder.encode(room.getRoomType(),"utf-8");				
				String surplusRoomNumber = URLEncoder.encode(String.valueOf(room.getSurplusRoomNumber()),"utf-8");
				String roomPrice = URLEncoder.encode(String.valueOf(room.getRoomPrice()),"utf-8");

				n++;
				if(n == 1){
					c1 = new Cookie("roomType1",roomType);
					c2 = new Cookie("surplusRoomNumber1",surplusRoomNumber);
					c3 = new Cookie("roomPrice1",roomPrice);
				}
			
				if(n == 2){
					c1 = new Cookie("roomType2",roomType);
					c2 = new Cookie("surplusRoomNumber2",surplusRoomNumber);
					c3 = new Cookie("roomPrice2",roomPrice);
				}
			
				if(n == 3){
					c1 = new Cookie("roomType3",roomType);
					c2 = new Cookie("surplusRoomNumber3",surplusRoomNumber);
					c3 = new Cookie("roomPrice3",roomPrice);
				}
				
				if(n == 4){
					c1 = new Cookie("roomType4",roomType);
					c2 = new Cookie("surplusRoomNumber4",surplusRoomNumber);
					c3 = new Cookie("roomPrice4",roomPrice);
				}
				
				
				if(n == 5){
					c1 = new Cookie("roomType5",roomType);
					c2 = new Cookie("surplusRoomNumber5",surplusRoomNumber);
					c3 = new Cookie("roomPrice5",roomPrice);
				}
		
				response.addCookie(c1);
				response.addCookie(c2);
				response.addCookie(c3);				
				
			}
			
			//获取评论信息
			int pageNum=2; //一页显示的条数
			int page=1;//当前的页数
			List<CommentView> cv = new ArrayList<CommentView>();
			cv = lris.getComment(pageNum,page);
			int k=0;
			for(CommentView comment:cv) {
				k++;
				System.out.println(k);
				if(k == 1) {
					String nickName1 = URLEncoder.encode(comment.getUserNickName(),"utf-8");		
//					String userCountry1 = URLEncoder.encode(comment.getUserCountry(),"utf-8");	
					String rating1 = URLEncoder.encode(String.valueOf(comment.getPositionRating()),"utf-8");
//					String commentDate1 = URLEncoder.encode(comment.getCommentDate(),"utf-8");		
					String commentWord1 = URLEncoder.encode(comment.getCommentWord(),"utf-8");
					String inDate1 = URLEncoder.encode(comment.getInDate(),"utf-8");	
					String likeNumber1 = URLEncoder.encode(String.valueOf(comment.getLikeNumber()),"utf-8");		

					c1 = new Cookie("nickName1",nickName1);
//					c2 = new Cookie("userCountry1",userCountry1);
					c3 = new Cookie("rating1",rating1);
//					c4 = new Cookie("commentDate1",commentDate1);
					c5 = new Cookie("commentWord1",commentWord1);
					c6 = new Cookie("inDate1",inDate1);
					c7 = new Cookie("likeNumber1",likeNumber1);
					
					response.addCookie(c1);
//					response.addCookie(c2);
					response.addCookie(c3);
//					response.addCookie(c4);
					response.addCookie(c5);
					response.addCookie(c6);		
					response.addCookie(c7);
				}
				
//				if(k == 2) {
//					String nickName2 = URLEncoder.encode(comment.getUserNickName(),"utf-8");		
//					String userCountry2 = URLEncoder.encode(comment.getUserCountry(),"utf-8");	
//					String rating2 = URLEncoder.encode(String.valueOf(comment.getPositionRating()),"utf-8");
//					String commentDate2 = URLEncoder.encode(comment.getCommentDate(),"utf-8");		
//					String commentWord2 = URLEncoder.encode(comment.getCommentWord(),"utf-8");
//					String inDate2 = URLEncoder.encode(comment.getInDate(),"utf-8");	
//					String likeNumber2 = URLEncoder.encode(String.valueOf(comment.getLikeNumber()),"utf-8");		
//					System.out.println(nickName2);
//					c1 = new Cookie("nickName2",nickName2);
//					c2 = new Cookie("userCountry2",userCountry2);
//					c3 = new Cookie("rating2",rating2);
//					c4 = new Cookie("commentDate2",commentDate2);
//					c5 = new Cookie("commentWord2",commentWord2);
//					c6 = new Cookie("inDate2",inDate2);
//					c7 = new Cookie("likeNumber2",likeNumber2);
//					
//					response.addCookie(c1);
//					response.addCookie(c2);
//					response.addCookie(c3);
//					response.addCookie(c4);
//					response.addCookie(c5);
//					response.addCookie(c6);		
//					response.addCookie(c7);
//				}
					

			}
					
			
			response.sendRedirect("view/looking_room.jsp");
			
		}


}
