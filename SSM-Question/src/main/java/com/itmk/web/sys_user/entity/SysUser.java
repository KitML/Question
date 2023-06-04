package com.itmk.web.sys_user.entity;


import lombok.Data;

import java.io.Serializable;

@Data//自动生成get和set方法,前提是有lombok插件和依赖
public class SysUser implements Serializable {

    private Long userId;

    private String username;

    private String password;

    private String phone;

    private String email;

    private int status;

    private boolean isadmin;



}
