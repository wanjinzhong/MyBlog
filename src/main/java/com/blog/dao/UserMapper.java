package com.blog.dao;

import java.util.Map;

import com.blog.bean.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    User check(Map<String, Object> map);
    
    User userIsExist(String name);
    
    int selectPrimaryKeyByName(String name);
}