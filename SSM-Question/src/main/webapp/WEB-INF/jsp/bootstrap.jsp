<%--
  Created by IntelliJ IDEA.
  User: MCheng
  Date: 2023/2/22
  Time: 17:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../lib/bootstrap/bootstrap.min.css" media="all">
</head>
<body class="m-4">
<h3>bootstrap弹性盒子测试</h3>
<br>
<h5>1.div默认是垂直排列</h5>
<div style="height: 220px;background-color: #d0d0d0">
    <div class="bg-primary" style="height: 50px;width: 50px;line-height: 50px;text-align: center">1</div>
    <div class="bg-danger" style="height: 50px;width: 50px;line-height: 50px;text-align: center">2</div>
    <div class="bg-warning" style="height: 50px;width: 50px;line-height: 50px;text-align: center">3</div>
    <div class="bg-info" style="height: 50px;width: 50px;line-height: 50px;text-align: center">4</div>
</div>
<br>
<h5>2.div变成弹性盒子(d-flex)</h5>
<div class="d-flex" style="height: 220px;background-color: #d0d0d0">
    <div class="bg-primary" style="height: 50px;width: 50px;line-height: 50px;text-align: center">1</div>
    <div class="bg-danger" style="height: 50px;width: 50px;line-height: 50px;text-align: center">2</div>
    <div class="bg-warning" style="height: 50px;width: 50px;line-height: 50px;text-align: center">3</div>
    <div class="bg-info" style="height: 50px;width: 50px;line-height: 50px;text-align: center">4</div>
</div>
<br>
<h5>3.div变成弹性盒子(d-flex),水平排列(flex-row)</h5>
<div class="d-flex flex-row" style="height: 220px;background-color: #d0d0d0">
    <div class="bg-primary" style="height: 50px;width: 50px;line-height: 50px;text-align: center">1</div>
    <div class="bg-danger" style="height: 50px;width: 50px;line-height: 50px;text-align: center">2</div>
    <div class="bg-warning" style="height: 50px;width: 50px;line-height: 50px;text-align: center">3</div>
    <div class="bg-info" style="height: 50px;width: 50px;line-height: 50px;text-align: center">4</div>
</div>
<br>
<h5>4.div变成弹性盒子(d-flex),垂直排列(flex-column)</h5>
<div class="d-flex flex-column" style="height: 220px;background-color: #d0d0d0">
    <div class="bg-primary" style="height: 50px;width: 50px;line-height: 50px;text-align: center">1</div>
    <div class="bg-danger" style="height: 50px;width: 50px;line-height: 50px;text-align: center">2</div>
    <div class="bg-warning" style="height: 50px;width: 50px;line-height: 50px;text-align: center">3</div>
    <div class="bg-info" style="height: 50px;width: 50px;line-height: 50px;text-align: center">4</div>
</div>
<br>
<h5>5.div变成弹性盒子(d-flex)，左对齐</h5>
<div class="d-flex justify-content-start" style="height: 220px;background-color: #d0d0d0">
    <div class="bg-primary" style="height: 50px;width: 50px;line-height: 50px;text-align: center">1</div>
    <div class="bg-danger" style="height: 50px;width: 50px;line-height: 50px;text-align: center">2</div>
    <div class="bg-warning" style="height: 50px;width: 50px;line-height: 50px;text-align: center">3</div>
    <div class="bg-info" style="height: 50px;width: 50px;line-height: 50px;text-align: center">4</div>
</div>
<br>
<h5>6.div变成弹性盒子(d-flex),居中</h5>
<div class="d-flex justify-content-center" style="height: 220px;background-color: #d0d0d0">
    <div class="bg-primary" style="height: 50px;width: 50px;line-height: 50px;text-align: center">1</div>
    <div class="bg-danger" style="height: 50px;width: 50px;line-height: 50px;text-align: center">2</div>
    <div class="bg-warning" style="height: 50px;width: 50px;line-height: 50px;text-align: center">3</div>
    <div class="bg-info" style="height: 50px;width: 50px;line-height: 50px;text-align: center">4</div>
