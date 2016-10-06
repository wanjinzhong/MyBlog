package com.blog.service;

import java.util.List;
import java.util.Map;

import com.blog.bean.LeaveWord;
import com.blog.bean.LeaveWordFull;

public interface LeaveWordService {
	/**
	 * 根据博主id获取评论
	 * @param map 包含index pageSize
	 * @return
	 */
	public List<LeaveWordFull> getByBloggerId(Map map);
	/**
	 * 获取博主的评论数
	 * @param id 博主ID
	 * @return 评论数
	 */
	public Integer getCount(Integer id);
	
	/**
	 * 插入留言
	 * @param lw 留言
	 * @return 影响条数
	 */
	public int addLeaveWord(LeaveWord lw);
}
