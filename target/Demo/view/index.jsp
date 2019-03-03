<%--
  Created by IntelliJ IDEA.
  User: isus
  Date: 2019/1/17
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html class="login-alone"><head>


    <title>重庆师范大学教室预订系统管理员登录页面</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link href="css/screen.css?v=3.9" media="screen, projection" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="css/base.css?v=3.9">

    <link rel="stylesheet" type="text/css" href="css/login.css">

</head>


<body background="images/bg.png">
<div class="logina-logo">
    <h6>欢迎来到重庆师范大学教室预订系统</h6>
</div>
<div class="logina-main main clearfix" id="logina">
    <h1>登  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录</h1>
		 <span style="display:block;margin-left:521px;margin-top:166px;position: absolute;/*! width: 113px; */z-index: 99;">
		 看不清，请点击
		 </span>
    <span style="display:block;margin-left:528px;margin-top:182px;position: absolute;/*! width: 113px; */z-index: 99;color: red;font-size: smaller;">
		 不区分大小写
		 </span>
    <div class="tab-con">
        <span id="s1" style="width:500px;margin-left:370px;position:absolute;margin-top:43px;color:#ff0000;"></span>
        <form id="form-login" name="form1">

            <div id="login-error" class="error-tip"></div>
            <img id="img" src="user/getVerify" style="width:81px;height:31px;position:absolute;margin-top:131px;margin-left:256px;border: grey solid 1px;" onclick="this.src=this.src+'?'+Math.random()">
            <table style="padding-top:-10px" cellspacing="0" cellpadding="0" border="0">
                <tbody style="/*! text-align: center; */ margin: 0 30%;display:block">

                <tr>
                    <td><input id="name" name="account" placeholder="请输入用户名" type="text"></td>
                </tr>
                <tr>
                    <td><input id="password" name="password" placeholder="请输入密码" type="password"></td>
                </tr>
                <tr>
                    <td><input id="checkcode" name="checkCode" style="width: 140px;" placeholder="请输入验证码" type="text"></td>



                </tr>
                <tr class="find">


                    <td><input style="height: auto; margin-left: 20px" class="login0"
                               id="login2" name="login" value="user" type="radio">学生 <input
                            style="height: auto; margin-left: 22px;" id="login" name="login"
                            value="user" type="radio" class="login0">教师 <input
                            style="height: auto; margin-left: 23px;" id="login" name="login"
                            value="admin" type="radio" class="login0">管理员</td>

                    <td></td>
                </tr>
                <tr>

                    <td><input class="Login" value="登  录" onclick="check();" type="button"></td>

                    <td style="width: 127px;display: block;margin-left: 10px;font-size: 12px;margin-top: 10px;">
							<span>忘记密码？点击<a href="javascript:reset_view();" style="text-decoration: underline;text-decoration-color: #6495ED;
							color: #6495ED;margin-left:5px;">这里</a></span></td>
                </tr>
                </tbody>
            </table>


        </form></div>
</div>
<div id="reset">
    <div id="reset_input">
        <span style="text-align: center;display: block;font-size: 20px;letter-spacing: 5px;">重置密码</span>
        <form name="form" method="post" action="javascript:return false;">
            <table style="padding-top:-10px" cellspacing="0" cellpadding="0" border="0">
                <tbody style="margin: 0 35%; display: block">
                <tr>
                    <td>学号：<input style="width:150px;height:10px;" type="text" name="account" id="account"></td>

                </tr>
                <tr>

                    <td>姓名：<input  style="width:150px;height:10px;" type="text" name="name"></td>


                </tr>
                <tr>
                    <td>学院：<input  style="width:150px;height:10px;" type="text" name="academy" id="academy"></td>

                </tr>


                <tr>
                    <td>专业：<input  style="width:150px;height:10px;" type="text" name="major" id="major"></td>
                </tr>
                <tr>
                    <td>电话：<input  style="width:150px;height:10px;" type="text" name="tel" id="tel"></td>

                </tr>
                <tr>
                    <td>邮箱：<input  style="width:150px;height:10px;" type="text" name="mail"></td>
                </tr>
                <tr>
                    <td>密码：
			<span id="box">
			<input name="password"  style="width:150px;height:10px;" type="password"></span></td>
                    <img id="image" src="images/password_visibility.png" style="opacity:0.4;position: absolute;margin-top: 213px;
			margin-left: 480px;width: 16px;height: 16px;" onclick="password_show();">
                </tr>

                </tbody>
            </table>
            <button onclick="password_reset();" style="margin-left: 41%;margin-top: 16px;width: 150px;background: #6495ED;
	color: white;border: none;border-radius: 2px;letter-spacing: 5px;">重置</button>
            <span>直接登录？点击<a href="__URL__/index.html" style="text-decoration: underline;text-decoration-color: #6495ED;color: #6495ED;">这里</a></span>
        </form>

    </div>
</div>
<div id="reset2">
    <div id="reset_input">
        <span style="text-align: center;display: block;font-size: 20px;letter-spacing: 5px;">重置密码</span>
        <form name="form" method="post" action="javascript:return false;">
            <table style="padding-top:-10px" cellspacing="0" cellpadding="0" border="0">
                <tbody style="margin: 0 35%; display: block">
                <tr>
                    <td>用户名：<input style="width:150px;height:10px;" type="text" name="account" id="account"></td>

                </tr>
                <tr>

                    <td>姓名：<input  style="width:150px;height:10px;" type="text" name="name"></td>


                </tr>
                <tr>
                    <td>电话：<input  style="width:150px;height:10px;" type="text" name="tel" id="tel"></td>

                </tr>
                <tr>
                    <td>邮箱：<input  style="width:150px;height:10px;" type="text" name="mail"></td>
                </tr>
                <tr>
                    <td>密码：
			<span id="box">
			<input name="password"  style="width:150px;height:10px;" type="password"></span></td>
                    <img id="image" src="images//password_visibility.png" style="opacity:0.4;position: absolute;margin-top: 213px;
			margin-left: 480px;width: 16px;height: 16px;" onclick="password_show();">
                </tr>

                </tbody>
            </table>
            <button onclick="password_reset();" style="margin-left: 41%;margin-top: 16px;width: 150px;background: #6495ED;
	color: white;border: none;border-radius: 2px;letter-spacing: 5px;">重置</button>
            <span>直接登录？点击<a href="__URL__/index.html" style="text-decoration: underline;text-decoration-color: #6495ED;color: #6495ED;">这里</a></span>
        </form>

    </div>
</div>


<footer>Copyright © 2017 www.cqnu.com. All Rights Reserved.
    重庆师范大学版权所有</footer>

<script type="text/javascript" src="js/check.js"></script>

<script src='js/jquery.js'></script>

<script src="js/index.js"></script>
<script src="js/password_reset.js"></script>
<script>
    var url="__ROOT__";
</script>
<script>

    $("logina-logo").ready(function(){

        reset.style.display="none";
        reset2.style.display="none";

        alert("欢迎进入教室预订系统，请先登录！");




    });



</script>






</body>
</html>
