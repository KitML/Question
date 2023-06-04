package com.itmk.web.answer_paper_choice.mapper;

import com.itmk.web.answer_paper_choice.entity.AnswerPaperChoice;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AnswerPaperChoiceMapper {
    boolean save(@Param("list") List<AnswerPaperChoice> list);
}