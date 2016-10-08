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
	
	/**
	 * 查询用户是否存在
	 * @param name 用户名
	 * @return 如果为空，则不存在
	 */
	User userIsExist(String name);
	/**
	 * 注册用户
	 * @param user 用户实体
	 * @return 影响行数
	 */
	int regist(User user);
	/**
	 * 根据用户名查id
	 * @param name 用户名
	 * @return 对应的id
	 */
	int getIdByName(String name);
}
