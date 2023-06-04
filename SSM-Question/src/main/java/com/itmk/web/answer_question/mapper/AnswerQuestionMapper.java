package com.itmk.web.answer_question.mapper;

import com.itmk.web.answer_question.entity.AnswerQuestion;
import org.apache.ibatis.annotations.Param;

public interface AnswerQuestionMapper {
    //保存用户做的问卷
    boolean save(@Param("answerQuestion") AnswerQuestion answerQuestion);
    //解决重复答卷
    AnswerQuestion getAnswerById(@Param("questionId") Long questionId,@Param("userId")Long userId);
}
