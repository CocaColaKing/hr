package com.jyw.hr.service;

import com.jyw.hr.iface.IUser;
import com.jyw.hr.mapper.UserMapper;
import com.jyw.hr.model.User;
import com.jyw.hr.model.UserExample;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author jiangyw
 * @date 2018/10/25 10:35
 */
@Service("userService")
public class UserServiceImpl implements IUser {
    @Resource
    private UserMapper userMapper;


    public int add(User user) {
        return userMapper.insert(user);
    }

    public int update(User user) {
        return userMapper.updateByPrimaryKey(user);
    }

    public User getUserByLoginNameAndPassword(String loginName, String password) {
        UserExample example = new UserExample();
        example.or().andLoginNameEqualTo(loginName).andPasswordEqualTo(password);
        List<User> users = userMapper.selectByExample(example);
        return users.isEmpty() ? null : users.get(0);
    }

    @Override
    public User getUserByLoginName(String loginName) {
        UserExample example = new UserExample();
        example.or().andLoginNameEqualTo(loginName);
        List<User> users = userMapper.selectByExample(example);
        return users.isEmpty() ? null : users.get(0);
    }
}
