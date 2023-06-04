package com.itmk.web.answer_paper.service.impl;

import com.itmk.web.answer_paper.entity.AnswerPaper;
import com.itmk.web.answer_paper.entity.CommitParm;
import com.itmk.web.answer_paper.entity.PaperPrm;
import com.itmk.web.answer_paper.mapper.AnswerPaperMapper;
import com.itmk.web.answer_paper.service.AnswerPaperService;
import com.itmk.web.answer_paper_choice.entity.AnswerPaperChoice;
import com.itmk.web.answer_paper_choice.mapper.AnswerPaperChoiceMapper;
import com.itmk.web.answer_question.entity.AnswerQuestion;
import com.itmk.web.answer_question.mapper.AnswerQuestionMapper;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class AnswerPaperServiceImpl implements AnswerPaperService {

    @Resource
    private AnswerQuestionMapper answerQuestionMapper;

    @Resource
    private AnswerPaperChoiceMapper answerPaperChoiceMapper;

    @Resource
    private AnswerPaperMapper answerPaperMapper;

    @Override
    @Transactional
    public void saveCommit(CommitParm parm) {
        //1.保存答卷表
        AnswerQuestion question = new AnswerQuestion();
        question.setCreateTime(new Date());
        question.setQuestionId(parm.getQuestionId());
        question.setUserId(parm.getUserId());
        answerQuestionMapper.save(question);
        //2.保存试题答案
        //前端传来的答案
        List<PaperPrm> paperPrmList = parm.getPaperList();
        List<AnswerPaper> papers = new ArrayList<>();
        for (int i=0;i<paperPrmList.size();i++){
            AnswerPaper paper= new AnswerPaper();
            BeanUtils.copyProperties(paperPrmList.get(i),paper);
            paper.setUserId(parm.getUserId());
            paper.setPaperId(paperPrmList.get(i).getPaperId());
            paper.setPaperType(paperPrmList.get(i).getPaperType());
            paper.setPaperValue(paperPrmList.get(i).getPaperValue());
            papers.add(paper);
            //保存单选
            if (paperPrmList.get(i).getPaperType().equals("1")){
                List<AnswerPaperChoice> choiceList = new ArrayList<>();
                AnswerPaperChoice choice = new AnswerPaperChoice();
                choice.setUserId(parm.getUserId());
                choice.setPaperId(paperPrmList.get(i).getPaperId());
                choice.setChioceId(Long.valueOf(paperPrmList.get(i).getPaperValue()));
                choiceList.add(choice);
                answerPaperChoiceMapper.save(choiceList);
            }
            //保存多选
            if (paperPrmList.get(i).getPaperType().equals("2")){
                List<AnswerPaperChoice> choiceList = new ArrayList<>();
                String regx=",";
                String [] strings=paperPrmList.get(i).getPaperValue().split(regx);
                for (int j=0;j<strings.length;j++){
                    AnswerPaperChoice choice = new AnswerPaperChoice();
                    choice.setUserId(parm.getUserId());
                    choice.setPaperId(paperPrmList.get(i).getPaperId());
                    choice.setChioceId(Long.valueOf(strings[j]));
                    choiceList.add(choice);
                }

                answerPaperChoiceMapper.save(choiceList);
            }
        }
        //批量保存答案
        answerPaperMapper.saveBatch(papers);
    }
}
