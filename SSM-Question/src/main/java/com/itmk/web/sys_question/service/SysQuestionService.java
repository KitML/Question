package com.itmk.web.sys_question.service;

import com.itmk.web.sys_question.entity.QuestionParm;
import com.itmk.web.sys_question.entity.SysQuestion;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysQuestionService {
    //新增问卷
    boolean addQuestion(@Param("sysQuestion") SysQuestion sysQuestion);
    //查询问卷表格
    List<SysQuestion> getTableList(QuestionParm parm);
    //编辑问卷
    boolean editQuestion(SysQuestion sysQuestion);
    //删除问卷
    boolean deleteQuestion(@Param("questionId")Long questionId);
    //根据id查询问卷
    SysQuestion getById(@Param("questionId")Long questionId);
    //查询我的问卷列表
    List<SysQuestion> getMyQuestionList(QuestionParm parm);
}
