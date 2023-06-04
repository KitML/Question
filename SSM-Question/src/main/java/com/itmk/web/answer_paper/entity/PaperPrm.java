package com.itmk.web.answer_paper.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class PaperPrm implements Serializable {
    private Long paperId;
    private String paperType;
    private String paperValue;
    private Long questionId;
}