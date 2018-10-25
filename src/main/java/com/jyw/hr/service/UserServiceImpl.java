package com.jyw.hr.service;

import com.jyw.hr.iface.IUser;
import com.jyw.hr.mapper.UserMapper;
import com.jyw.hr.model.UserExample;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author jiangyw
 * @date 2018/10/25 10:35
 */
@Service("userService")
public class UserServiceImpl implements IUser {
    @Resource
    private UserMapper userMapper;

    public long countAllUser() {
        return userMapper.countByExample(new UserExample());
    }
}
