package com.nier.Booking.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mchange.v2.c3p0.ComboPooledDataSource;

/**
 * @ClassName:JdbcUtils_C3P0
 * @author Nier
 *@Descript:数据库连接工具类
 *@date:2018-8-29
 */
public class JdbcUtils_C3P0 {
		private static ComboPooledDataSource ds = null;
		//在静态代码块中创建数据库连接池
		static {
			//通过读取C3P0的xml配置文件创建数据源
			try {
				ds = new ComboPooledDataSource("Booking");
			}catch(Exception e) {
				
				throw new ExceptionInInitializerError(e);
			}
			
		}
		
		 /**
		    * @Method: getConnection
		    * @Description: 从数据源中获取数据库连接
		    * @Anthor:luozhiyuan
		    * @return Connection
		    * @throws SQLException
		    */ 
		
		public static Connection getConnection() throws SQLException {
			 //从数据源中获取数据库连接
			return ds.getConnection();
		}
		
		 /**
		    * @Method: release
		    * @Description: 释放资源，
		    * 释放的资源包括Connection数据库连接对象，负责执行SQL命令的Statement对象，存储查询结果的ResultSet对象
		    * @Anthor:luozhiyuan
		    *
		    * @param conn
		    * @param st
		    * @param rs
		    */ 
		
		public static void release(Connection conn,Statement st,ResultSet rs) {
				if(rs != null) {
					
					try {
						//关闭存储查询结果的ResultSet对象
						rs.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					rs = null;
				}
				
				if(st != null) {
					try {
						//关闭负责执行SQL命令的Statement对象
						st.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
				if(conn != null) {
					try {
						//将Connection连接对象还给数据库连接池
						conn.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
		}
}
