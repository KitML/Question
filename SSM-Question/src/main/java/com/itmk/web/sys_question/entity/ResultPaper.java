package com.itmk.web.sys_question.entity;

import com.itmk.web.sys_paper_choice.entity.ResultPaperChoice;
import lombok.Data;

import java.io.Serializable;
import java.util.List;
@Data
public class ResultPaper implements Serializable {
    //试题id
    private Long paperId;
    //问卷id
    private Long questionId;
    //标题
    private String paperTitle;
    //试题类型
    private String paperType;

    private Long paperOrder;
    //单选题和多选题对应的选项
    private List<ResultPaperChoice> paperChoice;
}
