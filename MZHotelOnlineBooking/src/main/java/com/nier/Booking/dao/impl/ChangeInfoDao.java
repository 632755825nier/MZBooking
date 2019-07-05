package com.nier.Booking.dao.impl;

import java.sql.Connection;
import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;

import com.nier.Booking.util.DataSourceUtil;

public class ChangeInfoDao {
	
	public boolean ChangeUserInfo(String changeName, String changeValue, int userId) throws SQLException {
		QueryRunner runner = new QueryRunner();
		Connection conn = DataSourceUtil.getConnection();
		String sql = "update UserList set "+ changeName +" = ? where UserId=?";
		Object[] params = {changeValue, userId};
		runner.update(conn, sql, params);
		return true;
	}
	
}
