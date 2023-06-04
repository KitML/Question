package com.itmk.common;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ResultVo<T> {

    //返回提示信息
    private String msg;
    //返回的状态码
    private int code;
    //返回的数据
    protected T data;
}
