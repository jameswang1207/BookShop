<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎登录宁医书网后台管理系统</title>
<link href="<%=request.getContextPath()%>/css/adminStyle.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.loginbox{width:692px; height:336px; background:url(../images/AdminCall.gif) no-repeat; margin-top:30px;}
</style>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.1.js"></script>
<script src="<%=request.getContextPath()%>/js/cloud.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){  
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })  
});
</script>
</head>
<body style="background-color:#1c77ac; background-image:url(<%=request.getContextPath()%>/images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">
    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>  
<div class="logintop">    
    <span>欢迎登录宁医书网后台管理平台</span>    
    <ul>
    <li><a href="<%=request.getContextPath()%>/medicine/toIndex">回到前台主页</a></li>
    <li><a href="<%=request.getContextPath()%>/Admin/toLogin">Admin登陆</a></li>
    <li><a href="<%=request.getContextPath()%>/Admin/toHelp">帮助</a></li>
    </ul>    
    </div>
    <div class="loginbody">
    <span class="systemlogo"></span>   
    <div class="loginbox">
        <ul>
		    <li><strong>联系人：王永祥</strong></li>
		    <li><strong>qq:1983297642</strong></li>
	        <li><strong>邮箱：1983297642@qq.com</strong></li>
	        <li><strong>电话：15109670661</strong></li>
	        <li><strong>联系住址：宁夏医科大学学生公寓4号楼114房</strong></li>
	   </ul>
   </div>          
   </div> 
    <div class="loginbm">宁夏医科大学理学院 &copy;2011级电子信息班 All Rights Reserved.http://www.nxmubook.com</div>
</body>
</html>