package com.itmk.web.sys_user.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class UpdatePasswordParm implements Serializable {
    private Long userId;
    private String password;
    private String oldPassword;

}
