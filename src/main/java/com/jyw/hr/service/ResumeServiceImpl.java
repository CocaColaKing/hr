package com.jyw.hr.service;

import com.jyw.hr.iface.IResume;
import com.jyw.hr.mapper.ResumeMapper;
import com.jyw.hr.model.Resume;
import com.jyw.hr.model.ResumeExample;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author jiangyw
 * @date 2018/10/29 19:53
 */
@Service("resumeService")
public class ResumeServiceImpl implements IResume {
    @Resource
    private ResumeMapper resumeMapper;

    @Override
    public int add(Resume resume) {
        return resumeMapper.insert(resume);
    }

    @Override
    public int update(Resume resume) {
        return resumeMapper.updateByPrimaryKey(resume);
    }

    @Override
    public int del(String resumeId) {
        return resumeMapper.deleteByPrimaryKey(resumeId);
    }

    @Override
    public List<Resume> listByVisitor(String visitorId) {
        ResumeExample example = new ResumeExample();
        example.or().andVisitorIdEqualTo(visitorId);
        return resumeMapper.selectByExample(example);
    }

    @Override
    public Resume getById(String resumeId) {
        return resumeMapper.selectByPrimaryKey(resumeId);
    }
}
