<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>留言管理</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/jquery-easyui-1.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/jquery-easyui-1.4/themes/icon.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/jquery-easyui-1.4/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/jquery-easyui-1.4/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/jquery-easyui-1.4/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
   function  replyContentHref(value,rowData,rowIndex){
       if(value==null||value==""){
           return "<a href='javascript:adminReplyUser("+rowData.id+")'>回复用户留言</a>";
       }else{
          return value;
        } 
   }
   
    function  adminReplyUser(id){
        var    selectRows =  $("#dg").datagrid("getSelections");
// alert(selectRows);
          if(selectRows.length!=1){
             $.messager.alert("警告","请选择你要回复的留言连接");
                 return;
          }
          var  rowData  =  selectRows[0];
          $("#content").val(rowData.content);
          $("#commentId").val(rowData.id);
         $("#dialogComment").dialog("open").dialog("setTitle","回复用户留言");
    }
     
     function    searchComment(){
            $("#dg").datagrid("load", {    
               personName:$("#adminPerson").val()    
             });   
       }
    
    //进行回复的数据进行保存
    function  AdminSaveComment(){
          $("#commmentFrom").form("submit", {    
                        url:"<%=request.getContextPath()%>/Admin/adminReplyUser",    
                        onSubmit:function(){    
				              return $(this).form("validate");   
                        },    
                        success:function(ok){    
								if(ok){
									$.messager.alert("回复提示","回复用户留言成功");
									clearCommentDialog();
									$("#dialogComment").dialog("close");
									$("#dg").datagrid("reload");
								}else{
									$.messager.alert("回复提示","回复用户留言失败");
									return;
								}    
                         }    
                     });
    }
    
    function clearCommentDialog(){
       $("#content").val();
       $("#replyContent").val();
    }
    
   //进行dialog的关闭
    function  closeCommentDialog(){
       clearCommentDialog();
       $("#dialogComment").dialog("close");
    }
    //进行用户留言的删除
    function adminDeleteComment(){
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
           var  idString   =  adminDeletedUser.join(",");
           $.messager.confirm("删除用户留言","你确定要删除这些用户留言信息吗？",function(r){    
                       if (r){    
                    $.ajax({
                           type: "DELETE",
                           url: "<%=request.getContextPath()%>/Admin/adminDeleteComment/"+idString,
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
</script>
</head>
<body style="margin:1px;">
	<table class="easyui-datagrid" fitColumns="true" title="留言管理" id="dg"
		pageSize=5 pageList=[5,10,15,20] pagination="true" rownumbers="true"
		fit="true" toolbar="#tb" url="<%=request.getContextPath()%>/Admin/adminFindComment">
		<thead>
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="id" width="50" align="center">编号</th>
				<th field="content" width="200" align="center">留言内容</th>
				<th field="personName" width="50" align="center">留言人昵称</th>
				<th field="createTime" width="50" align="center">创建时间</th>
				<th field="replyContent" width="200" align="center"
					formatter="replyContentHref">回复内容</th>
				<th field="replyTime" width="50" align="center">回复时间</th>
			</tr>
		</thead>
	</table>

	<div id="tb">
		<div>
			<a href="javascript:adminDeleteComment()" class="easyui-linkbutton"
				iconCls="icon-remove" plain="true">删除留言</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			留言名称：&nbsp;<input type="text" id="adminPerson" size="20" /> <a
				href="javascript:searchComment()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">搜索|显示全部：当表单清空时显示全部</a>
		</div>
	</div>

	<div id="dialogComment" class="easyui-dialog"
		style="width: 600px;height:350px;padding: 10px 20px" closed="true"
		buttons="#dialogButtons">
		<form id="commmentFrom" method="post">
			<table cellspacing="8px">
				<tr hidden="true">
					<td>用户的ID:</td>
					<td><input id="commentId" name="id" type="text"
						readonly="readonly" />
					</td>
				</tr>
				<tr>
					<td valign="top">留言内容：</td>
					<td colspan="4"><textarea rows="4" cols="40" id="content"
							readonly="readonly"></textarea></td>
				</tr>
				<tr>
					<td valign="top">回复内容：</td>
					<td colspan="4"><textarea rows="4" cols="40" id="replyContent"
							name="replyContent" class="easyui-validatebox" required="true"></textarea>
					</td>
				</tr>
			</table>
		</form>
	</div>

	<div id="dialogButtons">
		<a href="javascript:AdminSaveComment()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a> <a href="javascript:closeCommentDialog()"
			class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>