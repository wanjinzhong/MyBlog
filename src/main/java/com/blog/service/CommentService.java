package com.blog.service;

import java.util.List;

import com.blog.bean.CommentFull;

public interface CommentService {
	/**
	 * 根据文章ID获取评论，并按时间排序
	 * @param id 文章ID
	 * @return 评论列表
	 */
	public List<CommentFull> getByArticleIdOrderByTime(Integer id);
}
