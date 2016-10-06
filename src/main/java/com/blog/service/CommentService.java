package com.blog.service;

import java.util.List;
import java.util.Map;

import com.blog.bean.CommentFull;

public interface CommentService {
	/**
	 * 根据文章ID获取评论，并按时间排序
	 * @param id 文章ID
	 * @return 评论列表
	 */
	public List<CommentFull> getByArticleIdOrderByTime(Map<String,Integer> map);
	
	/**
	 * 获取文章的所有评论数
	 * @param id 文章id
	 * @return 文章的所有评论数
	 */
	public int getCount(Integer id);
}
