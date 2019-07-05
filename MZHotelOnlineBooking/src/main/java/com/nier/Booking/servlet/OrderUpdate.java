package com.nier.Booking.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nier.Booking.service.impl.OrderService;

import net.sf.json.JSONArray;

/**
 * Servlet implementation class OrderUpdate
 */
public class OrderUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderUpdate() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		int isPay = Integer.parseInt(request.getParameter("isPay"));
		int isChargeback = Integer.parseInt(request.getParameter("isChargeback"));
		int OrderId = Integer.parseInt(request.getParameter("OrderId"));
		OrderService os = new OrderService();
		int count = 0;
		if(isPay == 0) {
			count = os.updateOrder(isPay,isChargeback,OrderId);
		}	
		
		JSONArray jsonArray=JSONArray.fromObject(count);

		out.print(jsonArray);
		out.flush();
		out.close();
//		try {
//			Thread.sleep(3000);
//		} catch (InterruptedException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		response.sendRedirect("view/PersonalCenter.jsp");
	}

}
