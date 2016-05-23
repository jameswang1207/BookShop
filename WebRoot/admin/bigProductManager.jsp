<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品大类管理</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery-easyui-1.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery-easyui-1.4/themes/icon.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui-1.4/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui-1.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui-1.4/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
         /* 进行商品的搜索 */
         function     searchBigProduct(){
            $("#dg").datagrid("load", {    
               bigProductName:$("#s_bigProductName").val()    
             });   
  }
  
         /*进行商品的添加  */
        function  adminAddBigProduct(){
         $("#addBigDialog").dialog("open").dialog("setTitle","商品大类添加");
        }
        //进行商品大类名IS repeat 的检测
        function checkBigProduct(){
            var   addBigProductName = $("#bigProductName").val();
             $.get("<%=request.getContextPath()%>/Admin/checkBigProductName/"+addBigProductName,
					 function(ok){
								if(ok){
									$("#error").html("商品大类信息已存在，请重新输入！");
									$("#bigProductName").focus();
								}else{
									$("#error").html("");
								}
							}
		        );
        }
       //进行商品大类信息的保存
       function  adminsaveBigProduct(){
              $("#adminAddBigProductF").form("submit", {    
                        url:"<%=request.getContextPath()%>/Admin/adminAddBigProduct",    
                        onSubmit:function(){    
                              if($("#bigProductRemarks").val()==""){
                                $.messager.alert("警告","请对你添加的商品大类进行描述");
                                 return false;  
                              }
				              return $(this).form("validate");   
                        },    
                        success:function(ok){    
								if(ok){
									$.messager.alert("商品大类添加提示","商品大类添加成功");
									clearBigProductInformation();
									$("#addBigDialog").dialog("close");
									$("#dg").datagrid("reload");
								}else{
									$.messager.alert("商品大类添加提示","商品大类添加失败");
									return;
								}    
                         }    
                     });
        } 
       //对选中的商品进行修改
        function  adminUpdateBigProdunt(){
               var    selectRows =  $("#dg").datagrid("getSelections");
                 if(selectRows.length!=1){
                 $.messager.alert("警告","请选择你要编辑的数据行！");
                  return ;
            } 
                  var  select =  selectRows[0];
               $("#UbigProductId").val(select.id);
               $("#UbigProductName").val(select.name);
               $("#UbigProductRemarks").val(select.remarks);
               $("#updateBigDialog").dialog("open").dialog("setTitle","对商品大类信息进行修改");
        }
        
         function  adminUpdateBigProduct(){
                  $("#adminUpdateBigProductF").form("submit", {    
                        url:"<%=request.getContextPath()%>/Admin/adminUpdateBigProduct",    
                        onSubmit:function(){    
                              if($("#UbigProductRemarks").val()==""){
                                $.messager.alert("警告","请对你修改的商品大类进行描述");
                                 return false;  
                              }
				              return $(this).form("validate");   
                        },    
                        success:function(ok){    
								if(ok){
									$.messager.alert("商品大类修改提示","商品大类修改成功");
									clearUpdateBigProduct();
									$("#updateBigDialog").dialog("close");
									$("#dg").datagrid("reload");
								}else{
									$.messager.alert("商品大类修改提示","商品大类修改失败");
									return;
								}    
                         }    
                     });
                     
         } 
         
         //进行商品大类的删除
       function   adminDeleteBigProduct(){
           //该方法返回的是一个数组
         var   selectedRow =$("#dg").datagrid("getSelections"); 
         if(selectedRow.length!=1){
            $.messager.alert("消息提示","请选择你要删除的商品大类每次只能删除一条,谢谢"); 
              return;  
         }
            var   adminDeleteBigProductId = selectedRow[0].id;
            $.messager.confirm("删除商品大类提示","你确定要删除该条商品大类信息吗？",function(r){    
                       if (r){    
                    $.ajax({
                           type: "DELETE",
                           url: "<%=request.getContextPath()%>/Admin/adminDeleteBigProduct/"+adminDeleteBigProductId,
                           success: function(msg){
                                   if(msg){
                                    $.messager.alert("操作结果提示","商品大类删除成功！");
                                    $("#dg").datagrid("reload");  
                                   }else{
          $.messager.alert("操作结果提示","商品大类删除失败, 有与商品大类相关联的商品小类！！");
                                   }
                                }
                          });
                   }     
            });
        
          }
        //进行添加dialog的清空
          function  clearBigProductInformation(){
              $("#bigProductRemarks").val("");
              $("#bigProductName").val("");
          }        
        
          function  closeBigProductAddDialog(){
             clearBigProductInformation();
             $("#addBigDialog").dialog("close");
          }
          //对修改的dialog进行清空
            function  clearUpdateBigProduct(){
               $("#UbigProductName").val();
               $("#UbigProductRemarks").val();
            }
          
             function  closeBigProductUpdateDialog(){
                 clearUpdateBigProduct();
                 $("#updateBigDialog").dialog("close");
             }
