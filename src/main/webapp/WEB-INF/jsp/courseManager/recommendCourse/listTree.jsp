<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
		
<script type="text/javascript">
function doInit(dialog){
	initTree();
	//initCombobox();
	}
 $(function(){
	$('#querybtn').bind('click', function(){
		var companyId = $("#companyId").combobox("getValue");
		initTree(companyId);
	})
	$('#clearBtn').bind('click', function(){
		initTree();
	})
}) 
function initCombobox(){
	 $('#companyId').combobox({    
		    url:'company/initCompany',    
		    valueField:'id',    
		    textField:'text'   
		});  
 }
function initTree(companyId){
	$("#restree").treegrid({
            url: 'relation/treeList',
            idField: 'relationId',
            treeField: 'relationRes',
            lines:true,
        	checkOnSelect:true,
			striped: true,
			border:false,
			rownumbers:true, 
			queryParams:{companyId:companyId},
            columns:[[    
              	        {title:'名称',field:'relationRes',width:'20%',align:'left',halign:'center'},    
              	        {field:'relationType',title:'资源类型',width:'20%',align:'center',halign:'center',formatter:fty},    
              	        {field:'relationRemain',title:'资源要求',width:'20%',align:'center',halign:'center',formatter:fc}, 
              	    	{field:'relationRemake',title:'资源备注',width:'20%',align:'center',halign:'center',formatter:fc},    
              	    ]],
              	   customAttr: {
                       parentField: 'relationPid'
                   }
               }).treegrid('followCustomHandle');
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
function doSave(dialog){
	var node = $("#restree").treegrid("getSelected");
	if(node.relationType!='2'){
		$.messager.alert('提示','请选择职位!','warning');
		return;
	}
	$.ajax({
		url:'recommendCourse/getAllPoint',
		type:'POST',
		dataType:'json',
		async: false,
		data:{
			relationId:node.relationId,
			relationRes:mode.relationRes
		},
		success:function(data){
			 dialog.close();
			myDiagram.model = new go.TreeModel(data);
			doubleTreeLayout(myDiagram,node.relationRes);
		}
	});
	$.ajax({
		url:'recommendCourse/getHtmlInfo',
		type:'POST',
		dataType:'json',
		 async: false,
		success:function(data){	
			var obj = data.data;
			if(obj.choosed==''||obj.choosed==null){
				$.messager.alert('提示','你当前未选修任何一个学科!','info');
				return;
			}
			var str ='<h1>&nbsp;<span style="font-family:楷体, 楷体_GB2312, SimKai"> <span style="font-size:16px">&nbsp;</span></span><span style="font-size:16px">所选<strong><span style="color:#ff0000">'+obj.positionName+'</span></strong>岗位需要进修：<span style="color: rgb(0, 176, 240);">'+obj.allCourse+'</span>等课程，根据您的学习进度，您已经修完<span style="color: rgb(0, 176, 80);">'+obj.choosed+'</span>等课程，只需要再次选修<span style="color: rgb(255, 0, 0);">'+obj.unChoosed+'</span>即可满足岗位要求。</span></h1>';   
			$("#info").html(str);
		}
	});
	$.ajax({
		url:'recommendCourse/initChoosed',
		type:'POST',
		dataType:'json',
		data:{
			relationId:node.relationId
		},
		success:function(data){	
			
			myDiagram2.model = new go.TreeModel(data);
			doubleTreeLayout(myDiagram2,node.relationRes);
		}
	});
}
</script>
<div data-options="region:'center'">
	    		<div id="tb" style="padding-bottom: 5px">
				名称     <input id="companyId" class="easyui-combobox"/>
		     	<a id="querybtn" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
		     	<a id="clearBtn" class="easyui-linkbutton" data-options="iconCls:'icon-search'">清空</a>
			</div>
			<table id="restree" calss="easyui-datagrid" style="height: 700px%"></table>
		</div>   	 
