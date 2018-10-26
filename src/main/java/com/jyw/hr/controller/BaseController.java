package com.jyw.hr.controller;

import com.jyw.hr.iface.IUser;
import com.jyw.hr.iface.IVisitor;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

/**
 * User:jyw
 * Date:2018/10/25
 * Time:22:32
 * Create by IntelliJ IDEA
 */
@Controller
public class BaseController {
    @Resource
    IUser userService;

    @Resource
    IVisitor visitorService;
}
