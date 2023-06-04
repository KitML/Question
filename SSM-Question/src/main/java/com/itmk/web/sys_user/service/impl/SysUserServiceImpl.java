package com.itmk.web.sys_user.service.impl;

import com.github.pagehelper.PageHelper;
import com.itmk.web.sys_user.entity.SysUser;
import com.itmk.web.sys_user.entity.UserParm;
import com.itmk.web.sys_user.mapper.SysUserMapper;
import com.itmk.web.sys_user.service.SysUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class SysUserServiceImpl implements SysUserService {

    //@Autowired
    @Resource
    private SysUserMapper sysUserMapper;


    @Override
    public List<SysUser> getUserList() {
        return sysUserMapper.getUserList();
    }

    @Override
    public boolean addUser(SysUser sysUser) {
        return sysUserMapper.addUser(sysUser);
    }

    @Override
    public SysUser getUserByName(String username) {
        return sysUserMapper.getUserByName(username);
    }

    @Override
    public List<SysUser> getUserTableList(UserParm userParm) {
        //设置分页参数一定要在sql查询之前
        PageHelper.startPage(userParm.getPage(),userParm.getLimit());
        return sysUserMapper.getUserTableList(userParm);
    }

    @Override
    public SysUser getUserById(Long userId) {
        return sysUserMapper.getUserById(userId);
    }

    @Override
    public boolean updateById(SysUser user) {
        return sysUserMapper.updateById(user);
    }

    @Override
    public boolean deleteById(String userId) {
        return sysUserMapper.deleteById(userId);
    }

    @Override
    public SysUser login(SysUser user) {
        return sysUserMapper.login(user);
    }
}
