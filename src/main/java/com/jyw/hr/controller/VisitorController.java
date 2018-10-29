package com.jyw.hr.controller;

import com.jyw.hr.model.Visitor;
import com.jyw.hr.utils.x;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * User:jyw
 * Date:2018/10/25
 * Time:23:57
 * Create by IntelliJ IDEA
 */
@Controller
@RequestMapping("user")
public class VisitorController extends BaseController {

    @GetMapping("register")
    public String register() {
        return "user/register";
    }

    @ResponseBody
    @PostMapping("ajaxRegister")
    public int ajaxRegister(Visitor u) {
        Visitor user = visitorService.getByLoginName(u.getLoginName());
        if (user != null) {
            return 0; // 登录名被占用
        }
        u.setVisitorId(x.uidGenerator());
        return visitorService.add(u);
    }

    /**
     * 游客主页
     */
    @GetMapping("index")
    public String index(HttpSession session) {
        Visitor visitor = (Visitor) session.getAttribute("visitor");

        return "user/index";
    }
}