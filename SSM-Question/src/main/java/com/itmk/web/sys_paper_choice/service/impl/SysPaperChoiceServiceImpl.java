package com.itmk.web.sys_paper_choice.service.impl;

import com.itmk.web.sys_paper_choice.entity.ResultPaperChoice;
import com.itmk.web.sys_paper_choice.entity.SysPaperChoice;
import com.itmk.web.sys_paper_choice.mapper.SysPaperChoiceMapper;
import com.itmk.web.sys_paper_choice.service.SysPaperChoiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class SysPaperChoiceServiceImpl implements SysPaperChoiceService {

    //@Autowired
    @Resource
    private SysPaperChoiceMapper sysPaperChoiceMapper;

    @Override
    public boolean deleteChoice(Long paperId) {
        return sysPaperChoiceMapper.deleteChoice(paperId);
    }

    @Override
    public boolean saveBatch(List<SysPaperChoice> choices) {
        return sysPaperChoiceMapper.saveBatch(choices);
    }

    @Override
    public List<ResultPaperChoice> getListPaperChoice(Long questionId) {
        return sysPaperChoiceMapper.getListPaperChoice(questionId);
    }
}
