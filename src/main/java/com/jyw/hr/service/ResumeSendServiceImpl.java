package com.jyw.hr.service;

import com.jyw.hr.iface.IResumeSend;
import com.jyw.hr.mapper.ResumeSendMapper;
import com.jyw.hr.model.ResumeSend;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

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
    public ResumeSend getByVisitor(String visitorId) {

        return null;
    }
}
