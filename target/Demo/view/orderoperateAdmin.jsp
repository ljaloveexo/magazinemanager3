<%--
  Created by IntelliJ IDEA.
  User: isus
  Date: 2019/2/18
  Time: 13:40
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
    <link rel="stylesheet" href="css/style.css" media="screen"
          type="text/css" />
    <link rel="stylesheet" href="css/reason_disagree.css"
          type="text/css" />



</head>

<body>

<span class='bckg'></span>
<header>
    <h1>教室管理</h1>
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
    </nav> </header>
<div style="float: right; width: 87%">
    <div class='title' style="width: 100%">
        <h2>operate</h2>
        <h2 style="color: black; clear: both; margin-right: 197px;">重庆师范大学教室预订管理系统</h2>
        <a href='#' title='Profil' style="margin: 0; margin-right: 20px">
            Hello administer ! </a>
    </div>
    <div style="clear: both"></div>
    <div class="my_1">
        <p class="my_2">当前位置：用户操作&gt;个人信息</p>
    </div>

        <div align="center">

            <div class="my_3" style="padding-bottom: 53px;">

                <input id="search" style="margin-left: 20px;position: absolute;display: block;border: none;background-color: #444;color: #fff;border-radius: 3px;width: 136px;height: 30px;text-align: center;" value="查询预订" type="button" align="left" onclick="search_admin();" />
                <input id="search_text"
                       style="margin-left: 20px;display:none;position: absolute;color: #000;width: 166px; height: 30px;padding-left:10px;"
                       placeholder="请按教室编号查找" type="text" align="left" />
                <input id="search_btn" style=

                        "margin-left: 204px; position: absolute; display:none; border: none; background-color: #444; color: #fff; border-radius: 3px; width: 49px; height: 27px; " value="查询" type="button" align="left" onclick="serverAdmin();">

                <div style="margin-left: 836px; display: inline-block;">
                    <input id="button_1" class="agree" name="operate"  style="height:31px;width: 77px;font-size: 13px;border-radius: 8px;background-color: rgb(56, 59, 66); color: white;  font-weight: bold;display: inline-block;margin-left: 20px;"
                           value="同意" onclick="admin(this)" type="button">
                    <input id="button_2" class="disagree" value="不同意" style="height:31px;width: 77px;font-size: 13px;border-radius: 8px;background-color: rgb(56, 59, 66); color: white;  font-weight: bold;display: inline-block;margin-left: 20px;"
                           onclick="javascript:d_show()" type="button">
                </div>




					<span style="font-size: 1.2em; font-weight: bold;display: block;
				margin-top: 13px;">教  室  预  订  处  理  表</span>
                <div id="server">
                    <table id="info" bordercolor="#dadada" border="1" align="center">
                        <tr>
                            <th>id</th>
                            <th>编号</th>
                            <th>详细地址</th>
                            <th>预订日期</th>
                            <th>时间段</th>
                            <th>预订人</th>
                            <th>预订原因</th>
                            <th>操作</th>

                        </tr>


                    </table>
                    <section id="preview"></section>

                    <input type="hidden" id="tb" value="orderoperation" />
                    <input type="hidden" id="page" value="Index/operate_page" />
                </div>

            </div>

        </div>
        <div id="logining">
            <div style="width: 100%; height: 20%; background-color: #444; display: inline-block;text-align: center;" align="center">
                <input onclick="d_hide()" style="border: 0px; background: content-box; float: left; text-align: center; margin-top: 2px;color: #fff;" value="提示" type="button">


                <input onclick="d_hide()" style="border: 0px; background: content-box; float: right; text-align: center; margin-top: 2px;color: #fff;" value="X" type="button">
            </div>


            <p style="float: left;font-size: smaller;margin-left: 10px;">请输入理由：</p>
            <input placeholder="例如：教室维修" id="disagree_reason" name="d_reason" style="margin-left: 5%; /*! margin-top: 5%; */ width: 76%;border: 0;border-bottom: 1px #b0e0e6 solid;width: 200px;" type="text">

            <input style="height: 28px; border-radius: 8px; background-color: #444; color: #fff; margin-right: 5px; margin-top: 22px;" id="disagree" class="agree" name="operate" value="提交" onclick="admin(this)" type="button">

        </div>





    <div id="overing"></div>
    </div>


    <footer
            style="bottom: 0; position: absolute; color: black; padding-left: 330px; font-size: 0.8em;">
        Copyright© 2017 www.cqnu.com. All Rights Reserved. 重庆师范大学版权所有</footer>



<script src="js/reason_disagree.js"></script>
<script src="js/operate.js"></script>
<script src="js/modernizr.js"></script>
<script src="js/spin.js"></script>
<script src='js/jquery.js'></script>
<script src="js/index.js"></script>
<script src="js/serverAdmin.js"></script>
<script src="js/search_admin.js"></script>





    <script>
        var url='admin/orderoperateAdmin';
        var preview=document.getElementById('preview');
        $(document).ready(function(){


            new Spinner().spin(preview);



            serverAdmin();



        });
    </script>







</body>

</html>
