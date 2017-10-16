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
	$('#delbtn').bind('click', function(){
		var row = $("#restree").treegrid("getSelected");
		 $.messager.confirm('提示','您确认删除所选数据,如果删除将删除其下所有数据',function(r){
			 if(r){
				 $.ajax({
					 type : 'post',
			  	        url: 'courseRelation/del',
			  	        data:{
			  	        	"srId":row.srId
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
	})
	$('#clearBtn').bind('click', function(){
		$("#queryName").textbox("setValue",'');
		initdatagrid();
	})
	//点击添加按钮
	var node;
	$('#addbtn').bind('click', function(){
		var url = 'toAdd' ;
		var titles;
		var type ;
		node =  $('#restree').treegrid('getSelected');
		 if(node==null){
			 $.messager.alert('提示', "请选择父节点", 'error');
			 return ;
		}else if(node.srType=="1"){
			titles ="添加加单元";
			type="2";
		}else if(node.srType=="2"){
			titles ="添加知识点";
			type="3";
		}
		$.showModalDialog({
            title: titles,
            content:'url:courseRelation/'+url,   
            data: {
            	type:type ,
            	node:node 
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
            },'-',{
                text: '选择',
                iconCls: 'icon-add',
                handler: 'choose'
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
            url: 'courseRelation/treeData',
            idField: 'srId',
            treeField: 'srName',
            lines:true,
        	checkOnSelect:true,
			striped: true,
			border:false,
			rownumbers:true, 
			onAfterEdit:onAfterEdit,  
			onDblClickCell: onClickCell,  
            columns:[[    
              	        {title:'名称',field:'srName',width:'12%',align:'left',halign:'center'},    
              	        {field:'srType',title:'资源类型',width:'12%',align:'center',halign:'center',formatter:forType},    
              	        {field:'srDate',title:'课时',width:'12%',align:'center',halign:'center',editor : 'text'}, 
              	    	{field:'srIsNess',title:'必修',width:'12%',align:'center',halign:'center',editor : 'text'},    
              	    	{field:'srProperty',title:'属性',width:'12%',align:'center',halign:'center'},    
               	        {field:'srRemake',title:'备注',width:'12%',align:'center',halign:'center',editor : 'text'},                	       
              	    ]],
              	   customAttr: {
                       parentField: 'srPid'
                   }
               }).treegrid('followCustomHandle');
}
function  foeDel(value, rec, rowIndex){
	value ='<a href="javascript:void(0);" onclick="edit('+'\''+rowIndex+'\''+')">编辑</a>' +"|"+
		   '<a href="javascript:void(0);" onclick="del('+'\''+rowIndex+'\''+')">删除</a>'  +"|"+
		   '<a href="javascript:void(0);" onclick="show('+'\''+rowIndex+'\''+')">查看详细信息</a>'
	return value ;		
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
function forType(v){
	if(v=='1') return "课程";
	if(v=='2') return '单元' ;
	if(v=='3') return '知识点';
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
	if (endEditing()) { 
		editingId = row.relationId;
		$('#restree').treegrid('beginEdit', editingId);
	} 
}
function onAfterEdit(row,changes) {
	 editInfo(row);
}
function editInfo(row){
	$.ajax({
			type : "POST",
			//提交的网址
			url : "url:relation/editRealtion",
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
				名称     <input id="queryName" class="easyui-textbox"/>
		     	<a id="querybtn" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
		     	<a id="clearBtn" class="easyui-linkbutton" data-options="iconCls:'icon-search'">清空</a>
				<a id="addbtn" class="easyui-linkbutton" data-options="iconCls:'icon-add'">新增</a>
				<a id="delbtn" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
			</div>
			<table id="restree" calss="easyui-datagrid" style="height: 91%"></table>
		</div>   	 

	</body>
</html>