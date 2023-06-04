package com.itmk.web.answer_paper_choice.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class AnswerPaperChoice implements Serializable {
    private Long answerChoiceId;
    private Long chioceId;
    private Long paperId;
    private Long userId;
}
