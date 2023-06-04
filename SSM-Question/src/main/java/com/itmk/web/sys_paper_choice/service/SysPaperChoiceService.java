package com.itmk.web.sys_paper_choice.service;

import com.itmk.web.sys_paper_choice.entity.ResultPaperChoice;
import com.itmk.web.sys_paper_choice.entity.SysPaperChoice;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysPaperChoiceService {
    //删除选项接口
    boolean deleteChoice(@Param("paperId") Long paperId);
    //批量保存试题接口
    boolean saveBatch(@Param("choices") List<SysPaperChoice> choices);
    //查询选项的统计
    List<ResultPaperChoice> getListPaperChoice(Long questionId);
}
