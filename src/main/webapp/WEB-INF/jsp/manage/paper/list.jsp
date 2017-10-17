<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/commonJs.jsp"%> 
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<head>
<script type="text/javascript">
$(function(){
	var pager = $("#dgzds").datagrid("getPager");
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
	initCourse();
	function initGrid(coursePaperId, pageNumber, pageSize) {
		if(pageNumber==null||pageNumber==""){
			pageNumber = "1" ;
		}
		if(pageSize==null||pageSize==""){
			pageSize = "10" ;
		}
		var jsonData = JSON.stringify({
			'coursePaperId':coursePaperId ,
			'pageNumber' : pageNumber,
			'pageSize' : pageSize
		});
		initDataGrid('dgzds', 'paper/getAll', 'POST', 'json', jsonData);
	}
	$('#delbtn').bind('click', function(){
		var row = $("#dgzds").treegrid("getSelected");
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
						url : "paper/delete",
						//提交的数据
						data :{paperId:row.paperId},
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
		var row = $("#dgzds").treegrid("getSelected");
		if(row==null){
			$.messager.alert('提示','请选择一行!','warning');
			return;
		}
		 $.showModalDialog({
	            title: '编辑试卷内容',
	            content:'url:paper/toEdit',
	            data: {
	            	selected: row
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
	$('#editinfo').bind('click', function(){
		var row = $("#dgzds").treegrid("getSelected");
		if(row==null){
			$.messager.alert('提示','请选择一行!','warning');
			return;
		}
		$.showModalDialog({
	        title: '编辑试卷内容',
	        content:'url:paper/toEditInfo',
	        data: {
	        	"selected":row
	        	},//扩展属性，给dilog页面传值
	        useiframe:false,//默认false，扩展属性
	        width:'90%',
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
	$('#clearBtn').bind('click', function(){
		$("#queryName").textbox("setValue",'');
		initdatagrid();
	})
	//点击添加按钮
	$('#addbtn').bind('click', function(){
		$.showModalDialog({
            title: '添加试卷',
            content:'url:paper/toNew',   
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
});
//初始化数据格
function initdatagrid(coursePaparId){
	$.ajax({
		url:'paper/getAll',
		type:'POST',
		dataType:'json',
		success:function(data){
			$("#dgzds").datagrid("loadData",data.data);
		}
	});
}
function  foeDel(value, rec, rowIndex){
	value ='<a href="javascript:void(0);" onclick="edit('+'\''+rowIndex+'\''+')">编辑试卷信息</a>' +"|"+
		   '<a href="javascript:void(0);" onclick="del('+'\''+rowIndex+'\''+')">删除</a>' +"|"+
		   '<a href="javascript:void(0);" onclick="editPaper('+'\''+rowIndex+'\''+')">编辑试卷内容</a>'  ;
	return value ;		
}

function editPaper(rowIndex){
		var selected = $("#dgzds").datagrid("getRows")[rowIndex];	
		$.showModalDialog({
        title: '编辑试卷内容',
        content:'url:paper/toEditInfo',
        data: {
        	"selected":selected
        	},//扩展属性，给dilog页面传值
        useiframe:false,//默认false，扩展属性
        width:'90%',
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
function del(rowIndex){
	var nodes =$('#dgzds').datagrid('getRows')[rowIndex];
    $.messager.confirm('提示','您确认删除所选数据?',function(r){
		if(r){
			$.ajax({
				//提交数据的类型 POST GET
				type : "POST",
				//提交的网址
				url : "paper/delete",
				//提交的数据
				data :{paperId:nodes.paperId},
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
	var selected = $("#dgzds").datagrid("getRows")[rowIndex];
	 $.showModalDialog({
            title: '编辑试卷内容',
            content:'url:paper/toEdit',
            data: {
            	selected: selected
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
$("#queryName").combobox({
	onChange: function (n,o) {
		initGrid(n,'1','10') ;
	}
});
function initCourse(){
	$('#queryName').combobox({    
		    url:'course/initCourse',    
		    valueField:'id',    
		    textField:'text'   
		}); 
}
</script>
</head>
<body class="easyui-layout">   
		<div data-options="region:'center'">
	    		<div id="tb" style="padding-bottom: 5px">
			 	学科：     <input id="queryName" class="easyui-combobox"/>
		     	<a id="querybtn" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
		     	<a id="clearBtn" class="easyui-linkbutton" data-options="iconCls:'icon-search'">清空</a> 
				<a id="addbtn" class="easyui-linkbutton" data-options="iconCls:'icon-add'">新增</a>
				<a id="delbtn" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
				<a id="editbtn" class="easyui-linkbutton" data-options="iconCls:'icon-add'">修改</a>
				<a id="editinfo" class="easyui-linkbutton" data-options="iconCls:'icon-add'">编辑试卷内容</a>
			</div>
			<table id="dgzds" data-options="region:'center',rownumbers:true,singleSelect:true" class="easyui-datagrid" pagination="true">
			<thead>
				<tr>  
					<th data-options="field:'paperId',halign:'center',align:'center',width:10,hidden:true">试卷id</th>
					<th data-options="field:'paperName',halign:'center',align:'center',width:120">试卷名称</th>
					<th data-options="field:'paperCode',halign:'center',align:'center',width:120">试卷代码</th>
					<th data-options="field:'majorPaperId',halign:'center',align:'center',width:120">所属专业</th>
					<th data-options="field:'courseName',halign:'center',align:'center',width:120">所属课程</th>
					<th data-options="field:'termMark',halign:'center',align:'center',width:120">学期标识</th>
					<th data-options="field:'totalResult',halign:'center',align:'center',width:70">总成绩</th>
					<th data-options="field:'resultMax',halign:'center',align:'center',width:70">最高成绩</th>
					<th data-options="field:'resultDesc',halign:'center',align:'center',width:120">成绩描述</th>
					<th data-options="field:'resultMin',halign:'center',align:'center',width:70">最低成绩</th>
					<th data-options="field:'userTotal',halign:'center',align:'center',width:70">考试人数</th>
					<th data-options="field:'hardDegree',halign:'center',align:'center',width:120">备注</th>
<!-- 					<th data-options="field:'caozuo',halign:'center',align:'center',width:200,formatter:foeDel">操作</th>
 -->				</tr>
			</thead>      
		</table>
		</div>   	
	</body>
</html>