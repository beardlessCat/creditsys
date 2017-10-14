<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/commonJs.jsp"%> 
<body class="easyui-layout">
<script type="text/javascript">
$(function(){
	var pager = $("#role").datagrid("getPager");
	if (pager) {
		$(pager).pagination({
			onBeforeRefresh : function() {
			},
			onRefresh : function(pageNumber, pageSize) {
			},
			onChangePageSize : function(pageNumber, pageSize) {
			},
			onSelectPage : function(pageNumber, pageSize) {
				initGrid('', pageNumber, pageSize);
			}
		});
	}
	initGrid('','1','10');
	commonTree('roleTree','sysRole/initRoleTree') ;
	$('#addbtn').bind('click', function(){
		dialogForAdd('添加角色信息', 'sysRole/toAdd', '80%', '90%');
	});	
	$('#delbtn').bind('click', function(){
		delRes('roleId','role',initGrid,'sysRole/delRoles');
	});
	$('#editbtn').bind('click', function(){
		dialogForEdit('role', '修改角色信息', 'sysRole/toEdit', '80%', '60%')
	});
	$('#authbtn').bind('click', function(){
		dialogForEdit('role', '角色授权', 'sysRole/toAuth', '80%', '60%')
	});
	$('#roleTree').tree({
		onClick : function(node) {
			initGrid(node.id,'1','10');
		}
	});
})
//初始化数据格
function initGrid(roleParentId, pageNumber, pageSize) {
	if(pageNumber==null||pageNumber==""){
		pageNumber = "1" ;
	}
	if(pageSize==null||pageSize==""){
		pageSize = "10"
	}
	var jsonData = JSON.stringify({
		'roleParentId' : roleParentId,
		'pageNumber' : pageNumber,
		'pageSize' : pageSize
	});
	initDataGrid('role', 'sysRole/allRole', 'POST', 'json', jsonData);
}
function undoSelTreeNode() {
	var treeNode = $('#roleTree').tree('getSelected');
	if (treeNode) {
		$('#roleTree').tree('unselect', treeNode);
		initGrid('', '1', '10');
	}
}
function isVal(v){
	if(v=='1'){
		return  '<font color="green">有效</font>' ;
	}else{
		return '<font color="red">无效</font>' ;
	}
}
function getName(v){
	var name = '<font color="red">已经是最上级</font>' ;
	$.ajax({
		type : 'POST',
		url : 'sysRole/getById',
		dataType : 'json',
		async:false ,
		data : {
			'roleId' : v
		},
		success : function(data) {
			if(data.data){
				name = data.data.roleName;
			}
		}
	});
	return name ;
}
</script>
	<div data-options="region:'west',title:'角色',collapsible:false,split:true,tools:'#treeTools'" style="width: 150px;">
		<ul id="roleTree" class="easyui-tree" data-options="lines:true ,animate:true"></ul>
	</div>
	<div id="cc" class="easyui-layout"  style="width:100%;height:100%; " data-options="region:'center'">      
		<div data-options="region:'center'">
	    		<div id="tb" style="padding-bottom: 5px">
	    		角色名称     <input id="queryName" class="easyui-textbox"/>
		     		<a id="querybtn" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
		     		<shiro:hasPermission name="role:add">
		     			<a id="addbtn" class="easyui-linkbutton" data-options="iconCls:'icon-add'">新增</a>
		     		</shiro:hasPermission>
		     		
		     		<shiro:hasPermission name="role:update">
		     			<a id="editbtn" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a> 
		     		</shiro:hasPermission>
		     		
		     		<shiro:hasPermission name="role:delete">
		     			<a id="delbtn" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除 </a>
		     		</shiro:hasPermission>
		     		<shiro:hasPermission name="role:authrole">
		     			<a id="authbtn" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">角色授权 </a>
		     		</shiro:hasPermission>
			</div>
			<table id="role" data-options="region:'center',singleSelect:false" class="easyui-datagrid" pagination="true">
			<thead>
				<tr>   
					<th data-options="field:'roleId',halign:'center',align:'center',width:120,hidden:true">roleId</th>
					<th data-options="field:'roleName',halign:'center',align:'center',width:120">角色名称</th>
					<th data-options="field:'roleIsValid',halign:'center',align:'center',width:120,formatter:isVal">是否有效</th>
					<th data-options="field:'roleParentId',halign:'center',align:'center',width:120,formatter:getName">上级角色</th>
					<th data-options="field:'remake',halign:'center',align:'center',width:120">备注</th>
				</tr>
			</thead>
		</table>
		</div>   	
    </div>   
    <div id="treeTools">
		<a href="javascript:" onclick="undoSelTreeNode()" class="icon-undo"
			title="取消选择"></a>
	</div>
	</body>
</html>