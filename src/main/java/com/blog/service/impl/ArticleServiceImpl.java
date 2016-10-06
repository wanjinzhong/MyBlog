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
	
	public List<ArticleFull> getAll(){
		return articleMapper.selectAllOrderByReading();
	}

	public ArticleFull getArticleFullById(Integer id) {
		return articleMapper.selectFullByPrimaryKey(id);
	}

	public int updateReadingById(Map<String, Integer> map) {
		return articleMapper.updateReadingByPrimaryKey(map);
	}

	public List<Article> getAritcleBaseOrderByUpdateTime() {
		return articleMapper.selectAllOrderByUpdateTime();
	}

	public List<Article> getArticleBaseOrderByReading() {
		return articleMapper.selectBaseOrderByReading();
	}

	public Article getArticleBaseById(Integer id) {
		return articleMapper.selectBaseByPrimaryKey(id);
	}

	public int getCount(Integer id) {
		return articleMapper.seclectCount(id);
	}

}
