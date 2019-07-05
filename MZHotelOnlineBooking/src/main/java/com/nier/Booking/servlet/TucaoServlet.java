package com.nier.Booking.servlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nier.Booking.entity.Tucao;
import com.nier.Booking.service.impl.TucaoServiceImpl;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class LookingroomServlet
 */
public class TucaoServlet extends HttpServlet {
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
		
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String num = request.getParameter("opeartion");
		String data = request.getParameter("data");
		
		List<Tucao> tc = new ArrayList<Tucao>();
		TucaoServiceImpl tsi = new TucaoServiceImpl();
		if(num.equalsIgnoreCase("getTucao")) {
			tc = tsi.getTucao();
			
		}
		if(num.equals("setTucao")) {
			tsi.setTucao(data);
		}
		
		
		JSONObject json = new JSONObject();
		json.put("tuCao", tc);
		out.print(json);

		
	}

}