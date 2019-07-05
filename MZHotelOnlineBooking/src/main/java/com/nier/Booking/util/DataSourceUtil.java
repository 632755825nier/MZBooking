package com.nier.Booking.util;

import java.sql.Connection;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

/**
 * @ClassName:DataSourceUtil
 * @author luozhiyuan
 *@Descript:数据库连接工具类
 *@date:2018-8-29
 */
public class DataSourceUtil {
	
//	定义ThreadLocal对象，用于存放Connection对象
	private static ThreadLocal<Connection> threadLocal = new ThreadLocal<Connection>();
	
//	定义数据源对象
	private static DataSource ds = new ComboPooledDataSource();
	
//	获取c3p0数据源对象
	public static DataSource getDataSourceWithC3P0ByXML() {
		return ds;
	}
	
//	获取连接对象
	public static Connection getConnection(){
		Connection conn = threadLocal.get();
		try {
			if(conn == null) {
				conn = ds.getConnection();
			}
			threadLocal.set(conn);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
//	开始事务
	public static void beginTransaction() {
		Connection conn = getConnection();
		try {
			conn.setAutoCommit(false);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
//	提交事务
	public static void commitTransaction() {
		Connection conn = threadLocal.get();
		try {
			if(conn != null) {
				conn.commit();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
//	回滚事务
	public static void rollbackTransaction() {
		Connection conn = threadLocal.get();
		try {
			if(conn != null) {
				conn.rollback();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
		
//	关闭连接，释放资源
	public static void close() {
		Connection conn = threadLocal.get();
		try {
			if(conn != null) {
				conn.close();
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			threadLocal.remove();
			conn = null;
		}
	}
}
