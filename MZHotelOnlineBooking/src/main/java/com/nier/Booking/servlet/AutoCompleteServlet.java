package com.nier.Booking.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nier.Booking.service.impl.SearchResultService;

/**
 * Servlet implementation class AutoComplete
 */
public class AutoCompleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AutoCompleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		//设置字符串为utf-8
				request.setCharacterEncoding("utf-8");
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/html;charset=utf-8");
				
				PrintWriter out = response.getWriter();
				//接收index的用户输入的部分信息adInfo
				String adInfo = request.getParameter("keywords");
				System.out.println(adInfo);
				//调用service层的
				SearchResultService srService = new SearchResultService();
//				List<com.king.Booking.entity.AutoComplete> acReturn = srService.getAutoCompleteService(adInfo);
				String acReturn = srService.getAutoCompleteService(adInfo);			
				//返回结果
				System.out.println(acReturn);
				response.getWriter().write(acReturn);
				
	}

}
