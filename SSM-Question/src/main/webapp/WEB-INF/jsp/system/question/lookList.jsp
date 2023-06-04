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
</head>
<body>
<input id="questionId" type="hidden" value="${questionId}"/>
<input id="questionTitle" type="hidden" value="${questionTitle}"/>
<%--存放试题的容器--%>
<div id="chartList" style="margin-top: 20px;" class="d-flex justify-content-center align-items-center flex-column">


</div>
<%--定义模板,需要影藏--%>
<div id="template" style="display: none;">
    <!-- 为 ECharts 准备一个定义了宽高的 DOM -->
    <div id="main" class="mb-5"
         style="width: 800px;height:400px;background-color: #EEEEEE;border: 1px solid #e5e5e5;padding: 20px;"></div>
</div>
<script src="../../lib/jquery-3.4.1/jquery-3.4.1.min.js" charset="utf-8"></script>
<script src="../../js/echarts.min.js"></script>
<script src="../../lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script src="../../js/http.js" charset="utf-8"></script>
<script type="text/javascript">
    $(document).ready(function () {
        getPaperList();
    })

    //获取数据
    function getPaperList() {
        var parm = {
            questionId: $("#questionId").val()
        }
        http.get("/api/sysQuestion/getTotalList", parm, function (res) {
            if (res.code == 200) {
                console.log(res)
                //返回的试题数据
                var result = res.data;
                if (result && result.length > 0) {
                    //清空容器
                    $("#chartList").empty();
                    //获取存放试题的容器
                    var list = $("#chartList").empty();
                    //循环试题
                    for (var i = 0; i < result.length; i++) {
                        //找到试题的模板
                        var clonechat = $("#template").find("#main").clone();
                        clonechat.attr("id", "main" + i);
                        //生成echarts的容器
                        list.append(clonechat);
                        //初始化
                        var myChart = echarts.init(document.getElementById('main' + i));
                        //配置option属性
                        var option = null;
                        if (result[i].paperType == '1') {
                            option = {
                                title: {
                                    text: '',
                                    left: 'left',
                                    // top: '5%'
                                },
                                tooltip: {
                                    trigger: 'item'
                                },
                                legend: {
                                    orient: 'vertical',
                                    left: 'left',
                                    top: '10%'
                                },
                                series: [
                                    {
                                        name: '票数',
                                        type: 'pie',
                                        radius: '50%',
                                        data: [],
                                        emphasis: {
                                            itemStyle: {
                                                shadowBlur: 10,
                                                shadowOffsetX: 0,
                                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                                            }
                                        }
                                    }
                                ]
                            };
                            //设置试题的标题
                            option.title.text = i + 1 + "、" + result[i].paperTitle;
                            //生成选项
                            if (result[i].paperChoice && result[i].paperChoice.length > 0) {
                                for (var j = 0; j < result[i].paperChoice.length; j++) {
                                    var obj = {value: 0, name: ''}
                                    obj.value = result[i].paperChoice[j].total
                                    obj.name = result[i].paperChoice[j].choiceText
                                    option.series[0].data.push(obj);
                                }
                            }
                        } else if (result[i].paperType == '2'){
                            option = {
                                title: {
                                    text: '',
                                    left: 'left',
                                    top: '5%'
                                },
                                xAxis: {
                                    type: 'category',
                                    data: []
                                },
                                yAxis: {
                                    type: 'value'
                                },
                                series: [{
                                    data: [],
                                    type: 'bar'
                                }]
                            };
                            option.title.text = i + 1 + "、" + result[i].paperTitle;
                            if (result[i].paperChoice && result[i].paperChoice.length > 0) {
                                for (var j = 0; j < result[i].paperChoice.length; j++) {
                                    option.xAxis.data.push(result[i].paperChoice[j].choiceText)
                                    option.series[0].data.push(result[i].paperChoice[j].total)
                                }
                            }
                        }else{
                            option=null
                        }
                        myChart.setOption(option);
                    }
                }
            }
        })
    }

    // 基于准备好的dom，初始化echarts实例
    // var myChart = echarts.init(document.getElementById('main'));
    //
    // // 指定图表的配置项和数据
    // var option = {
    //     title: {
    //         text: '某站点用户访问来源',
    //         left: 'left',
    //         top: '10%'
    //     },
    //     tooltip: {
    //         trigger: 'item'
    //     },
    //     legend: {
    //         orient: 'vertical',
    //         left: 'left',
    //         top: '20%'
    //     },
    //     series: [
    //         {
    //             name: '访问来源',
    //             type: 'pie',
    //             radius: '50%',
    //             data: [
    //                 {value: 1048, name: '搜索引擎'},
    //                 {value: 735, name: '直接访问'},
    //                 {value: 580, name: '邮件营销'},
    //                 {value: 484, name: '联盟广告'},
    //                 {value: 300, name: '视频广告'}
    //             ],
    //             emphasis: {
    //                 itemStyle: {
    //                     shadowBlur: 10,
    //                     shadowOffsetX: 0,
    //                     shadowColor: 'rgba(0, 0, 0, 0.5)'
    //                 }
    //             }
    //         }
    //     ]
    // };
    //
    // // 使用刚指定的配置项和数据显示图表。
    // myChart.setOption(option);
</script>
</body>
</html>
