package com.jyw.hr.mapper;

import com.jyw.hr.model.Interview;
import com.jyw.hr.model.InterviewExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface InterviewMapper {
    long countByExample(InterviewExample example);

    int deleteByExample(InterviewExample example);

    int deleteByPrimaryKey(String interviewId);

    int insert(Interview record);

    int insertSelective(Interview record);

    List<Interview> selectByExample(InterviewExample example);

    Interview selectByPrimaryKey(String interviewId);

    int updateByExampleSelective(@Param("record") Interview record, @Param("example") InterviewExample example);

    int updateByExample(@Param("record") Interview record, @Param("example") InterviewExample example);

    int updateByPrimaryKeySelective(Interview record);

    int updateByPrimaryKey(Interview record);
}