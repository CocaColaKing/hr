package com.jyw.hr.controller;

import com.jyw.hr.iface.IUser;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

/**
 * @author jiangyw
 * @date 2018/10/25 10:37
 */

@Controller
public class UserController {
    @Resource
    private IUser userService;

}
