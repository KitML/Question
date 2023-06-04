package com.itmk.web.sys_paper.mapper;

import com.itmk.web.sys_paper.entity.SysPaper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysPaperMapper {
    //新增试题接口
    boolean addPaper(@Param("paper") SysPaper paper);
    //删除试题接口
    boolean deletePaper(@Param("questionId") Long questionId);
    //根据问卷id查询试题列表
    List<SysPaper> listPaper(@Param("questionId") Long questionId);
}
