package com.itmk.web.sys_paper_choice.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class SysPaperChoice implements Serializable {
    //选项id
    private Long chioceId;
    //试题id
    private Long paperId;
    //选项标题
    private String choiceText;
    //选项序号
    private Long choiceOrder;
}
