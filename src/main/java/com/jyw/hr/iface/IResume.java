package com.jyw.hr.iface;

import com.jyw.hr.model.Resume;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author jiangyw
 * @date 2018/10/29 19:50
 */
@Repository("resumeMapper")
public interface IResume {
    /**
     * 添加简历
     * @param resume
     * @return
     */
    int add(Resume resume);

    /**
     * 更新简历
     * @param resume
     * @return
     */
    int update(Resume resume);

    /**
     * 删除简历
     * @param resumeId
     * @return
     */
    int del(String resumeId);

    /**
     * 根据游客id获取简历
     * @param visitorId
     * @return
     */
    List<Resume> listByVisitor(String visitorId);



    Resume getById(String resumeId);


}
