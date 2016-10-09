package com.blog.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.blog.bean.LeaveWord;
import com.blog.bean.LeaveWordFull;
import com.blog.dao.LeaveWordMapper;
import com.blog.service.LeaveWordService;

@Service
public class LeaveWordServiceImpl implements LeaveWordService {

	@Resource
	private LeaveWordMapper leaveWordMapper;
	
	public List<LeaveWordFull> getByBloggerId(Map map) {
		return leaveWordMapper.selectByBloggerId(map);
	}

	public Integer getCount(Integer id) {
		return leaveWordMapper.selectCount(id);
	}

	public int addLeaveWord(LeaveWord lw) {
		return leaveWordMapper.insertSelective(lw);
	}

	public List<LeaveWordFull> getByBloggerIdUnread(Map<String, Integer> map) {
		return leaveWordMapper.selectByBloggerIdWhichIsUnread(map);
	}

	public LeaveWordFull getFullByPrimaryKey(Integer leaveWordId) {
		return leaveWordMapper.selectFullByPrimaryKey(leaveWordId);
	}

	public int updateSelective(LeaveWord leaveword) {
		return leaveWordMapper.updateByPrimaryKeySelective(leaveword);
	}

	public int getCountUnread(Integer id) {
		return leaveWordMapper.selectCountWhichIsUnread(id);
	}

	public int deleteById(Integer leaveWordId) {
		return leaveWordMapper.deleteByPrimaryKey(leaveWordId);
	}

}
