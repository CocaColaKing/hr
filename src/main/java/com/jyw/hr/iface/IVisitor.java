package com.jyw.hr.iface;

import com.jyw.hr.model.Visitor;
import org.springframework.stereotype.Repository;

/**
 * @author jiangyw
 * @date 2018/10/25 10:35
 */
@Repository("visitorMapper")
public interface IVisitor {
    int add(Visitor visitor);
    int update(Visitor visitor);
    Visitor getByLoginNameAndPassword(String loginName , String password);
    Visitor getByLoginName(String loginName);
}
