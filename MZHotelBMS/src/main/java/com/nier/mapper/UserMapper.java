package com.nier.mapper;

import static com.nier.utils.HrmConstants.MANAGERTABLE;
import static com.nier.utils.HrmConstants.USERTABLE;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.springframework.stereotype.Repository;

import com.nier.entity.Manager;
import com.nier.entity.User;
import com.nier.provider.UserDynaSqlProvider;

@Repository("userMapper")
public interface UserMapper {
	
	// 根据登录名和密码查询员工
	@Select("select * from "+MANAGERTABLE+" where loginName = #{loginname} and password = #{password}")
	Manager selectByLoginnameAndPassword(
		@Param("loginname") String loginname,
		@Param("password") String password);
		
		// 根据id查询用户
	@Select("select * from "+USERTABLE+" where UserId = #{userId}")
	User selectById(Integer userId);
	
	// 根据id删除用户
	@Delete(" delete from "+USERTABLE+" where UserId = #{userId} ")
	void deleteById(Integer userId);
			
	// 动态修改用户
	@SelectProvider(type=UserDynaSqlProvider.class,method="updateUser")
	void update(User user);
		
	
	
	
	// 动态查询
	@SelectProvider(type=UserDynaSqlProvider.class,method="selectWhitParam")
	List<User> selectByPage(Map<String, Object> params);
	
	// 根据参数查询用户总数
	@SelectProvider(type=UserDynaSqlProvider.class,method="count")
	Integer count(Map<String, Object> params);
	
	// 动态插入用户
	@SelectProvider(type=UserDynaSqlProvider.class,method="insertUser")
	void save(User user);
	

}
