<%--
  Created by IntelliJ IDEA.
  User: isus
  Date: 2019/2/22
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>

<%@ taglib prefix="c_rt" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<html>

<head>
    <title>管理员操作页面</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <base href="<%=basePath%>">
    <link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />
</head>

<body>

<span class='bckg'></span>
<header>
    <h1>
        教室管理
    </h1>
    <nav>
        <ul>
            <li><a data-title='Team' href="__URL__/classroominfoAdmin.html">教室信息</a>
            </li>

            <li><a data-title='Timeline' href="__URL__/orderoperateAdmin.html">预订处理</a>
            </li>
            <li><a data-title='Search1' href="__URL__/orderrecordAdmin.html">预订记录</a>
            </li>
            <li><a data-title='Search1' href="__URL__/manageUser.html">用户信息管理</a>
            </li>
            <li><a data-title='Search1' href="__URL__/manageAdmin.html">管理员管理</a>
            </li>

            <li><a data-title='Exit' href="__URL__/index">退出</a></li>
        </ul>
    </nav>
</header>
<div style="float:right; width:87% ">
    <div class='title' style="width:100%">
        <h2>manage</h2>
        <h2 style="color:black;clear:both;margin-right:197px;">重庆师范大学教室预订管理系统</h2>
        <a href='#' title='Profil' style="margin:0;margin-right:20px">
            Hello administer !
        </a>
    </div>
    <div style="clear: both"></div>
    <div class="my_1">
        <p class="my_2">当前位置：用户操作&gt;个人信息</p>
    </div>
    <div align="center">
        <div class="my_3" style="padding-bottom: 90px;">

            <input style="margin-left: 20px;position: absolute;display: block;border: none;background-color: #444;color: #fff;border-radius: 3px;width: 136px;height: 30px;text-align: center;" value="查询用户" type="button" align="left" onclick="search_admin();" />
            <input id="search_text"
                   style="margin-left: 20px;display:none;position: absolute;color: #000;width: 166px; height: 30px;padding-left:10px;"
                   placeholder="请按用户编号查找" type="text" align="left" />
            <input id="search_btn" style=

                    "margin-left: 204px; position: absolute; display:none; border: none; background-color: #444; color: #fff; border-radius: 3px; width: 49px; height: 27px; " value="查询" type="button" align="left" onclick="serverAdmin();">
            <div class="info" style="margin-top: 50px;text-align: left;margin-left: 22px;">

                <input style="height: 25px; width: 140px" id="account" name="account" placeholder="学号" type="text" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input style="height: 25px; width: 140px" id="name" name="name" placeholder="姓名" type="text" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input style="height: 25px; width: 140px" id="academy" name="academy" placeholder="学院" type="text" />&nbsp;&nbsp;
                <input style="height: 25px; width: 140px" id="major" name="major" placeholder="专业" type="text" />&nbsp;&nbsp;
                <input style="height: 25px; width: 140px" id="tel" name="tel" placeholder="电话" type="text" />&nbsp;&nbsp;
                <input style="height: 25px; width: 140px" id="mail" name="mail" placeholder="邮箱" type="text" />&nbsp;&nbsp;
                <input style="border: none; background-color: #444; color: #fff; border-radius: 3px; width: 49px; height: 27px;" class="Login" value="添加" type="button" onclick="userAdd();" />
            </div>

				<span style="font-size: 1.2em; font-weight: bold;display: block;
				margin-top: 50px;">用  户  信  息  表</span>
            <div id="server">
                <table style="color: black;background-color: white;margin-top:20px;width:96%;
border-collapse: collapse;
" align="center" bordercolor="#dadada" border="1">
                    <tr style="background-color: #EAEAEA;">
                        <th>学号</th>
                        <th>姓名</th>
                        <th>学院</th>
                        <th>专业</th>
                        <th>电话</th>
                        <th>邮箱</th>
                        <th style="width:53px;">操作</th>
                    </tr>

                </table>
                <section id="preview"></section>

            </div>
        </div>
    </div>
    <footer style="bottom: 0; position: absolute; color: black; padding-left: 330px; font-size: 0.8em;">Copyright © 2017 www.cqnu.com. All Rights Reserved. 重庆师范大学版权所有</footer>
    </div>
<script src='js/jquery.js'></script>

<script src="js/index.js"></script>
<script src="js/modernizr.js"></script>
<script src="js/spin.js"></script>
<script src="js/serverAdmin.js"></script>
<script src="js/operate.js"></script>
<script type="text/javascript" src="js/search_admin.js"></script>
    <script>

        var url='admin/userManageAdmin';
        var preview=document.getElementById('preview');
        $(".bckg").ready(function(){

            new Spinner().spin(document.getElementById('preview'));



            serverAdmin();




        });
    </script>
</body>

</html>
