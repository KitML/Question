package com.itmk.web.sys_user.mapper;

import com.itmk.web.sys_user.entity.SysUser;
import com.itmk.web.sys_user.entity.UserParm;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysUserMapper {
    //查询所有用户
    List<SysUser> getUserList();
    //新增用户
    boolean addUser(@Param("user") SysUser sysUser);
    //根据用户名查询账号是否被占用
    SysUser getUserByName(@Param("username") String username);
    //查询用户列表，带分页
    List<SysUser> getUserTableList(@Param("parm") UserParm userParm);
    //根据用户id查询用户
    SysUser getUserById(@Param("userId") Long userId);
    //更新用户
    boolean updateById(@Param("user")SysUser user);
    //删除用户
    boolean deleteById(@Param("userId") String userId);
    //根据用户名和密码查询
    SysUser login(@Param("user") SysUser user);
}
