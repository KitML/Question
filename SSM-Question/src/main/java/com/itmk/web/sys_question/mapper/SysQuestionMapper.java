package com.itmk.web.sys_question.mapper;

import com.itmk.web.sys_question.entity.QuestionParm;
import com.itmk.web.sys_question.entity.SysQuestion;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysQuestionMapper {
    //新增问卷
    boolean addQuestion(@Param("sysQuestion") SysQuestion sysQuestion);
    //查询问卷表格
    List<SysQuestion> getTableList(@Param("questionTitle") String questionTitle);
    //编辑问卷
    boolean editQuestion(@Param("sysQuestion")SysQuestion sysQuestion);
    //删除问卷
    boolean deleteQuestion(@Param("questionId")Long questionId);
    //根据id查询问卷
    SysQuestion getById(@Param("questionId")Long questionId);
    //查询我的问卷列表
    List<SysQuestion> getMyQuestionList(@Param("questionTitle") String questionTitle,@Param("userId") Long userId);
}
