<%--
  Created by IntelliJ IDEA.
  User: MCheng
  Date: 2023/2/26
  Time: 15:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../lib/layui-v2.6.3/css/layui.css" media="all">
    <link rel="stylesheet" href="../../lib/bootstrap/bootstrap.min.css" media="all">
</head>
<body style="height: 100%;font-size: 0.8rem;">
<%--最外层div，分成左右两个，div默认垂直排列，把div变成一个弹性盒子模型--%>
<div class="d-flex" style="height: 100%;">
    <div class="d-flex flex-column p-3" style="width: 200px;border-right:1px solid #e5e5e5;">
        <span style="display: none;" id="fontQuestionId">${questionId}</span>
        <div onclick="addPaper('1')" class="d-flex justify-content-center p-1 mb-3" style="width: 100%;border:1px solid
        #e5e5e5;cursor:
        pointer;">
            单选题
        </div>
        <div onclick="addPaper('2')" class="d-flex justify-content-center p-1 mb-3"
             style="width: 100%;border:1px solid #e5e5e5;cursor: pointer;">多选题
        </div>
        <div onclick="addPaper('3')" class="d-flex justify-content-center p-1 mb-3"
             style="width: 100%;border:1px solid #e5e5e5;cursor: pointer;">填空题
        </div>
        <div onclick="addPaper('4')" class="d-flex justify-content-center p-1 mb-3"
             style="width: 100%;border:1px solid #e5e5e5;cursor: pointer;">简答题
        </div>
    </div>
    <%--生成试题存放的容器--%>
    <div id="paperList" class="col m-3 " style="overflow-y: auto;">

    </div>
    <%--试题循环的模板,需要影藏--%>
    <div class="template" style="display: none;">
        <%--单选题--%>
        <div id="paper1" class="mb-3 paperItem">
            <div class="d-flex align-items-center mb-3">
                <span class="paperNum">1</span><span>、</span>
                <input type="hidden" name="paperId" class="form-control form-control-sm mr-3"/>
                <input type="hidden" name="questionId" class="form-control form-control-sm mr-3"/>
                <input name="paperTitle" class="form-control form-control-sm mr-3" placeholder="请输入试题名称"/>
                <button class="layui-btn layui-btn-primary layui-btn-sm addChoice"><i
                        class="layui-icon layui-icon-addition"></i>新增选项
                </button>
                <button class="layui-btn layui-btn-danger layui-btn-sm deletePaper">
                    <i class="layui-icon layui-icon-close"></i>删除试题
                </button>
            </div>
            <div class="choiceList" style="margin-left: 30px;">

            </div>
            <hr>
        </div>
        <%--多选题--%>
        <div id="paper2" class="mb-3 paperItem">
            <div class="d-flex align-items-center mb-3">
                <span class="paperNum">2</span><span>、</span>
                <input type="hidden" name="paperId" class="form-control form-control-sm mr-3"/>
                <input type="hidden" name="questionId" class="form-control form-control-sm mr-3"/>
                <input name="paperTitle" class="form-control form-control-sm mr-3" placeholder="请输入试题名称"/>
                <button class="layui-btn layui-btn-primary layui-btn-sm addChoice">
                    <i class="layui-icon layui-icon-addition"></i>新增选项
                </button>
                <button class="layui-btn layui-btn-danger layui-btn-sm deletePaper">
                    <i class="layui-icon layui-icon-close"></i>删除试题
                </button>
            </div>
            <div class="choiceList" style="margin-left: 30px;">

            </div>
            <hr>
        </div>
        <%--单文本--%>
        <div id="paper3" class="mb-3 paperItem">
            <div class="d-flex align-items-center mb-3">
                <div><span class="paperNum">3</span><span>、</span></div>
                <input type="hidden" name="paperId" class="form-control form-control-sm mr-3"/>
                <input type="hidden" name="questionId" class="form-control form-control-sm mr-3"/>
                <input name="paperTitle" class="form-control form-control-sm mr-3" placeholder="请输入试题名称"/>
                <button class="layui-btn layui-btn-sm layui-btn-danger deletePaper">
                    <i class="layui-icon layui-icon-close"></i>
                    删除试题
                </button>
            </div>
            <hr>
        </div>
        <%--多文本--%>
        <div id="paper4" class="mb-3 paperItem">
            <div class="d-flex align-items-center mb-3">
                <div><span class="paperNum">4</span><span>、</span></div>
                <input type="hidden" name="paperId" class="form-control form-control-sm mr-3"/>
                <input type="hidden" name="questionId" class="form-control form-control-sm mr-3"/>
                <textarea name="paperTitle" class="form-control form-control-sm mr-3" placeholder="请输入试题名称"></textarea>
                <button class="layui-btn layui-btn-sm layui-btn-danger deletePaper">
                    <i class="layui-icon layui-icon-close"></i>
                    删除试题
                </button>
            </div>
            <hr>
        </div>
        <%--选项模板--%>
        <div class="d-flex align-items-center mb-3 choiceItem">
            <div class="col d-flex align-items-center">
                <span style="width: 30px;">选项</span><span class="choiceNum"></span>
                <input name="choiceText" class="form-control form-control-sm ml-2"/>
            </div>
            <div class="col d-flex align-items-center">
                <span style="width: 30px;">序号</span>
                <input name="choiceOrder" class="form-control form-control-sm ml-2"/>
            </div>
            <button type="button" class="layui-btn layui-btn-primary layui-btn-sm layui-btn-radius deleteChoice"><i
                    class="layui-icon layui-icon-delete"></i>删除选项
            </button>
        </div>
    </div>
