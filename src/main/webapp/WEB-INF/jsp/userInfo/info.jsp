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
	//点击组织机构树
	$('#deptTree').tree({
		 onClick: function(node){
			initdatagrid(node.id);
		} 	
	});
	initdatagrid();
	initCombotree();
	initComBoBox();
	initTree();
	$('#querybtn').bind('click', function(){
		var deptId = $('#dept').combotree('getValue');
		var roleId = $('#role').combobox('getValue');
		console.log("deptId"+deptId);
		console.log("roleId"+roleId);
		initdatagrid(deptId, roleId)
	})
	$('#addbtn').bind('click', function(){
		$.showModalDialog({
            title: '添加用户',
            content:'url:user/toNewJsp', 
            data: {
            	grid: $('#dgzd')
            	},//扩展属性，给dilog页面传值
            useiframe:false,//默认false，扩展属性
            width:'800px',
            height:'60%',
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
	});		
	})
function initComBoBox(){
	$('#role').combobox({    
		    url:'role/initRole',    
		    valueField:'id',    
		    textField:'text'   
		});  
}
function initdatagrid(deptId,roleId){
	$.ajax({
		url:'user/allUser',
		type:'post',
		dataType:'json',
		data:{
			"data":JSON.stringify({
				userPost:deptId,
				roleId:roleId})
		},
		success:function(data){
			$("#dgzd").datagrid("loadData",data);
		}
	});
};
function sex(value, rec, rowIndex){
	if(value =="1"){
		return "女";
	}else{
		return "男";
	}
	
}
function userManage(value, rec, rowIndex){
	value = '<a href="javascript:void(0);" onclick="edit('+'\''+rowIndex+'\''+')">编辑</a>' +"|"+
			'<a href="javascript:void(0);" onclick="del('+'\''+rowIndex+'\''+')">删除</a>'  +"|"+
			'<a href="javascript:void(0);" onclick="passwd('+'\''+rowIndex+'\''+')">初始密码</a>'  +"|"+
			'<a href="javascript:void(0);" onclick="lock('+'\''+rowIndex+'\''+')">锁定</a>';
return  value ;
}
function initTree(){
	$('#deptTree').tree({
		checkbox: false,
 		customAttr:{
			dataModel: 'simpleData',
			idField: 'id',
            textField: 'deptName',
            parentField: 'pid'
		}
	}).tree('followCustomHandle');
	$.ajax({
		type : 'GET',
        url: 'dept/deptTree',
        dataType:'json',
        success: function(data){
            	$('#deptTree').tree('loadData',eval(data.data));
        },
        error: function(){
            $.messager.alert('提示','初始化失败!','warning');
        }
	});
}
function initCombotree(){
		$('#dept').combotree({
			editable:false,
			required:true,
			cascadeCheck:false,//取消树级联
			customAttr:{
				dataModel: 'simpleData',
				idField: 'id',
	            textField: 'deptName',
	            parentField: 'pid'
			}
		}).combotree('followCustomHandle');
		$.ajax({
			type : 'GET',
	        url: 'dept/deptTree',
	        data:{},
	        dataType:'json',
	        success: function(data){
	            if(data){
	            	$('#dept').combotree('loadData',data.data);
	            }
	        },
	        error: function(){
	            $.messager.alert('提示','组织机构初始化失败!','warning');
	        }
		});
	}
function del(rowIndex){
	var row = $('#dgzd').datagrid('getRows')[rowIndex];
    $.messager.confirm('提示','您确认删除所选数据?',function(r){
		if(r){
			$.ajax({
				//提交数据的类型 POST GET
				type : "POST",
				//提交的网址
				url : "user/delete",
				//提交的数据
				data :{id:row.id},
				//成功返回之后调用的函数             
				success : function(data) {
					if(data="true"){
						initdatagrid();
                    }else{
                        $.messager.alert('error', data.meta.message, 'error');
                    }
				},
				//调用出错执行的函数
				error : function() {
					//请求出错处理
					$.messager.alert('删除失败', data.meta.message);
				}
			});
		}
	});
}
function undoSelTreeNode() {
	var treeNode = $('#deptTree').tree('getSelected');
	if (treeNode) {
		$('#deptTree').tree('unselect', treeNode);
		initdatagrid();
		}
}
function edit(rowIndex){
	var row = $('#dgzd').datagrid('getData').rows[rowIndex];
	 $.showModalDialog({
         title: '修改用户信息',
         content:'url:user/toEditJsp',
         data: {
         	grid: $('#dgzd'), 
         	selected: row
         	},//扩展属性，给dilog页面传值
         useiframe:false,//默认false，扩展属性
         width:'365x',
         height:'60%',
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
</script>
		<!-- <div data-options="region:'west',title:'组织机构',collapsible:false,split:true,tools:'#treeTools'" style="width:150px;">
			<ul id="deptTree"  class="easyui-tree"></ul>	
		</div>  -->  
		<div data-options="region:'center'" style="width:100%">
	    		<div id="tb" style="padding-bottom: 5px">
	    		上级组织机构：<input id="dept" class="easyui-combotree" data-options="required:true" style="width:200px">
	    		角色：<input id="role" class="easyui-combobox" data-options="required:true">
		     	<a id="querybtn" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
				<a id="addbtn" class="easyui-linkbutton" data-options="iconCls:'icon-add'">新增</a>
			</div>
			<table id="dgzd" data-options="region:'center',singleSelect:true" class="easyui-datagrid">
			<thead>
				<tr>   
					<th data-options="field:'id',halign:'center',align:'center',width:120,hidden:true">字段名称</th>
					<th data-options="field:'userLoginName',halign:'center',align:'center',width:120">登录名称</th>
					<th data-options="field:'userPassword',halign:'center',align:'center',width:150,hidden:true">登录密码</th>	
					<th data-options="field:'userRealName',halign:'center',align:'center',width:80">真实姓名</th>
					<th data-options="field:'userSex',halign:'center',align:'center',width:120,formatter:sex">用户性别</th>
					<th data-options="field:'userDuty',halign:'center',align:'center',width:120">用户职位</th>
					<th data-options="field:'deptName',halign:'center',align:'center',width:150">用户部门</th>	
					<th data-options="field:'userIp',halign:'center',align:'center',width:80,hidden:true">用户IP</th>
					<th data-options="field:'userTel',halign:'center',align:'center',width:80">用户手机</th>
					<th data-options="field:'userPhone',halign:'center',align:'center',width:120,hidden:true">用户电话</th>
					<th data-options="field:'userStatus',halign:'center',align:'center',width:120">用户状态</th>
					<th data-options="field:'userStatus',halign:'center',align:'center',width:120">用户角色</th>
					<th data-options="field:'userDesc',halign:'center',align:'center',width:150,hidden:true">用户排序</th>	
					<th data-options="field:'userIndex',halign:'center',align:'center',width:80,hidden:true">用户位置</th>
					<th data-options="field:'manage',halign:'center',align:'center',width:200,formatter:userManage">操作</th>
				</tr>
			</thead>
		</table>
		</div>   	
		 <div id="treeTools">
			<a href="javascript:" onclick="undoSelTreeNode()"  class="icon-undo" title="取消选择"></a>
		</div>
	</body>
</html>