<%--
  Created by IntelliJ IDEA.
  User: MCheng
  Date: 2023/3/4
  Time: 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../lib/layui-v2.6.3/css/layui.css" media="all">
    <link rel="stylesheet" href="../../lib/bootstrap/bootstrap.min.css" media="all">
    <style>
        table {
            text-align: center;
            border-collapse: collapse; /* 为table设置这个属性 */
        }
    </style>
</head>
<body style="padding: 10px;">
<input id="questionId" value="${questionId}" type="hidden"/>
<input id="questionTitle" value="${questionTitle}" type="hidden"/>
<%--定义表格模板--%>
<table id="tables" style="display: none;" class="tables">
    <tbody>
    <%--一个tr代表一行，一个td代表一列；一行显示3列--%>
    <tr>
        <td class="paperTitle" style="width: 30%;text-align: center;"></td>
        <td class="choiceText"></td>
        <td class="total"></td>
    </tr>
    </tbody>
</table>
<%--定义容器：存放生成模板的地方--%>
<!--printstart-->
<table border="1" style="width: 100%;font-size: 0.9rem;">
    <%--问卷标题--%>
    <h2 style="text-align: center;font-size: 18px;font-weight: 600;">${questionTitle}</h2>
    <%--表格的头部--%>
    <thead>
    <th>题目</th>
    <th>选项</th>
    <th>票数</th>
    </thead>
    <tbody class="tableList">

    </tbody>
</table>
<!--printend-->
<script src="../../lib/jquery-3.4.1/jquery-3.4.1.min.js" charset="utf-8"></script>
<script src="../../js/echarts.min.js"></script>
<script src="../../lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script src="../../js/http.js" charset="utf-8"></script>
<script>
    $(document).ready(function () {
        getPaperList();
    })

    function getPaperList() {
        var parm = {
            questionId: $("#questionId").val()
        }
        http.get("/api/sysQuestion/getTotalList", parm, function (res) {
            if (res.code == 200 && res.data) {
                var result = res.data;
                console.log(result)
                //清空容器
                $(".tableList").empty();
                //获取容器
                var list = $(".tableList");
                for (var i = 0; i < result.length; i++) {
                    if (result[i].paperChoice && result[i].paperChoice.length > 0) {
                        for (var j = 0; j < result[i].paperChoice.length; j++) {
                            //克隆模板
                            var clonedom = $("#tables").find("tbody").find("tr").clone();
                            if (j == 0) {
                                clonedom.find(".paperTitle").attr("rowspan", result[i].paperChoice.length);
                                clonedom.find(".paperTitle").text(result[i].paperTitle);
                            } else {
                                //移除空的
                                clonedom.find(".paperTitle").remove();
                            }
                            clonedom.find(".choiceText").text(result[i].paperChoice[j].choiceText);
                            clonedom.find(".total").text(result[i].paperChoice[j].total);
                            //生成的模板放到容器
                            list.append(clonedom)
                        }
                    }
                }
            }
        })
    }

    function printCount() {
        var bdhtml = window.document.body.innerHTML;
        var printstart = "<!--printstart-->";
        var printend = "<!--printend-->";
        prnhtml = bdhtml.substr(bdhtml.indexOf(printstart), bdhtml.indexOf(printend));
        window.document.body.innerHTML = prnhtml;
        window.print();
        // 还原界面
        window.document.body.innerHTML = bdhtml;
        window.location.reload();
    }
</script>
</body>
</html>
