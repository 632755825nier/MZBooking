package com.nier.Booking.dao.impl;

import java.sql.Connection;
import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;

import com.nier.Booking.util.DataSourceUtil;

public class SubmitImgDaoImpl {
	
	public boolean saveHead(String imgURL, int userId) throws SQLException {
		QueryRunner runner = new QueryRunner();
		Connection conn = DataSourceUtil.getConnection();
		String sql = "update UserList set UserPicture = ? where UserId=?";
		Object[] params = {imgURL, userId};
		runner.update(conn, sql, params);
		return true;
	}

}
