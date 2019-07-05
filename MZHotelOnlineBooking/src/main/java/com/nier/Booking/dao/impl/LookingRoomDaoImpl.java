package com.nier.Booking.dao.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.nier.Booking.entity.CommentView;
import com.nier.Booking.util.DataSourceUtil;

public class LookingRoomDaoImpl {
	public CommentView footComment(int n) {
		int i=0;
		CommentView returnComment = new CommentView();
		QueryRunner runner = new QueryRunner();
		Connection conn;
		try {
			conn = DataSourceUtil.getConnection();
			
			String sql = "select * from view_rightComment";
//			List<CommentView> mapHotels = null;
		
			List<CommentView> commentQuery = runner.query(conn, sql,new BeanListHandler<CommentView>(CommentView.class));
			for(CommentView oneComment: commentQuery) {
				i++;
				if(i==n) {
					returnComment=oneComment;
				}
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		return returnComment;
	}
}
