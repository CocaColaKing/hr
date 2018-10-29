package com.jyw.hr.controller;

import com.jyw.hr.model.Visitor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

/**
 * @author jiangyw
 * @date 2018/10/25 10:37
 */

@RestController
@RequestMapping("login")
public class LoginController extends BaseController {

    @PostMapping("login")
    public int login(HttpSession session, Visitor user) {
        Visitor u = visitorService.getByLoginNameAndPassword(user.getLoginName(), user.getPwd());
        if (u == null) {
            return 0;
        } else {

            session.setAttribute("visitor", user);

            return 1;
        }
    }



}
