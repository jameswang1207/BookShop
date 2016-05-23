<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品订单管理</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery-easyui-1.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery-easyui-1.4/themes/icon.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui-1.4/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui-1.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery-easyui-1.4/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
   //进行数据的从新加载
   function  adminSearchOrder(){
      $("#dg").datagrid("load", {    
               orderno:$("#orderno").val(),
               truename:$("#truename").val()                 
             }); 
   }
   //1 待审核  2 审核通过 3 卖家已发货  4 已收获
   function  oderStatusChange(value,rowDate,rowIndex){
          switch(value)
				     {
				   case 1:
				     return   "待审核";
				     break
				   case 2:
				      return  "审核通过";
				     break
				   case 3:
				      return  "卖家已发货";
				     break
				    case 4:
				      return  "用户已收货";
				     break  
				   }
   }
   
   //进行用户的detailed的查询
   function  openOrderDetailDialog(){
        var   selectedRows =   $("#dg").datagrid("getSelections");
        if(selectedRows.length!=1){
           $.messager.alert("警告","请选择你要查询的订单详情的一行数据！！"); 
           return;   
        }
        var  selectData=selectedRows[0];
         $("#detailedDialog").datagrid("load", {    
               orderno:selectData.orderno
         });
        $("#dOrderno").val(selectData.orderno);
        $("#dTruename").val(selectData.truename);
        $("#dCost").val(selectData.cost+"元");
        switch(selectData.orderStatus)
				     {
				   case 1:
				    $("#dOrderStatus").val("待审核");
				     break
				   case 2:
				    $("#dOrderStatus").val("审核通过");
				     break
				   case 3:
				     $("#dOrderStatus").val("卖家已发货");
				     break
				    case 4:
				     $("#dOrderStatus").val("用户已收货");
				     break  
				   }
	   $("#userDetailedOrder").dialog("open").dialog("setTitle","用户订单详情"); 		   
   }
   
    function  closeOrderDetailDialog(){
    $("#userDetailedOrder").dialog("close");
    }
   
    function  changeToPicture(value,rowDate,rowIndex){
       return  "<img width=100 height=100 src='${pageContext.request.contextPath}/"+value+"'>";
    }
    
    
    function  UpdateOrderStatus(value){
       var   selectedRow =$("#dg").datagrid("getSelections");
           if(selectedRow.length==0){
                 $.messager.alert("警告","请选择你要设置的订单！");
                  return ;
           }
           var  adminSetidArray= [];
           for(var  i = 0;i<selectedRow.length;i++){
                  adminSetidArray.push(selectedRow[i].orderno);
           }
           var  adminStatusOrderNoString  =  adminSetidArray.join(",");
             $.messager.confirm("提示","你确定要改变定单的状态吗？",function(r){    
                             if (r){    
                          $.ajax({
                                  type:"PUT",
 url:"<%=request.getContextPath()%>/Admin/adminChangeStatus/"+adminStatusOrderNoString+"/"+value,
                           success: function(msg){
                                   if(msg){
                                    $.messager.alert("操作结果提示","订单状态设置成功！！");
                                    $("#dg").datagrid("reload");  
                                   }else{
                                     $.messager.alert("操作结果提示","订单状态设置失败！！");
                                   }
                                }
                              });   
                          }    
                    }); 
    }    
</script>
</head>
<body style="margin:1px">
      <table class="easyui-datagrid" fitColumns="true" title="用户订单管理" id="dg"
               pageSize=5  pageList=[5,10,15,20] 
               pagination="true"  rownumbers="true" fit="true"  toolbar="#tb"
               url="<%=request.getContextPath()%>/Admin/adminFindOrder"
                  >   
      <thead>   
        <tr>   
            <th field="cb" checkbox="true" align="center"></th>
	 		<th field="orderId" width="50" align="center">编号</th>
	 		<th field="orderno" width="100" align="center">订单号</th>
	 		<th field="idcard" width="50" align="center">订单人ID</th>
	 		<th field="username" width="100" align="center">订单用户名</th>
	 	    <th field="truename" width="100" align="center">订单用户的真实姓名</th>
	 		<th field="createtime" width="100" align="center">创建时间</th>
	 		<th field="cost" width="50" align="center">总金额</th>
	 		<th field="orderStatus" width="100" align="center" formatter="oderStatusChange" >订单状态</th>
        </tr>   
     </thead>   
</table>

<!--用户订单的详情显示 -->
<div id="userDetailedOrder" class="easyui-dialog" style="width: 750px;height:400px;padding: 10px 30px"
	  closed="true" buttons="#detailedButtons">
		<table cellspacing="8px">
			<tr>
				<td>订单号：</td>
				<td><input type="text" id="dOrderno" readonly="readonly"/></td>
				<td>&nbsp;</td>
				<td>订单人：</td>
				<td><input type="text" id="dTruename" readonly="readonly"/></td>
			</tr>
			<tr>
				<td>总金额：</td>
				<td><input type="text" id="dCost" readonly="readonly"/></td>
				<td>&nbsp;</td>
				<td>订单状态：</td>
				<td><input type="text" id="dOrderStatus" readonly="readonly"/></td>
			</tr>
		</table>
		<br/>
		<table id="detailedDialog"  class="easyui-datagrid"
		 fitColumns="true"  rownumbers="true"  fit="true" 
		 url="<%=request.getContextPath()%>/Admin/orderDetailData" >
		 <thead>
		 	<tr>
		 		<th field="cb" checkbox="true" align="center"></th>
		 		<th field="name" width="100" align="center">商品名称</th>
		 		<th field="picture" width="100" align="center" formatter="changeToPicture">商品图片</th>
		 		<th field="price" width="50" align="center">商品价格</th>
		 		<th field="productCount" width="50" align="center">商品数量</th>
		 		<th field="productSubtotal" width="50" align="center">小计/(元)</th>
		 	</tr>
		 </thead>
		</table>
	</div>
	 
    <div id="detailedButtons">
		<a href="javascript:closeOrderDetailDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>

<div id="tb">
		<div>
			<a href="javascript:openOrderDetailDialog()" class="easyui-linkbutton" iconCls="icon-detail" plain="true">查看订单详情</a>
			<a href="javascript:UpdateOrderStatus(2)" class="easyui-linkbutton" iconCls="icon-shenhe" plain="true">审核通过</a>
			<a href="javascript:UpdateOrderStatus(3)" class="easyui-linkbutton" iconCls="icon-fahuo" plain="true">卖家已发货</a>
		</div>
		<div>
			&nbsp;订单号：&nbsp;<input type="text" id="orderno" size="20" />
			&nbsp;订单人：&nbsp;<input type="text" id="truename" size="20" />
			<a href="javascript:adminSearchOrder()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索|显示全部：当表单清空时显示全部</a>
		</div>
	</div>
</body>
</html>