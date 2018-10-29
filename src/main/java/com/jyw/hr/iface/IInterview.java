package com.jyw.hr.iface;

import com.jyw.hr.model.Interview;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author jiangyw
 * @date 2018/10/29 19:59
 */
@Repository("interviewMapper")
public interface IInterview {
    /**
     * 添加面试邀请（管理员的操作）
     * @param interview
     * @return
     */
    int add(Interview interview);

    /**
     * 根据游客id查询面试邀请
     * @param visitorId
     * @return
     */
    List<Interview> listByVisitor(String visitorId);

    /**
     * 更新面试邀请
     * @param interview
     * @return
     */
    int update(Interview interview);

    /**
     * 根据简历投递id查询面试邀请
     * @param resumeSendIds
     * @return
     */
    List<Interview> listByResumeSendIds(List<String> resumeSendIds);
}
