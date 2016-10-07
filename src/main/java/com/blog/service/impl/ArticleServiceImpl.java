package com.blog.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.blog.bean.Article;
import com.blog.bean.ArticleFull;
import com.blog.dao.ArticleMapper;
import com.blog.service.ArticleService;

@Service
public class ArticleServiceImpl implements ArticleService {
	@Resource
	private ArticleMapper articleMapper;
	
	public Article getArticleById(Integer id) {
		return articleMapper.selectByPrimaryKey(id);
	}
	
	public List<ArticleFull> getAll(Integer bloggerId){
		return articleMapper.selectAllOrderByReading(bloggerId);
	}

	public ArticleFull getArticleFullById(Integer id) {
		return articleMapper.selectFullByPrimaryKey(id);
	}

	public int updateReadingById(Map<String, Integer> map) {
		return articleMapper.updateReadingByPrimaryKey(map);
	}

	public List<Article> getAritcleBaseOrderByUpdateTime(Map<String, Integer> map) {
		return articleMapper.selectAllOrderByUpdateTime(map);
	}

	public List<Article> getArticleBaseOrderByReading(Map<String, Integer> map) {
		return articleMapper.selectBaseOrderByReading(map);
	}

	public Article getArticleBaseById(Integer id) {
		return articleMapper.selectBaseByPrimaryKey(id);
	}

	public int getCount(Integer id) {
		return articleMapper.seclectCount(id);
	}

	public Article getPrev(Map<String, Integer> map) {
		return articleMapper.selectBasePrev(map);
	}

	public Article getNext(Map<String, Integer> map) {
		return articleMapper.selectBaseNext(map);
	}

	public List<ArticleFull> getAllOrderByTime(Map<String, Integer> map) {
		return articleMapper.selectAllOrderByTime(map);
	}

}
