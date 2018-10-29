package com.jyw.hr.service;

import com.jyw.hr.iface.IInterview;
import com.jyw.hr.mapper.InterviewMapper;
import com.jyw.hr.model.Interview;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author jiangyw
 * @date 2018/10/29 20:02
 */
@Service("interviewService")
public class InterviewServiceImpl implements IInterview {
    @Resource
    private InterviewMapper interviewMapper;

    @Override
    public int add(Interview interview) {
        return interviewMapper.insert(interview);
    }

    @Override
    public List<Interview> listByVisitor(String visitorId) {
        // todo 需要自定义sql
        return null;
    }

    @Override
    public int update(Interview interview) {
        return interviewMapper.updateByPrimaryKey(interview);
    }
}
