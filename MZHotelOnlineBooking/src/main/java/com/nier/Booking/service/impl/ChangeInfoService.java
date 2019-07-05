package com.nier.Booking.service.impl;

import java.sql.SQLException;

import com.nier.Booking.dao.impl.ChangeInfoDao;
import com.nier.Booking.util.DataSourceUtil;

public class ChangeInfoService {

	public boolean ChangeUserInfo(String changeName, String changeValue, int userId) {
		boolean isChanged = false;
		try {
			isChanged = new ChangeInfoDao().ChangeUserInfo(changeName, changeValue, userId);
		} catch (SQLException e) {
			isChanged = false;
		} finally {
			DataSourceUtil.close();
		}
		return isChanged;
	};

}
