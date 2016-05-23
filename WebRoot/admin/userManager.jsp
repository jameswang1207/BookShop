<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户管理中心</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery-easyui-1.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery-easyui-1.4/themes/icon.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui-1.4/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui-1.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui-1.4/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
  //按用户名进行用户的查找|或是显示全部用户
  function searchUser(){
//alert("要搜索的用户名："+searchUserName);    
		  $('#dg').datagrid('load', {    
                     userName:$("#s_userName").val()    
            }); 
  }
  
  //删除用户信息
  function  adminDeleteUser(){
  //该方法返回的是一个数组
         var   selectedRow =$("#dg").datagrid("getSelections"); 
         if(selectedRow.length==0){
            $.messager.alert("消息提示","请选择你要删除的消息行！！"); 
              return;  
         }
         //push方法用修改原来的数组，而不是删除原来的数组，将元素直接添加到数组中
           var  adminDeletedUser=[];
           for(var i=0;i<selectedRow.length;i++){
              adminDeletedUser.push(selectedRow[i].id);
           }
           //将数组中的元素转换成一个与|隔开的字符串
           var  idsString   =  adminDeletedUser.join(",");
           $.messager.confirm("删除客户提示框","你确定要删除这些用户信息吗？",function(r){    
                       if (r){    
                    $.ajax({
                           type: "DELETE",
                           url: "<%=request.getContextPath()%>/Admin/AdminDeleteUser/"+idsString,
                           success: function(msg){
                                   if(msg){
                                    $.messager.alert("操作结果提示","删除成功！！");
                                    $("#dg").datagrid("reload");  
                                   }else{
                                     $.messager.alert("操作结果提示","删除失败！！");
                                   }
                                }
                          });
                   }    
            }); 
         } 
         
            //admin添加用户信息
            function  adminAddUser(){
                $("#adminAddUser").dialog("open").dialog("setTitle","添加用户信息");
            }
            //检测用户名是否重复
            function  checkAdminAddUserName(){
              var   userName = $("#userName").val();
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
            //保证用户电话号码唯一
            function  checkAdminAddMobil(){
                var    mobile =$("#mobile").val();
                $.get("<%=request.getContextPath()%>/medicine/checkMoblie/"+mobile,
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
            //触发保存用户信息，进行用户信息的保存
            function  adminsaveUser(){
                 $("#adminAddUserF").form("submit", {    
                        url:"<%=request.getContextPath()%>/Admin/AdminAddUser",    
                        onSubmit:function(){    
                         if($("#gender").combobox("getValue")==""){
					           $.messager.alert("添加提示","请选择性别");
					           return false;
				             }
				              return $(this).form("validate");   
                        },    
                        success:function(ok){    
								if(ok){
									$.messager.alert("用户添加提示","用户添加成功成功");
									clearUserInformation();
									$("#adminAddUser").dialog("close");
									$("#dg").datagrid("reload");
								}else{
									$.messager.alert("用户添加提示","用户添加失败");
									return;
								}    
                         }    
                     });   
            }
          //进行用户信息的清空
          function  clearUserInformation(){
            $("#trueName").val("");
			$("#userName").val("");
			$("#password").val("");
			$("#gender").combobox("setValue","");
			$("#birthday").datebox("setValue","");
			$("#idCard").val("");
			$("#email").val("");
			$("#mobile").val("");
			$("#address").val("");
          }
          
          //进行dialog的关闭
           function  closeUserAddDialog(){
           $("#adminAddUser").dialog("close");
             clearUserInformation();
           } 
</script>
</head>
<body style="margin:1px">
       <table class="easyui-datagrid" fitColumns="true" title="用户管理" id="dg"
             pagination="true"  rownumbers="true" fit="true"  toolbar="#tb"
             url="<%=request.getContextPath()%>/Admin/AdminManagerUser" 
             >
            <thead>
              <tr id="tableData">
                 <th field="cb" checkbox="true" align="center"></th>
                 <th field="id"  align="center"  width="50">编号</th>
                 <th field="trueName"  align="center"  width="100">真实名字</th>
                 <th field="userName"  align="center"  width="100">用户名</th>
                 <th field="password"  align="center"  width="100">密码</th>
                 <th field="gender"    align="center"  width="50">性别</th>
                 <th field="birthday"  align="center"  width="100">出生日期</th>
                 <th field="idCard"  align="center"  width="150">身份证号</th>
                 <th field="email"  align="center"  width="100">邮箱</th>
                 <th field="mobile"  align="center"  width="100">联系电话</th>
                 <th field="address"  align="center"  width="200">用户地址</th>
              </tr>
            </thead>
       </table>  
       <div id="tb">
            <div>
	            <a href="javascript:adminAddUser()" class="easyui-linkbutton"  plain="true" data-options="iconCls:'icon-add'">添加</a>
	            <a href="javascript:adminDeleteUser()" class="easyui-linkbutton"  plain="true" data-options="iconCls:'icon-remove'">删除</a>
                   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;                         
                                                         用户名：<input  type="text"  id="s_userName"/>
                   <a  href="javascript:searchUser()"  class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">搜索|显示全部：当表单清空时显示全部</a>
                   <span id="error" style="color: red"></span>
            </div>
       </div>
       
       <div id="adminAddUser"  class="easyui-dialog"  style="width:550px;height:300px;padding: 10px 20px"
	         closed="true"   buttons="#adminButtons">
             <form id="adminAddUserF" method="post">
                  <table>
                     <tr>
	                      <td>用户名：</td>
	                      <td><input type="text" id="userName" name="userName" class="easyui-validatebox" required="true" onblur="checkAdminAddUserName()"/></td>
	                      <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	                      <td>真实姓名：</td>
	                      <td><input type="text" id="trueName" name="trueName" class="easyui-validatebox" required="true"/></td>
                     </tr>
                     <tr>
                          <td>密码:</td>
                          <td><input type="text" id="password" name="password" class="easyui-validatebox" required="true"/></td>
                          <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                          <td>性别:</td>
                          <td><select class="easyui-combobox" id="gender" name="gender" style="width: 154px;" editable="false" panelHeight="auto">
				 						<option value="">请选择性别</option>
				 						<option value="M">男</option>
				 						<option value="F">女</option>
                                  </select>
                           </td>
                           <tr>
	 				<td>出生日期：</td>
	 				<td><input type="text" id="birthday" name="birthday" class="easyui-datebox" editable="false" required="true"/></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>身份证：</td>
	 				<td><input type="text" id="idCard" name="idCard" class="easyui-validatebox" required="true"/></td>
	 			</tr>
	 			<tr>
	 				<td>邮件：</td>
	 				<td><input type="text" id="email" name="email" class="easyui-validatebox" validType="email" required="true"/></td>
	 				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 				<td>联系电话：</td>
	 				<td><input type="text" id="mobile" name="mobile" class="easyui-validatebox" required="true" onblur="checkAdminAddMobil()"/></td>
	 			</tr>
	 			<tr>
	 				<td>收货地址：</td>
	 				<td colspan="4">
	 					<input type="text" id="address" name="address" class="easyui-validatebox" required="true" style="width: 350px;"/>
	 				</td>
	 			</tr>
            </table>
            </form>
            <span id="userErrorInfo" style="color: red"></span>
            <span id="mobileErrorInfo" style="color: red"></span>
        </div>
       <div id="adminButtons">
              <a href="javascript:adminsaveUser()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		      <a href="javascript:closeUserAddDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
       </div>
</body>
</html>