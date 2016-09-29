package com.blog.service.impl;

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
	

}
