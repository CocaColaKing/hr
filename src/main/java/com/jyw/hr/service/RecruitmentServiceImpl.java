package com.jyw.hr.service;

import com.jyw.hr.iface.IRecruitment;
import com.jyw.hr.mapper.RecruitmentMapper;
import com.jyw.hr.model.Recruitment;
import com.jyw.hr.model.RecruitmentExample;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author jiangyw
 * @date 2018/10/29 19:42
 */
@Service("recruitmentService")
public class RecruitmentServiceImpl implements IRecruitment {
    @Resource
    private RecruitmentMapper recruitmentMapper;

    @Override
    public int add(Recruitment recruitment) {
        return recruitmentMapper.insert(recruitment);
    }

    @Override
    public int update(Recruitment recruitment) {
        return recruitmentMapper.updateByPrimaryKey(recruitment);
    }

    @Override
    public List<Recruitment> listAllRecruitment() {
        return recruitmentMapper.selectByExample(new RecruitmentExample());
    }

    @Override
    public int del(String recruitmentId) {
        return recruitmentMapper.deleteByPrimaryKey(recruitmentId);
    }
}
