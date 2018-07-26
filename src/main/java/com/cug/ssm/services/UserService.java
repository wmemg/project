package com.cug.ssm.services;

import java.util.List;

import com.cug.ssm.other.Page;
import com.cug.ssm.po.User;

public interface UserService {
	public User selectByPrimaryKey(String username);
	public int insert(User record);
	public int deleteByPrimaryKey(String username);
	public int getUserTotal();
	 public List<User> selectUserAll(Page page);
}
