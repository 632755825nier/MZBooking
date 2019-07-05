package com.nier.provider;


import static com.nier.utils.HrmConstants.ORDERTABLE;

import java.util.Map;

import org.apache.ibatis.jdbc.SQL;

import com.nier.entity.Order;

/**
 * 
 * @author Nier
 *
 */
public class OrderDynaSqlProvider {
	// 分页动态查询
	public String selectWhitParam(Map<String, Object> params){
		String sql =  new SQL(){
			{
				SELECT("*");
				FROM(ORDERTABLE);
				if(params.get("order") != null){
					Order order = (Order)params.get("order");
					if(order.getOrderId() != 0){
						WHERE(" OrderId LIKE CONCAT ('%',#{order.orderId},'%') ");
					}
				}
			}
		}.toString();
		
		if(params.get("pageModel") != null){
			sql += " limit #{pageModel.firstLimitParam} , #{pageModel.pageSize}  ";
		}
		
		return sql;
	}	
	
	// 动态查询总数量
	public String count(Map<String, Object> params){
		return new SQL(){
			{
				SELECT("count(*)");
				FROM(ORDERTABLE);
				if(params.get("order") != null){
					Order order = (Order)params.get("order");
					if(order.getOrderId() != 0){
						WHERE(" OrderId LIKE CONCAT ('%',#{order.orderId},'%') ");
					}
				}
			}
		}.toString();
	}	
	

	// 动态更新
		public String updateOrder(Order order){
			
			return new SQL(){
				{
					UPDATE(ORDERTABLE);
					if(order.getOrderIsPay() != 0){
						SET(" OrderIsPay = #{orderIsPay} ");
					}
				
					WHERE(" OrderId = #{orderId} ");
				}
			}.toString();
		}
}
