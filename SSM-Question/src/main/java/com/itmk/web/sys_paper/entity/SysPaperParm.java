package com.itmk.web.sys_paper.entity;
import com.itmk.web.sys_paper_choice.entity.SysPaperChoice;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class SysPaperParm implements Serializable {
    //试题id
    private Long paperId;
    //问卷id
    private Long questionId;
    //标题
    private String paperTitle;
    //试题类型
    private String paperType;
    private Long paperOrder;
    private List<SysPaperChoice> paperChoice;
}