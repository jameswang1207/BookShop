<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>宁医书网后台首页</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery-easyui-1.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery-easyui-1.4/themes/icon.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui-1.4/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui-1.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui-1.4/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
//用户管理界面
   function openTab(text,url,iconCls){
		if($("#tabs").tabs("exists",text)){
			$("#tabs").tabs("select",text);
		}else{
			var content="<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='<%=request.getContextPath()%>/admin/"+url+"'></iframe>";
			$("#tabs").tabs("add",{
				title:text,
				iconCls:iconCls,
				closable:true,
				content:content
			});
		}
	}
//进行管理员的密码修改
function  adminUpdatePassword(){
	  $("#dlg").dialog("open").dialog("setTitle","admin密码修改");
}
//旧密码的确认
function confirmPassword(){
	var oldPassword  =  $("#oldPassword").val();
	$.get("<%=request.getContextPath()%>/Admin/confirmOldPassword/"+oldPassword,
			 function(ok){
						if(ok){
							$("#ErrorInfo").html("admin输入的密码正确");
						}else{
							$("#ErrorInfo").html("admin输入的密码错误");
							$("#oldPassword").focus();
						}
					}
       );
}

   function  equalNewPassword(){
	    var  newPassword = $("#newPassword").val();
	    var  confirmword =$("#newPasswordConfirm").val();
	    if(newPassword!=confirmword){
	    	$("#error").html("确认密码失败");
	    	$("#error").focus();
	    	return  false;
	    }else{
	    	$("#error").html("确认密码成功");
	    	return  true;
	    }
  }
 
   function  adminPassword(){
	   $("#adminPasswordForm").form("submit", {    
           url:"<%=request.getContextPath()%>/Admin/adminModifyPassword",    
           onSubmit:function(){    
                 if(!equalNewPassword()){
                    $.messager.alert("警告","确认密码错误");
                    return false;  
                 }
	              return $(this).form("validate");   
           },    
           success:function(ok){    
					if(ok){
						$.messager.alert("提示","修改密码成功");
						clearDialogInformation();
						$("#dlg").dialog("close");
					}else{
						$.messager.alert("提示","修改密码失败");
						return;
					}    
            }    
        });   
   }
   
   function  clearDialogInformation(){
	  $("#userName").val("");
	  $("#oldPassword").val("");
	  $("#newPassword").val("");
	  $("#newPasswordConfirm").val("");
   }
   
   function  closePasswordModifyDialog(){
	   clearDialogInformation();
	   $("#dlg").dialog("close");
   }
   
   function  adminLogout(){
	   $.messager.confirm("系统提示","您确定要退出系统吗",function(r){
			if(r){
				 window.location.href="<%=request.getContextPath()%>/Admin/adminLoginOut";
			}
		});
   }
   //进行系统的刷新
   function  adminRefresh(){
	   $.get("<%=request.getContextPath()%>/Admin/adminRefresh",
				 function(ok){
							if(ok){
								$.messager.alert("系统提示","系统刷新成功！！");
							}else{
								$.messager.alert("系统提示","系统刷新失败！！");
							}
						}
	       );
   }
</script>
</head>
<body class="easyui-layout">
<!--主页面top布局  -->
<div region="north" style="height:78px;background:url(<%=request.getContextPath()%>/images/adminBackground.jpg) no-repeat">
   <table width="100%">
		<tr>
			<td width="80%"></td>
			<td valign="bottom" align="right" width="20%">
		       <p style="font-size: 20px;color:blue"align="center">
		         <strong>本次登陆用户:${userLogin.userName}</strong>
		       </p>
			</td>
		</tr>
	</table>
</div>
<!--主页面center布局  -->
<div region="center">
	<div class="easyui-tabs" fit="true" border="false" id="tabs">
		<div style="margin:2px;background:#0063a0 url(../images/adminMain.gif) no-repeat; background-position: center" 
		title="首页" data-options="iconCls:'icon-home'">			
		</div>
	</div>
