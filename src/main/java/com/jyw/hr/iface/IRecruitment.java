package com.jyw.hr.iface;

import com.jyw.hr.model.Recruitment;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author jiangyw
 * @date 2018/10/29 19:37
 */
@Repository("recruitmentMapper")
public interface IRecruitment {
    /**
     * 添加招聘信息，由管理员添加发布
     * @param recruitment
     * @return
     */
    int add(Recruitment recruitment);

    /**
     * 更新招聘信息
     * @param recruitment
     * @return
     */
    int update(Recruitment recruitment);

    /**
     * 由游客查看
     * @return 所有招聘信息
     */
    List<Recruitment> listAllRecruitment();

    /**
     * 删除招聘信息
     * @param recruitmentId recruitmentId
     * @return
     */
    int del(String recruitmentId);

}
