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
	} ;
	initGrid('','1','10') ;
	$('#querybtn').bind('click', function(){
		var companyName = $("#queryName").textbox("getValue");
		initdatagrid(companyName);
	})
	$('#clearBtn').bind('click', function(){
		$("#queryName").textbox("setValue",'');
		initdatagrid();
	})
	//点击添加按钮
	$('#addbtn').bind('click', function(){
		$.showModalDialog({
            title: '添加课程类型',
            content:'url:courseType/toAdd',   
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
            onLoad: function(dialog, cotent){
                if(cotent && cotent.doInit){//判断弹出页面是否加载完，是否有这个方法
                    cotent.doInit(dialog);//调用dialog页面的方法
                }
            }
        }); 
	})
	$('#delbtn').bind('click', function(){
		var row = $("#dgzd").treegrid("getSelected");
		 $.messager.confirm('提示','您确认删除所选数据',function(r){
				if(r){
					$.ajax({
						//提交数据的类型 POST GET
						type : "POST",
						//提交的网址
						url : "courseType/delete",
						//提交的数据
						data :{ctypeId:row.ctypeId},
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
	$('#editbtn').bind('click', function(){
		var row = $("#dgzd").treegrid("getSelected");
		 $.showModalDialog({
	            title: '修改用户信息',
	            content:'url:courseType/toEdit',
	            data: {
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
function initGrid(courseType, pageNumber, pageSize) {
	if(pageNumber==null||pageNumber==""){
		pageNumber = "1" ;
	}
	if(pageSize==null||pageSize==""){
		pageSize = "10" ;
	}
	var jsonData = JSON.stringify({
		'pageNumber' : pageNumber,
		'pageSize' : pageSize
	});
	initDataGrid('dgzd', 'courseType/allType', 'POST', 'json', jsonData);
}

function  foeDel(value, rec, rowIndex){
	value ='<a href="javascript:void(0);" onclick="edit('+'\''+rowIndex+'\''+')">编辑</a>' +"|"+
		   '<a href="javascript:void(0);" onclick="del('+'\''+rowIndex+'\''+')">删除</a>'  +"|"+
		   '<a href="javascript:void(0);" onclick="show('+'\''+rowIndex+'\''+')">查看详细信息</a>'
	return value ;		
}
</script>
</head>
<body class="easyui-layout">   
		<div data-options="region:'center'">
	    		<div id="tb" style="padding-bottom: 5px">
				专业名称     <input id="queryName" class="easyui-combobox"/>
		     	<a id="querybtn" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
		     	<a id="clearBtn" class="easyui-linkbutton" data-options="iconCls:'icon-search'">清空</a>
				<a id="addbtn" class="easyui-linkbutton" data-options="iconCls:'icon-add'">新增</a>
				<a id="delbtn" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
				<a id="editbtn" class="easyui-linkbutton" data-options="iconCls:'icon-add'">修改</a>
			</div>
			<table id="dgzd" data-options="region:'center',rownumbers:true,singleSelect:true" class="easyui-datagrid" pagination="true">
			<thead>
				<tr>  
					<th data-options="field:'ctypeId',halign:'center',align:'center',width:120,hidden:true">courseId</th>
					<th data-options="field:'ctypeName',halign:'center',align:'center',width:120">类型名称</th>
					<th data-options="field:'ctypeDesc',halign:'center',align:'center',width:120">类型描述</th>
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