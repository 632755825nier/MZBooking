package com.nier.Booking.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nier.Booking.entity.HotelView;
import com.nier.Booking.entity.SearchHotel;
import com.nier.Booking.service.impl.MapServiceImpl;

import net.sf.json.JSONArray;

/**
 * 地图窗口的Servlet
 * @author nier
 *
 */
public class ShowMapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public ShowMapServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
//		String destination = request.getParameter("destination");
		List<HotelView> hotels = null;
		
		if(request.getSession().getAttribute("Downtown") != null) {
			String downtown =(String) request.getSession().getAttribute("Downtown");
			if(request.getParameterValues("checked") != null) {
				String[] checkeds = request.getParameterValues("checked");
				SearchHotel searchHotel = new SearchHotel();
				for(String checked:checkeds) {
	//				判断并生成对象
					String[] head = checked.split(":");
					if(head[0].equals("B")) {
						float[] budget = {Float.parseFloat(head[1]),Float.parseFloat(head[2])};
						searchHotel.setRoomMin(budget);
					}
					if(head[0].equals("L")) {
						searchHotel.setRoomRating(head[1]);
					}
					if(head[0].equals("R")) {
						String[] relax = {head[1]};
						searchHotel.setRelax(relax);
					}
					if(head[0].equals("A")) {
						searchHotel.setRoomQuantity(true);
					}
					if(head[0].equals("I")) {
						searchHotel.setDiscount(true);
					}
					if(head[0].equals("E")) {
						searchHotel.setFrontDesk(true);
					}
					if(head[0].equals("F")) {
						searchHotel.setCancelPrepay(head[1]);
					}
					if(head[0].equals("C")) {
						searchHotel.setMealDinner(head[1]);
					}
					if(head[0].equals("T")) {
						searchHotel.setRoomType(head[1]);
					}
					if(head[0].equals("G")) {
						searchHotel.setRating(head[1]);
					}
					if(head[0].equals("H")) {
						searchHotel.setChainHotels(head[1]);
					}
				}
				hotels = new MapServiceImpl().queryHotelSecond(searchHotel,downtown);
			} else {
				hotels = new MapServiceImpl().queryHotelsToMap(downtown);
			}
			System.out.println(downtown);
		}
		
		JSONArray jsonArray=JSONArray.fromObject(hotels);
		
		PrintWriter out = response.getWriter();
		out.print(jsonArray);//返回json数组
		out.flush();
		out.close();
		
	}

}
