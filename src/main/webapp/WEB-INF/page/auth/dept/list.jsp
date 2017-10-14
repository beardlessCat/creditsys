<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/commonJs.jsp"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<body class="easyui-layout">
	<div
		data-options="region:'west',title:'组织机构',collapsible:false,split:true,tools:'#treeTools'"
		style="width: 150px;">
		<ul id="deptTree" class="easyui-tree" data-options="lines:true ,animate:true""></ul>
	</div>
	<div data-options="region:'center'" style="width: 100%">
		<div data-options="region:'north'" title="用户管理" style="height: 30px">
			组织机构名称 <input id="queryName" class="easyui-textbox" /> 
				<a id="querybtn" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a> 
				<a id="clearBtn"class="easyui-linkbutton" data-options="iconCls:'icon-search'">清空</a>
				<shiro:hasPermission name="dept:add">
					<a id="addbtn" class="easyui-linkbutton"data-options="iconCls:'icon-add'">新增</a> 
				</shiro:hasPermission>
				<shiro:hasPermission name="dept:edit">
					<a id="editbtn" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a> 
				</shiro:hasPermission>
				<shiro:hasPermission name="dept:delete">
					<a id="delselbtn" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除 </a>
				</shiro:hasPermission>
		</div>
		<div data-options="region:'center'">
			<table id="dept" data-options="region:'center',rownumbers:true" pagination="true" class="easyui-datagrid">
				<thead>
					<tr>
						<th data-options="field:'deptId',halign:'center',align:'center',width:120,hidden:true">组织机构标识</th>
						<th data-options="field:'deptName',halign:'center',align:'center',width:120">组织机构名称</th>
						<th data-options="field:'deptParentId',halign:'center',align:'center',width:120,formatter:getName">上级组织机构标识</th>
						<th data-options="field:'deptLevel',halign:'center',align:'center',width:120">组织机构等级</th>
						<th data-options="field:'deptOrder',halign:'center',align:'center',width:120">组织机构排序</th>
						<th data-options="field:'deptIsValid',halign:'center',align:'center',width:120 ,formatter:isValid" >组织机构有效标识</th>
						<th data-options="field:'deptLeader',halign:'center',align:'center',width:120">组织机构负责人</th>
						<th data-options="field:'deptDesc',halign:'center',align:'center',width:120">组织机构描述</th>
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
<script type="text/javascript">
	$(function() {
		var pager = $("#dept").datagrid("getPager");
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
		commonTree('deptTree','sysDept/initDeptTree');
		initGrid('', '1', '10');
		//点击树
		$('#deptTree').tree({
			onClick : function(node) {
				initGrid(node.id,'1','10');
			}
		});
		//点击添加按钮
		$('#addbtn').bind('click', function() {
			dialogForAdd('添加组织结构', 'sysDept/toAdd', '80%', '60%');
		})
		//点击删除按钮
		$('#delselbtn').bind('click', function() {
			delRes('deptId','dept',initGrid,'sysDept/delDept');
		})
		//点击修改按钮
		$('#editbtn').bind('click', function() {
			dialogForEdit('dept', '修改组织机构', 'sysDept/toEdit', '80%', '60%') ;
		})
	});
	//初始化数据格
	function initGrid(deptParentId, pageNumber, pageSize) {
		if(pageNumber==null||pageNumber==""){
			pageNumber = "1" ;
		}
		if(pageSize==null||pageSize==""){
			pageSize = "10"
		}
		var jsonData = JSON.stringify({
			'deptParentId' : deptParentId,
			'pageNumber' : pageNumber,
			'pageSize' : pageSize
		});
		initDataGrid('dept', 'sysDept/allDept', 'POST', 'json', jsonData);
	}
	
	function undoSelTreeNode() {
		var treeNode = $('#deptTree').tree('getSelected');
		if (treeNode) {
			$('#deptTree').tree('unselect', treeNode);
			initGrid('', '1', '10');
		}
	}
	function isValid(value, rec, rowIndex){
		if(value =='1'){
			return  '有效' ;
		}else{
			return '无效' ;
		}
	}
	function getName(v){
		var name = '<font color="red">已经是最上级</font>' ;
		$.ajax({
			type : 'POST',
			url : 'sysDept/getById',
			dataType : 'json',
			async:false ,
			data : {
				'deptId' : v
			},
			success : function(data) {
				if(data.data){
					name = data.data.deptName;
				}
			}
		});
		return name ;
	}
</script>
</html>