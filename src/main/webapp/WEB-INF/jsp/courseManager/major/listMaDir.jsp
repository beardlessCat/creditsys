<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
var selected;
function doInits(dialog){
	selected= dialog.getData("selected");
	if(check(selected.majorId)==0){
		$.ajax({
			 type : 'post',
	 	        url: 'planRelation/addP',
	 	        data:{
	 	        	 "data":JSON.stringify({
	 					"majorId":selected.majorId,
	 					"majorName":selected.majorName
	 					})	
	 	        },
	 	        dataType:'json',
	 	        success: function(data){
	 	        },
	 	        error: function(){
	 	        }
		 });
	}
	initTree(selected.majorId);
}
function check(majorId){
	var total;
	$.ajax({
		 type : 'post',
 	        url: 'planRelation/oneData',
 	       data:{
	        	"majorId":majorId
	        },
	        async:false,
 	        dataType:'json',
 	        success: function(data){
 	        	total = data.total
 	        },
 	        error: function(){
 	            $.messager.alert('提示','删除失败!','warning');
 	        }
	 });
	console.log(total)
	return total;
}
$(function(){
	$('#_delbtn').bind('click', function(){
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

	//点击添加按钮
	var node;
	$('#_addbtn').bind('click', function(){
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
            	node:node ,
            	row:selected
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
function initTree(majorId){
	$("#restree").treegrid({
            url: 'planRelation/oneData',
            idField: 'prId',
            treeField: 'prName',
            lines:true,
        	checkOnSelect:true,
			striped: true,
			border:false,
			rownumbers:true, 
			onAfterEdit:onAfterEdit,  
			onDblClickCell: onClickCell,
			queryParams:{majorId:majorId},
            columns:[[    
              	        {title:'名称',field:'prName',width:'20%',align:'left',halign:'center'},    
              	        {field:'prType',title:'类型',width:'12%',align:'center',halign:'center',formatter:fo},    
              	        {field:'prCode',title:'代码',width:'12%',align:'center',halign:'center'}, 
              	    	{field:'prDept',title:'开课单位',width:'12%',align:'center',halign:'center',editor : 'text'},  
              	    	{field:'actualCredit',title:'实际学分',width:'12%',align:'center',halign:'center'}, 
              	    	{field:'chargeCrerdit',title:'收费学分',width:'12%',align:'center',halign:'center',editor : 'text'}, 
              	    	{field:'checkStyle',title:'考察方式',width:'12%',align:'center',halign:'center'}, 
              	    	{field:'totalPeriod',title:'总学时',width:'12%',align:'center',halign:'center'}, 
              	    	{field:'talkPeriod',title:'讲课学时',width:'12%',align:'center',halign:'center'}, 
              	    	{field:'compPeriod',title:'上机学时',width:'12%',align:'center',halign:'center'}, 
              	    	{field:'testPeriod',title:'实验学时',width:'12%',align:'center',halign:'center'},
              	    	{field:'startTerm',title:'建议开课周学时',width:'12%',align:'center',halign:'center',editor : 'text'}, 
              	    	{field:'ifCharge',title:'按学分收费',width:'12%',align:'center',halign:'center',editor : 'text'}, 
              	    	{field:'otherId',title:'来源',width:'12%',align:'center',halign:'center',hidden:true},  
              	    	{field:'prDegree',title:'资源级别',width:'12%',align:'center',halign:'center',hidden:true},  
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
					"prId":row.prId,
	 				"prDept":row.prDept,
	 				"chargeCrerdit":row.chargeCrerdit,
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
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center'">
	    		<div id="tb" style="padding-bottom: 5px">
				名称     <input id="queryName" class="easyui-textbox"/>
				<a id="_addbtn" class="easyui-linkbutton" data-options="iconCls:'icon-add'">新增</a>
				<a id="_delbtn" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
			</div>
			<table id="restree" calss="easyui-datagrid" style="height: 91%"></table>
		</div>   	
</div>   	 
</div>
