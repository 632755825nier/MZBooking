package com.nier.Booking.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nier.Booking.entity.Hotel;
import com.nier.Booking.entity.HotelEva;
import com.nier.Booking.entity.HotelSearchHotelView;
import com.nier.Booking.entity.HotelSet;
import com.nier.Booking.entity.Page;
import com.nier.Booking.service.impl.SearchResultService;

import net.sf.json.JSONArray;

/**
 * Servlet implementation class searchResult
 */
public class SearchResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchResultServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		//获取地址详细详细信息，用,分割成字符数组
		String searchAdress = request.getParameter("searchadress");
		int currentPage = Integer.parseInt(request.getParameter("currentpage"));
		//行为
		String behavior = request.getParameter("behavior");

		System.out.println("服务器"+behavior);
		String[] searchAdressArray = searchAdress.split("#");
		//searchAdressArray的三个字符串元素有市i，省，国家组成，按照这三个字段去搜索酒店
		Hotel hotel = new Hotel();
		hotel.setHotelProvince(searchAdressArray[1]);
		hotel.setHotelDowntown(searchAdressArray[0]);
		Page page = new Page();
		page.setPageSize(12);
		
		
		//调用service层的
		SearchResultService srService = new SearchResultService();
		//酒店的总记录数
		int hotelCount = srService.getCountService(searchAdressArray[1], searchAdressArray[0]);
				
		page.setTotalCount(hotelCount);
		//用cookie保存酒店page对象
		//创建cookie

		Cookie cookiePage=new Cookie("hotelcount", hotelCount+"");
		Cookie cookieHehavior = new Cookie("behavior",behavior);
		//将创建的cookie写到浏览器中

		response.addCookie(cookiePage);
		response.addCookie(cookieHehavior);
		List<HotelSearchHotelView> hotelReturn = null;
		if("热门推荐".equals(behavior)) {
//			System.out.println("在热门推荐里面");
			hotelReturn = srService.searchRult(searchAdressArray[1], searchAdressArray[0],(currentPage),7);
		}else if("价格从低到高".equals(behavior)) {
			hotelReturn = srService.searchPrice2(searchAdressArray[1], searchAdressArray[0],(currentPage),7);
		}else if("价格从高到低".equals(behavior)) {
			hotelReturn = srService.searchPrice(searchAdressArray[1], searchAdressArray[0],(currentPage),7);
		}
	
		
		
		List<HotelSet> hotelSetReturn = new ArrayList<HotelSet>();
		HotelSet hotelSet = null;

		System.out.println("hotelReturn.size()+"+hotelReturn.size());
		for(int i = 0;i < hotelReturn.size();i ++) {

			hotelSet = new HotelSet();
			hotelSet.setHotelId(hotelReturn.get(i).getHotelId());
//			System.out.println("SearchResultServlet;getHotelId"+hotelReturn.get(i).getHotelId());
			hotelSet.setHotelPicture(hotelReturn.get(i).getHotelPicture());
			hotelSet.setHotelName(hotelReturn.get(i).getHotelName());
			hotelSet.setHotelType(hotelReturn.get(i).getHotelType());
			hotelSet.setHotelAdress(hotelReturn.get(i).getHotelAdress());
			hotelSet.setHotelPer(hotelReturn.get(i).getHotelPer());
			hotelSet.setHotelProvince(hotelReturn.get(i).getHotelProvince());
			hotelSet.setHotelDowntown(hotelReturn.get(i).getHotelDowntown());
			hotelSet.setHotelArea(hotelReturn.get(i).getHotelArea());
			hotelSet.setRoomMin(hotelReturn.get(i).getRoomMin());
			hotelSet.setSumScore(hotelReturn.get(i).getSumScore());
			hotelSet.setEvaSum(hotelReturn.get(i).getEvaSum());
			int hotelId = hotelReturn.get(i).getHotelId();
			
			List<HotelEva> hotelEvaReturn = srService.searchEva(hotelId);
				if(hotelEvaReturn.size() != 0) {
					hotelSet.setEvalutionId(hotelEvaReturn.get(0).getEvalutionId());
					hotelSet.setCommentWord(hotelEvaReturn.get(0).getCommentWord());
					hotelSet.setUserId(hotelEvaReturn.get(0).getUserId());
					hotelSet.setUserName(hotelEvaReturn.get(0).getUserName());
					hotelSet.setUserCountry(hotelEvaReturn.get(0).getUserCountry());
				}else {
					hotelSet.setEvalutionId(0);
					hotelSet.setCommentWord("");
					hotelSet.setUserId(0);
					hotelSet.setUserName("");
					hotelSet.setUserCountry("");
				}
			
			hotelSetReturn.add(hotelSet);
		}
		JSONArray jsonArray = JSONArray.fromObject(hotelSetReturn);
		
		request.getSession(true).setAttribute("Downtown", searchAdressArray[0]);

		out.print(jsonArray);//返回json数组
		out.flush();
		out.close();
		
	}

}
