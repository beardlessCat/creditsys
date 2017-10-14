<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/commonJs.jsp"%> 
<body class="easyui-layout">
<script type="text/javascript">
function url(value, rec, rowIndex) {
	value = '<a href="javascript:void(0);" onclick="showRes('+'\''+rowIndex+'\''+')">查看已分配的资源</a>' ;
	return  value ;
}
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
	initGrid('','1','10') ;
	hide();
	$('#saveBtn').bind('click',function(){
		var node = $('#user').datagrid('getSelected');
		var rows = $('#rightRole').datagrid('getRows');
		var ID=""; 		
        for (i = 0; i < rows.length;i++) {  
            if (ID =="") {  
                ID = rows[i].roleId;  
            } else {  
                ID = rows[i].roleId + "," + ID;  
            }                 
        } 
    	var jsonData = JSON.stringify({
    		'roleIds' : ID,
    		'urUserId' : node.userId,
    	});
    	doActionForm('sysUserRole/saveUserRole',jsonData) ;
	});
});
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
function hide()
{
	$("#left").hide();
    $("#right").hide(); 
}
function  addRole(value,row,index) {
	value = '<a href="javascript:void(0);" onclick="addRow('+'\''+index+'\''+')">添加</a>' ;
	return  value ;
}
function   removeRole(value, row, rowIndex) {
	value = '<a href="javascript:void(0);" onclick="removeRow('+'\''+row.roleId+'\''+')">移除</a>'  ;
return  value ;
} 
function addRow(index){
	   var leftDg = $('#leftRole');
	   var rightDg = $('#rightRole');
	   leftDg.datagrid('selectRow',index);
	   var row = leftDg.datagrid('getSelected');
	   var rindex = rightDg.datagrid('getRowIndex',row);
	   var allData = rightDg.datagrid('getRows') ;
	   console.log('allData'+allData)
	   for(var i = 0;i<allData.length;i++){
		   var roleId = allData[i].roleId ;
		   if(row.roleId == roleId) {
			   $.messager.alert('提示', '已在选择列表','info', function(){
			      });
			   return ;
		   }   
	   }
	   rightDg.datagrid('appendRow',row);
}
function removeRow(data){
	 var rightDg = $('#rightRole');
	 var rows = rightDg.datagrid('getRows');
	 for(var i=0; i<rows.length; i++){
			if(data == rows[i]["roleId"]){
				rightDg.datagrid('deleteRow',i);
				break;
			}
		} 
}
function clickRow(index, row){
	console.log(row) ;
	var userId = row.userId ;
	//初始化左边数据格
	var jsonData = JSON.stringify({
		'roleParentId' : '',
		'pageNumber' : '1',
		'pageSize' : '10'
	});
	initDataGrid('leftRole', 'sysRole/allRole', 'POST', 'json', jsonData);
	//初始化右边数据格
	initRightGrid(userId);
	show() ;
};
function initRightGrid(userId) {
	$.ajax({
	url:'sysUserRole/getRoleByUser',
	type:'POST',
	dataType:'json',
	data:{
		userId:userId
	},
	success:function(data){
		$("#rightRole").datagrid("loadData",data);
	}
});	 
}
function show(){
	$("#right").show(); 
    $("#left").show();
    $('#right').panel({
		title:"已选人员"
    });
    $('#left').panel({
		title:"备选人员"
		});
};
</script>  
      <div id="cc" class="easyui-layout" style="width:100%;height:100%;">   
    	<div data-options="region:'north'" style="height:30%">
	    		<div id="tb" style="padding-bottom: 5px">
	    			用户名称     <input id="queryName" class="easyui-textbox"/>
		     		<a id="querybtn" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
		     		<a id="saveBtn" class="easyui-linkbutton" data-options="iconCls:'icon-save'">分配角色</a>
				</div>
			<table id="user" data-options="region:'center',singleSelect:true,onClickRow:clickRow"  pagination="true" class="easyui-datagrid">
				<thead>
				<tr>   
					<th data-options="field:'userId',halign:'center',align:'center',width:120,hidden:true" >用户标识</th>
					<th data-options="field:'userDeptId',halign:'center',align:'center',width:120,hidden:true">部门标识</th>
					<th data-options="field:'userPwd',halign:'center',align:'center',width:150,hidden:true">登录密码</th>	
					<th data-options="field:'userNo',halign:'center',align:'center',width:80">用户编号</th>
					<th data-options="field:'userName',halign:'center',align:'center',width:80">用户姓名</th>
					<th data-options="field:'cardId',halign:'center',align:'center',width:180">身份证号码</th>
					<th data-options="field:'userAddr',halign:'center',align:'center',width:100">家庭住址</th>	
					<th data-options="field:'userContact',halign:'center',align:'center',width:80">联系方式</th>
					<th data-options="field:'enterDate',halign:'center',align:'center',width:80">入校时间</th>
					<th data-options="field:'leaveDate',halign:'center',align:'center',width:80">离校时间</th>
					<th data-options="field:'userProfess',halign:'center',align:'center',width:120">用户职称</th>
					<th data-options="field:'userStatus',halign:'center',align:'center',width:80">用户状态</th>
					<th data-options="field:'userEmail',halign:'center',align:'center',width:150">用户邮箱</th>
					<th data-options="field:'lastLogin',halign:'center',align:'center',width:150">上次登录时间</th>
					<th data-options="field:'schoolYear',halign:'center',align:'center',width:80">学年制</th>
					<th data-options="field:'remark',halign:'center',align:'center',width:150">备注</th>	
				</tr>
				</thead>
		</table>
    </div>   
    <div id="right" data-options="region:'east',iconCls:'icon-reload',split:true,rownumbers:true"style="width:50%;">
    	<table id="rightRole" data-options="singleSelect:true" class="easyui-datagrid" >
			<thead>
				<tr>   
					<th data-options="field:'roleId',halign:'center',align:'center',width:120,hidden:true">roleId</th>
					<th data-options="field:'roleName',halign:'center',align:'center',width:120">角色名称</th>
					<th data-options="field:'roleIsValid',halign:'center',align:'center',width:120">是否有效</th>
					<th data-options="field:'roleParentId',halign:'center',align:'center',width:120">上级角色</th>
					<th data-options="field:'remake',halign:'center',align:'center',width:120">备注</th>
					<th data-options="field:'manage',halign:'center',align:'center',width:100,formatter:removeRole">操作</th>
				</tr>
			</thead>
				</table>
    </div>   
    <div  id="left" data-options="region:'center'" style="width:50%">
    	<table id="leftRole" data-options="singleSelect:true,rownumbers:true"  class="easyui-datagrid"  pagination="true" >
			<thead>
				<tr>   
					<th data-options="field:'roleId',halign:'center',align:'center',width:120,hidden:true">roleId</th>
					<th data-options="field:'roleName',halign:'center',align:'center',width:120">角色名称</th>
					<th data-options="field:'roleIsValid',halign:'center',align:'center',width:120">是否有效</th>
					<th data-options="field:'roleParentId',halign:'center',align:'center',width:120">上级角色</th>
					<th data-options="field:'remake',halign:'center',align:'center',width:120">备注</th>
					<th data-options="field:'manage',halign:'center',align:'center',width:100,formatter:addRole">操作</th>
				</tr>
			</thead>
		</table>
    </div>   
	</div>  
	</body> 
	</body>
</html>