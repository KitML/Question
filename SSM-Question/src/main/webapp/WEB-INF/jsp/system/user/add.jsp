<%--
  Created by IntelliJ IDEA.
  User: MCheng
  Date: 2023/2/23
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../lib/layui-v2.6.3/css/layui.css" media="all">
    <link rel="stylesheet" href="../../lib/bootstrap/bootstrap.min.css" media="all">
</head>
<body class="" style="font-size: 0.85rem">
<form class="layui-form m-3">
   <div class="row mb-3">
       <div class="col d-flex">
           <label style="width: 50px;margin: 0px" class="control-label d-flex align-items-center">电话:</label>
           <input name="phone" id="phone" class="form-control form-control-sm" type="text" value="" placeholder="请输入电话"/>
       </div>
       <div class="col d-flex">
           <label style="width: 50px;margin: 0px" class="control-label d-flex align-items-center">邮箱:</label>
           <input name="email" id="email" class="form-control form-control-sm" type="text" value="" placeholder="请输入邮箱地址"/>
       </div>
   </div>
    <div class="row mb-3">
        <div class="col d-flex">
            <label style="width: 50px;margin: 0px" class="control-label d-flex align-items-center">账号:</label>
            <input name="username" id="username" class="form-control form-control-sm" type="text" value="" placeholder="请输入账号"/>
        </div>
        <div class="col d-flex">
            <label style="width: 50px;margin: 0px" class="control-label d-flex align-items-center">密码:</label>
            <input name="password" id="password" class="form-control form-control-sm" type="text" value="" placeholder="请输入密码"/>
        </div>
    </div>
    <div class="row mb-3">
        <div class="d-flex col-auto">
            <label style="width: 50px;margin: 0px" class="control-label d-flex align-items-center">状态:</label>
            <div class="input-group">
                <input type="radio" name="status" value="1" title="启用"/>
                <input type="radio" name="status" value="2" title="停用"/>
            </div>
        </div>
    </div>

</form>
<script src="../../lib/jquery-3.4.1/jquery-3.4.1.min.js" charset="utf-8"></script>
<script src="../../lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script>
    var layer = null
    //加载layui的layer模块
    layui.use('layer',function () {
        //获取layer
        layer=layui.layer;
    })
    var adddata =function () {
        //表单验证
        //获取电话输入框的值
        var phone=$("#phone").val();
        console.log(phone);
        if(!phone){
            //信息提示
            layer.msg('请输入电话号码');
            return;
        };
        //邮箱验证
        if(!$("#email").val()){
            layer.msg('请输入邮箱');
            return;
        };
        //账户验证
        if(!$("#username").val()){
            layer.msg('请输入账户');
            return;
        };
        //密码验证
        if(!$("#password").val()){
            layer.msg('请输入密码');
            return;
        };
        //用户状态验证
        if(!$('input[name="status"]:checked').val()){
            layer.msg('请选择用户状态');
            return;
        }
        return{
            phone:$("#phone").val(),
            email:$("#email").val(),
            username:$("#username").val(),
            password:$("#password").val(),
            status:$('input[name="status"]:checked').val(),
        }
    }
</script>
</body>
</html>
