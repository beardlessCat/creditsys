<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/commonJs.jsp"%> 
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<head>
<script type="text/javascript">
$(function(){
	initTree();
	$('#querybtn').bind('click', function(){
		var companyName = $("#queryName").textbox("getValue");
		initdatagrid(companyName);
	})
	$('#clearBtn').bind('click', function(){
		$("#queryName").textbox("setValue",'');
		initdatagrid();
	})
	$('#delbtn').bind('click', function(){
		var row = $("#restree").treegrid("getSelected");
		if(row==null){
			$.messager.alert('提示','请选择一行!','warning');
			return;
		}

		delResource(row.relationId);
	})
	$('#editbtn').bind('click', function(){
		var row = $("#restree").treegrid("getSelected");
		if(row==null){
			$.messager.alert('提示','请选择一行!','warning');
			return;
		}
		delResource(row.relationId);
	})
	//点击添加按钮
	$('#addbtn').bind('click', function(){
		var url = 'addCompany' ;
		var titles;
		var type ;
		var node =  $('#restree').treegrid('getSelected');
		 if(node==null){
			titles ="选择公司";
			type="1";
			url='url:relation/toAddCompany';
		}else if(node.relationType=="1"){
			titles ="选择职位";
			type="2";
			url='url:relation/addPosition';
		}else if(node.relationType=="2"){
			titles ="选择技能";
			type="3";
			url='url:relation/addTechnology';
		}else{
			titles ="选择知识点";
			type="4";
			url='url:relation/addPoint';
		} 
		 var selected = $('#restree').treegrid('getSelected');
		 if(selected==null){
			 selected = "0"
		 }
		$.showModalDialog({
            title: titles,
            content:url,   
            data: {
            	type:type ,
            	selected:selected
            	},//扩展属性，给dilog页面传值
            useiframe:false,//默认false，扩展属性
            width:'800px',
            height:'80%',
            toolbar:[{
                text:'保存',
                iconCls:'icon-save',
                handler: 'doChoose'
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
function initTree(){
	$("#restree").treegrid({
            url: 'relation/treeData',
            idField: 'relationId',
            treeField: 'relationRes',
            lines:true,
        	checkOnSelect:true,
			striped: true,
			border:false,
			rownumbers:true, 
			onAfterEdit:onAfterEdit,  
			onDblClickCell: onClickCell,  
            columns:[[    
              	        {title:'名称',field:'relationRes',width:'20%',align:'left',halign:'center'},    
              	        {field:'relationType',title:'类型',width:'20%',align:'center',halign:'center',formatter:fty},    
              	        {field:'relationRemain',title:'要求',width:'20%',align:'center',halign:'center',editor : 'text'}, 
              	    	{field:'relationRemake',title:'备注',width:'20%',align:'center',halign:'center',editor : 'text'},    
              	      /*   {field:'cz',title:'操作',width:'23%',align:'center',formatter:formatcz}     */
              	    ]],
              	   customAttr: {
                       parentField: 'relationPid'
                   }
               }).treegrid('followCustomHandle');
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
            title: '修改用户信息',
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
function formatcz(value,row){
	var fHref ;
	if(row.relationType=="3"||row.relationType=="4"){
		fHref ="<a href='javascript:void(0)' onclick='editResource(\""+row.relationId+"\")'>编辑</a>"+"|"
		+"<a href='javascript:void(0)' onclick='delResource(\""+row.relationId+"\");'>删除</a>";
	}else{
		fHref ="<a href='javascript:void(0)' onclick='delResource(\""+row.relationId+"\");'>删除</a>";
	}
	return fHref;
}
function delResource(relationId){
	 $.messager.confirm('提示','您确认删除所选数据,如果删除将删除其下所有数据',function(r){
		 if(r){
			 $.ajax({
				 type : 'post',
		  	        url: 'relation/del',
		  	        data:{
		  	        	"relationId":relationId
		  	        },
		  	        dataType:'json',
		  	        success: function(data){
		  	        	$.messager.alert('提示','删除成功!','info');
		  	        	initTree();
		  	        },
		  	        error: function(){
		  	            $.messager.alert('提示','删除失败!','warning');
		  	        }
			 });
		 }
		 
	 })
}
function fc(value, row, index){
	if(row.relationType=="3"||row.relationType=="4"){
		return value ;
	}else{
		return "" ;
	}
	
}
function fty(value, row, index){
	if(value=="1"){
		return "公司";
	}else if(value=="2"){
		return "职位" ;
	}else if(value=="3"){
		return "技术" ;
	}else{
		return "知识点"  ;
	}
}
function editResource(relationId){
	$.showModalDialog({
        title: '编辑资源',
        content:'url:relation/toEditJsp', 
        data: {
        	"relationId":relationId
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
}
//在线编辑
var editingId;
function endEditing() {//该方法用于关闭上一个焦点的editing状态  
    if (editingId == undefined) {  
        return true  
    }  
    if ($('#restree').treegrid('validateRow', editingId)) {  
        $('#restree').treegrid('endEdit', editingId);  
        editingId = undefined;  
        return true;  
    } else {  
        return false;  
    }  
}  
function onClickCell(field,row) {  
	if(editOnline){
		if (endEditing()) { 
			editingId = row.relationId;
			$('#restree').treegrid('beginEdit', editingId);
		} 
	}
}
function onAfterEdit(row,changes) {
	 editInfo(row);
}
function editInfo(row){
	$.ajax({
			type : "POST",
			//提交的网址
			url : "relation/editRealtion",
			datatype:"json",
			//提交的数据
			data :{
				"data":JSON.stringify({
	 				"relationRemain":row.relationRemain,
	 				"relationRemake":row.relationRemake,
	 				"relationId":row.relationId
					})					
				},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				$.messager.alert('提示','保存失败!','warning');
            alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);
            alert(textStatus);
        }
		});
}
</script>
</head>
<body class="easyui-layout">   
		<div data-options="region:'center'">
	    		<div id="tb" style="padding-bottom: 5px">
			<!-- 	公司名称     <input id="queryName" class="easyui-textbox"/>
		     	<a id="querybtn" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
		     	<a id="clearBtn" class="easyui-linkbutton" data-options="iconCls:'icon-search'">清空</a> -->
				<a id="addbtn" class="easyui-linkbutton" data-options="iconCls:'icon-add'">新增</a>
				<a id="delbtn" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
				<!-- <a id="editbtn" class="easyui-linkbutton" data-options="iconCls:'icon-add'">修改</a> -->
			</div>
			<table id="restree" calss="easyui-datagrid" style="height: 91%"></table>
		</div>   	 

	</body>
</html>