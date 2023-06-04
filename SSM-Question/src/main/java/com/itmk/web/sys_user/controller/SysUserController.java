package com.itmk.web.sys_user.controller;

//系统用户控制器

import com.github.pagehelper.PageInfo;
import com.google.code.kaptcha.Constants;
import com.itmk.common.ResultMap;
import com.itmk.common.ResultUtils;
import com.itmk.common.ResultVo;
import com.itmk.common.StatusCode;
import com.itmk.web.sys_user.entity.LoginParm;
import com.itmk.web.sys_user.entity.SysUser;
import com.itmk.web.sys_user.entity.UpdatePasswordParm;
import com.itmk.web.sys_user.entity.UserParm;
import com.itmk.web.sys_user.service.SysUserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/api/sysUser")
public class SysUserController {
    @Autowired
    private SysUserService sysUserService;

    /*
    * 获取全部用户
    * */
    @GetMapping("/getUserList")
    @ResponseBody//JSON数据
    public ResultVo getUserList(){
        List<SysUser> userList = sysUserService.getUserList();
        //构造返回值
        //ResultVo vo = new ResultVo("查询成功",200,userList);
//        vo.setMsg("查询成功");
//        vo.setCode(200);
//        vo.setData(userList);
        return ResultUtils.success("查询成功",userList);
    }

    /*
    * 用户管理页面
    * */
    @GetMapping("/index")
    public String index(){
        return "system/user/user";
    }

    /*
     * 用户管理页面
     * */
    @GetMapping("/add")
    public String add(){
        return "system/user/add";
    }

    /*
    * 新增用户
    * SysUser sysUser：通过sysuser对象接收前端传来的参数
    * 前端表单提交的字段，需要跟这个对象的属性一一对应
    * */
    @PostMapping("/add")
    @ResponseBody
    public ResultVo add(SysUser sysUser){
        //验证参数是否为空
        if(StringUtils.isEmpty(sysUser.getUsername()) || StringUtils.isEmpty(sysUser.getPassword())){
            return ResultUtils.error("参数不能为空!");
        }
        //根据用户账户查询该账户是否被占用
        SysUser user = sysUserService.getUserByName(sysUser.getUsername());
        if(user != null){
            return ResultUtils.error("该账户已经被占用!");
        }
        boolean save =sysUserService.addUser(sysUser);
        if(save){
            //返回true，说明新增用户成功
            return ResultUtils.success("新增用户成功！");
        }
        return ResultUtils.error("新增用户失败！");
    }

    /*
    * 获取列表
    * 1、返回json
    * 2、返回值需要满足layui table的格式
    * */
    @GetMapping("/list")
    @ResponseBody
    public ResultMap getUserList(UserParm parm){
        List<SysUser> list = sysUserService.getUserTableList(parm);
        PageInfo<SysUser> page = new PageInfo<>(list);
        return ResultUtils.pageResult(StatusCode.SUCCESS_LAYUI_CODE,"查询成功",page.getList(),page.getTotal());
    }

    /*
    * 编辑用户页面
    * */
    @GetMapping("editUI")
    public String editUI(Long userId, ModelMap modelMap){
        //查询要编辑的用户信息
        SysUser user = sysUserService.getUserById(userId);
        //把数据返回前端显示
        modelMap.put("user",user);
        return "system/user/edit";
    }

    /*
    * 编辑用户的保存
    * 1、验证账号是否被占用
    * 2、更新
    * 3、返回json
    * */
    @PostMapping("/update")
    @ResponseBody
    public ResultVo updateUser(SysUser sysUser){
        //根据用户账户查询该账户是否被占用
        SysUser user = sysUserService.getUserByName(sysUser.getUsername());
        if (user != null && !user.getUserId().equals(sysUser.getUserId())) {
            return ResultUtils.error("该账户名已经被占用!");
        }
        //更新
        boolean b = sysUserService.updateById(sysUser);
        if(b){
            return ResultUtils.success("编辑用户成功!");
        }
        return ResultUtils.error("编辑用户失败!");
    }

    /**
     * 删除用户
     */
    @PostMapping("/delete")
    @ResponseBody
    public ResultVo delete(String userId){
        boolean b = sysUserService.deleteById(userId);
        if(b){
            return ResultUtils.success("删除成功!");
        }
        return ResultUtils.error("删除失败!");
    }

    /*
    * 注册页面
    * */
    @GetMapping("/regeister")
    public String regeister(){
        return "system/user/regeister";
    }

    /*
     * 登录页面
     * */
    @GetMapping("/login")
    public String login(){
        return "login";
    }

    /*
    * 用户注册
    * */
    @PostMapping("/registerCommit")
    @ResponseBody
    public ResultVo registerCommit(LoginParm loginParm, HttpServletRequest request){
        //获取session
        HttpSession session= request.getSession();
        //从session获取验证码
        String code = (String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
        //验证验证码是否正确
        if (!loginParm.getCode().equals(code)){
            return ResultUtils.error("验证码不正确！");
        }
        //判断用户的账户是否被注册
        SysUser user = sysUserService.getUserByName(loginParm.getUsername());
        if (user != null){
            return ResultUtils.error("该账户已被注册！");
        }
        SysUser sysUser = new SysUser();
        BeanUtils.copyProperties(loginParm,sysUser);
        sysUser.setStatus(1);
        boolean b =sysUserService.addUser(sysUser);
        if (b){
            return ResultUtils.success("注册成功！");
        }
        return ResultUtils.error("注册失败！");
    }

    /*
     * 用户登录
     * */
    @PostMapping("/loginCommit")
    @ResponseBody
    public ResultVo loginCommit(LoginParm loginParm, HttpServletRequest request){
        //获取session
        HttpSession session= request.getSession();
        //从session获取验证码
        String code = (String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
        //验证验证码是否正确
        if (!loginParm.getCode().equals(code)){
            return ResultUtils.error("验证码不正确！");
        }
        //查询数据库账户是否存在
        SysUser sysUser = new SysUser();
        BeanUtils.copyProperties(loginParm,sysUser);
        SysUser user = sysUserService.login(sysUser);
        if (user == null){
            return ResultUtils.error("用户名或密码不正确！");
        }
        session.setAttribute("user",user);
        return ResultUtils.success("登录成功！",user.getUserId());
    }

    /**
     * 修改密码页面
     */
    @GetMapping("/editPassword")
    public String editPassword(){
        return "system/user/editPassword";
    }
    /**
     * 用户修改密码
     * 1、判断旧密码是否正确
     * 2、更新
     *
     */
    @PostMapping("/updatePassword")
    @ResponseBody
    public ResultVo updatePassword(UpdatePasswordParm sysUser) {
        //查数据库的密码和前端传来的旧密码是否一致
        SysUser user = sysUserService.getUserById(sysUser.getUserId());
        //判断密码是否相等
        if(!sysUser.getOldPassword().equals(user.getPassword())){
            return ResultUtils.error("旧密码不正确!");
        }
        SysUser user1 = new SysUser();
        user1.setUserId(user.getUserId());
        user1.setPassword(sysUser.getPassword());
        //更新密码
        boolean b = sysUserService.updateById(user1);
        if (b) {
            return ResultUtils.success("修改成功!");
        }
        return ResultUtils.error("修改失败!");
    }
}
