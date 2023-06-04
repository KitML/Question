<%--
  Created by IntelliJ IDEA.
  User: MCheng
  Date: 2023/3/1
  Time: 13:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../lib/layui-v2.6.3/css/layui.css" media="all">
    <link rel="stylesheet" href="../../lib/bootstrap/bootstrap.min.css" media="all">
    <style>
        html, body {
            margin: 0px;
            padding: 0px;
        }

        .item {
            background-color: #FFF;
            border-radius: 10px;
        }
    </style>
</head>
<body class="m-3" style="background-color: #F0F0F0;">
<%-- 添加影藏数据，保存问卷id--%>
<input id="questionId" type="hidden" value="${questionId}">
<%--存放试题的容器--%>
<div class="d-flex flex-column layui-form paperList">

</div>
<%--试题模板,需要影藏--%>
<div class="template" style="display: none;">
    <%--单选题模板--%>
    <div id="paper1" class="item d-flex flex-column p-3 mb-3">
        <div class="d-flex align-items-center">
            <span class="paperOrder"></span><span>、</span><span class="paperTitle"></span></div>
        <hr>
        <%--单选题的容器--%>
        <div class="radioitem d-flex flex-column">

        </div>
    </div>
    <%-- 单选题的模板--%>
    <input class="radiotemplate" type="radio" name="choiceText" value="" title=""/>
    <%--多选题模板--%>
    <div id="paper2" class="item d-flex flex-column p-3 mb-3">
        <div class="d-flex align-items-center">
            <span class="paperOrder"></span><span>、</span><span class="paperTitle"></span></div>
        <hr>
        <%--多选题选项容器--%>
        <div class="radioitem d-flex flex-column">

        </div>
    </div>
    <%--多选题选项模板--%>
    <div class="mb-2 checkboxtemplate">
        <input type="checkbox" name="choiceText" lay-skin="primary" title="">
    </div>
    <%--填空题模板--%>
    <div id="paper3" class="item d-flex flex-column p-3 mb-3">
        <div class="d-flex align-items-center">
            <span class="paperOrder"></span><span>、</span><span class="paperTitle"></span></div>
        <hr>
        <div class="radioitem d-flex flex-column">
            <input class="form-control form-control-sm" type="text" name="choiceText" value=""/>
        </div>
    </div>
    <%--简答题模板--%>
    <div id="paper4" class="item d-flex flex-column p-3 mb-3">
        <div class="d-flex align-items-center">
            <span class="paperOrder"></span><span>、</span><span class="paperTitle"></span></div>
        <hr>
        <div class="radioitem d-flex flex-column">
            <textarea class="form-control form-control-sm" type="text" name="choiceText" value=""></textarea>
        </div>
    </div>
