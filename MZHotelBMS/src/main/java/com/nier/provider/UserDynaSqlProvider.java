package com.nier.provider;


import static com.nier.utils.HrmConstants.USERTABLE;

import java.util.Map;

import org.apache.ibatis.jdbc.SQL;

import com.nier.entity.User;

/**
 * 
 * @author Nier
 *
 */
public class UserDynaSqlProvider {
	// 分页动态查询
	public String selectWhitParam(Map<String, Object> params){
		String sql =  new SQL(){
			{
				SELECT("*");
				FROM(USERTABLE);
				if(params.get("user") != null){
					User user = (User)params.get("user");
					if(user.getUserName() != null && !user.getUserName().equals("")){
						WHERE("  UserName LIKE CONCAT ('%',#{user.userName},'%') ");
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
				FROM(USERTABLE);
				if(params.get("user") != null){
					User user = (User)params.get("user");
					if(user.getUserName() != null && !user.getUserName().equals("")){
						WHERE(" UserName LIKE CONCAT ('%',#{user.userName},'%') ");
					}
				}
			}
		}.toString();
	}	
	
	// 动态插入
	public String insertUser(User user){
		return new SQL(){
			{
				INSERT_INTO(USERTABLE);
				if(user.getUserName() != null && !user.getUserName().equals("")){
					VALUES("UserName", "#{userName}");
				}	
				if(user.getUserPhoneNumber() != null && !user.getUserPhoneNumber().equals("")){
					VALUES("UserPhoneNumber", "#{userPhoneNumber}");
				}
				if(user.getUserEmail() != null && !user.getUserEmail().equals("")){
					VALUES("UserEmail", "#{userEmail}");
				}	
				if(user.getUserPassword() != null && !user.getUserPassword().equals("")){
					VALUES("UserPassword", "#{userPassword}");
				}
			}
		}.toString();
	}
	// 动态更新
		public String updateUser(User user){
			
			return new SQL(){
				{
					UPDATE(USERTABLE);
					if(user.getUserName() != null){
						SET(" UserName = #{userName} ");
					}
					if(user.getUserEmail() != null){
						SET(" UserEmail = #{userEmail} ");
					}
					if(user.getUserPhoneNumber()!= null){
						SET(" UserPhoneNumber = #{userPhoneNumber} ");
					}
					if(user.getUserPassword()!= null){
						SET(" UserPassword = #{userPassword} ");
					}
					if(user.getCreateDate()!= null){
						SET(" createDate = #{createDate} ");
					}
					WHERE(" UserId = #{userId} ");
				}
			}.toString();
		}
}
