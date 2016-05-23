<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品小类管理</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery-easyui-1.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery-easyui-1.4/themes/icon.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui-1.4/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui-1.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui-1.4/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
      function  searchSmallProduct(){
         $("#dg").datagrid("load", {    
               smallProductName:$("#s_smallProductName").val()    
             });
      }
      
      function  adminAddSmallProduct(){
      $("#adminAddSmallProductDialog").dialog("open").dialog("setTitle","进行商品小类的添加");
      } 
      //进行小类的商品名检测
      function  checkSmallProductRepeat(){
               var   addAdminSmallProduct = $("#SmallProductName").val();
             $.get("<%=request.getContextPath()%>/Admin/adminCheckSmallProductRepeat/"+addAdminSmallProduct,
					 function(ok){
								if(ok){
									$("#error").html("商品小类信息已存在，请重新输入！");
									$("#SmallProductName").focus();
								}else{
									$("#error").html("");
								}
							}
		        );
      }
      
      //进行商品小类的添加
     function  adminSaveSmallProduct(){
              $("#adminSmallProdutF").form("submit", {    
                        url:"<%=request.getContextPath()%>/Admin/adminAddSmallProduct",    
                        onSubmit:function(){
                              if($("#bigTypeId").combobox("getValue")==""){
					            $.messager.alert("警告","请选择商品所属大类");
					            return false;
				              }
				               if($("#SmallProductName").val()==""){
				                  $.messager.alert("警告","请填写你添加的商品小类名");
                                   return false;
				               } 
                              if($("#smallProductRemarks").val()==""){
                                 $.messager.alert("警告","请对你添加的商品小类进行描述");
                                 return false;  
                              }
				              return $(this).form("validate");   
                        },    
                        success:function(ok){    
								if(ok){
									$.messager.alert("商品小类添加提示","商品小类添加成功");
									clearSmallProductInformation();
									$("#adminAddSmallProductDialog").dialog("close");
									$("#dg").datagrid("reload");
								}else{
									$.messager.alert("商品小类添加提示","商品小类添加失败");
									return;
								}    
                         }    
                     });
     }
     
      //进行商品信息的修改
       function  adminUpdateSmallProdunt(){
            var selectedSmallProducts=$("#dg").datagrid("getSelections");
		    if(selectedSmallProducts.length!=1){
			$.messager.alert("商品大类修改提示","请选择一条要修改的数据！");
			         return;
		  }
		    //取出选择的商品小类的数据
		    var  selectedDate=selectedSmallProducts[0];
		    //alert(selectedDate);
		    $("#Uid").val(selectedDate.smallProductId);
            $("#USmallProductName").val(selectedDate.smallProductName);
            $("#UsmallProductRemarks").val(selectedDate.smallProductRemarks); 
            $("#adminUpdateSmallProductDialog").dialog("open").dialog("setTitle","商品小类信息的修改窗口");      
       }
       //进行商品小类的修改并重新保存
       function    adminUpdateSmallProduct(){
           $("#adminUpdateSmallProdutF").form("submit", {    
                        url:"<%=request.getContextPath()%>/Admin/adminUpdateSmallProduct",    
                        onSubmit:function(){
                              if($("#UbigTypeId").combobox("getValue")==""){
					            $.messager.alert("警告","请选择商品所属大类");
					            return false;
				              }
                              if($("#UsmallProductRemarks").val()==""){
                                 $.messager.alert("警告","请对你要修改的商品小类进行描述");
                                 return false;  
                              }
				              return $(this).form("validate");   
                        },    
                        success:function(ok){    
								if(ok){
									$.messager.alert("商品小类修改提示","商品小类修改成功");
									clearSmallProductDialog();
									$("#adminUpdateSmallProductDialog").dialog("close");
									$("#dg").datagrid("reload");
								}else{
									$.messager.alert("商品小类修改提示","商品小类修改失败");
									return;
								}    
                         }    
                     });
       } 
        
     //进行商品的删除
     function  adminDeleteSmallProduct(){
         var  seletedDeletes =$("#dg").datagrid("getSelections");
         if(seletedDeletes.length==0){
           $.messager.alert("警告","请选择你要删除的数据！！");    
         }
         alert(seletedDeletes);
          var  idArrays = [];
          for(var i = 0;i<seletedDeletes.length;i++){
                 idArrays.push(seletedDeletes[i].smallProductId);
          }
          
          var   adminDeleteidString  =  idArrays.join(",");
         // alert("要删除的小商品的id是"+adminDeleteidString);
          $.messager.confirm("提示","你确定要删除你选中的数据吗？",function(r){    
                             if (r){    
                          $.ajax({
                                  type:"DELETE",
                                  url:"<%=request.getContextPath()%>/Admin/adminDeleteSmallProduct/"+adminDeleteidString,
                           success: function(msg){
                                   if(msg){
                                    $.messager.alert("操作结果提示","删除成功！！");
                                    $("#dg").datagrid("reload");  
                                   }else{
                                     $.messager.alert("操作结果提示","商品小类删除失败, 有与商品小类相关联的商品！");
                                   }
                                }
                              });   
                          }    
                    }); 
         
     }
     //clearSmallProductInformation
       function  clearSmallProductInformation(){
            $("#bigTypeId").combobox("setValue","");
            $("#SmallProductName").val("");
            $("#smallProductRemarks").val("");
       }  
      //进行dialog的关闭
      function closeSmallProductDialog(){
           clearSmallProductInformation();
		   $("#adminAddSmallProductDialog").dialog("close");
      } 
      
      //商品修改时的清空
      function   clearSmallProductDialog(){
            $("#UbigTypeId").combobox("setValue","");
            $("#USmallProductName").val("");
            $("#UsmallProductRemarks").val("");
      }
      //进行dialog的关闭
      function  closeUpdateSmallProductDialog(){
           clearSmallProductDialog();
           $("#adminUpdateSmallProductDialog").dialog("close");
      }
       
