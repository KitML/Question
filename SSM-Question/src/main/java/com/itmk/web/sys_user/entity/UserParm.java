package com.itmk.web.sys_user.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class UserParm implements Serializable {

    //当前第几页
    private int page;
    //每页查询的条数
    private int limit;
    //搜索关键字
    private String phone;
}
