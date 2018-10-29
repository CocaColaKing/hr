package com.jyw.hr.iface;

import com.jyw.hr.model.Resume;
import com.jyw.hr.model.ResumeSend;
import org.springframework.stereotype.Repository;

/**
 * @author jiangyw
 * @date 2018/10/29 19:56
 */
@Repository("resumeSendMapper")
public interface IResumeSend {
    /**
     * 投递简历
     * @param resumeSend
     * @return
     */
    int add(ResumeSend resumeSend);
}
