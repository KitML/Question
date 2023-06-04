package com.itmk.web.answer_question.service;

import com.itmk.web.answer_question.entity.AnswerQuestion;
import org.apache.ibatis.annotations.Param;

public interface AnswerQuestionService {
    AnswerQuestion getAnswerById(@Param("questionId") Long questionId, @Param("userId")Long userId);

}
