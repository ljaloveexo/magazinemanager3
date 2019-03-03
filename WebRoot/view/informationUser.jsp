<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>


<html>

	<head>

		<title>用户操作页面</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<base href="<%=basePath%>">
		<link rel="stylesheet" href="css/style2.css" media="screen" type="text/css" />

	</head>

	<body>

		<span class="bckguser"></span>
		<header>
			<h1><a id="my_4"> 教室预订</a></h1>
			<nav class="navigation">
				<ul>
					<li>
						<a data-title="Team" href="user/orderUser">教室预订</a>
					</li>
					<li>
						<a data-title="Diary" href="user/orderResultUserShow">预订结果</a>
					</li>
					<li>
						<a data-title="Team" href="/classroomorder_ThinkPHP/index.php/Index/infoUserFind">个人信息</a>
					</li>
					<li>
						<a data-title="Exit" href="/classroomorder_ThinkPHP/index.php/Index/index">退出</a>
					</li>
				</ul>
			</nav>
		</header>
		<div style="float:right; width:87% ">
			<div class="title">
				<h2>result</h2>
				<h2 style="clear:both;margin-right:197px;">重庆师范大学教室预订系统</h2>
				<a href="#" title="Profil" style="margin:0;margin-right:20px">Hello,${account.getName()}!
    			</a>
			</div>
			<div style="clear:both"></div>
<div class="my_1"><p class="my_2">当前位置：用户操作&gt;个人信息</p></div>

			<form action="/classroomorder_ThinkPHP/index.php/Index/updateUser" method="post">

			
<div align="center">
<div class="my_3">		
		
				 
				 
<table class="user" style="margin-left: 500px;padding-left: 136px;height: 415px;" align="center"> 
				<tbody style="height: 70%;" align="center">
				<volist name="select" id="account">
				<tr style="margin-top: 40px;">
				   
                    <td>学号：<input style="background-color:grey;opacity:0.3" value="${account.getAccount()}" name="account" readOnly="true"></td>
                     
				    </tr>
				    <tr>
                  
                     <td>姓名：<input value="${account.getName()}" name="name"></td>
                    
                   
				    </tr>
				    <tr>
                    <td>学院：<input value="${account.getAcademy()}" name="academy"></td>
                     
				    </tr>
				    
				    
				     <tr>
				      <td>专业：<input value="${account.getMajor()}" name="major"></td>
				       </tr>	
				       <tr>
                   <td>电话：<input value="${account.getTel()}" name="tel"></td>
                     
				    </tr>
                        <tr>
                 <td>邮箱：<input value="${account.getMail()}" name="mail"></td>
				    </tr>
				    </volist>
                   <input class="query" value="修改" style="position: absolute;margin-top: 340px;margin-left: 668px;display: block;width: 195px;height: 25px;" type="submit" onclick="user()" />
                   			</tbody></table>
			
			</div></div>
			</form>
		</div>
			<footer style="bottom: 0; position: absolute; color: black; padding-left: 500px; font-size: 0.8em;">Copyright © 2017 www.cqnu.com. All Rights Reserved. 重庆师范大学版权所有</footer>
            <p style="position: absolute;margin-left: 391px;margin-top: 283px;font-size: 17px;letter-spacing: 11px;">${account.getName()}同学,欢迎进入 </p>
			<img src="images/gesture.png" style="position: absolute;margin-left: 470px;margin-top: 329px;">
			<div style="height: 372px;border-left:black dashed 1px;position:absolute;margin-left: 734px;margin-top: 160px;"></div>
			
			
			<script src="js/jquery.js"></script>

			<script src="js/index.js"></script>
            <script src="js/operate.js"></script>
	

<div></div>
</body>
</html>