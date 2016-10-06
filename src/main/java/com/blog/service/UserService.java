package com.blog.service;

import java.util.Map;

import com.blog.bean.User;

public interface UserService {
	public User selectById(Integer id);
	
	/**
	 * 检查用户密码
	 * @param map 包含用户和密码
	 * @return 如果为不空，可以登陆，如果为空，用户名密码错误
	 */
	public User check(Map<String, Object> map);
}
