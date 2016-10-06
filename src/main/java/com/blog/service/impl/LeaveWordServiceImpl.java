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
		// TODO Auto-generated method stub
		return leaveWordMapper.selectCount(id);
	}

}
