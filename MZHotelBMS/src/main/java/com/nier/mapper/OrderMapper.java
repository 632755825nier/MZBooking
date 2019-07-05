package com.nier.mapper;

import static com.nier.utils.HrmConstants.ORDERTABLE;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.springframework.stereotype.Repository;

import com.nier.entity.Order;
import com.nier.provider.OrderDynaSqlProvider;

@Repository("orderMapper")
public interface OrderMapper {
	
		// 根据id查询用户
	@Select("select * from "+ORDERTABLE+" where OrderId = #{orderId}")
	Order selectById(Integer orderId);
	
	// 根据id删除用户
	@Delete(" delete from "+ORDERTABLE+" where OrderId = #{orderId} ")
	void deleteById(Integer orderId);
			
	// 动态修改用户
	@SelectProvider(type=OrderDynaSqlProvider.class,method="updateOrder")
	void update(Order order);
		
	
	
	
	// 动态查询
	@SelectProvider(type=OrderDynaSqlProvider.class,method="selectWhitParam")
	List<Order> selectByPage(Map<String, Object> params);
	
	// 根据参数查询用户总数
	@SelectProvider(type=OrderDynaSqlProvider.class,method="count")
	Integer count(Map<String, Object> params);
	
	// 动态插入用户
//	@SelectProvider(type=OrderDynaSqlProvider.class,method="insertOrder")
//	void save(Order order);
//	

}
