package com.itmk.web.answer_paper.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Data
public class CommitParm implements Serializable {
    private Long userId;
    private Long questionId;
    private List<PaperPrm> paperList = new ArrayList<>();
}