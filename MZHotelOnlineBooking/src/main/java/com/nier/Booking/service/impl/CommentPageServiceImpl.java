package com.nier.Booking.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.nier.Booking.dao.impl.CommentPageDaoImpl;
import com.nier.Booking.entity.CommentView;

public class CommentPageServiceImpl {
		public List<CommentView> getComment(int pageNum,int pageNow){
			List<CommentView> cv = new ArrayList<CommentView>();
			CommentPageDaoImpl cpdi = new CommentPageDaoImpl();
			cv = cpdi.getComment(pageNum,pageNow);	
			return cv;			
			
		}
}
