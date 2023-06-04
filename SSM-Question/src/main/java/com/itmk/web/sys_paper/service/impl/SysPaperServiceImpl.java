package com.itmk.web.sys_paper.service.impl;

import com.itmk.web.sys_paper.entity.SysPaper;
import com.itmk.web.sys_paper.entity.SysPaperParm;
import com.itmk.web.sys_paper.mapper.SysPaperMapper;
import com.itmk.web.sys_paper.service.SysPaperService;
import com.itmk.web.sys_paper_choice.entity.SysPaperChoice;
import com.itmk.web.sys_paper_choice.mapper.SysPaperChoiceMapper;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class SysPaperServiceImpl implements SysPaperService {

    @Resource
    private SysPaperMapper sysPaperMapper;
    @Resource
    private SysPaperChoiceMapper sysPaperChoiceMapper;

    @Override
    public void savePaper(List<SysPaperParm> list) {
        //先删除再保存
        for(int i=0;i<list.size();i++){
            //判断是否是单选还是多选，是，需要删除对应的选项
            if(list.get(i).getPaperType().equals("1") || list.get(i).getPaperType().equals("2")){
                //根据试题id删除选项
                if(!StringUtils.isEmpty(list.get(i).getPaperId())){
                    sysPaperChoiceMapper.deleteChoice(list.get(i).getPaperId());
                }
            }
            //删除试题
            sysPaperMapper.deletePaper(list.get(i).getQuestionId());
        }
        //生成试题
        for (int j=0;j<list.size();j++){
            //先保存试题
            SysPaper sysPaper =new SysPaper();
            BeanUtils.copyProperties(list.get(j),sysPaper);
            //设置试题序号
            sysPaper.setPaperOrder(j+1L);
            sysPaperMapper.addPaper(sysPaper);
            //判断是否是单选还是多选，是，需要保存选项
            if (list.get(j).getPaperType().equals("1") || list.get(j).getPaperType().equals("2")){
                //此处，使用批量保存的方式保存选项，保存之前，需要设置试题的id
                list.get(j).getPaperChoice().forEach(item ->{
                    //设置试题id
                    item.setPaperId(sysPaper.getPaperId());
                });
                //保存选项
                sysPaperChoiceMapper.saveBatch(list.get(j).getPaperChoice());
            }
        }
    }

    @Override
    public List<SysPaperParm> getPaperList(Long questionId) {
        //根据问卷id查询所有的试题列表
        List<SysPaper> paperList = sysPaperMapper.listPaper(questionId);
        List<SysPaperParm> list = new ArrayList<>();
        if(paperList != null && paperList.size()>0){
            //循环试题列表
            for(int i=0;i<paperList.size();i++){
                SysPaperParm parm = new SysPaperParm();
                BeanUtils.copyProperties(paperList.get(i),parm);
                //判断是否是单选或者多选，查询对应的选项
                List<SysPaperChoice> choices =
                        sysPaperChoiceMapper.getChoiceList(paperList.get(i).getPaperId());
                //设置试题对应的选项
                parm.setPaperChoice(choices);
                list.add(parm);
            }
        }
        return list;
    }
}
