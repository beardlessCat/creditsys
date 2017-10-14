<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/commonJs.jsp"%> 
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<head>
</head>
<body class="easyui-layout">
<script type="text/javascript">
$(function(){
	initTreeData();
	$('#addbtn').bind('click',function(){
 		dialogForAdd('添加权限资源信息', 'sysRes/toAdd', '80%', '60%');
	});
	$('#editbtn').bind('click',function(){
		dialogForEdit('restree','修改资源权限信息', 'sysRes/toEdit', '80%', '60%' ) ;
	});
	
	$('#delbtn').bind('click',function(){
		delRes('resId','restree',initTreeData,'sysRes/delRes');
	});
});
function initTreeData(){
	$("#restree").treegrid({
            url: 'sysRes/getTreeData',
            idField: 'resId',
            treeField: 'resName', 
            lines:true,
        	checkOnSelect:true,
			striped: true,
			border:false,
			rownumbers:true, 
            columns:[[    
              	        {title:'权限标识',field:'resId',width:'11%',align:'left',halign:'center',hidden:true},    
              	        {field:'resName',title:'权限名称',width:'11%',align:'left',halign:'center'},    
              	        {field:'resUrl',title:'权限访问路径',width:'11%',align:'left',halign:'center'},    
              	     	{field:'resCode',title:'权限代码',width:'11%',align:'left',halign:'center'},    
              	    	{field:'resParentId',title:'上级权限标识',width:'11%',align:'left',halign:'center'},    
              	  		{field:'resType',title:'权限类型',width:'11%',align:'left',halign:'center'},    
              	 		{field:'resOrder',title:'权限序号',width:'11%',align:'left',halign:'center'},    
              			{field:'resDesc',title:'权限描述',width:'20%',align:'left',halign:'center'}
              	    ]],
            customAttr: {
                dataModel:'simpleData',
                parentField: 'resParentId'
            }
        }).treegrid('followCustomHandle');
}
</script>
	<div id="cc" class="easyui-layout"  style="width:100%;height:100%; ">   
		<div data-options="region:'center'">
	    		<div id="tb" style="padding-bottom: 5px">
	    		<input id="queryName" class="easyui-textbox"/>
		     	<a id="querybtn" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
		     	<shiro:hasPermission name="res:add">
		     		<a id="addbtn" class="easyui-linkbutton" data-options="iconCls:'icon-add'">新增</a>
		     	</shiro:hasPermission>
		     	<shiro:hasPermission name="res:edit">
		     		<a id="editbtn" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a> 
		     	</shiro:hasPermission>
		     	<shiro:hasPermission name="res:delete">
		     		<a id="delbtn" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除 </a>
		     	</shiro:hasPermission>
				
		</div>
		<table id="restree" calss="easyui-datagrid" style="height: 91%"></table>
		</div>   	
    </div>   
	</body>
</html>