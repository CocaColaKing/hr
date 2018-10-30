package com.jyw.hr.controller;

import com.jyw.hr.model.*;
import com.jyw.hr.utils.x;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
     * 游客各页面共用的头部
     */
    @GetMapping("header")
    public String header(HttpSession session, Model model) {
        Visitor visitor = (Visitor) session.getAttribute("visitor");
        // 查询其简历投递情况
        List<ResumeSend> resumeSends = resumeSendService.getByVisitor(visitor.getVisitorId());
        if (!resumeSends.isEmpty()) {
            // 如果其简历投递不为空，则根据简历投递id查询他的面试邀请
            // 切记尽量不要在循环里调用sql查询
            List<String> rsIds = new ArrayList<>();
            for (ResumeSend resumeSend : resumeSends) {
                rsIds.add(resumeSend.getResumeSendId());
            }
            List<Interview> interviews = interviewService.listByResumeSendIds(rsIds);
            model.addAttribute("interviews", interviews);
        }
        model.addAttribute("interviews", new ArrayList<Interview>()); // 防止前端出错
        return "user/header";
    }


    /**
     * 游客主页
     */
    @GetMapping("index")
    public String index(HttpSession session, Model model) {
        // 查看所有招牌信息
        List<Recruitment> recruitments = recruitmentService.listAllRecruitment();
        model.addAttribute("recruitments", recruitments);
        return "user/index";
    }

    @GetMapping("myResumes")
    public String myResumes(HttpSession session, Model model) {
        Visitor visitor = (Visitor) session.getAttribute("visitor");
        List<Resume> resumes = resumeService.listByVisitor(visitor.getVisitorId());
        model.addAttribute("resumes", resumes);
        return "user/myResumes";
    }

    @GetMapping("resume")
    public String resume(Model model, @RequestParam(value = "id", required = false, defaultValue = "0") String id) {
        Resume resume = resumeService.getById(id);
        model.addAttribute("resume", resume);
        return "user/resume";
    }

    /**
     * 添加或者更改简历
     */
    @ResponseBody
    @PostMapping("ajaxResume")
    public int ajaxResume(Resume resume, HttpSession session) {
        Visitor visitor = (Visitor) session.getAttribute("visitor");
        if (resume.getResumeId() == null || "".equals(resume.getResumeId())) {
            resume.setResumeId(x.uidGenerator());
            resume.setVisitorId(visitor.getVisitorId());
            resume.setCreateTime(new Date());
            return resumeService.add(resume);
        } else {
            resume.setUpdateTime(new Date());
            return resumeService.update(resume);
        }
    }


    /**
     * 招聘信息详情
     */
    @GetMapping("recruitment")
    public String recruitment(@RequestParam("id") String id, Model model, HttpSession session) {
        Visitor visitor = (Visitor) session.getAttribute("visitor");
        Recruitment recruitment = recruitmentService.getById(id);
        List<Resume> resumes = resumeService.listByVisitor(visitor.getVisitorId());
        model.addAttribute("recruitment", recruitment);
        model.addAttribute("resumes", resumes);
        return "user/recruitment";
    }

    /**
     * 投递简历
     */
    @ResponseBody
    @PostMapping("sendResume")
    public int sendResume(@RequestParam("recruitmentId") String recruitmentId, HttpSession session, @RequestParam("resumeId") String resumeId) {
        Visitor visitor = (Visitor) session.getAttribute("visitor");
        Resume resume = resumeService.getById(resumeId);
        if (resume == null) {
            return 0;
        }
        ResumeSend send = new ResumeSend();
        send.setResumeSendId(x.uidGenerator());
        send.setCreateTime(new Date());
        send.setRecruitmentId(recruitmentId);
        send.setVisitorId(visitor.getVisitorId());
        send.setResumeId(resume.getResumeId());
        return resumeSendService.add(send);
    }

    @ResponseBody
    @PostMapping("confirmInterview")
    public int confirmInterview(@RequestParam("id") String id) {
        Interview interview = interviewService.getById(id);
        interview.setStatus((short) 1);
        // todo 这里应该是生成员工的账号和密码以及员工的网址 然后发送到游客的邮箱中
        return interviewService.update(interview);
    }
}
