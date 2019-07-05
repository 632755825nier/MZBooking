package com.nier.Booking.service.impl;

import java.sql.SQLException;

import com.nier.Booking.dao.impl.RegisterDaoImpl;
import com.nier.Booking.entity.User;
import com.nier.Booking.util.DataSourceUtil;

public class RegisterServiceImpl {

		//Dao层用户登录函数
		public User UserLogin(User user) {
			User user2;
			try {
				user2 = new RegisterDaoImpl().userLogin(user);
			} catch (SQLException e) {
				user2 = null;
			} finally {
				DataSourceUtil.close();
			}
			return user2;
		}
		
//		用户是否存在
		public boolean userExist(String eop) {
			boolean isExist;
			try {
				isExist = new RegisterDaoImpl().userExist(eop);
			} catch (SQLException e) {
				return false;
			} finally {
				DataSourceUtil.close();
			}
			return isExist;
		}
		
//		手机登录
		public User PhoneLogin(String phoneNum) {
			User user2;
			try {
				user2 = new RegisterDaoImpl().phoneLogin(phoneNum);
			} catch (SQLException e) {
				user2 = null;
			} finally {
				DataSourceUtil.close();
			}
			return user2;
		} 
		
		//Dao层用户注册的函数
		public boolean userRegister(User user){
			boolean result;
			try {
				result = new RegisterDaoImpl().UserRegister(user);
			} catch (SQLException e) {
				return false;
			} finally {
				DataSourceUtil.close();
			}
			return result;
		}
}