</div>
<br>
<h5>7.div变成弹性盒子(d-flex),右对齐</h5>
<div class="d-flex justify-content-end" style="height: 220px;background-color: #d0d0d0">
    <div class="bg-primary" style="height: 50px;width: 50px;line-height: 50px;text-align: center">1</div>
    <div class="bg-danger" style="height: 50px;width: 50px;line-height: 50px;text-align: center">2</div>
    <div class="bg-warning" style="height: 50px;width: 50px;line-height: 50px;text-align: center">3</div>
    <div class="bg-info" style="height: 50px;width: 50px;line-height: 50px;text-align: center">4</div>
</div>
<br>
<h5>8.div变成弹性盒子(d-flex),环绕对齐</h5>
<div class="d-flex justify-content-around" style="height: 220px;background-color: #d0d0d0">
    <div class="bg-primary" style="height: 50px;width: 50px;line-height: 50px;text-align: center">1</div>
    <div class="bg-danger" style="height: 50px;width: 50px;line-height: 50px;text-align: center">2</div>
    <div class="bg-warning" style="height: 50px;width: 50px;line-height: 50px;text-align: center">3</div>
    <div class="bg-info" style="height: 50px;width: 50px;line-height: 50px;text-align: center">4</div>
</div>
<br>
<h5>9.div变成弹性盒子(d-flex),两端对齐</h5>
<div class="d-flex justify-content-between" style="height: 220px;background-color: #d0d0d0">
    <div class="bg-primary" style="height: 50px;width: 50px;line-height: 50px;text-align: center">1</div>
    <div class="bg-danger" style="height: 50px;width: 50px;line-height: 50px;text-align: center">2</div>
    <div class="bg-warning" style="height: 50px;width: 50px;line-height: 50px;text-align: center">3</div>
    <div class="bg-info" style="height: 50px;width: 50px;line-height: 50px;text-align: center">4</div>
</div>
<br>
<h5>10.div变成弹性盒子(d-flex)，上对齐</h5>
<div class="d-flex align-items-start" style="height: 220px;background-color: #d0d0d0">
    <div class="bg-primary" style="height: 50px;width: 50px;line-height: 50px;text-align: center">1</div>
    <div class="bg-danger" style="height: 50px;width: 50px;line-height: 50px;text-align: center">2</div>
    <div class="bg-warning" style="height: 50px;width: 50px;line-height: 50px;text-align: center">3</div>
    <div class="bg-info" style="height: 50px;width: 50px;line-height: 50px;text-align: center">4</div>
</div>
<br>
<h5>11.div变成弹性盒子(d-flex),居中</h5>
<div class="d-flex align-items-center" style="height: 220px;background-color: #d0d0d0">
    <div class="bg-primary" style="height: 50px;width: 50px;line-height: 50px;text-align: center">1</div>
    <div class="bg-danger" style="height: 50px;width: 50px;line-height: 50px;text-align: center">2</div>
    <div class="bg-warning" style="height: 50px;width: 50px;line-height: 50px;text-align: center">3</div>
    <div class="bg-info" style="height: 50px;width: 50px;line-height: 50px;text-align: center">4</div>
</div>
<br>
<h5>12.div变成弹性盒子(d-flex),下对齐</h5>
<div class="d-flex align-items-end" style="height: 220px;background-color: #d0d0d0">
    <div class="bg-primary" style="height: 50px;width: 50px;line-height: 50px;text-align: center">1</div>
    <div class="bg-danger" style="height: 50px;width: 50px;line-height: 50px;text-align: center">2</div>
    <div class="bg-warning" style="height: 50px;width: 50px;line-height: 50px;text-align: center">3</div>
    <div class="bg-info" style="height: 50px;width: 50px;line-height: 50px;text-align: center">4</div>
</div>
<br>
</body>
</html>
