package com.itmk.web.sys_paper.service;

import com.itmk.web.sys_paper.entity.SysPaperParm;

import java.util.List;

public interface SysPaperService {
    //保存试题
    void savePaper(List<SysPaperParm> list);
    //根据问卷id查询试题列表回显
    List<SysPaperParm> getPaperList(Long questionId);
}
