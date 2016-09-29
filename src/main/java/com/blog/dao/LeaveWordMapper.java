package com.blog.dao;

import com.blog.bean.LeaveWord;

public interface LeaveWordMapper {
    int deleteByPrimaryKey(Integer leaveWordId);

    int insert(LeaveWord record);

    int insertSelective(LeaveWord record);

    LeaveWord selectByPrimaryKey(Integer leaveWordId);

    int updateByPrimaryKeySelective(LeaveWord record);

    int updateByPrimaryKeyWithBLOBs(LeaveWord record);

    int updateByPrimaryKey(LeaveWord record);
}