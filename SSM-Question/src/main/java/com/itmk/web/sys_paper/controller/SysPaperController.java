package com.itmk.web.sys_paper.controller;

import com.itmk.common.ResultUtils;
import com.itmk.common.ResultVo;
import com.itmk.web.sys_paper.entity.SysPaperParm;
import com.itmk.web.sys_paper.service.SysPaperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/*
* 设计试题控制器
* */
@Controller
@RequestMapping("/api/sysPaper")
public class SysPaperController {

    @Autowired
    private SysPaperService sysPaperService;

    /*
    * 试题设计首页
    * */
    @GetMapping("/index")
    public String index(){
        return "system/paper/index";
    }
    /*
     * 试题设计页面
     * */
    @GetMapping("/setting")
    public String setting(Long questionId, ModelMap map){
        map.put("questionId",questionId);
        return "system/paper/setting";
    }

    /**
     * 保存试题
     */
    @PostMapping("/savePaper")
    @ResponseBody
    public ResultVo savePaper(@RequestBody List<SysPaperParm> paperList) {
        sysPaperService.savePaper(paperList);
        return ResultUtils.success("操作成功!");
    }

    /**
     * 查询试题回显
     */
    @GetMapping("/getPaperList")
    @ResponseBody
    public ResultVo getPaperList(Long questionId){
        List<SysPaperParm> paperList = sysPaperService.getPaperList(questionId);
        return ResultUtils.success("查询成功",paperList);
    }

    /*
    * 答卷试题列表
    * */
    @GetMapping("/answer")
    public String answer(Long questionId,ModelMap map){
        map.put("questionId",questionId);
        return "system/paper/answer";
    }
}
