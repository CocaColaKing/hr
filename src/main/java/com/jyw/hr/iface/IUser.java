package com.jyw.hr.iface;

import com.jyw.hr.model.User;
import org.springframework.stereotype.Repository;

/**
 * @author jiangyw
 * @date 2018/10/25 10:35
 */
@Repository("userMapper")
public interface IUser {
    int add(User user);
    int update(User user);
    User getUserByLoginNameAndPassword(String loginName , String password);
    User getUserByLoginName(String loginName);
}
