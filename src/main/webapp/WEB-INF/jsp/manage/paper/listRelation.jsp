 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
var pr;
var selected ;
function doInit(dialog){
	selected =dialog.getData("selected");
	pr = selected.paperName;
	initTree(selected.paperId);
}
$(function(){
	$('#clearBtn2').bind('click', function(){
		 $('#restree').treegrid('expandAll')
	})
	$('#addbtn2').bind('click', function(){
		var title ;
		var tooBar ;
		var type ;
		var node =  $('#restree').treegrid('getSelected');
		//type为1，增加大题
		//type为2增加小题，在paperDetial中选择或者添加
		//type为3增加知识点，在point列表正选择
		if(node==null){
			$.messager.alert('提示','请选择添加的父节点!','warning');
			return ;
		}else if(node.type=="1"){
			title='添加大题题目';
			type=node.type ;
		}else if(node.type=="2"){
			title='添加题目';
			type=node.type ;
		}else{
			$.messager.alert('提示','已经是最下级节点了!','warning');
			return ;
			title='添加知识点';
			type=node.type ;
			//choosePoint(title,type,node,pr);
			//return;
		} 
		$.showModalDialog({
            title: title,
            content:'url:paperRelation/toAdd',   
            data: {
            	type:type,
            	node:node,
            	pr:pr,
            	paperId:selected.paperId
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
		})
	})
})
function choosePoint(title,type,node,pr){
	 $.showModalDialog({
        title: title,
        content:'url:paperRelation/toChoosePoint',   
        data: {
        	type:type,
        	node:node,
        	pr:pr
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
	}) 

}
function initTree(paperId){
	$("#restree").treegrid({
            url: 'paperRelation/paperRelation',
            idField: 'prId',
            treeField: 'prName', 
            lines:true,
        	checkOnSelect:true,
			striped: true,
			border:false,
			queryParams:{otherId:paperId},
			rownumbers:true, 
            columns:[[    
                        {field:'prName',title:'资源名称',width:'30%',align:'left',halign:'center'},    
              	    	{field:'type',title:'资源类型',width:'10%',align:'center',halign:'center',formatter:fc},    
               	        {field:'prType',title:'题目类型',width:'10%',align:'center',halign:'center'}, 
               	    	{field:'prDesc',title:'题目描述',width:'10%',align:'center',halign:'center'}, 
               	 	    {field:'prScore',title:'题目分值',width:'10%',align:'center',halign:'center'},    
           	      		{field:'prHard',title:'题目难度',width:'10%',align:'center',halign:'center'}, 
           	    		/* {field:'prRate',title:'得分率',width:'10%',align:'center',halign:'center'},  */
              	        {field:'cz',title:'操作',width:'10%',align:'center',formatter:formatcz}    
              	    ]]      ,
            customAttr: {
                parentField: 'prPid'
            },
            onLoadSuccess: function () {
            	//$('#restree').treegrid('collapseAll')
            	}
        }).treegrid('followCustomHandle');
	
}
function fc (value){
	var info ;
	if(value=='4'){
		info = '知识点';
	}else if(value=='1'){
		info = '试卷名称' ;	
	}else if(value=='3'){
		info = '小题';
	}else{
		info =  '大题';
	}
	return info;
}
function formatcz(value,row){
	var info
	if(row.type=='1'){
		info='';
	}else {
		info="<a href='javascript:void(0)' onclick='editResource(\""+row.prId+"\")'>编辑</a>"+"|"
		+"<a href='javascript:void(0)' onclick='delResource(\""+row.prId+"\");'>删除</a>";
	}
	return info;
}
function delResource(prId){
	 $.messager.confirm('提示','您确认删除所选数据,如果删除将删除其下所有数据',function(r){
		 if(r){
			 $.ajax({
				 type : 'post',
		  	        url: 'paperRelation/del',
		  	        data:{
		  	        	"prId":prId
		  	        },
		  	        dataType:'json',
		  	        success: function(data){
		  	        	$.messager.alert('提示','删除成功!','info');
		  	        	initTree(selected.paperName);
		  	        },
		  	        error: function(){
		  	            $.messager.alert('提示','删除失败!','warning');
		  	        }
			 });
		 }
		 
	 })
}
function editResource(prId){
	$.showModalDialog({
        title: '编辑信息',
        content:'url:paperRelation/toEditJsp', 
        data: {
        	"prId":prId,
        	"prName":pr,
        	"paperId":selected.paperId
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
</script>
<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center'">
	    		<div id="tb" style="padding-bottom: 5px">
		     	<a id="clearBtn2" class="easyui-linkbutton" data-options="iconCls:'icon-search'">展开全部节点</a>
				<a id="addbtn2" class="easyui-linkbutton" data-options="iconCls:'icon-add'">新增</a>
			</div>
			<table id="restree" calss="easyui-datagrid" style="height: 91%"></table>
		</div>   	 
</div>
