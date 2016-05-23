<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
  $(function(){
//添加时进行加载。
		$("#bigtypeId").combobox({
			onSelect:function(record){
			  $("#smalltypeId").combobox("reload","<%=request.getContextPath()%>/Admin/SelectSmallType/"+record.id);
			  $("#smalltypeId").combobox("setValue","");    
			}
		});
//修改时的加载。
		$("#UbigtypeId").combobox({
			onSelect:function(record){
			  $("#UsmalltypeId").combobox("reload","<%=request.getContextPath()%>/Admin/SelectSmallType/"+record.id);
			  $("#UsmalltypeId").combobox("setValue","");    
			}
		});	
	});
//进行页面中的数据的另一种方式的转化
//value：字段值。
//rowData：行记录数据。
//rowIndex: 行索引
      function  formatterPicture(value,rowDate,rowIndex){
             return  "<img width=100 height=100 src='${pageContext.request.contextPath}/"+value+"'>";
      }
//将商品的热卖状态设置为YES或是NO     
      function  formatterHot(value,rowDate,rowIndex){
             if(value==1){
                     return "YES";
             }else{
                     return "NO";
             }
      }
//将商品的 特价状态设置为YES或NO     
      function  formatterPrice(value,rowDate,rowIndex){
               if(value==1){
                     return "YES";
             }else{
                     return "NO";
             }
      }
//发送搜索请求      
      function   AdminsearchProduct(){
              $("#dg").datagrid("load", {    
                  productName:$("#s_productName").val()    
                });  
      }
//打开添加用户的dialog
       function  adminAddProduct(){
         $("#adminAddProduct").dialog("open").dialog("setTitle","添加商品信息");
       }    
