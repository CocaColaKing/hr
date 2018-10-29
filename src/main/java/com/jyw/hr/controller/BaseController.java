package com.jyw.hr.controller;

import com.jyw.hr.iface.*;
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
    IVisitor visitorService;

    @Resource
    IRecruitment recruitmentService;

    @Resource
    IResume resumeService;

    @Resource
    IResumeSend resumeSendService;

    @Resource
    IInterview iInterviewService;
}
