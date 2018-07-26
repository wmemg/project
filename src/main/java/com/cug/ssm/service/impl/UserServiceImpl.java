package com.cug.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.cug.ssm.mapper.UserMapper;
import com.cug.ssm.other.Page;
import com.cug.ssm.po.User;
import com.cug.ssm.services.UserService;

public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper userMapper;
	
	public User selectByPrimaryKey(String username) {//根据用户名查询用户记录
		return userMapper.selectByPrimaryKey(username);
	}

	public int insert(User record) {
		return userMapper.insert(record);
	}

	public int deleteByPrimaryKey(String username) {
		return userMapper.deleteByPrimaryKey(username);
	}

	public int getUserTotal() {
		return userMapper.getUserTotal();
	}

	public List<User> selectUserAll(Page page) {
		return userMapper.selectUserAll(page);
	}

}
