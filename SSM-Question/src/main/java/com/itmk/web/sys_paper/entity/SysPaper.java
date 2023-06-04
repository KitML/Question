package com.itmk.web.sys_paper.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class SysPaper implements Serializable {
    //试题id
    private Long paperId;
    //问卷id
    private Long questionId;
    //标题
    private String paperTitle;
    //试题类型
    private String paperType;
    private Long paperOrder;
}