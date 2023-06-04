package com.itmk.web.answer_question.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class AnswerQuestion implements Serializable {
    private Long answerId;
    private Long questionId;
    private Long userId;
    private Date createTime;
}
