<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/My97DatePicker/WdatePicker.js"></script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" />
<script type="text/javascript">
	function checkForm(){
		var userName=$("#userName").val();
		var password=$("#password").val();
		var rePassWord=$("#rePassWord").val();
		var mobile=$("#mobile").val();
		var address=$("#address").val();
        var truename=$("#truename").val();		
		
		if(userName==""){
			$("#error").html("用户名不能为空！");
			return false;
		}
		
		if(userName.length > 20){
			$("#error").html("你输入的用户名太长,应该小于10字!");
			return false;
		}
		
		if(password==""){
			$("#error").html("密码不能为空！");
			return false;
		}
		if(rePassWord==""){
			$("#error").html("确认密码不能为空！");
			return false;
		}
		if(password!=rePassWord){
			$("#error").html("确认密码和密码不一致，请重新输入！");
			return false;
		}
		if(truename==""){
		  $("#error").html("用户真实姓名不能为空！");
		  return false;
		}
		if(mobile==""){
			$("#error").html("手机号码不能为空！");
			return false;
		}
		if(address==""){
			$("#error").html("收货地址不能为空！");
			return false;
		}
		return true;
	}

	function checkUserName(userName){
		if($("#userName").val()==""){
			$("#userErrorInfo").html("用户名不能为空！");
			$("#userName").focus();
			return;
		}
		//用户名的校验
		$.get("<%=request.getContextPath()%>/medicine/checkUsername/"+userName,
		 function(ok){
					if(ok){
						$("#userErrorInfo").html("用户名已存在，请重新输入！");
						$("#userName").focus();
					}else{
						$("#userErrorInfo").html("");
					}
				}
		);
	}
	//进行电话号码的校验
	function  checkMobile(phone){
		if($("#mobile").val()==""){
			$("#mobileErrorInfo").html("电话号码不能为空！");
			$("#mobile").focus();
			return;
		}
		//用户名的校验
		$.get("<%=request.getContextPath()%>/medicine/checkMoblie/"+phone,
		 function(ok){
					if(ok){
						$("#mobileErrorInfo").html("电话号码已注册，请重新输入一个号码！");
						$("#mobile").focus();
					}else{
						$("#mobileErrorInfo").html("");
					}
				}
		);
	}
	
	
</script>
</head>
<body>
<div id="header" class="wrap">
	<jsp:include page="../common/top.jsp"/>
</div>

<div id="register" class="wrap">
	<div class="shadow">
		<em class="corner lb"></em>
		<em class="corner rt"></em>
		<div class="box">
			<h1>欢迎注册宁医书网</h1>
			<ul class="steps clearfix">
				<li class="current"><em></em>填写注册信息</li>
				<li class="last"><em></em>注册成功</li>
			</ul>
			<form id="regForm" method="post" action="<%=request.getContextPath()%>/medicine/register" onsubmit="return checkForm()">
				<table>				
					
					<tr>
						<td class="field">用户名(*)：</td>
						<td><input class="text" type="text" id="userName" name="userName" onblur="checkUserName(this.value)" />&nbsp;<font id="userErrorInfo" color="red"></font></td>
					</tr>
					<tr>
						<td class="field">登录密码(*)：</td>
						<td><input class="text"  type="password" id="password" name="password"   /></td>
					</tr>
					<tr>
						<td class="field">确认密码(*)：</td>
						<td><input class="text" type="password"  id="rePassWord"/></td>
					</tr>
					
					<tr>
						<td class="field">性别(*)：</td>
						<td>
					    <input type="radio"   name="gender" value="M" checked="checked"/>男&nbsp;&nbsp;
					    <input type ="radio"  name="gender" value="F"/>女					    					    
					    </td>						
					</tr>
					<tr>
						<td class="field">出生日期：</td>
						<td>
							<input  type="text"  id="birthday"  name="birthday"  class="Wdate" onClick="WdatePicker()"/>	
						</td> 
					</tr>
					
					<tr>
						<td class="field">真实姓名：</td>
						<td>
							<input  class="text" type="text"  id="truename"  name="trueName"/>	
						</td> 
					</tr>
					
					<tr>
						<td class="field">身份证号：</td>
						<td><input class="text" type="text" id="dentityCode" name="idCard"  /></td>
					</tr>
					<tr>
						<td class="field">Email：</td>
						<td><input class="text" type="text" id="email" name="email"  /></td>
					</tr>
					<tr>
						<td class="field">手机号码(*)：</td>
						<td><input class="text" type="text" id="mobile" name="mobile"  onblur="checkMobile(this.value)"/>&nbsp;<font id="mobileErrorInfo" color="red"></font></td>
					</tr>
					<tr>
						<td class="field">收获地址(*)：</td>
						<td><input class="text" type="text" id="address" name="address" /></td>
					</tr>
					<tr>
						<td></td>
						<td><label class="ui-green"><input type="submit" name="submit" value="提交注册" /></label></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><font id="error" color="red"></font> </td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="clear"></div>
</div>

<div id="footer">
	<jsp:include page="../common/footer.jsp"/>
</div>
</body>
</html>