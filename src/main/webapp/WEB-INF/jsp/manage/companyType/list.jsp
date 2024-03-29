<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/commonJs.jsp"%> 
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<head>
<script type="text/javascript">
$(function(){
	var pager = $("#dgzd").datagrid("getPager");
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
	$('#clearBtn').bind('click', function(){
		$("#queryName").textbox("setValue",'');
		initdatagrid();
	}) ;
	$('#querybtn').bind('click', function(){
		var typeName = $("#queryName").textbox("getValue");
		initdatagrid(typeName);
	})
	//点击添加按钮
	$('#addbtn').bind('click', function(){
		$.showModalDialog({
            title: '添加公司类型',
            content:'url:companyType/toAdd',   
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
	$('#editbtn').bind('click', function(){
		var row = $("#dgzd").treegrid("getSelected");
		if(row==null){
			$.messager.alert('提示','请选择一行!','warning');
			return;
		}
		$.showModalDialog({
            title: '修改类型信息',
            content:'url:companyType/toEdit',
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
	$('#delbtn').bind('click', function(){
		var row = $("#dgzd").treegrid("getSelected");
		if(row==null){
			$.messager.alert('提示','请选择一行!','warning');
			return;
		}
		 $.messager.confirm('提示','您确认删除所选数据?',function(r){
				if(r){
					$.ajax({
						//提交数据的类型 POST GET
						type : "POST",
						//提交的网址
						url : "companyType/delete",
						//提交的数据
						data :{typeId:row.typeId},
						//成功返回之后调用的函数             
						success : function(data) {
							if(data.meta.success){
								initGrid('','1','10') ;
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
		
});
function initGrid(typeName, pageNumber, pageSize) {
	if(pageNumber==null||pageNumber==""){
		pageNumber = "1" ;
	}
	if(pageSize==null||pageSize==""){
		pageSize = "10" ;
	}
	var jsonData = JSON.stringify({
		'typeName':typeName ,
		'pageNumber' : pageNumber,
		'pageSize' : pageSize
	});
	initDataGrid('dgzd', 'companyType/allByCon', 'POST', 'json', jsonData);
}
//初始化数据格

function  foeDel(value, rec, rowIndex){
	value ='<a href="javascript:void(0);" onclick="edit('+'\''+rowIndex+'\''+')">编辑</a>' +"|"+
		   '<a href="javascript:void(0);" onclick="del('+'\''+rowIndex+'\''+')">删除</a>'  ;
	return value ;		
}
function show(rowIndex){
	var selected = $("#dgzd").datagrid("getRows")[rowIndex];
	 $.showModalDialog({
         title: '类型详细',
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
    $.messager.confirm('提示','您确认删除所选数据?',function(r){
		if(r){
			$.ajax({
				//提交数据的类型 POST GET
				type : "POST",
				//提交的网址
				url : "companyType/delete",
				//提交的数据
				data :{typeId:nodes.typeId},
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
}
function edit(rowIndex){
	var selected = $("#dgzd").datagrid("getRows")[rowIndex];
	 $.showModalDialog({
            title: '修改类型信息',
            content:'url:companyType/toEdit',
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
            onLoad: function(dcialog, cotent){//参数扩展，dialog表示弹出页面，cotent表示弹出页面的body
                if(cotent && cotent.doInit){//判断弹出页面是否加载完，是否有这个方法
                    cotent.doInit(dialog);//调用dialog页面的方法
                }
            }
        });
}
</script>
</head>
<body class="easyui-layout">   
		<div data-options="region:'center'">
	    		<div id="tb" style="padding-bottom: 5px">
				 公司类型     <input id="queryName" class="easyui-textbox"/>
		     	<a id="querybtn" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
		     	<a id="clearBtn" class="easyui-linkbutton" data-options="iconCls:'icon-search'">清空</a> 
				<a id="addbtn" class="easyui-linkbutton" data-options="iconCls:'icon-add'">新增</a>
				<a id="delbtn" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
				<a id="editbtn" class="easyui-linkbutton" data-options="iconCls:'icon-add'">修改</a>
			</div>
			<table id="dgzd" data-options="region:'center',rownumbers:true,singleSelect:true" class="easyui-datagrid"  pagination="true">
			<thead>
				<tr>  
					<th data-options="field:'typeId',halign:'center',align:'center',width:120,hidden:true">id</th>
					<th data-options="field:'typeName',halign:'center',align:'center',width:120">公司类型</th>
					<th data-options="field:'typeRemake',halign:'center',align:'center',width:120">备注</th>
<!-- 					<th data-options="field:'caozuo',halign:'center',align:'center',width:200,formatter:foeDel">操作</th>
 -->				</tr>
			</thead>      
		</table>
		</div>   	
    </div>   
     <div id="treeTools">
			<a href="javascript:" onclick="undoSelTreeNode()"  class="icon-undo" title="取消选择"></a>
	 </div>
	</body>
</html>