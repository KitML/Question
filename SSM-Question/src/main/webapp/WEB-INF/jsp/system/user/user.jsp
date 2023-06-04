<%--
  Created by IntelliJ IDEA.
  User: MCheng
  Date: 2023/2/22
  Time: 19:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../lib/layui-v2.6.3/css/layui.css" media="all">
    <link rel="stylesheet" href="../../lib/bootstrap/bootstrap.min.css" media="all">
</head>
<body class="m-3">
<div class="form-row">
    <%--搜索框--%>
    <div class="d-flex col-auto align-items-center">
        <label style="width: 60px;margin: 0px">电话:</label>
        <input id="phone" class="form-control form-control-sm" type="text" placeholder="请输入电话号码">
    </div>
        <button id="searchBtn" type="button" style="margin-left: 0.8rem" class="layui-btn layui-btn-primary layui-btn-sm"><i
                class="layui-icon layui-icon-search"></i> 搜索</button>
        <button id="resetBtn" type="button" style="margin-left: 0.8rem;border-color: #FF7670;color: #FF7670" class="layui-btn layui-btn-primary layui-btn-sm"><i
                class="layui-icon layui-icon-close"></i> 重置</button>
        <button id="addBtn" type="button" class="layui-btn layui-btn-sm layui-btn-normal"><i
                class="layui-icon layui-icon-addition"></i>新增</button>
</div>

<%--表格挂载的元素--%>
<table id="usertable" lay-filter="usertable"></table>
<%--头部工具栏--%>
<script type="text/html" id="headertool">
<div class="layui-btn-container">
<%--    <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="deleteAll">删除</button>--%>
</div>
</script>
<%--操作栏按钮--%>
<script type="text/html" id="linetool">
<a lay-event="edit" class="layui-btn layui-btn-sm"><i class="layui-icon layui-icon-edit"></i>编辑</a>
<a lay-event="delete" class="layui-btn layui-btn-sm layui-btn-danger"><i class="layui-icon layui-icon-delete"></i>删除</a>
</script>
<script src="../../lib/jquery-3.4.1/jquery-3.4.1.min.js"></script>
<script src="../../lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script src="../../js/http.js" charset="utf-8"></script>

<script>
    //加载table模块
    layui.use(['table'],function () {
        //接受加载的table
        var table = layui.table;
        //获取jQuery
        var $ = layui.jquery;
        //获取layer弹出层
        var layer=layui.layer;
        //渲染表格配置
        table.render({
            elem:'#usertable',//指定挂载的元素
            url:'../../api/sysUser/list',//请求的地址
            height:'full-80',//表格高度
            toolbar:'#headertool',
            cols:[[//配置表头
                {field: 'username', title: '用户名'},
                {field: 'phone', title: '电话'},
                {field: 'email', title: '邮箱'},
                //{field: 'status', title: '状态'},
                {
                    field: 'status', title: '状态', align: 'center', width: 180, templet: function (d) {
                        if (d.status == true) {
                            return '启用'
                        } else {
                            return '停用'
                        }
                    }
                },
                {field: 'sign',width:180,align:'center', title: '操作',toolbar:'#linetool'},
            ]],
            page:true,//开启分页
            limit:10,//每页10条
            limits:[10,20,30,40]
        });
        //头部按钮点击事件
        table.on('toolbar(usertable)',function (obj) {
            console.log(obj)
        })
        //行操作按钮点击事件
        table.on('tool(usertable)', function (obj) {
            console.log(obj)
            console.log(obj.event)
            if (obj.event == 'edit') {
                layer.open({
                    type: 2,
                    skin: 'layui-layer-molv', //皮肤
                    content: '/api/sysUser/editUI?userId=' + obj.data.userId,
                    area: ['650px', '350px'],
                    title: '编辑用户',
                    offset: '0px',
                    btn: ['确定', '取消'],
                    btn1: function (index) {
                        var parms = window["layui-layer-iframe" + index].adddata();
                        console.log('111111111')
                        console.log(parms)
                        if (parms) {
                            //提交表单，通过ajax
                            http.post("/api/sysUser/update", parms, function (data) {
                                console.log(data);
                                if (data.code == 200) {
                                    //刷新表格
                                    reload();
                                    //关闭弹框
                                    layer.close(index);
                                }
                            })
                        }
                    },
                    btn2: function (index) {

                    }
                })
            }
            if (obj.event == 'delete') {
                layer.confirm('确定删除该数据吗?', {icon: 3, title: '系统提示'}, function (index) {
                    //do something
                    //提交数据
                    let parm = {
                        userId:obj.data.userId
                    }
                    http.post("/api/sysUser/delete",parm,function (data) {
                        if(data.code == 200){
                            layer.msg(data.msg)
                            //刷新表格
                            reload();
                            layer.close(index);
                        }
                    })
                });
            }
        });
        //给新增按钮添加点击事件
        $('#addBtn').click(function () {
            //打开弹框
            layer.open({
                type:2,//指定弹出层的类型
                skin:'layui-layer-molv',//皮肤
                content:'/api/sysUser/add',//弹框内容,课程里面是一个页面add.jsp
                area:['650px','350px'],//指定弹框宽度和高度
                title:'新增用户',//指定弹框标题
                offset:'0px',
                btn:['确定','取消'],//弹框的按钮
                btn1:function (index) {
                    //表单数据
                    var parms = window["layui-layer-iframe" + index].adddata();
                    console.log(parms)
                    if(parms){
                        //提交表单，通过ajax
                        http.post("/api/sysUser/add",parms,function (data) {
                            console.log(data);
                            layer.msg(data.msg)
                            if(data.code==200){
                                //刷新表格
                                reload();
                                //关闭弹框
                                layer.close(index);
                            }
                        })
                    }

                },
                btn2:function (index) {
                    layer.msg('取消按钮')
                }
            })
        });
        //给搜索按钮添加点击事件
        $('#searchBtn').click(function () {
            reload();
        });
        //重置按钮
        $('#resetBtn').click(function () {
            //清空输入框的值
            $('#phone').val('');
            //重新加载表格
            reload();
        })
        //重载表格
        function reload() {
            table.reload('usertable',{
                page:{
                    curr:1//从第一页开始查询
                },
                where:{
                    phone:$("#phone").val()
                }
            })
        }
    })

</script>
</body>
</html>
