package com.itmk.web.sys_question.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class QuestionParm implements Serializable {

    private Integer page;

    private Integer limit;

    private String questionTitle;

    private Long userId;
}