//检测productName是否重复
       function  checkProductName(){
//用户名的校验
		$.get("<%=request.getContextPath()%>/Admin/ajaxCheckProductName/"+$("#name").val(),
		 function(ok){
					if(ok){
						$("#productInfo").html("产品信息已存在,请重新输入！");
						$("#name").focus();
					}else{
						$("#productInfo").html("");
					}
				}
		);
	}
	
	function   adminsaveProduct(){
	     $("#adminAddProductF").form("submit", {     
                        url:"<%=request.getContextPath()%>/Admin/adminAddProduct",    
                        onSubmit:function(){    
                            if($("#bigtypeId").combobox("getValue")==""){
					           $.messager.alert("警告","请选择商品所属大类");
					            return false;
				             }
				             if($("#picture").val()==""){
				             $.messager.alert("警告","请选择你要添加产品的图片");
					            return false;
				             }
                             if($("#description").val()==""){
				             $.messager.alert("警告","请对你添加的商品进行描述");
					            return false;
				              }		             
				           if($("#smalltypeId").combobox("getValue")==""){
					          $.messager.alert("警告","请选择商品所属小类");
					          return false;
				            }
				             return $(this).form("validate");
                        },    
                        success:function(date){
                              if(date){
						      $.messager.alert("提示","商品添加成功");
						      clearDialogValue();
						      $("#adminAddProduct").dialog("close");
						      $("#dg").datagrid("reload");
						      }else{
						      $.messager.alert("提示","商品添加失败");
						        return;
						      }  
                         }    
                     });
	}
	//商品的删除
	function adminDeleteProduct(){
         var   selectedRow =$("#dg").datagrid("getSelections");
           if(selectedRow.length==0){
                 $.messager.alert("警告","请选择你要删除的数据行！");
                  return ;
           }   
           var  adminDeleteidArray= [];
           for(var  i = 0;i<selectedRow.length;i++){
                  adminDeleteidArray.push(selectedRow[i].productId);
           }
             
           var  adminDeleteIdString  =  adminDeleteidArray.join(",");
           $.messager.confirm("提示","你确定要删除你选中的数据吗？",function(r){    
                             if (r){    
                          $.ajax({
                                  type:"DELETE",
                                  url:"<%=request.getContextPath()%>/Admin/adminDeleteProduct/"+adminDeleteIdString,
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
	//进行产品的修改
 	function  adminUpdateProdunt(){
 	 var   selectUpdateRow =$("#dg").datagrid("getSelections");
           if(selectUpdateRow.length!=1){
                 $.messager.alert("警告","请选择你要编辑的数据行！");
                  return ;
           } 
           var   updateRow =  selectUpdateRow[0];
           $("#Uname").val(updateRow.productName);
           $("#Uprice").val(updateRow.price);
           $("#Ustock").val(updateRow.stock);
           $("#Udescription").val(updateRow.description);
           $("#id").val(updateRow.productId);
	       $("#adminUpdateProduct").dialog("open").dialog("setTitle","修改商品信息"); 
	}
	//进行修改
	function  adminUpdateProduct(){
	                            $("#adminUpdateProductF").form("submit", {    
									    url:"<%=request.getContextPath()%>/Admin/adminUpdateProduct",   
									    onSubmit: function(){ 
									       if($("#UbigtypeId").combobox("getValue")==""){
					                           $.messager.alert("警告","请选择要修改的商品所属大类");
					                           return false;
				                              }
									       if($("#UsmalltypeId").combobox("getValue")==""){
					                             $.messager.alert("警告","请选择要修改的商品所属小类");
					                              return false;
				                               }  
									       if($("#Udescription").val()==""){
									             $.messager.alert("警告","请对你修改的商品进行描述");
										           return false;
									              }		             
									             return $(this).form("validate");
					                        },            
									   success:function(date){
					                              if(date){
											      $.messager.alert("提示","商品修改成功");
											      clearUpdateDialogValue();
											      $("#adminUpdateProduct").dialog("close");
											      $("#dg").datagrid("reload");
											      }else{
											      $.messager.alert("提示","商品修改失败");
											        return;
											      }  
					                         }    
						   });  
	}
	//设置商品的热卖
	function  adminSetHot(){
	      var   selectedRow =$("#dg").datagrid("getSelections");
           if(selectedRow.length==0){
                 $.messager.alert("警告","请选择你要设置的热卖商品！");
                  return ;
           }
           var  adminSetidArray= [];
           for(var  i = 0;i<selectedRow.length;i++){
                  adminSetidArray.push(selectedRow[i].productId);
           }
           var  adminSethotIdString  =  adminSetidArray.join(",");
             $.messager.confirm("提示","你确定要将你选中的商品设置为热卖吗？",function(r){    
                             if (r){    
                          $.ajax({
                                  type:"PUT",
                                  url:"<%=request.getContextPath()%>/Admin/adminSetHotProduct/"+adminSethotIdString,
                           success: function(msg){
                                   if(msg){
                                    $.messager.alert("操作结果提示","热卖商品设置成功！！");
                                    $("#dg").datagrid("reload");  
                                   }else{
                                     $.messager.alert("操作结果提示","热卖商品设置失败！！");
                                   }
                                }
                              });   
                          }    
                    });   
	}
	//设置商品的特价
	function adminSetSpersical(){
	       var   selectedRow =$("#dg").datagrid("getSelections");
           if(selectedRow.length==0){
                 $.messager.alert("警告","请选择你要设置的特价商品！");
                  return ;
           }   
           var  adminSetSidArray= [];
           for(var  i = 0;i<selectedRow.length;i++){
                  adminSetSidArray.push(selectedRow[i].productId);
           }
             
           var  adminSetSIdString  =  adminSetSidArray.join(",");
            $.messager.confirm("提示","你确定要将你选中的商品设置为特价吗？",function(r){    
                             if (r){    
                          $.ajax({
                                  type:"PUT",
                                  url:"<%=request.getContextPath()%>/Admin/adminSetSProduct/"+adminSetSIdString,
                           success: function(msg){
                                   if(msg){
                                    $.messager.alert("操作结果提示","特价商品设置成功！！");
                                    $("#dg").datagrid("reload");  
                                   }else{
                                     $.messager.alert("操作结果提示","特价商品设置失败！！");
                                   }
                                }
                              });   
                          }    
                    });  
	 }
	//取消特价设置
	  function  adminCancelSpecial(){
	          var   selectedRow =$("#dg").datagrid("getSelections");
           if(selectedRow.length==0){
                 $.messager.alert("警告","请选择你要取消特价的商品！");
                  return ;
           }   
           var  adminSetSidArray= [];
           for(var  i = 0;i<selectedRow.length;i++){
                  adminSetSidArray.push(selectedRow[i].productId);
           }
             
           var  adminCancelIdString  =  adminSetSidArray.join(",");
            $.messager.confirm("提示","你确定要将你选中的商品取消特价吗？",function(r){    
                             if (r){    
                          $.ajax({
                                  type:"PUT",
                                  url:"<%=request.getContextPath()%>/Admin/adminCancelSpecialProduct/"+adminCancelIdString,
                           success: function(msg){
                                   if(msg){
                                    $.messager.alert("操作结果提示","取消特价商品设置成功！！");
                                    $("#dg").datagrid("reload");  
                                   }else{
                                     $.messager.alert("操作结果提示","取消特价商品设置失败！！");
                                   }
                                }
                              });   
                          }    
                    });
	  }
	//取消热卖设置
	  function adminCancelHot(){
	         var   selectedRow =$("#dg").datagrid("getSelections");
           if(selectedRow.length==0){
                 $.messager.alert("警告","请选择你要取消的热卖商品！");
                  return ;
           }
           var  adminSetidArray= [];
           for(var  i = 0;i<selectedRow.length;i++){
                  adminSetidArray.push(selectedRow[i].productId);
           }
             
           var  adminCancelhotIdString  =  adminSetidArray.join(",");
             $.messager.confirm("提示","你确定要将你选中的商品设置为不热卖吗？",function(r){    
                             if (r){    
                          $.ajax({
                                  type:"PUT",
                                  url:"<%=request.getContextPath()%>/Admin/adminCancelHotProduct/"+adminCancelhotIdString,
                           success: function(msg){
                                   if(msg){
                                    $.messager.alert("操作结果提示","取消热卖商品设置成功！！");
                                    $("#dg").datagrid("reload");  
                                   }else{
                                     $.messager.alert("操作结果提示","取消热卖商品设置失败！！");
                                   }
                                }
                              });
                          }    
                    });
	   }
	//进行对话框中的信息进行清空
	function clearDialogValue(){
		$("#name").val("");
		$("#price").val("");
		$("#stock").val("");
		$("#file").val("");
		$("#bigtypeId").combobox("setValue","");
		$("#smalltypeId").combobox("setValue","");
		$("#description").val("");
	}
	
	//进行对话框中的修改信息进行清空
	function clearUpdateDialogValue(){
	    $("#id").val("");
		$("#Uname").val("");
		$("#Uprice").val("");
		$("#Ustock").val("");
		$("#Ufile").val("");
		$("#UbigtypeId").combobox("setValue","");
		$("#UsmalltypeId").combobox("setValue","");
		$("#Udescription").val("");
	}
	//关闭添加对话框
	   function closeUserAddDialog(){
		$("#adminAddProduct").dialog("close");
		clearDialogValue();
    	}
	//关闭修改对话框
	   function closeUpdateDialog(){
	   $("#adminUpdateProduct").dialog("close");
		clearUpdateDialogValue();
	   }
		
</script>
<title>商品管理</title>
</head>
<body style="margin:1px">
          <table class="easyui-datagrid" id="dg" fitColumns="true"  fit="true" pagination="true"  pageSize=4 
           pageList=[4,8,12,16,20]
           rownumbers="true"  title="商品管理" url="<%=request.getContextPath()%>/Admin/AdminManagerProcut" toolbar="#tb">
           <thead>
		          <tr>
			 		<th field="cb" checkbox="true" align="center"></th>
			 		<th field="productId" width="50" align="center">编号</th>
			 		<th field="picture" width="150" align="center" formatter="formatterPicture">商品图片</th>
			 		<th field="productName"width="200" align="center">商品名称</th>
			 		<th field="price" width="50" align="center">价格</th>
			 		<th field="stock" width="50" align="center">库存</th>
			 		<th field="description" width="50" hidden="true" align="center">描述商品</th>
			 		<th field="bigtypeName" width="100" align="center" >所属商品大类名称</th>
			 		<th field="smallTypeName" width="100" align="center">所属商品小类名称</th>
			 		<th field="hot" width="100" align="center" formatter="formatterHot">是否热卖</th>
			 		<th field="specialPrice" width="100" align="center" formatter="formatterPrice" >是否特价</th>
			 		<th field="hotTime" width="100" align="center" >热卖时间</th>
			 		<th field="specialPriceTime" width="100" align="center" >特价时间</th>
			 	 </tr>
	 	</thead>
          </table>
      <div id="tb">
            <div>
	            <a href="javascript:adminAddProduct()" class="easyui-linkbutton"  plain="true" data-options="iconCls:'icon-add'">添加</a>
	            <a href="javascript:adminDeleteProduct()" class="easyui-linkbutton"  plain="true" data-options="iconCls:'icon-remove'">删除</a>
	            <a href="javascript:adminUpdateProdunt()" class="easyui-linkbutton"  plain="true" data-options="iconCls:'icon-edit'">修改</a>
	            <a href="javascript:adminSetHot()" class="easyui-linkbutton"  plain="true" data-options="iconCls:'icon-hot'">设置热卖</a>
	            <a href="javascript:adminCancelHot()" class="easyui-linkbutton"  plain="true" data-options="iconCls:'icon-cannelHot'">取消热卖</a>
	            <a href="javascript:adminCancelSpecial()" class="easyui-linkbutton"  plain="true" data-options="iconCls:'icon-cannelSpecial'">取消特价</a>
	            <a href="javascript:adminSetSpersical()" class="easyui-linkbutton"  plain="true" data-options="iconCls:'icon-special'">设置特价</a>
                   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;                        
                                                         商品名称：<input  type="text"  id="s_productName"/>
                   <a  href="javascript:AdminsearchProduct()"  class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">搜索|显示全部：当表单清空时显示全部</a>
            </div>
       </div>
       
       <div  id="adminAddProduct"  class="easyui-dialog"  style="width:500px;height:350px;padding: 10px 20px"
	         closed="true"   buttons="#adminButtons">
          <form  id="adminAddProductF"  method="post" enctype="multipart/form-data">
             <table>
                <tr>
                   <td>商品名字：</td>
                   <td><input type="text"  class="easyui-validatebox" required="true" id="name"  name="name" style="width:200px"  onblur="checkProductName()"/>
                   <span id="productInfo" style="color: red"></span>
                   </td>
                </tr>
                <tr>
                   <td>商品价格：</td>
                   <td><input  type="text"  class="easyui-validatebox"  required="true" id="price" name="price" style="width:200px" /></td>
                </tr>
                <tr>
                   <td>商品图片：</td>
                   <td><input  type="file" id="file"  name="file"/></td>
                </tr>
                <tr>
                   <td>商品库存：</td>
                   <td><input  type="text"  class="easyui-validatebox"  required="true"  id="stock" name="stock" style="width:200px" /></td>
                </tr>
                <tr>
                   <td>商品所属大类：</td>
                   <td><input   class="easyui-combobox" id="bigtypeId" name ="bigtypeId" data-options="valueField:'id',textField:'name',editable:false,panelHeight:'auto',url:'<%=request.getContextPath()%>/Admin/SelectBigType' "/></td>
                </tr>
                <tr>
                   <td>商品所属小类：</td>
                   <td><input  class="easyui-combobox" id="smalltypeId" name ="smallTypeId" data-options="valueField:'id',textField:'name',editable:false,panelHeight:'auto',url:'<%=request.getContextPath()%>/Admin/SelectSmallType/0'"/>
                   &nbsp;&nbsp;&nbsp;<span>提示:请先选择商品大类信息</span></td>
                </tr>
                <tr>
                   <td>商品信息描述：</td>
                   <td><textarea rows="5" cols="50" id="description" name="description"></textarea></td>
                </tr>
             </table>
          </form>
       </div>
       
       
       <div  id="adminUpdateProduct"  class="easyui-dialog"  style="width:550px;height:350px;padding: 10px 20px"
	         closed="true"   buttons="#adminUButtons">
          <form  id="adminUpdateProductF"  method="post" enctype="multipart/form-data">
             <table>
                 <tr hidden="true">
                 <td>编号：</td>
                 <td><input  hidden="true" type="text" id="id" name="id"/></td>
                 </tr>
                <tr>
                   <td>商品名字：</td>
                   <td><input type="text" readonly="readonly" class="easyui-validatebox" required="true" id="Uname"  name="name" style="width:200px"  onblur="checkProductName()"/>
                   </td>
                </tr>
                <tr>
                   <td>商品价格：</td>
                   <td><input  type="text"  class="easyui-validatebox"  required="true" id="Uprice" name="price" style="width:200px" /></td>
                </tr>
                 <tr>
                   <td>商品图片：</td>
                   <td><input  type="file" id="Ufile"  name="file"/></td>
                 </tr>
                <tr>
                   <td>商品库存：</td>
                   <td><input  type="text"  class="easyui-validatebox"  required="true"  id="Ustock" name="stock" style="width:200px" /></td>
                </tr>
                <tr>
                   <td>商品所属大类：</td>
                   <td><input   class="easyui-combobox" id="UbigtypeId" name ="bigtypeId" data-options="valueField:'id',textField:'name',editable:false,panelHeight:'auto',url:'<%=request.getContextPath()%>/Admin/SelectBigType' "/></td>
                </tr>
                <tr>
                   <td>商品所属小类：</td>
                   <td><input  class="easyui-combobox" id="UsmalltypeId" name ="smallTypeId" data-options="valueField:'id',textField:'name',editable:false,panelHeight:'auto',url:'<%=request.getContextPath()%>/Admin/SelectSmallType/0'"/>
                   &nbsp;&nbsp;&nbsp;<span>提示:请先选择商品大类信息</span></td>
                </tr>
                <tr>
                   <td>商品信息描述：</td>
                   <td><textarea rows="5" cols="50" id="Udescription" name="description"></textarea></td>
                </tr>
             </table>
          </form>
       </div>
       
       <div id="adminButtons">
              <a href="javascript:adminsaveProduct()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		      <a href="javascript:closeUserAddDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
       </div>
       
       <div id="adminUButtons">
              <a href="javascript:adminUpdateProduct()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		      <a href="javascript:closeUpdateDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
       </div>
</body>
</html>