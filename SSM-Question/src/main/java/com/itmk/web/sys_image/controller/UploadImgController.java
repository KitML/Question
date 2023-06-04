package com.itmk.web.sys_image.controller;

import com.itmk.common.StatusCode;
import com.itmk.web.sys_image.entity.ResultImg;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/*
图片上传控制器
*/
@RestController
@RequestMapping("/api/upload/")
public class UploadImgController {

    @RequestMapping("/uploadImage")
    public ResultImg uploadImage(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
        //定义返回的url
        String Url = null;
        //获取名字
        String fileName = file.getOriginalFilename();
        //扩展名  aa.png
        String fileExtenionName = fileName.substring(fileName.indexOf("."));
        //生成新的名称
        String newName = UUID.randomUUID().toString() + fileExtenionName;
        String path = request.getSession().getServletContext().getRealPath("/WEB-INF/staticImg");
        File fileDir = new File(path);
        if (!fileDir.exists()) {
            //设置权限
            fileDir.setWritable(true);
            fileDir.mkdirs();
        }
        File targetFile = new File(path, newName);
        try {
            file.transferTo(targetFile);
            Url = "/staticImg/" + targetFile.getName();
        } catch (Exception e) {
            return null;
        }
        ResultImg result = new ResultImg();
        result.setCode(StatusCode.SUCCESS_LAYUI_CODE);
        result.setMsg("图片上传成功");
        Map<String, String> map = new HashMap<>();
        map.put("src", Url);
        result.setData(map);
        return result;
    }
}
