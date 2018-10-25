package com.jyw.hr.controller;

import com.jyw.hr.model.User;
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
    public int login(HttpSession session,User user) {
        User u = userService.getUserByLoginNameAndPassword(user.getLoginName(), user.getPassword());
        if (u == null) {
            return 0;
        } else {

            session.setAttribute("user", user);

            return 1;
        }
    }



}
