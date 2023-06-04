<%--
  Created by IntelliJ IDEA.
  User: MCheng
  Date: 2023/2/22
  Time: 12:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body style="margin: 30px;">
<h1>弹性盒子模型测试</h1>
<br>
<h3>1.div默认垂直排列</h3>
<div style="height: 220px;background-color: #d0d0d0">
    <div style="background-color: #d4002a;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">1</div>
    <div style="background-color: #0ed400;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">2</div>
    <div style="background-color: #00a2d4;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">3</div>
    <div style="background-color: #e2c329;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">4</div>
</div>
<br>
<h3>2.div变成弹性盒子模型(display:flex)，子元素将横向排列</h3>
<div style="height: 220px;background-color: #d0d0d0;display: flex">
    <div style="background-color: #d4002a;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">1</div>
    <div style="background-color: #0ed400;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">2</div>
    <div style="background-color: #00a2d4;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">3</div>
    <div style="background-color: #e2c329;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">4</div>
</div>
<br>
<h3>3.div变成弹性盒子模型(display:flex)，子元素默认横向排列(flex-direction:row)</h3>
<div style="height: 220px;background-color: #d0d0d0;display: flex; flex-direction:row">
    <div style="background-color: #d4002a;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">1</div>
    <div style="background-color: #0ed400;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">2</div>
    <div style="background-color: #00a2d4;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">3</div>
    <div style="background-color: #e2c329;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">4</div>
</div>
<br>
<h3>4.div变成弹性盒子模型(display:flex)，子元素纵向排列(flex-direction:column)</h3>
<div style="height: 220px;background-color: #d0d0d0;display: flex; flex-direction:column">
    <div style="background-color: #d4002a;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">1</div>
    <div style="background-color: #0ed400;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">2</div>
    <div style="background-color: #00a2d4;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">3</div>
    <div style="background-color: #e2c329;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">4</div>
</div>
<br>
<h3>5.div变成弹性盒子模型(display:flex)，子元素横向反向排列(flex-direction:row-reverse)</h3>
<div style="height: 220px;background-color: #d0d0d0;display: flex; flex-direction:row-reverse">
    <div style="background-color: #d4002a;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">1</div>
    <div style="background-color: #0ed400;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">2</div>
    <div style="background-color: #00a2d4;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">3</div>
    <div style="background-color: #e2c329;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">4</div>
</div>
<br>
<h3>6.div变成弹性盒子模型(display:flex)，子元素纵向反向排列(flex-direction:column-reverse)</h3>
<div style="height: 220px;background-color: #d0d0d0;display: flex; flex-direction:column-reverse">
    <div style="background-color: #d4002a;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">1</div>
    <div style="background-color: #0ed400;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">2</div>
    <div style="background-color: #00a2d4;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">3</div>
    <div style="background-color: #e2c329;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">4</div>
</div>
<br>
<h3>7.div变成弹性盒子模型(display:flex)，justify-content: flex-start子元素主轴对齐方式：左对齐</h3>
<div style="height: 220px;background-color: #d0d0d0;display: flex; justify-content: flex-start">
    <div style="background-color: #d4002a;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">1</div>
    <div style="background-color: #0ed400;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">2</div>
    <div style="background-color: #00a2d4;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">3</div>
    <div style="background-color: #e2c329;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">4</div>
</div>
<br>
<h3>8.div变成弹性盒子模型(display:flex)，justify-content:center子元素主轴对齐方式：居中</h3>
<div style="height: 220px;background-color: #d0d0d0;display: flex; justify-content:center">
    <div style="background-color: #d4002a;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">1</div>
    <div style="background-color: #0ed400;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">2</div>
    <div style="background-color: #00a2d4;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">3</div>
    <div style="background-color: #e2c329;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">4</div>
</div>
<br>
<h3>9.div变成弹性盒子模型(display:flex)，justify-content: flex-end子元素主轴对齐方式：右对齐</h3>
<div style="height: 220px;background-color: #d0d0d0;display: flex; justify-content: flex-end">
    <div style="background-color: #d4002a;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">1</div>
    <div style="background-color: #0ed400;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">2</div>
    <div style="background-color: #00a2d4;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">3</div>
    <div style="background-color: #e2c329;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">4</div>
</div>
<br>
<h3>10.div变成弹性盒子模型(display:flex)，align-items: flex-start交叉轴对齐方式：上对齐</h3>
<div style="height: 220px;background-color: #d0d0d0;display: flex; align-items: flex-start">
    <div style="background-color: #d4002a;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">1</div>
    <div style="background-color: #0ed400;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">2</div>
    <div style="background-color: #00a2d4;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">3</div>
    <div style="background-color: #e2c329;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">4</div>
</div>
<br>
<h3>11.div变成弹性盒子模型(display:flex)，align-items: center交叉轴对齐方式：居中</h3>
<div style="height: 220px;background-color: #d0d0d0;display: flex; align-items: center">
    <div style="background-color: #d4002a;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">1</div>
    <div style="background-color: #0ed400;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">2</div>
    <div style="background-color: #00a2d4;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">3</div>
    <div style="background-color: #e2c329;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">4</div>
</div>
<br>
<h3>12.div变成弹性盒子模型(display:flex)，align-items: flex-end交叉轴对齐方式：下对齐</h3>
<div style="height: 220px;background-color: #d0d0d0;display: flex; align-items: flex-end">
    <div style="background-color: #d4002a;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">1</div>
    <div style="background-color: #0ed400;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">2</div>
    <div style="background-color: #00a2d4;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">3</div>
    <div style="background-color: #e2c329;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">4</div>
</div>
<br>
<h3>13.div变成弹性盒子模型(display:flex)，justify-content: space-around</h3>
<div style="height: 220px;background-color: #d0d0d0;display: flex; justify-content: space-around">
    <div style="background-color: #d4002a;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">1</div>
    <div style="background-color: #0ed400;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">2</div>
    <div style="background-color: #00a2d4;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">3</div>
    <div style="background-color: #e2c329;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">4</div>
</div>
<br>
<h3>14.div变成弹性盒子模型(display:flex)，justify-content: space-between</h3>
<div style="height: 220px;background-color: #d0d0d0;display: flex; justify-content: space-between">
    <div style="background-color: #d4002a;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">1</div>
    <div style="background-color: #0ed400;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">2</div>
    <div style="background-color: #00a2d4;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">3</div>
    <div style="background-color: #e2c329;height: 50px;width: 50px;line-height: 50px;color: #FFF;text-align: center">4</div>
</div>
<br>
</body>
</html>
