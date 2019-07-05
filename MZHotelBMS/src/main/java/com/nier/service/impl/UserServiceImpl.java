package com.nier.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.nier.entity.Manager;
import com.nier.entity.User;
import com.nier.mapper.UserMapper;
import com.nier.service.UserService;
import com.nier.utils.PageModel;

@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	
	@Override
	public Manager login(String loginname, String password) {
		return userMapper.selectByLoginnameAndPassword(loginname, password);
	}

	@Override
	public User findUserById(Integer userId) {
		// TODO Auto-generated method stub
		return userMapper.selectById(userId);
	}

	@Transactional(readOnly=true)
	@Override
	public List<User> findUser(User user,PageModel pageModel) {
		/** 当前需要分页的总数据条数  */
		Map<String,Object> params = new HashMap<>();
		params.put("user", user);
		int recordCount = userMapper.count(params);
		pageModel.setRecordCount(recordCount);
		if(recordCount > 0){
	        /** 开始分页查询数据：查询第几页的数据 */
		    params.put("pageModel", pageModel);
	    }
		List<User> users = userMapper.selectByPage(params);
		 
		return users;
	}


	@Override
	public void removeUserById(Integer userId) {
		userMapper.deleteById(userId);
	}

	@Override
	public void modifyUser(User user) {
		System.out.println("进来UserServiceImpl了！！");
		System.out.println("UserServiceImpl"+user);
		userMapper.update(user);
	}

	@Override
	public void addUser(User user) {
		userMapper.save(user);
	}


}
