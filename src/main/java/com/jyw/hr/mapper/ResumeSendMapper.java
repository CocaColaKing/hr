package com.jyw.hr.mapper;

import com.jyw.hr.model.ResumeSend;
import com.jyw.hr.model.ResumeSendExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ResumeSendMapper {
    long countByExample(ResumeSendExample example);

    int deleteByExample(ResumeSendExample example);

    int deleteByPrimaryKey(String resumeSendId);

    int insert(ResumeSend record);

    int insertSelective(ResumeSend record);

    List<ResumeSend> selectByExample(ResumeSendExample example);

    ResumeSend selectByPrimaryKey(String resumeSendId);

    int updateByExampleSelective(@Param("record") ResumeSend record, @Param("example") ResumeSendExample example);

    int updateByExample(@Param("record") ResumeSend record, @Param("example") ResumeSendExample example);

    int updateByPrimaryKeySelective(ResumeSend record);

    int updateByPrimaryKey(ResumeSend record);
}