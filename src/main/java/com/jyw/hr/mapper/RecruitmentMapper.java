package com.jyw.hr.mapper;

import com.jyw.hr.model.Recruitment;
import com.jyw.hr.model.RecruitmentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface RecruitmentMapper {
    long countByExample(RecruitmentExample example);

    int deleteByExample(RecruitmentExample example);

    int deleteByPrimaryKey(String recruitmentId);

    int insert(Recruitment record);

    int insertSelective(Recruitment record);

    List<Recruitment> selectByExample(RecruitmentExample example);

    Recruitment selectByPrimaryKey(String recruitmentId);

    int updateByExampleSelective(@Param("record") Recruitment record, @Param("example") RecruitmentExample example);

    int updateByExample(@Param("record") Recruitment record, @Param("example") RecruitmentExample example);

    int updateByPrimaryKeySelective(Recruitment record);

    int updateByPrimaryKey(Recruitment record);
}