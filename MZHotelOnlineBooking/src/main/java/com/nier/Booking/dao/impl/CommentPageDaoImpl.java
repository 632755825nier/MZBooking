package com.nier.Booking.dao.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.nier.Booking.entity.CommentView;
import com.nier.Booking.util.DataSourceUtil;

public class CommentPageDaoImpl {
	public List<CommentView> getComment(int pageNum,int pageNow){
		List<CommentView> cv = new ArrayList<CommentView>();
		QueryRunner runner = new QueryRunner();
		Connection conn;
		List<CommentView> commentQuery = new ArrayList<CommentView>();
		
		conn = DataSourceUtil.getConnection();
		
		String sql = "select * from view_rightComment";

		try {
			commentQuery = runner.query(conn, sql,new BeanListHandler<CommentView>(CommentView.class));
		} catch (SQLException e) {
		}

		int n=0;
		for(CommentView cv1: commentQuery) {
			n++;
			if(n<=pageNum*pageNow&&n>=(pageNum*pageNow-1)){
				cv.add(cv1);
			}
		}
	
		return cv;
	}
}
