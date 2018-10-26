package com.jyw.hr.iface;

import com.jyw.hr.model.User;
import com.jyw.hr.model.Visitor;
import org.springframework.stereotype.Repository;

/**
 * @author jiangyw
 * @date 2018/10/26 17:24
 */
@Repository("userMapper")
public interface IUser {
    int add(User user);
    int update(User user);
    User getByLoginNameAndPassword(String loginName , String password);
    User getByLoginName(String loginName);
}
