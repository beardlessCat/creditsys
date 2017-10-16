<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/commonJs.jsp"%> 
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<head>
<script type="text/javascript">
$(function(){
	initdatagrid("","");
	initCobbobox();
	$('#querybtn').bind('click', function(){
		var companyName = $("#queryName").textbox("getValue");
		var companyType = $("#queryType").combobox("getValue");
		initdatagrid(companyName,companyType);
	})
	$('#clearBtn').bind('click', function(){
		$("#queryName").textbox("setValue",'');
		$("#queryType").combobox("setValue",'');
		initdatagrid();
	})
	$("#queryType").combobox({
		onChange: function (n,o) {
			initdatagrid("",n);
		}
	});
	//点击添加按钮
	$('#addbtn').bind('click', function(){
		$.showModalDialog({
            title: '添加公司信息',
            content:'url:company/toAdd',   
            data: {
            	grid: $('#dgzd')
            	},//扩展属性，给dilog页面传值
            useiframe:false,//默认false，扩展属性
            width:'800px',
            height:'80%',
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
	})
	$('#delbtn').bind('click', function(){
		var row = $("#dgzd").treegrid("getSelected");
		if(row==null){
			$.messager.alert('提示','请选择一行!','warning');
			return;
		}
		 $.messager.confirm('提示','您确认删除所选数据,如果删除将删除其下属部门',function(r){
				if(r){
					$.ajax({
						//提交数据的类型 POST GET
						type : "POST",
						//提交的网址
						url : "company/delete",
						//提交的数据
						data :{companyId:row.companyId},
						//成功返回之后调用的函数             
						success : function(data) {
							if(data.meta.success){
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
	})
	$('#editbtn').bind('click', function(){
		var row = $("#dgzd").treegrid("getSelected");
		if(row==null){
			$.messager.alert('提示','请选择一行!','warning');
			return;
		}
		 $.showModalDialog({
	            title: '修改用户信息',
	            content:'url:company/toEdit',
	            data: {
	            	grid: $('#dgzd'), 
	            	selected: row,
	            	},//扩展属性，给dilog页面传值
	            useiframe:false,//默认false，扩展属性
	            width:'800pxx',
	            height:'80%',
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
	})
});
//初始化数据格
function initdatagrid(companyName,companyTypeId){
	$.ajax({
		url:'company/selectByCon',
		type:'POST',
		dataType:'json',
		data:{
			"data":JSON.stringify({
					companyName:companyName,
					companyTypeId:companyTypeId
			})
		},
		success:function(data){
			$("#dgzd").datagrid("loadData",data);
		}
	});
}
function  foeDel(value, rec, rowIndex){
	value ='<a href="javascript:void(0);" onclick="edit('+'\''+rowIndex+'\''+')">编辑</a>' +"|"+
		   '<a href="javascript:void(0);" onclick="del('+'\''+rowIndex+'\''+')">删除</a>'  +"|"+
		   '<a href="javascript:void(0);" onclick="show('+'\''+rowIndex+'\''+')">查看详细信息</a>'
	return value ;		
}
function show(rowIndex){
	var selected = $("#dgzd").datagrid("getRows")[rowIndex];
	 $.showModalDialog({
         title: '企业详细',
         content:'url:company/showCompanyInfo',
         data: {
         	grid: $('#dgzd'), 
         	selected: selected,
         	},//扩展属性，给dilog页面传值
         useiframe:false,//默认false，扩展属性
         width:'830px',
         height:'60%',
         onLoad: function(dialog, cotent){//参数扩展，dialog表示弹出页面，cotent表示弹出页面的body
             if(cotent && cotent.doInit){//判断弹出页面是否加载完，是否有这个方法
                 cotent.doInit(dialog);//调用dialog页面的方法
             }
         }
     });
}
function del(rowIndex){
	var nodes =$('#dgzd').datagrid('getRows')[rowIndex];
    $.messager.confirm('提示','您确认删除所选数据,如果删除将删除其下属部门',function(r){
		if(r){
			$.ajax({
				//提交数据的类型 POST GET
				type : "POST",
				//提交的网址
				url : "company/delete",
				//提交的数据
				data :{companyId:nodes.companyId},
				//成功返回之后调用的函数             
				success : function(data) {
					if(data.meta.success){
						initdatagrid();
						initTree();
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
function edit(rowIndex){
	var selected = $("#dgzd").datagrid("getRows")[rowIndex];
	 $.showModalDialog({
            title: '修改公司信息',
            content:'url:company/toEdit',
            data: {
            	grid: $('#dgzd'), 
            	selected: selected,
            	},//扩展属性，给dilog页面传值
            useiframe:false,//默认false，扩展属性
            width:'800pxx',
            height:'80%',
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

function undoSelTreeNode() {
	var treeNode = $('#deptTree').tree('getSelected');
	if (treeNode) {
		$('#deptTree').tree('unselect', treeNode);
		initdatagrid();
		}
}
function initCobbobox(){
		$('#queryType').combobox({    
		    url:'companyType/initType',    
		    valueField:'id',    
		    textField:'text'   
		});  
	}
</script>
</head>
<body class="easyui-layout">   
		<div data-options="region:'center'">
	    		<div id="tb" style="padding-bottom: 5px">
	    		公司类型     <input id="queryType" class="easyui-combobox"/>
				公司名称     <input id="queryName" class="easyui-textbox"/>
		     	<a id="querybtn" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
		     	<a id="clearBtn" class="easyui-linkbutton" data-options="iconCls:'icon-search'">清空</a> 
				<a id="addbtn" class="easyui-linkbutton" data-options="iconCls:'icon-add'">新增</a>
				<a id="delbtn" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
				<a id="editbtn" class="easyui-linkbutton" data-options="iconCls:'icon-add'">修改</a>
			</div>
			<table id="dgzd" data-options="region:'center',rownumbers:true,singleSelect:true" class="easyui-datagrid">
			<thead>
				<tr>  
					<th data-options="field:'companyId',halign:'center',align:'center',width:120,hidden:true">id</th>
					<th data-options="field:'companyName',halign:'center',align:'center',width:120">公司名称</th>
					<th data-options="field:'companyTypeId',halign:'center',align:'center',width:120,hidden:true">公司类型id</th>
					<th data-options="field:'typeName',halign:'center',align:'center',width:120">公司类型</th>
					<th data-options="field:'companyInfo',halign:'center',align:'center',width:120">公司信息</th>
					<th data-options="field:'companyAddress',halign:'center',align:'center',width:120">公司地址</th>	
					<th data-options="field:'companyTel',halign:'center',align:'center',width:120">公司电话</th>
					<th data-options="field:'companyUrl',halign:'center',align:'center',width:120">公司网址</th>
					<th data-options="field:'companySize',halign:'center',align:'center',width:120">公司规模</th>
					<th data-options="field:'companyBusiness',halign:'center',align:'center',width:120">公司业务</th>
					<th data-options="field:'companyAptitude',halign:'center',align:'center',width:120">公司资质</th>
					<!-- <th data-options="field:'caozuo',halign:'center',align:'center',width:200,formatter:foeDel">操作</th> -->
				</tr>
			</thead>      
		</table>
		</div>   	
    </div>   
     <div id="treeTools">
			<a href="javascript:" onclick="undoSelTreeNode()"  class="icon-undo" title="取消选择"></a>
	 </div>
	</body>
</html>