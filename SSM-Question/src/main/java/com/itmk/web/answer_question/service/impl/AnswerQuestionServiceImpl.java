package com.itmk.web.answer_question.service.impl;

import com.itmk.web.answer_question.entity.AnswerQuestion;
import com.itmk.web.answer_question.mapper.AnswerQuestionMapper;
import com.itmk.web.answer_question.service.AnswerQuestionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class AnswerQuestionServiceImpl implements AnswerQuestionService {

    @Resource
    private AnswerQuestionMapper answerQuestionMapper;

    @Override
    public AnswerQuestion getAnswerById(Long questionId, Long userId) {
        return answerQuestionMapper.getAnswerById(questionId,userId);
    }
}
