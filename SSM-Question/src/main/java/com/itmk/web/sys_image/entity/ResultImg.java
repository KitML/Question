package com.itmk.web.sys_image.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Map;

/*
* 图片上传成功返回值类型
* */
@Data
public class ResultImg implements Serializable {

    private Integer code;

    private String msg;

    private Map<String ,String > data;
}
