<%--
  Created by IntelliJ IDEA.
  User: MCheng
  Date: 2023/2/24
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../lib/layui-v2.6.3/css/layui.css" media="all">
    <link rel="stylesheet" href="../../lib/bootstrap/bootstrap.min.css" media="all">
</head>
<body class="m-3" style="font-size: 0.8rem;">
<form class="layui-form">
    <div class="row mb-3">
        <div class="col d-flex align-items-center">
            <label style="width: 80px;margin: 0px;" class="d-flex align-items-center"><span style="color: #FF7670;">*
          </span>电话:</label>
            <input type="text" id="phone" value="${user.phone}" class="form-control form-control-sm"/>
            <input type="hidden" id="userId" value="${user.userId}" class="form-control form-control-sm"/>
        </div>
        <div class="col d-flex align-items-center">
            <label style="width: 80px;margin: 0px;" class="d-flex align-items-center"><span style="color: #FF7670;">*</span>邮箱:</label>
            <input type="text" id="email" value="${user.email}" class="form-control form-control-sm"/>
        </div>
    </div>
    <div class="row mb-3">
        <div class="col d-flex align-items-center">
            <label style="width: 80px;margin: 0px;" class="d-flex align-items-center"><span style="color: #FF7670;">*
          </span>账号:</label>
            <input type="text" id="username" value="${user.username}" class="form-control form-control-sm"/>
        </div>
        <div class="col d-flex align-items-center">
            <label style="width: 80px;margin: 0px;" class="d-flex align-items-center"><span style="color: #FF7670;">*
          </span>密码:</label>
            <input type="password" id="password" value="${user.password}" class="form-control form-control-sm"/>
        </div>
    </div>
    <div class="row mb-3">
        <div class="col-auto d-flex align-items-center">
            <label style="width: 80px;margin: 0px;" class="d-flex align-items-center"><span style="color: #FF7670;">*
          </span>状态:</label>
            <div class="input-group">
                <input name="status"  ${user.status == 1?'checked':''} type="radio" title="启用" value="1" />
                <input name="status"  ${user.status == 2?'checked':''} type="radio" title="停用" value="2" />
            </div>
        </div>
    </div>
</form>
<script src="../../lib/jquery-3.4.1/jquery-3.4.1.min.js" charset="utf-8"></script>
<script src="../../lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script>
    var layer = null;
    //加载layui的layer模块
    layui.use('layer', function () {
        //获取layer
        layer = layui.layer;
    })
    var adddata = function () {
        //表单验证
        //获取电话输入框的值
        var phone = $("#phone").val();
        console.log(phone)
        if (!phone) {
            //信息提示
            layer.msg('请输入电话号码');
            return;
        }
        ;
        //邮箱验证
        if (!$("#email").val()) {
            layer.msg("请输入邮箱");
            return;
        }
        //账户验证
        if (!$("#username").val()) {
            layer.msg("请输入账户");
            return;
        }
        //密码验证
        if (!$("#password").val()) {
            layer.msg("请输入密码");
            return;
        }
        //用户状态
        if(!$('input[name="status"]:checked').val()){
            layer.msg("请选择用户状态");
            return;
        }
        return {
            userId: $("#userId").val(),
            phone: $("#phone").val(),
            email: $("#email").val(),
            username: $("#username").val(),
            password: $("#password").val(),
            status: $('input[name="status"]:checked').val()
        }
    }
</script>
</body>
</html>
