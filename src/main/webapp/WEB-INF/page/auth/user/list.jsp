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
	var pager = $("#user").datagrid("getPager");
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
 	commonTree('deptTree', 'sysDept/initDeptTree')
 	initGrid('','1','10') ;
 	//点击修改
	$('#editbtn').bind('click', function(){
		dialogForEdit('user', '修改用户信息', 'sysUser/toEdit', '80%', '70%')
	});	
	$('#addbtn').bind('click', function(){
		dialogForAdd('添加用户信息', 'sysUser/toAdd', '80%', '70%');
		});	
	$('#delbtn').bind('click', function(){
		delRes('userId','user',initGrid,'sysUser/delUsers');
	});	
	$('#deptTree').tree({
		onClick : function(node) {
			initGrid(node.id,'1','10');
		}
	});
})

function initGrid(userDeptId, pageNumber, pageSize) {
		if(pageNumber==null||pageNumber==""){
			pageNumber = "1" ;
		}
		if(pageSize==null||pageSize==""){
			pageSize = "10"
		}
		var jsonData = JSON.stringify({
			'userDeptId' : userDeptId,
			'pageNumber' : pageNumber,
			'pageSize' : pageSize
		});
		initDataGrid('user', 'sysUser/allUser', 'POST', 'json', jsonData);
	}
function undoSelTreeNode() {
	var treeNode = $('#deptTree').tree('getSelected');
	if (treeNode) {
		$('#deptTree').tree('unselect', treeNode);
		initGrid('','1','10') ;
	}
}
function userStatus(v){
	if(v=='1'){
		return  '<font color="green">正常</font>' ;
	}else{
		return '<font color="green">锁定</font>' ;
	}
}
function forPro(v){
	if(v==""){
		return '无' ;
	}else{
		return v ;
	}
}
</script>
		<div data-options="region:'west',title:'组织机构',collapsible:false,split:true,tools:'#treeTools'" style="width:150px;">
			<ul id="deptTree"  class="easyui-tree"></ul>	
		</div>   
		<div data-options="region:'center'" style="width:100%">
	    		<div id="tb" style="padding-bottom: 5px">
	    		用户名称     <input id="queryName" class="easyui-textbox"/>
		     	<a id="querybtn" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
		     	<shiro:hasPermission name="user:add">
		     		<a id="addbtn" class="easyui-linkbutton" data-options="iconCls:'icon-add'">新增</a>
		     	</shiro:hasPermission>
				<shiro:hasPermission name="user:update">
					<a id="editbtn" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改 </a>	
				</shiro:hasPermission>
				<shiro:hasPermission name="user:delete">
					<a id="delbtn" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除 </a>
				</shiro:hasPermission>
			</div>
			<table id="user" data-options="region:'center',singleSelect:false,rownumbers:true" class="easyui-datagrid" pagination="true">
			<thead>
				<tr>   
					<th data-options="field:'userId',halign:'center',align:'center',width:120,hidden:true">用户标识</th>
					<th data-options="field:'userDeptId',halign:'center',align:'center',width:120,hidden:true">部门标识</th>
					<th data-options="field:'userPwd',halign:'center',align:'center',width:150,hidden:true">登录密码</th>	
					<th data-options="field:'userNo',halign:'center',align:'center',width:80">用户编号</th>
					<th data-options="field:'userName',halign:'center',align:'center',width:80">用户姓名</th>
					<th data-options="field:'cardId',halign:'center',align:'center',width:180">身份证号码</th>
					<th data-options="field:'userAddr',halign:'center',align:'center',width:100">家庭住址</th>	
					<th data-options="field:'userContact',halign:'center',align:'center',width:80">联系方式</th>
					<th data-options="field:'enterDate',halign:'center',align:'center',width:80">入校时间</th>
					<th data-options="field:'leaveDate',halign:'center',align:'center',width:80">离校时间</th>
					<th data-options="field:'userProfess',halign:'center',align:'center',width:120,formatter:forPro">用户职称</th>
					<th data-options="field:'userStatus',halign:'center',align:'center',width:80,formatter:userStatus">用户状态</th>
					<th data-options="field:'userEmail',halign:'center',align:'center',width:150">用户邮箱</th>
					<th data-options="field:'lastLogin',halign:'center',align:'center',width:150">上次登录时间</th>
					<th data-options="field:'schoolYear',halign:'center',align:'center',width:80">学年制</th>
					<th data-options="field:'remark',halign:'center',align:'center',width:150">备注</th>	
				</tr>
			</thead>
		</table>
		</div>   	
		 <div id="treeTools">
			<a href="javascript:" onclick="undoSelTreeNode()"  class="icon-undo" title="取消选择"></a>
		</div>
	</body>
</html>