</div>
<script src="../../lib/jquery-3.4.1/jquery-3.4.1.min.js" charset="utf-8"></script>
<script src="../../lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script src="../../js/http.js" charset="utf-8"></script>
<script>
    $(document).ready(function () {
        getPaperList();
    })
    //试题数据
    var addModel = []

    //左侧分类点击事件
    function addPaper(type) {
        //先获取页面的数据
        getAllList();
        //构造试题需要的数据格式
        var objModel = {
            paperId: '', //试题id
            questionId: '', //问卷id
            paperTitle: '',//试题的标题
            paperType: '',//试题的类型
            paperChoice: [] //试题对应的选项
        }
        //如果是单选和多选题时，需要设置选项
        if (type == '1' || type == '2') {
            //选项的数据格式
            var obj = {
                "choiceText": "",
                "choiceOrder": ""
            }
            objModel.paperChoice.push(obj)
        }
        objModel.paperType = type;
        //把生成的数据添加到列表的数据里面
        addModel.push(objModel);
        //生成试题列表
        createPaper();
    }

    //循环生成试题
    function createPaper() {
        //清空试题列表
        $("#paperList").empty();
        for (var i = 0; i < addModel.length; i++) {
            var data = addModel[i];
            //根据id找到存放试题的容器
            var listdom = $("#paperList");
            //找到克隆的模板
            var clonedom = $(".template #paper" + data.paperType).clone();
            //给输入框赋值
            clonedom.find("input[name='paperId']").val(data.paperId)
            clonedom.find("input[name='questionId']").val($("#fontQuestionId").text())
            clonedom.find(".paperNum").text(i + 1)
            //给试题添加点击事件
            clonedom.find(".deletePaper").attr('onclick', 'deletePaper(this)');
            //试题的类型
            clonedom.attr("type", data.paperType);
            if (data.paperType == "1" || data.paperType == "2" || data.paperType == "3") {
                clonedom.find("input[name='paperTitle']").val(data.paperTitle)
            } else {
                clonedom.find("textarea").val(data.paperTitle)
            }
            if (data.paperType == "1" || data.paperType == "2") {
                //给新增选项按钮添加点击事件
                clonedom.find(".addChoice").attr('onclick', 'addChoice(this,' + i + ')')
            }
            //动态生成选项  只有单选和多选才有选项
            if (data.paperType == '1' || data.paperType == '2') {
                //清空选项
                clonedom.find(".choiceList").empty();
                //获取选项的容器
                var choiceList = clonedom.find(".choiceList");
                if (data.paperChoice && data.paperChoice.length > 0) {
                    for (var j = 0; j < data.paperChoice.length; j++) {
                        //找到克隆选项的模板
                        var chioseClone = $(".template .choiceItem").clone();
                        //设置选项的索引
                        chioseClone.find(".choiceNum").text(j + 1)
                        //给试题选项添加点击事件
                        chioseClone.find(".deleteChoice").attr("onclick", 'deleteChoice(this)')
                        //设置选项的名称和序号
                        chioseClone.find("input[name='choiceText']").val(data.paperChoice[j].choiceText)
                        chioseClone.find("input[name='choiceOrder']").val(data.paperChoice[j].choiceOrder)
                        choiceList.append(chioseClone);
                    }
                }
            }
            listdom.append(clonedom);
        }
    }

    //新增选项点击事件
    function addChoice(dom, num) {
        //构造选项数据，添加到addModel里面
        addModel[num].paperChoice.push({
            "choiceText": "",
            "choiceOrder": ""
        })
        //克隆选项模板添加到选项列表里面
        //获取选项列表容器
        var choiceList = $(dom).parent().parent().find(".choiceList");
        //克隆模板
        var choiceClone = $(".template .choiceItem").clone();
        choiceClone.find("input[name='choiceText']").val('')
        choiceClone.find("input[name='choiceOrder']").val('')
        //给试题选项添加点击事件
        choiceClone.find(".deleteChoice").attr("onclick", 'deleteChoice(this)')
        //设置选项文字后面的序号
        var j = $(dom).parent().parent().find(".choiceList .choiceItem").length;
        console.log(j)
        choiceClone.find(".choiceNum").text(j + 1)
        choiceList.append(choiceClone)
    }

    //删除选项的点击事件
    function deleteChoice(dom) {
        console.log($(dom))
        console.log($(dom).parent())
        //删除之前的数据
        console.log(addModel)
        //删除选项
        $(dom).parent().remove();
        //重新获取页面数据
        getAllList();
        //重新生成页面
        createPaper();
        console.log(addModel)
    }

    //获取页面全部数据
    function getAllList() {
        //获取所有的试题列表
        var items = $('#paperList .paperItem');
        console.log(items.length)
        //把原来的数据清空，重新从页面获取新的数据
        addModel = [];
        if (items && items.length > 0) {
            for (var k = 0; k < items.length; k++) {
                //获取试题的类型
                var domtype = $(items[k]).attr('type');
                //构造试题需要的数据格式
                var objModel = {
                    paperId: '', //试题id
                    questionId: '', //问卷id
                    paperTitle: '',//试题的标题
                    paperType: '',//试题的类型
                    paperChoice: [] //试题对应的选项
                }
                //如果是单选和多选，处理选项数据
                if (domtype == '1' || domtype == '2') {
                    //获取选项列表
                    var choiceitems = $(items[k]).find('.choiceItem');
                    //循环选项数据列表
                    if (choiceitems && choiceitems.length > 0) {
                        for (var h = 0; h < choiceitems.length; h++) {
                            //选项的数据格式
                            var obj = {
                                "choiceText": "",
                                "choiceOrder": ""
                            }
                            //获取选项名称
                            obj.choiceText = $(choiceitems[h]).find("input[name='choiceText']").val()
                            //获取选项的序号
                            obj.choiceOrder = $(choiceitems[h]).find("input[name='choiceOrder']").val()
                            //添加到试题的选项
                            objModel.paperChoice.push(obj);
                        }
                    }
                }
                //设置试题对应的问卷id
                objModel.questionId = $("#fontQuestionId").text();
                //设置试题的id
                objModel.paperId = $(items[k]).find("input[name='paperId']").val()
                //设置试题类型
                objModel.paperType = domtype;
                //设置试题的标题
                if(domtype == '4'){
                    objModel.paperTitle = $(items[k]).find("textarea").val()
                }else{
                    objModel.paperTitle = $(items[k]).find("input[name='paperTitle']").val()
                }
                //把页面上重新获取的数据添加到addModel
                addModel.push(objModel)
            }
        }
    }

    //删除试题的点击事件
    function deletePaper(dom) {
        //删除页面展示
        $(dom).parent().parent().remove();
        //重新获取页面数据
        getAllList();
        //重新生成试题
        createPaper();
    }

    //获取页面参数
    function adddata() {
        getAllList();
        return addModel;
    }

    //获取回显的数据
    function getPaperList() {
        let parm = {
            "questionId": $("#fontQuestionId").text()
        }
        http.get("/api/sysPaper/getPaperList",parm,function (data) {
            if(data.code == 200){
                let result = data.data;
                if(result && result.length >0){
                    //设置试题列表数据
                    addModel = result;
                    //生成试题
                    createPaper();
                }else{
                    addPaper('1');
                }
            }
        })
    }
</script>
</body>
</html>


