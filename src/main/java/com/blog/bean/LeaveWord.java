package com.blog.bean;

import java.util.Date;

public class LeaveWord {
    private Integer leaveWordId;

    private Integer boggerId;

    private Date time;

    private String content;

    public Integer getLeaveWordId() {
        return leaveWordId;
    }

    public void setLeaveWordId(Integer leaveWordId) {
        this.leaveWordId = leaveWordId;
    }

    public Integer getBoggerId() {
        return boggerId;
    }

    public void setBoggerId(Integer boggerId) {
        this.boggerId = boggerId;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}