</div>
<!-- 主页的西边布局 -->
<div region="west" style="width:200px" title="可选菜单" split="true">
	<div class="easyui-accordion" data-options="fit:true,border:false">
		<div title="用户管理" data-options="selected:true,iconCls:'icon-user'" style="padding: 10px;background-color:#E0ECFF">
			<a href="javascript:openTab('用户管理','userManager.jsp','icon-manage')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-manage'" style="width: 150px;">管理用户</a>
	    </div>
		
		<div title="商品管理"  data-options="iconCls:'icon-product'" style="padding:10px;background-color:#E0ECFF">
			<a href="javascript:openTab('商品管理','productManager.jsp','icon-product')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-manage'" style="width: 150px;">商品管理</a>
			<a href="javascript:openTab('商品大类管理','bigProductManager.jsp','icon-product')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-manage'" style="width: 150px;">商品大类管理</a>
			<a href="javascript:openTab('商品小类管理','smailProductManager.jsp','icon-product')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-manage'" style="width: 150px;">商品小类管理</a>
		</div>
		<div title="订单管理"  data-options="iconCls:'icon-order'" style="padding:10px;background-color:#E0ECFF">
			<a href="javascript:openTab('订单管理','orderManager.jsp','icon-order')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-manage'" style="width: 150px;">订单管理</a>
		</div>
		<div title="留言管理" data-options="iconCls:'icon-comment'" style="padding:10px;background-color:#E0ECFF">
			<a href="javascript:openTab('留言管理','commentManager.jsp','icon-comment')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-manage'" style="width: 150px;">留言管理</a>
		</div>
		<div title="公告管理"  data-options="iconCls:'icon-notice'" style="padding:10px;background-color:#E0ECFF">
			<a href="javascript:openTab('公告管理','noticeManager.jsp','icon-notice')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-manage'" style="width: 150px;">公告管理</a>
		</div>
		<div title="新闻管理"  data-options="iconCls:'icon-news'" style="padding:10px;background-color:#E0ECFF"">
			<a href="javascript:openTab('新闻管理','newsManager.jsp','icon-news')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-manage'" style="width: 150px;">新闻管理</a>
		</div>
		<div title="标签管理"  data-options="iconCls:'icon-tag'" style="padding:10px;background-color:#E0ECFF"">
			<a href="" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-manage'" style="width: 150px;">标签管理</a>
		</div>
		<div title="系统管理"  data-options="iconCls:'icon-item'" style="padding:10px;background-color:#E0ECFF">
			<a href="javascript:adminUpdatePassword()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-modifyPassword'" style="width: 150px;">修改密码</a>
			<a href="javascript:adminLogout()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-exit'" style="width: 150px;">安全退出</a>
			<a href="javascript:adminRefresh()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-refresh'" style="width: 150px;">刷新系统缓存</a>
		</div>
	</div>
</div>
<div region="south" style="height:25px;padding:5px;background-color:#E0ECFF" align="center">
	                                                              宁夏医科大学理学院 &copy;2011级电子信息班 All Rights Reserved.http://www.www.nxmumanagerbook.com.com
</div>

<div id="dlg" class="easyui-dialog" style="width:500px;height:220px;padding: 10px 20px"
  closed="true" buttons="#adminPassword">
 	<form id="adminPasswordForm" method="post">
 		<table cellspacing="8px">
 			<tr>
 				<td>用户名：</td>
 				<td><input type="text" id="userName" name="userName" value="${userLogin.userName}" readonly="readonly" style="width: 200px"/></td>
 			</tr>
 			<tr>
 				<td>原密码：</td>
 				<td><input type="password" id="oldPassword" class="easyui-validatebox" required="true" style="width: 200px" onblur="confirmPassword()"/>
 				   <span id="ErrorInfo" style="color: red"></span>
 				</td>
 			</tr>
 			<tr>
 				<td>新密码：</td>
 				<td><input type="password" id="newPassword" name="password" class="easyui-validatebox" required="true" style="width: 200px"/></td>
 			</tr>
 			<tr>
 				<td>确认新密码：</td>
 				<td><input type="password" id="newPasswordConfirm" onblur="equalNewPassword()" class="easyui-validatebox" required="true" style="width: 200px"/>
 				 <span id="error" style="color:red"></span>
 				</td>
 			</tr>
 		</table>
 	</form>
</div>

<div id="adminPassword">
	<a href="javascript:adminPassword()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
	<a href="javascript:closePasswordModifyDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>
</body>
</html>