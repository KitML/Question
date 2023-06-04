package com.itmk.web.sys_paper_choice.mapper;

import com.itmk.web.sys_paper_choice.entity.ResultPaperChoice;
import com.itmk.web.sys_paper_choice.entity.SysPaperChoice;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysPaperChoiceMapper {
    //删除选项接口
    boolean deleteChoice(@Param("paperId") Long paperId);
    //批量保存试题接口
    boolean saveBatch(@Param("choices")List<SysPaperChoice> choices);
    //根据试题id查询选项列表
    List<SysPaperChoice> getChoiceList(@Param("paperId") Long paperId);
    //查询选项的统计
    List<ResultPaperChoice> getListPaperChoice(@Param("questionId") Long questionId);
}
