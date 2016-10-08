package com.blog.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blog.bean.User;
import com.blog.dao.UserMapper;
import com.blog.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	public User selectById(Integer id) {
		return userMapper.selectByPrimaryKey(id);
	}

	public User check(Map<String, Object> map) {
		return userMapper.check(map);
	}

	public User userIsExist(String name) {
		return userMapper.userIsExist(name);
	}

	public int regist(User user) {
		return userMapper.insertSelective(user);
	}

	public int getIdByName(String name) {
		return userMapper.selectPrimaryKeyByName(name);
	}
	

}