</script>
</head>
<body style="margin:1px">
              <table class="easyui-datagrid" fitColumns="true" title="用户管理" id="dg"
               pageSize=5  pageList=[5,10,15,20]
               pagination="true"  rownumbers="true" fit="true"  toolbar="#tb"
               url="<%=request.getContextPath()%>/Admin/adminFindBigProduct" 
             >
            <thead>
              <tr id="tableData">
                 <th field="cb" checkbox="true" align="center"></th>
                 <th field="id"  align="center"  width="50">编号</th>
                 <th field="name"  align="center"  width="100">商品大类名称</th>
                 <th field="remarks"  align="center"  width="200">商品大类的备注</th>
               </tr>
            </thead>
       </table>
       
       <div  id="addBigDialog"  class="easyui-dialog"  closed="true"  buttons="#addBigProduct"
             style="width:550px;height:250px;padding: 10px 20px">
            <form  id="adminAddBigProductF"  method="post"  enctype="application/x-www-form-urlencoded">
              <table>
                 <tr>
                 <td>商品大类名:</td>
                 <td><input id="bigProductName"  name="name" class="easyui-validatebox" required="true" onblur="checkBigProduct()"/>
                 <span id="error" style="color: red"></span>
                 </td>
                 </tr>
                 <tr>
                 <td>商品大类说明：</td>
                 <td colspan="3"><textarea  rows="6" cols="40"  id="bigProductRemarks" name="remarks" ></textarea></td>
                 </tr>
              </table>
            </form>
       </div>
       
       <div id="addBigProduct">
              <a href="javascript:adminsaveBigProduct()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		      <a href="javascript:closeBigProductAddDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
       </div>
       
       
       <div  id="updateBigDialog"  class="easyui-dialog"  closed="true"  buttons="#updateBigProduct"
             style="width:550px;height:250px;padding: 10px 20px">
            <form  id="adminUpdateBigProductF"  method="post"  enctype="application/x-www-form-urlencoded">
              <table>
                 <tr hidden="true">
                 <td>商品编号:</td>
                 <td><input id="UbigProductId"  name="id" /></td>
                 </tr>
                 <tr>
                 <td>商品大类名:</td>
                 <td><input id="UbigProductName"  name="name" class="easyui-validatebox"   readonly="true"  required="true"/>
                 </td>
                 </tr>
                 <tr>
                 <td>商品大类说明：</td>
                 <td colspan="3"><textarea  rows="6" cols="40"  id="UbigProductRemarks" name="remarks" ></textarea></td>
                 </tr>
              </table>
            </form>
       </div>
       
       <div id="updateBigProduct">
              <a href="javascript:adminUpdateBigProduct()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		      <a href="javascript:closeBigProductUpdateDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
       </div>
       
       
       
       <div id="tb">
            <div>
	            <a href="javascript:adminAddBigProduct()" class="easyui-linkbutton"  plain="true" data-options="iconCls:'icon-add'">添加</a>
	            <a href="javascript:adminUpdateBigProdunt()" class="easyui-linkbutton"  plain="true" data-options="iconCls:'icon-edit'">修改</a>
	            <a href="javascript:adminDeleteBigProduct()" class="easyui-linkbutton"  plain="true" data-options="iconCls:'icon-remove'">删除</a>
                   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;                         
                                                         用户名：<input  type="text"  id="s_bigProductName"/>
                   <a  href="javascript:searchBigProduct()"  class="easyui-linkbutton" data-options="iconCls:'icon-search'" plain="true">搜索|显示全部：当表单清空时显示全部</a>
            </div>
       </div>
</body>
</html>