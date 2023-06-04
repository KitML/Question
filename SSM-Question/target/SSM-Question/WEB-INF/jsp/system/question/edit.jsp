<%--
  Created by IntelliJ IDEA.
  User: MCheng
  Date: 2023/2/25
  Time: 21:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../lib/layui-v2.6.3/css/layui.css" media="all">
    <link rel="stylesheet" href="../../lib/bootstrap/bootstrap.min.css" media="all">
    <style>
        .layui-upload-img {
            width: 120px;
            height: 120px;
        }
    </style>
</head>
<body style="font-size: 0.8rem;">
<form class="layui-form m-3">
    <div class="d-flex align-items-center mb-3">
        <label style="width: 100px;margin: 0px;"><span style="color: #FF7670;">*</span>问卷标题:</label>
        <%--        问卷的id--%>
        <input id="questionId" value="${question.questionId}" type="hidden"/>
        <input type="text" id="questionTitle" value="${question.questionTitle}" class="form-control form-control-sm" placeholder="请填写问卷标题"/>
    </div>
    <div class="d-flex align-items-center mb-3">
        <label style="width: 100px;margin: 0px;"><span style="color: #FF7670;">*</span>问卷序号:</label>
        <input id="questionOrder" type="text" value="${question.questionOrder}" class="form-control form-control-sm" placeholder="请填写问卷序号"/>
    </div>
    <div class="d-flex align-items-center mb-3">
        <label style="width: 100px;margin: 0px;"><span style="color: #FF7670;">*</span>问卷状态:</label>
        <div class="input-group">
            <input type="radio" name="questionStatus" ${question.questionStatus == 1?'checked':''} value="1" title="启用" class="form-control form-control-sm"/>
            <input type="radio" name="questionStatus" ${question.questionStatus == 0?'checked':''} value="0" title="停用" class="form-control form-control-sm"/>
        </div>
    </div>
    <div class="d-flex  mb-3">
        <label style="width: 100px;margin: 0px;"><span style="color: #FF7670;">*</span>问卷简介:</label>
        <textarea id="questionDesc" type="text" value="" class="form-control form-control-sm" placeholder="请填写问卷简介">${question.questionDesc}</textarea>
    </div>
    <div id="test1" style="cursor: pointer;color: #FF7670;font-weight: 600;">点我上传图片</div>
    <hr style="margin: 0px 0px 0.5rem 0px;">
    <div class="d-flex">
        <input id="questionImg" value="${question.questionImg}" type="hidden"/>
        <div class="layui-upload">
            <%--          <button type="button" class="layui-btn" id="test1">上传图片</button>--%>
            <div class="layui-upload-list" style="margin: 0px;">
                <img class="layui-upload-img" src="${question.questionImg}" id="demo1">
                <p id="demoText"></p>
            </div>
        </div>
    </div>
</form>
<script src="../../lib/jquery-3.4.1/jquery-3.4.1.min.js" charset="utf-8"></script>
<script src="../../lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script>
    layui.use(['upload', 'layer'], function () {
        var upload = layui.upload;
        layer = layui.layer;
        var $ = layui.jquery;
        //图片上传
        var uploadInst = upload.render({
            elem: '#test1'
            , url: '/api/upload/uploadImage' //此处用的是第三方的 http 请求演示，实际使用时改成您自己的上传接口即可。
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
                // layer.msg('上传中', {icon: 16, time: 0});
            }
            , done: function (res) {
                console.log(res)
                //如果上传失败
                if (res.code > 0) {
                    return layer.msg('上传失败');
                }
                //上传成功的一些操作
                layer.msg(res.msg)
                //需要把返回的图片路径，赋值到上面定义的输入框里面
                $("#questionImg").val(res.data.src)
                //……
                $('#demoText').html(''); //置空上传失败的状态
            }
            , error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });
    })
    //表单验证
    var adddata = function () {
        //表单验证
        //获取问卷标题输入框的值
        var questionTitle = $("#questionTitle").val();
        if (!questionTitle) {
            //信息提示
            layer.msg('请输入问卷标题');
            return;
        }
        ;
        //序号
        if (!$("#questionOrder").val()) {
            layer.msg("请输入序号");
            return;
        }
        //问卷状态
        if (!$('input[name="questionStatus"]:checked').val()) {
            layer.msg("请选择问卷状态");
            return;
        }
        if (!$("#questionDesc").val()) {
            layer.msg("请输入问卷简介");
            return;
        }
        if (!$("#questionImg").val()) {
            layer.msg("请上传问卷图片");
            return;
        }
        return {
            questionId: $("#questionId").val(),
            questionTitle: $("#questionTitle").val(),
            questionOrder: $("#questionOrder").val(),
            questionDesc: $("#questionDesc").val(),
            questionImg: $("#questionImg").val(),
            questionStatus: $('input[name="questionStatus"]:checked').val()
        }
    }
</script>
</body>
</html>
