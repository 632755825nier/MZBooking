package com.nier.Booking.service.impl;

import com.nier.Booking.dao.impl.LookingRoomDaoImpl;
import com.nier.Booking.entity.CommentView;

public class LookingRoomServiceImpl {
		public CommentView footComment(int n) {
			CommentView cv = new CommentView();
			LookingRoomDaoImpl lrd = new LookingRoomDaoImpl();
			cv = lrd.footComment(n);
			return cv;
		}
}
