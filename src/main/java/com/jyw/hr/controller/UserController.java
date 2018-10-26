package com.jyw.hr.controller;

import com.jyw.hr.model.User;
import com.jyw.hr.model.Visitor;
import com.jyw.hr.utils.x;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * User:jyw
 * Date:2018/10/25
 * Time:23:57
 * Create by IntelliJ IDEA
 */
@Controller
@RequestMapping("user")
public class UserController extends BaseController {

    @GetMapping("register")
    public String register(){
        return "user/register";
    }

    @ResponseBody
    @PostMapping("ajaxRegister")
    public int ajaxRegister(Visitor u){
        Visitor user = visitorService.getByLoginName(u.getLoginName());
        if(user!=null){
            return 0; // 登录名被占用
        }
        u.setVisitorId(x.uidGenerator());
        return visitorService.add(u);
    }
}
