package com.blog.bean;

import java.util.Date;

public class LeaveWord {
    private Integer leaveWordId;

    private Integer userId;

    private Date time;

    private Integer bloggerId;

    private String content;

	public Integer getLeaveWordId() {
		return leaveWordId;
	}

	public void setLeaveWordId(Integer leaveWordId) {
		this.leaveWordId = leaveWordId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public Integer getBloggerId() {
		return bloggerId;
	}

	public void setBloggerId(Integer bloggerId) {
		this.bloggerId = bloggerId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

   
}