package com.jyw.hr.model;

import java.util.Date;

public class Interview {
    private String interviewId;

    private String resumeSendId;

    private String note;

    private Short status;

    private Date createTime;

    private Date updateTime;

    public String getInterviewId() {
        return interviewId;
    }

    public void setInterviewId(String interviewId) {
        this.interviewId = interviewId == null ? null : interviewId.trim();
    }

    public String getResumeSendId() {
        return resumeSendId;
    }

    public void setResumeSendId(String resumeSendId) {
        this.resumeSendId = resumeSendId == null ? null : resumeSendId.trim();
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

    public Short getStatus() {
        return status;
    }

    public void setStatus(Short status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}