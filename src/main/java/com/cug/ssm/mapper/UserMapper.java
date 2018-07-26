package com.cug.ssm.mapper;

import java.util.List;

import com.cug.ssm.other.Page;
import com.cug.ssm.po.User;

public interface UserMapper {
    int deleteByPrimaryKey(String username);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String username);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    
    ////////////////////////////////////////////////////////////////
    
    public List<User> findUserList(User user) throws Exception;
    public List<User> findUser(String username)throws Exception;
    public User login(String username)throws Exception;
    public List<User> serachUserAll();
    public List<User> serachUser(String username);
    public List<User> selectUserAll(Page page);
    public int getUserTotal();
    
}