package com.nier.Booking.dao.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.nier.Booking.entity.Tucao;
import com.nier.Booking.util.DataSourceUtil;

public class TucaoDaoImpl {
	public List<Tucao> getTucao(){
		List<Tucao> returnTucao = new ArrayList<Tucao>();
		QueryRunner runner = new QueryRunner();
		Connection conn;
		try {
			conn = DataSourceUtil.getConnection();
			
			String sql = "select * from Tucao";

		
			returnTucao = runner.query(conn, sql,new BeanListHandler<Tucao>(Tucao.class));
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		return returnTucao;
	}
	
	public void setTucao(String data)  {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSourceWithC3P0ByXML());
		
		int id = (int)((Math.random()*9+1)*1000);
		String sql = "insert into Tucao values(?,?)";
		Object[] params = {id,data};
	
		try {
			runner.update(sql, params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
}
