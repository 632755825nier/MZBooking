package com.nier.Booking.dao.impl;

import java.sql.Connection;
import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.nier.Booking.entity.User;
import com.nier.Booking.util.DataSourceUtil;

public class RegisterDaoImpl{
	
	//用户登录
	public User userLogin(User user) throws SQLException {
		QueryRunner runner = new QueryRunner();
		Connection conn = DataSourceUtil.getConnection();
//		判断是手机还是邮箱
		String sql = "select * from UserList where";
		User userResult = null;
		if(user.getUserEmail() != null) {
			sql += " UserEmail='"+user.getUserEmail()+"'";
		} else {
			sql += " UserPhoneNumber='"+user.getUserPhoneNumber()+"'";
		}
		userResult = runner.query(conn, sql, new BeanHandler(User.class));
		
		if(!userResult.getUserPassword().equals(user.getUserPassword())) {
			userResult.setUserPassword(null);
		}
		
		return userResult;
	}
	
	//判断用户是否存在
		public boolean userExist(String eop) throws SQLException {
			QueryRunner runner = new QueryRunner();
			Connection conn = DataSourceUtil.getConnection();
//			判断是手机还是邮箱
			String sql = "select UserId from UserList where UserEmail = ? or UserPhoneNumber = ?";
			Object[] params = {eop, eop};
			
			User userResult = runner.query(conn, sql, new BeanHandler(User.class), params);
			
			if(userResult != null) {
				return true;
			} else {
				return false;
			}
		}
		
//		手机登录
		public User phoneLogin(String phoneNum) throws SQLException {
			QueryRunner runner = new QueryRunner();
			Connection conn = DataSourceUtil.getConnection();
			String sql = "select * from UserList where UserPhoneNumber = ?";
			Object[] params = {phoneNum};
			
			User userResult = runner.query(conn, sql, new BeanHandler(User.class), params);
			
			return userResult;
		}
	
	/**
	 * 用户注册
	 * @param user
	 * @return
	 * @throws SQLException 
	 */
	public boolean UserRegister(User user) throws SQLException {
		String userPassword = user.getUserPassword();
		int num = (int)(Math.random() * 1000000);
		QueryRunner runner = new QueryRunner();
		Connection conn = DataSourceUtil.getConnection();
		boolean registerRes;
		if(user.getUserPhoneNumber() != null) {
			String inSql = "insert into UserList(UserId,UserPassword,UserPhoneNumber) values(?,?,?)";
			Object[] result = {num,userPassword,user.getUserPhoneNumber()};
			runner.update(conn, inSql,result);
		} else {
			//用用户输入的邮箱号码注册
			String inSql = "insert into UserList(UserId,UserPassword,UserEmail) values(?,?,?)";
			Object[] result = {num,userPassword,user.getUserEmail()};
			runner.update(conn, inSql,result);
		}
		registerRes = true;

		if(registerRes==false) {
			System.out.println("注册失败!");
		}
		return registerRes;
	}
}
