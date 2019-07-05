package com.nier.Booking.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nier.Booking.entity.CommentView;
import com.nier.Booking.service.impl.LookingRoomServiceImpl;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class LookingroomServlet
 */
public class LookingroomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LookingroomServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

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
		
		String num = request.getParameter("num");
		int n = Integer.parseInt(num);
		
		CommentView cv = new CommentView();
		LookingRoomServiceImpl lrs = new LookingRoomServiceImpl();
		cv = lrs.footComment(n);
		
		JSONObject json = new JSONObject();
		json.put("leftComment", cv);
		out.print(json);

		
	}

}