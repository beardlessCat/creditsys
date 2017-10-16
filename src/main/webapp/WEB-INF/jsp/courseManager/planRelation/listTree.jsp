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
			  	        url: 'planRelation/delete',
			  	        data:{
			  	        	"prId":row.prId
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
		var url;
		var titles;
		var type ;
		node =  $('#restree').treegrid('getSelected');
		 if(node==null){
			 $.messager.alert('提示', "请选择父节点", 'error');
			 return ;
		}else if(node.prType=="1"){
			titles ="选择课程类型";
			type="2";
			url = 'chooseCourseType';
		}else if(node.prType=="2"){
			if(node.prName=='专业限选课'){
				titles ="选择专业方向";
				type="3";
				url="chooseDirect";
			}else{
				titles ="选择课程";
				type="4";
				url="chooseCourse";
			}
		}else if(node.prType=="3"){
			titles ="选择课程";
			type="4";
			url="chooseCourse";
		}
		$.showModalDialog({
            title: titles,
            content:'url:planRelation/'+url,   
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
            url: 'planRelation/treeData',
            idField: 'prId',
            treeField: 'prName',
            lines:true,
        	checkOnSelect:true,
			striped: true,
			border:false,
			rownumbers:true, 
			onAfterEdit:onAfterEdit,  
			onDblClickCell: onClickCell,  
            columns:[[    
              	        {title:'名称',field:'prName',width:'20%',align:'left',halign:'center'},    
              	        {field:'prType',title:'类型',width:'12%',align:'center',halign:'center',formatter:fo},    
              	        {field:'prCode',title:'代码',width:'12%',align:'center',halign:'center',editor : 'text'}, 
              	    	{field:'prDept',title:'开课单位',width:'12%',align:'center',halign:'center',editor : 'text'},  
              	    	{field:'actualCredit',title:'实际学分',width:'12%',align:'center',halign:'center',editor : 'text'}, 
              	    	{field:'chargeCrerdit',title:'收费学分',width:'12%',align:'center',halign:'center',editor : 'text'}, 
              	    	{field:'checkStyle',title:'考察方式',width:'12%',align:'center',halign:'center',editor : 'text'}, 
              	    	{field:'totalPeriod',title:'总学时',width:'12%',align:'center',halign:'center',editor : 'text'}, 
              	    	{field:'talkPeriod',title:'讲课学时',width:'12%',align:'center',halign:'center',editor : 'text'}, 
              	    	{field:'compPeriod',title:'上机学时',width:'12%',align:'center',halign:'center',editor : 'text'}, 
              	    	{field:'testPeriod',title:'实验',width:'12%',align:'center',halign:'center',editor : 'text'},
              	    	{field:'startTerm',title:'建议开课周学时',width:'12%',align:'center',halign:'center',editor : 'text'}, 
              	    	{field:'ifCharge',title:'按学分收费',width:'12%',align:'center',halign:'center',editor : 'text'}, 
              	    	{field:'otherId',title:'来源',width:'12%',align:'center',halign:'center',hidden:true},    
              	    ]],
              	   customAttr: {
                       parentField: 'prPid'
                   }
               }).treegrid('followCustomHandle');
}

function fo(value){
	if( value=="1") return "教学计划";
	if( value=="2") return "课程类型";
	if( value=="3") return "专业方向";
	if( value=="4") return "课程";
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
	if(row.prType=="4"){
		if(editOnline){
			if (endEditing()) { 
				editingId = row.prId;
				$('#restree').treegrid('beginEdit', editingId);
			} 
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
			url : "planRelation/edit",
			datatype:"json",
			//提交的数据
			data :{
				"data":JSON.stringify({
	 				"prCode":row.prCode,
	 				"prDept":row.prDept,
	 				"prId":row.prId,
	 				"actualCredit":row.actualCredit,
	 				"chargeCrerdit":row.chargeCrerdit,
	 				"checkStyle":row.checkStyle,
	 				"totalPeriod":row.totalPeriod,
	 				"talkPeriod":row.talkPeriod,
	 				"compPeriod":row.compPeriod,
	 				"testPeriod":row.testPeriod,
	 				"startTerm":row.startTerm,
	 				"ifCharge":row.ifCharge
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
				<!-- <a id="addbtn" class="easyui-linkbutton" data-options="iconCls:'icon-add'">新增</a>
				<a id="delbtn" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a> -->
			</div>
			<table id="restree" calss="easyui-datagrid" style="height: 91%"></table>
		</div>   	 
	</body>
</html>