package com.nier.Booking.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nier.Booking.entity.CommentView;
import com.nier.Booking.service.impl.CommentPageServiceImpl;

import net.sf.json.JSONObject;

public class CommentPageServlet extends HttpServlet{


		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			this.doPost(request, response);
			
			}
		

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			PrintWriter out = response.getWriter();
			int pageNow = Integer.parseInt(request.getParameter("pageNow"));
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));
			
			CommentPageServiceImpl lris = new CommentPageServiceImpl();
			List<CommentView> cv = new ArrayList<CommentView>();
			cv = lris.getComment(pageNum,pageNow);
			System.out.println(cv);
			
			JSONObject json = new JSONObject();
			json.put("rightComment",cv);
			out.print(json);
			
		}
}
