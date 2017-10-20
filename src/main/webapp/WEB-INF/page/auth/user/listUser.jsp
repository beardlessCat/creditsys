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
 	initGrid('','1','10') ;
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
function userManage(value, row, rowIndex){
	value = '<a href="javascript:void(0);" onclick="allotRes('+'\''+rowIndex+'\''+')">分配资源</a>' +"|"+
			'<a href="javascript:void(0);" onclick="manageRes('+'\''+rowIndex+'\''+')">权限控制</a>'
return  value ;
}
function allotRes(rowIndex){
	var row = $('#user').datagrid('getData').rows[rowIndex]; 
	 $.showModalDialog({
         title: '分配资源',
         content:'url:sysRes/toAllotRes',
         data: {
         	row: row,
         	},//扩展属性，给dilog页面传值
         useiframe:false,//默认false，扩展属性
         width:'90%',
         height:'75%',
         toolbar:[{
             text:'保存',
             iconCls:'icon-save',
             handler: 'doSave'
         },'-',{
             text: '关闭',
             iconCls: 'icon-cancel',
             handler: function(dialog){
                 dialog.close();
             }
         }],
         onLoad: function(dialog, cotent){//参数扩展，dialog表示弹出页面，cotent表示弹出页面的body
             if(cotent && cotent.doInit){//判断弹出页面是否加载完，是否有这个方法
                 cotent.doInit(dialog);//调用dialog页面的方法
             }
         }
     });
}
function initTreeGrid(roleId,userNo){
	$("#restree").treegrid({
        url: 'sysUserRes/getResByUser',
        idField: 'RES_ID',
        treeField: 'RES_NAME',
        lines:true,
    	checkOnSelect:true,
		striped: true,
		border:false,
		queryParams:{
			'userNo':userNo
        },  
        columns:[[    
          	        {field:'RES_NAME',width:'100%',align:'left',halign:'center'}  
          	    ]]      ,
        customAttr: {
            parentField: 'RES_PARENT_ID'
        }
    }).treegrid('followCustomHandle');
	
}
function clickRow(index,row){	
	initTreeGrid(row.roleId,row.userNo) ;
	var title = "【"+row.userName+"】已经分配的资源" ;
	 $('#allotesRes').panel({
			title:title
	}); 
}

</script>
	<div id="allotesRes" data-options="region:'east',collapsible:false,split:true,tools:'#treeTools'" style="width:250px;">
			<ul id="restree"  class="easyui-tree"></ul>
		</div>   
		<div data-options="region:'center'" style="width:100%">
			<table id="user" data-options="region:'center',singleSelect:true,rownumbers:true,onClickRow:clickRow,fit: true," class="easyui-datagrid" pagination="true">
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
					<th data-options="field:'userStatus',halign:'center',align:'center',width:80">用户状态</th>
					<th data-options="field:'userEmail',halign:'center',align:'center',width:150">用户邮箱</th>
					<th data-options="field:'lastLogin',halign:'center',align:'center',width:150">上次登录时间</th>
					<th data-options="field:'remark',halign:'center',align:'center',width:150">备注</th>	
					<th data-options="field:'manage',halign:'center',align:'center',width:200,formatter:userManage">操作</th>
				</tr>
			</thead>
		</table>
		</div>   	
	</body>
</html>