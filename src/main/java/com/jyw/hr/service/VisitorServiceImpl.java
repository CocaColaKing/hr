package com.jyw.hr.service;

import com.jyw.hr.iface.IVisitor;
import com.jyw.hr.mapper.VisitorMapper;
import com.jyw.hr.model.Visitor;
import com.jyw.hr.model.VisitorExample;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author jiangyw
 * @date 2018/10/25 10:35
 */
@Service("visitorService")
public class VisitorServiceImpl implements IVisitor {
    @Resource
    private VisitorMapper visitorMapper;


    @Override
    public int add(Visitor visitor) {
        return visitorMapper.insert(visitor);
    }

    @Override
    public int update(Visitor visitor) {
        return visitorMapper.updateByPrimaryKey(visitor);
    }

    @Override
    public Visitor getByLoginNameAndPassword(String loginName, String password) {
        VisitorExample example = new VisitorExample();
        example.or().andLoginNameEqualTo(loginName).andPwdEqualTo(password);
        List<Visitor> users = visitorMapper.selectByExample(example);
        return users.isEmpty() ? null : users.get(0);
    }

    @Override
    public Visitor getByLoginName(String loginName) {
        VisitorExample example = new VisitorExample();
        example.or().andLoginNameEqualTo(loginName);
        List<Visitor> users = visitorMapper.selectByExample(example);
        return users.isEmpty() ? null : users.get(0);
    }
}
