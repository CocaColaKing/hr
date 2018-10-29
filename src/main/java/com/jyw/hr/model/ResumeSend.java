package com.jyw.hr.model;

import java.util.Date;

public class ResumeSend {
    private String resumeSendId;

    private String recruitmentId;

    private String resumeId;

    private String visitorId;

    private Date createTime;

    private Date updateTime;

    public String getResumeSendId() {
        return resumeSendId;
    }

    public void setResumeSendId(String resumeSendId) {
        this.resumeSendId = resumeSendId == null ? null : resumeSendId.trim();
    }

    public String getRecruitmentId() {
        return recruitmentId;
    }

    public void setRecruitmentId(String recruitmentId) {
        this.recruitmentId = recruitmentId == null ? null : recruitmentId.trim();
    }

    public String getResumeId() {
        return resumeId;
    }

    public void setResumeId(String resumeId) {
        this.resumeId = resumeId == null ? null : resumeId.trim();
    }

    public String getVisitorId() {
        return visitorId;
    }

    public void setVisitorId(String visitorId) {
        this.visitorId = visitorId == null ? null : visitorId.trim();
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