<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>公告管理</title>
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
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
 function     adminSearchNotice(){
            $("#dg").datagrid("load", {    
               title:$("#noticeTitle").val()    
             });   
  }
  
  //进行notice的删除
  function deleteNotice(){
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
           $.messager.confirm("公告删除提示框","你确定要删除这些公告信息吗？",function(r){    
                       if (r){    
                    $.ajax({
                           type: "DELETE",
                           url: "<%=request.getContextPath()%>/Admin/adminDeleteNotice/"+idsString,
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
  
  //进行Notice的添加
  function  adminAddNoticeDialog(){
    var  allRows = $("#dg").datagrid("getRows");
           if(allRows.length<7){
              $("#noticeDialog").dialog("open").dialog("setTitle","公告的添加");
           }else{
              $.messager.alert("公告添加提示","前台页面显示公告条数已是最大值,请删除过期公告再添加");
           }
  }
  //进行title的重复检测
  function  checkNoticeNameRepeat(){
         var   title = $("#title").val();
                $.get("<%=request.getContextPath()%>/Admin/adminCheckTitleRepeat/"+title,
					 function(ok){
								if(ok){
									$("#ErrorInfo").html("公告标题已存在，请重新输入！");
									$("#title").focus();
								}else{
									$("#ErrorInfo").html("");
								}
							}
		        );
  }
  //进行用户的notice的保存
  function  adminSaveNotice(){
          $("#noticeFrom").form("submit", {    
                        url:"<%=request.getContextPath()%>/Admin/adminInsertNotice",    
                        onSubmit:function(){
                        var content=CKEDITOR.instances.content.getData();
				        if(content==null || content==""){
					     $.messager.alert("系统提示","公告内容不能为空！");
					                   return false;
				          }    
				              return $(this).form("validate");   
                        },    
                        success:function(ok){    
								if(ok){
									$.messager.alert("公告添加提示","公告添加成功");
									clearNoticeDialog();
									$("#noticeDialog").dialog("close");
									$("#dg").datagrid("reload");
								}else{
									$.messager.alert("公告添加提示","公告添加失败");
									return;
								}    
                         }    
                     }); 
  }
  
  function  clearNoticeDialog(){
        $("#title").val("");
       CKEDITOR.instances.content.setData("");
  }
   
  function  closeNoticeDialog(){
       clearNoticeDialog();
       $("#noticeDialog").dialog("close");
  }  
  
//进行admin的公告修改
  function  openNoticeUpdateDialog(){
      var selectedRows=$("#dg").datagrid("getSelections");
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要编辑的数据！");
			return;
		}
		var row=selectedRows[0];
		$("#updateNoticeDialog").dialog("open").dialog("setTitle","编辑公告信息");
		$("#Utitle").val(row.title);
		$("#uId").val(row.id);
		CKEDITOR.instances.Ucontent.setData(row.content);
  } 
  //修改时的公告title的校验
  function  UcheckNoticeNameRepeat(){
      var   title = $("#Utitle").val();
                $.get("<%=request.getContextPath()%>/Admin/adminCheckTitleRepeat/"+title,
					 function(ok){
								if(ok){
									$("#UErrorInfo").html("公告标题已存在，请重新输入！");
									$("#Utitle").focus();
								}else{
									$("#UErrorInfo").html("");
								}
							}
		        );
  }
  
  function  UadminSaveNotice(){
                  $("#UnoticeFrom").form("submit", {    
                        url:"<%=request.getContextPath()%>/Admin/adminUpdateNotice",
			onSubmit : function() {
				var content = CKEDITOR.instances.Ucontent.getData();
				if (content == null || content == "") {
					$.messager.alert("系统提示", "公告内容不能为空！");
					return false;
				}
				return $(this).form("validate");
			},
			success : function(ok) {
				if (ok) {
					$.messager.alert("公告修改提示", "公告修改成功");
					UclearNoticeDialog();
					$("#updateNoticeDialog").dialog("close");
					$("#dg").datagrid("reload");
				} else {
					$.messager.alert("公告修改提示", "公告修改失败");
					return;
				}
			}
		});
	}
	function UclearNoticeDialog() {
		$("#Utitle").val("");
		CKEDITOR.instances.Ucontent.setData("");
		$("#uId").val("");
	}

	function UcloseNoticeDialog() {
		UclearNoticeDialog();
		$("#updateNoticeDialog").dialog("close");
	}
</script>
</head>
<body style="margin:1px;">
	<table id="dg" title="公告管理" class="easyui-datagrid" pageSize=7
		pageList=[7] fitColumns="true" pagination="true" rownumbers="true"
		fit="true" toolbar="#tb"
		url="<%=request.getContextPath()%>/Admin/adminFindNotice">
		<thead>
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="id" width="50" align="center">编号</th>
				<th field="title" width="100" align="center">公告名称</th>
				<th field="createTime" width="100" align="center">创建时间</th>
				<th field="content" width="400" align="center">内容</th>
			</tr>
		</thead>
	</table>

	<div id="tb">
		<div>
			<a href="javascript:adminAddNoticeDialog()" class="easyui-linkbutton"
				iconCls="icon-add" plain="true">添加</a> <a
				href="javascript:openNoticeUpdateDialog()" class="easyui-linkbutton"
				iconCls="icon-edit" plain="true">修改</a> <a
				href="javascript:deleteNotice()" class="easyui-linkbutton"
				iconCls="icon-remove" plain="true">删除</a>
		</div>
		<div>
			&nbsp;公告名称：&nbsp;<input type="text" id="noticeTitle" size="20" /> <a
				href="javascript:adminSearchNotice()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">搜索|显示全部：当表单清空时显示全部</a>
		</div>
	</div>

	<div id="noticeDialog" class="easyui-dialog"
		style="width: 750px;height:450px;padding: 10px 20px" closed="true"
		buttons="#noticeButtons">
		<form id="noticeFrom" method="post">
			<table cellspacing="8px">
				<tr>
					<td>公告标题：</td>
					<td colspan="4"><input type="text" id="title" name="title"
						class="easyui-validatebox" onblur="checkNoticeNameRepeat()"
						required="true" style="width: 300px" /> <span id="ErrorInfo"
						style="color: red"></span>
					</td>
				</tr>
				<tr>
					<td valign="top">公告内容：</td>
					<td colspan="4"><textarea id="content" name="content"
							class="ckeditor"></textarea>
					</td>
				</tr>
			</table>
		</form>
	</div>

	<div id="noticeButtons">
		<a href="javascript:adminSaveNotice()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a> <a href="javascript:closeNoticeDialog()"
			class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>



	<div id="updateNoticeDialog" class="easyui-dialog"
		style="width: 750px;height:450px;padding: 10px 20px" closed="true"
		buttons="#UnoticeButtons">
		<form id="UnoticeFrom" method="post">
			<table cellspacing="8px">
				<tr hidden="true">
					<td>公告ID:</td>
					<td><input id="uId" name="id" type="text" /></td>
				</tr>
				<tr>
					<td>公告标题：</td>
					<td colspan="4"><input type="text" id="Utitle" name="title"
						class="easyui-validatebox" onblur="UcheckNoticeNameRepeat()"
						required="true" style="width: 300px" /> <span id="UErrorInfo"
						style="color: red"></span>
					</td>
				</tr>
				<tr>
					<td valign="top">公告内容：</td>
					<td colspan="4"><textarea id="Ucontent" name="content"
							class="ckeditor"></textarea>
					</td>
				</tr>
			</table>
		</form>
	</div>

	<div id="UnoticeButtons">
		<a href="javascript:UadminSaveNotice()" class="easyui-linkbutton"
			iconCls="icon-ok">保存</a> <a href="javascript:UcloseNoticeDialog()"
			class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>

</body>
</html>