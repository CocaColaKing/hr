package com.jyw.hr.service;

import com.jyw.hr.iface.IInterview;
import com.jyw.hr.mapper.InterviewMapper;
import com.jyw.hr.mapper.ResumeSendMapper;
import com.jyw.hr.model.Interview;
import com.jyw.hr.model.InterviewExample;
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
    @Resource
    private ResumeSendMapper resumeSendMapper;

    @Override
    public int add(Interview interview) {
        return interviewMapper.insert(interview);
    }

    @Override
    public List<Interview> listByVisitor(String visitorId) {
        // todo 需要自定义sql
//        select i.*
//                from INTERVIEW i,
//        RESUME_SEND r,
//        RECRUITMENT r2
//        where i.RESUME_SEND_ID = r.RESUME_SEND_ID
//        and r.RECRUITMENT_ID = r2.RECRUITMENT_ID
//        and r.VISITOR_ID = '42563be13b83';

        return null;
    }

    @Override
    public int update(Interview interview) {
        return interviewMapper.updateByPrimaryKey(interview);
    }

    @Override
    public List<Interview> listByResumeSendIds(List<String> resumeSendIds) {
        InterviewExample example = new InterviewExample();
        example.or().andResumeSendIdIn(resumeSendIds);
        return interviewMapper.selectByExample(example);
    }

    @Override
    public Interview getById(String interviewId) {
        return interviewMapper.selectByPrimaryKey(interviewId);
    }
}
