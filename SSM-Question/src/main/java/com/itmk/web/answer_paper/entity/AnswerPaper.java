package com.itmk.web.answer_paper.entity;

import lombok.Data;

import java.io.Serializable;
@Data
public class AnswerPaper implements Serializable {
    private Long answerPaperId;
    private Long paperId;
    private Long userId;
    private String paperType;
    private String paperValue;
}
