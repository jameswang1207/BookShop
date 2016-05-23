<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎登录宁医书网后台管理系统</title>
<link href="<%=request.getContextPath()%>/css/adminStyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.1.js"></script>
<script src="<%=request.getContextPath()%>/js/cloud.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){  
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })  
});

function loadimage(){
document.getElementById("randImage").src = "<%=request.getContextPath()%>/medicine/getCode/"+Math.random();
	}
	
function checkForm(){
	 var userName=$("#userName").val();
	 var password=$("#password").val();
	 var imageCode=$("#imageCode").val();
	 if(userName==""){
		 $("#error").html("用户名不能为空！");			 
		 return false;
	 }
	 if(password==""){
		 $("#error").html("密码不能为空！");
		 return false;
	 }
	 if(imageCode==""){
		 $("#error").html("验证码不能为空！");
		 return false;
	 }
	 return true;
}
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
    <li><a href="<%=request.getContextPath()%>/Admin/toHelp">帮助</a></li>
    <li><a href="<%=request.getContextPath()%>/Admin/toCall">联系我</a></li>
    </ul>    
    </div>
    <div class="loginbody">
    <span class="systemlogo"></span>   
    <div class="loginbox"> 
    <form action="<%=request.getContextPath()%>/Admin/adminLogin" method="post" onsubmit="return checkForm()">
		    <ul>
		    <li><input id="userName" name="userName" type="text" class="loginuser" value="${Resultuser.userName}"/></li>
		    <li><input id="password" name="password" type="password" class="loginpwd"  value="${Resultuser.password}"/></li>
	        <li><label style="padding-left: 0px;">验证码：</label><input id="imageCode" name="code" type="text"  class="loginImageCode"/>
	            <img onclick="javascript:loadimage();" name="randImage"
							id="randImage" src="<%=request.getContextPath()%>/medicine/getCode/100" width="60" height="20" border="1"
							align="absmiddle"/>
			    <strong  id="error" style="color:red;">${error}</strong>
		    </li>
		    <li><input type="submit" class="loginbtn" value="登录"/></li>
		    </ul>    
    </form>
    </div>
    </div> 
    <div class="loginbm">宁夏医科大学理学院 &copy;2011级电子信息班 All Rights Reserved.http://www.nxmumanagerbook.com</div>
</body>
</html>