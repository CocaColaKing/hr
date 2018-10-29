package com.jyw.hr.service;

import com.jyw.hr.iface.IResumeSend;
import com.jyw.hr.mapper.ResumeSendMapper;
import com.jyw.hr.model.ResumeSend;
import com.jyw.hr.model.ResumeSendExample;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author jiangyw
 * @date 2018/10/29 19:58
 */
@Service("resumeSendService")
public class ResumeSendServiceImpl implements IResumeSend {
    @Resource
    private ResumeSendMapper resumeSendMapper;

    @Override
    public int add(ResumeSend resumeSend) {
        return resumeSendMapper.insert(resumeSend);
    }

    @Override
    public List<ResumeSend> getByVisitor(String visitorId) {
        ResumeSendExample example = new ResumeSendExample();
        example.or().andVisitorIdEqualTo(visitorId);
        return resumeSendMapper.selectByExample(example);
    }
}
