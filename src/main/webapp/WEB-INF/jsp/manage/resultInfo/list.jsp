<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/commonJs.jsp"%> 
<script type="text/javascript"> 
$(function(){
	initdatagrid(); 
	initComBoBox();
	$("#paperName").combobox({
		onChange: function (n,o) {
			initdatagrid(n);
		}
	});
	$('#delbtn').bind('click', function(){
		var row = $("#dgzd").treegrid("getSelected");
		$.messager.confirm('提示','您确认删除所选数据,如果删除将删除其下属部门',function(r){
			if(r){
				$.ajax({
					//提交数据的类型 POST GET
					type : "POST",
					//提交的网址
					url : "resultInfo/delete",
					//提交的数据
					data :{
						"data":JSON.stringify({
							resultId:row.resultId,
							userNo:row.userNo
						})},
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
		 $.showModalDialog({
	            title: '修改用户信息',
	            content:'url:resultInfo/toEdit',
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
	$('#info').bind('click', function(){
		var row = $("#dgzd").treegrid("getSelected");
		 $.showModalDialog({
	           title: '编辑题目成绩--'+row.userName,
	           content:'url:resultInfo/addInfo',
	           data: {
	           	selected: row,
	           	},//扩展属性，给dilog页面传值
	           useiframe:false,//默认false，扩展属性
	           width:'800pxx',
	           height:'85%',
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
	//批量添加
	$('#addMany').bind('click', function(){
		$.showModalDialog({
            title: '批量添加成绩',
            content:'url:resultInfo/toAddMany',   
            useiframe:false,//默认false，扩展属性
            width:'40%',
            height:'30%', 
            data: {
            	grid: $('#dgzd')
        	},
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
            title: '添加成绩信息',
            content:'url:resultInfo/toNew',   
            useiframe:false,//默认false，扩展属性
            width:'800px',
            height:'80%', 
            data: {
            	grid: $('#dgzd')
        	},
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
function initdatagrid(riPaperId){
	$.ajax({
		url:'resultInfo/list',
		type:'GET',
		dataType:'json',
		data:{
			riPaperId:riPaperId
		},
		success:function(data){
			$("#dgzd").datagrid("loadData",data);
		}
	});
}
function  foeDel(value, rec, rowIndex){
	value ='<a href="javascript:void(0);" onclick="edit('+'\''+rowIndex+'\''+')">编辑</a>' +"|"+
		   '<a href="javascript:void(0);" onclick="del('+'\''+rowIndex+'\''+')">删除</a>'+"|"+
		   '<a href="javascript:void(0);" onclick="addInfo('+'\''+rowIndex+'\''+')">题目成绩</a>';
	return value ;		
}
function del(rowIndex){
	var nodes =$('#dgzd').datagrid('getRows')[rowIndex];
    $.messager.confirm('提示','您确认删除所选数据,如果删除将删除其下属部门',function(r){
		if(r){
			$.ajax({
				//提交数据的类型 POST GET
				type : "POST",
				//提交的网址
				url : "resultInfo/delete",
				//提交的数据
				data :{resultId:nodes.resultId},
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
            title: '修改用户信息',
            content:'url:resultInfo/toEdit',
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
function initComBoBox(){
	$('#paperName').combobox({    
		    url:'paper/initCobbobox',    
		    valueField:'id',    
		    textField:'text'   
		});  
}
function addInfo(rowIndex){
	var selected = $("#dgzd").datagrid("getRows")[rowIndex];
	 $.showModalDialog({
           title: '编辑题目成绩--'+selected.userRealName,
           content:'url:resultInfo/addInfo',
           data: {
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
function forRate(v,r,index){
	return  toPercent((r.resultTotal-r.riRate)/(r.resultTotal-1));
}
function toPercent(point){
    var str=Number(point*100).toFixed(1);
    str+="%";
    return str;
}
</script>
</head>
<body class="easyui-layout">   
		<div data-options="region:'center'">
	    		<div id="tb" style="padding-bottom: 5px">
				试卷名称   <input id="paperName" class="easyui-combobox" data-options="required:true">
		     	<a id="clearBtn" class="easyui-linkbutton" data-options="iconCls:'icon-search'">清空</a>
				<a id="addbtn" class="easyui-linkbutton" data-options="iconCls:'icon-add'">新增</a>
				<a id="addMany" class="easyui-linkbutton" data-options="iconCls:'icon-add'">批量添加</a>
				<a id="delbtn" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
				<a id="editbtn" class="easyui-linkbutton" data-options="iconCls:'icon-add'">修改</a>
				<a id="info" class="easyui-linkbutton" data-options="iconCls:'icon-add'">题目成绩</a>
			</div>
			<table id="dgzd" data-options="region:'center',rownumbers:true,singleSelect:true" class="easyui-datagrid">
			<thead>
				<tr>
					<th data-options="field:'userNo',halign:'center',align:'center',width:120,hidden:true">userLoginName</th>  
					<th data-options="field:'resultId',halign:'center',align:'center',width:120,hidden:true">id</th>
					<th data-options="field:'paperName',halign:'center',align:'center',width:120">试卷名称</th>
					<th data-options="field:'userName',halign:'center',align:'center',width:120">学生姓名</th>
					<th data-options="field:'riResult',halign:'center',align:'center',width:120">得分</th>
					<th data-options="field:'riRate',halign:'center',align:'center',width:120">排名</th>
					<th data-options="field:'xx',halign:'center',align:'center',width:120,formatter:forRate">排名百分比</th>
<!-- 					<th data-options="field:'caozuo',halign:'center',align:'center',width:200,formatter:foeDel">操作</th>
 -->				</tr>
			</thead>      
		</table>
	 </div>   	
     <div id="treeTools">
			<a href="javascript:" onclick="undoSelTreeNode()"  class="icon-undo" title="取消选择"></a>
	 </div>
	</body>
</html>