</div>
<script src="../../lib/jquery-3.4.1/jquery-3.4.1.min.js" charset="utf-8"></script>
<script src="../../lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script src="../../js/http.js" charset="utf-8"></script>
<script>
    //页面加载完调用
    var form = null;
    $(document).ready(function () {
        layui.use(['form'], function () {
            form = layui.form;
        })
        getPaperData();
    })

    //根据问卷的id获取试题列表
    function getPaperData() {
        var parm = {
            questionId: $("#questionId").val()
        }
        http.get("/api/sysPaper/getPaperList", parm, function (result) {
            if (result.code == 200) {
                //动态的生成试题
                console.log(result)
                if (result.data && result.data.length > 0) {
                    createPaper(result.data);
                }
            }
        })
    }

    //生成试题
    //循环，根据试题类型，找对应的模板
    function createPaper(res) {
        //清空容器
        $(".paperList").empty();
        //循环数据
        for (var i = 0; i < res.length; i++) {
            //数组的每一条数据
            var data = res[i];
            //获取存放试题的容器
            var list = $(".paperList");
            //根据试题的类型，获取对应的模板
            var clonedom = $(".template #paper" + data.paperType).clone();
            //设置试题的序号
            clonedom.find(".paperOrder").text(data.paperOrder);
            //设置试题的标题
            clonedom.find(".paperTitle").text(data.paperTitle);
            //设置试题的id
            clonedom.attr("paperId", data.paperId)
            //设置试题的类型
            clonedom.attr("type", data.paperType)
            //如果是单选和多选题，需要设置选项
            //找到单选题和多选题的容器
            var radioList = clonedom.find(".radioitem");
            if (data.paperType == '1') {
                if (data.paperChoice && data.paperChoice.length > 0) {
                    for (var j = 0; j < data.paperChoice.length; j++) {
                        //找到单选题的模板
                        var radioclone = $(".template .radiotemplate").clone();
                        radioclone.val(data.paperChoice[j].chioceId);
                        radioclone.attr("title", data.paperChoice[j].choiceText)
                        radioclone.attr("paperId", data.paperChoice[j].paperId)
                        radioclone.attr("name", "choiceText-" + data.paperChoice[j].paperId)
                        radioList.append(radioclone)
                    }
                }
            }
            //多选题的选项处理
            if (data.paperType == '2') {
                if (data.paperChoice && data.paperChoice.length > 0) {
                    for (var j = 0; j < data.paperChoice.length; j++) {
                        //找到多选题的模板
                        var radioclone = $(".template .checkboxtemplate").clone();
                        radioclone.find("input[name='choiceText']").val(data.paperChoice[j].chioceId)
                        radioclone.find("input[name='choiceText']").attr("title", data.paperChoice[j].choiceText)
                        radioclone.find("input[name='choiceText']").attr("paperId", data.paperChoice[j].paperId)
                        radioList.append(radioclone)
                    }
                }
            }
            list.append(clonedom)
            form.render();
        }
    }

    //表单提交获取页面数据
    function commitdata() {
        //定义一个存放试题答案的数组
        var paperData = [];
        //获取所有的试题
        var paperList = $(".paperList .item");
        if (paperList && paperList.length > 0) {
            for (var i = 0; i < paperList.length; i++) {
                //定义提交答案的数据格式
                var obj = {
                    questionId: '', //问卷id
                    paperId: '', //试题id
                    paperType: '', //试题类型
                    paperValue: '', //试题的答案
                    //userId: sessionStorage.getItem('userId')
                }
                //设置问卷id
                obj.questionId = $("#questionId").val();
                //设置问卷的类型
                obj.paperType = $(paperList[i]).attr("type");
                //设置试题did
                obj.paperId = $(paperList[i]).attr("paperid");
                //设置选中的答案
                //单选题
                if (obj.paperType == '1') {
                    var value = $(paperList[i]).find('input[name="choiceText-' + obj.paperId + '"]:checked').val();
                    if (value) {
                        obj.paperValue = value;
                    }
                } else if (obj.paperType == '2') {
                    //获取所有选中的复选框
                    var boxitem = $(paperList[i]).find(".checkboxtemplate").find("input[name='choiceText']:checked")
                    //复选框会有多个选中的值，所有需要循环取值
                    if (boxitem && boxitem.length > 0) {
                        //用于接收值
                        var vas = "";
                        for (var k = 0; k < boxitem.length; k++) {
                            //判断是否取到值,取到的值，以逗号拼接
                            if ($(boxitem[k]).val()) {
                                vas += $(boxitem[k]).val() + ",";
                            }
                        }
                        //取到拼接的值后面的逗号 vas = 12,13,14,
                        if (vas.length > 0) {
                            vas = vas.substr(0, vas.length - 1)
                            obj.paperValue = vas;
                        }
                    }
                } else if (obj.paperType == '3') { //填空题
                    var textval = $(paperList[i]).find("input[name='choiceText']").val();
                    if (textval) {
                        obj.paperValue = textval;
                    }
                } else { //简答题
                    var textareaval = $(paperList[i]).find('textarea').val()
                    if (textareaval) {
                        obj.paperValue = textareaval;
                    }
                }
                //把每一题的答案放到数组
                paperData.push(obj)
            }
        }
        //判断是否有空值，如果有，系统提示
        if (paperData.length == 0) {
            layer.msg('感谢您的参与，请答卷后再提交试题！')
            return;
        }
        for (var g = 0; g < paperData.length; g++) {
            if (!paperData[g].paperValue) { //如果paperValue为空，说明题目没有做完，系统提示
                layer.msg('感谢您的参与，请答卷后再提交试题！')
                return;
            }
        }
        return paperData;
    }
</script>
</body>
</html>