</script>
</head>
<body style="margin:1px">
            <table class="easyui-datagrid" fitColumns="true" id="dg"
               pageSize=5  pageList=[5,10,15,20]
               pagination="true"  rownumbers="true" fit="true"  toolbar="#tb"
               url="<%=request.getContextPath()%>/Admin/adminFindAllSmallProduct" 
             >
            <thead>
              <tr id="tableData">
                 <th field="cb" checkbox="true" align="center"></th>
                 <th field="smallProductId"  align="center"  width="50">编号</th>
                 <th field="smallProductName"  align="center"  width="100">商品小类名称</th>
                 <th field="bigProductName"  align="center"  width="100">所属商品大类名</th>
                 <th field="smallProductRemarks"  align="center"  width="200">商品小类的备注</th>
               </tr>
            </thead>
       </table> 
       
       <div id="tb">
            <div>
	            <a href="javascript:adminAddSmallProduct()" class="easyui-linkbutton"  plain="true" data-options="iconCls:'icon-add'">添加</a>
	            <a href="javascript:adminUpdateSmallProdunt()" class="easyui-linkbutton"  plain="true" data-options="iconCls:'icon-edit'">修改</a>
	            <a href="javascript:adminDeleteSmallProduct()" class="easyui-linkbutton"  plain="true" data-options="iconCls:'icon-remove'">删除</a>
                   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;                         
                                                         用户名：<input  type="text"  id="s_smallProductName"/>
                   <a  href="javascript:searchSmallProduct()"  class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">搜索|显示全部：当表单清空时显示全部</a>
            </div>
       </div>
       
       <div id="adminAddSmallProductDialog" class="easyui-dialog" style="width: 600px;height:350px;padding: 10px 20px"
	      closed="true" buttons="#adminAddSmallProductButtons">
	 	<form id="adminSmallProdutF" method="post">
	 		<table cellspacing="8px">
	 		   <tr>
	 				<td>小类名称：</td>
	 				<td colspan="3"><input type="text" id="SmallProductName" name="name" class="easyui-validatebox" required="true" onblur="checkSmallProductRepeat()"/>
	 				<span id="error"  style="color:red"></span>
	 				</td>
	 			</tr>
	 			<tr>
	 				<td>所属大类：</td>
	 				<td colspan="3">
	 					<input class="easyui-combobox" id="bigTypeId" name="bigTypeId" data-options="panelHeight:'auto',editable:false,valueField:'id',textField:'name',url:'<%=request.getContextPath()%>/Admin/SelectBigType'"/>
	 				</td>
	 			</tr>
	 			<tr>
	 				<td valign="top">商品小类说明：</td>
	 				<td colspan="3">
	 					<textarea rows="7" cols="50" id="smallProductRemarks" name="remarks"></textarea>
	 				</td>
	 			</tr>
	 		</table>
	 	</form>
	</div>
	
	<div id="adminAddSmallProductButtons">
		<a href="javascript:adminSaveSmallProduct()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeSmallProductDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
	<!--进行修改的dialog窗口的再造 -->
	<div id="adminUpdateSmallProductDialog" class="easyui-dialog" style="width: 600px;height:350px;padding: 10px 20px"
	      closed="true" buttons="#adminUpdateSmallProductButtons">
	 	<form id="adminUpdateSmallProdutF" method="post">
	 		<table cellspacing="8px">
	 		   <tr hidden="true">
	 		    <td>编号：</td>
	 		    <td><input type="text" name="id"  id="Uid"/></td>
	 		   </tr>
	 		   <tr>
	 				<td>小类名称：</td>
	 				<td colspan="3"><input readonly="true" type="text" id="USmallProductName" name="name" class="easyui-validatebox" required="true" onblur="checkSmallProductRepeat()"/>
	 				<span id="error"  style="color:red"></span>
	 				</td>
	 			</tr>
	 			<tr>
	 				<td>所属大类：</td>
	 				<td colspan="3">
	 					<input class="easyui-combobox" id="UbigTypeId" name="bigTypeId" data-options="panelHeight:'auto',editable:false,valueField:'id',textField:'name',url:'<%=request.getContextPath()%>/Admin/SelectBigType'"/>
	 				</td>
	 			</tr>
	 			<tr>
	 				<td valign="top">商品小类说明：</td>
	 				<td colspan="3">
	 					<textarea rows="7" cols="50" id="UsmallProductRemarks" name="remarks"></textarea>
	 				</td>
	 			</tr>
	 		</table>
	 	</form>
	</div>
	
	<div id="adminUpdateSmallProductButtons">
		<a href="javascript:adminUpdateSmallProduct()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeUpdateSmallProductDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
          
</body>
</html>