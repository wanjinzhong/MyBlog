package com.blog.dao;

import java.util.List;
import java.util.Map;

import com.blog.bean.LeaveWord;
import com.blog.bean.LeaveWordFull;

public interface LeaveWordMapper {
	int deleteByPrimaryKey(Integer leaveWordId);

	int insert(LeaveWord record);

	int insertSelective(LeaveWord record);

	LeaveWord selectByPrimaryKey(Integer leaveWordId);

	int updateByPrimaryKeySelective(LeaveWord record);

	int updateByPrimaryKeyWithBLOBs(LeaveWord record);

	int updateByPrimaryKey(LeaveWord record);

	List<LeaveWordFull> selectByBloggerId(Map map);

	Integer selectCount(Integer id);
	
	List<LeaveWordFull> selectByBloggerIdWhichIsUnread(Map<String, Integer> map);
	
	LeaveWordFull selectFullByPrimaryKey(Integer leaveWordId);
	
	int selectCountWhichIsUnread(Integer id);
}