package com.blog.dao;

import com.blog.bean.Blogger;

public interface BloggerMapper {
	int deleteByPrimaryKey(Integer bloggerId);

	int insert(Blogger record);

	int insertSelective(Blogger record);

	Blogger selectByPrimaryKey(Integer bloggerId);

	int updateByPrimaryKeySelective(Blogger record);

	int updateByPrimaryKey(Blogger record);

	/**
	 * 根据博主id获取博主完整信息
	 * 
	 * @param bloggerId
	 *            博主id
	 * @return 博主完整信息
	 */
	Blogger selectFullByPrimaryKey(Integer bloggerId);

	/**
	 * 根据用户id获取博主基本信息
	 * 
	 * @param userId
	 *            用户id
	 * @return 博主基本信息
	 */
	Blogger selectBaseByUserId(Integer userId);
}