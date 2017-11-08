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
	//职位
	initCombotree();
	 //专业方向
	initCobbobox();
	clearBtn
	$('#clearBtn').bind('click', function(){
		$("#planDircct").combobox("setValue","");
		$('#position').combotree("setValue","");
	})
	$('#querybtn').bind('click', function(){
		var id = $("#planDircct").combobox("getValue");
		var relationId = $('#position').combotree("getValue"); 
		var t = $("#position").combotree('tree'); // 得到树对象  
		if(id==null){
			  $.messager.alert('提示','请选择专业方向!','warning');
			  return;
		}
		if(t.tree('getSelected')!=null){
			//选择职业
			if(t.tree('getSelected').relationType!="2"){
				$.messager.alert('提示','请选择职业!','warning');
				return;
			}
			var relationId = t.tree('getSelected').relationId; // 得到选择的节点  
			initRecommendTree(id,relationId);
		}else{
			//未选择职业
			initRecommendTree(id,"");
		}	
	})
});
function initCobbobox(){
		$('#planDircct').combobox({    
		    url:'planRelation/initDirect',    
		    valueField:'id',    
		    textField:'text'   
		});  
	}
function initTree(){
	$("#restree").treegrid({
            url: 'planRelation/oneData',
            idField: 'prId',
            treeField: 'prName',
            lines:true,
        	checkOnSelect:true,
			striped: true,
			border:false,
			rownumbers:true, 
            columns:[[    
         	        {title:'名称',field:'prName',width:'33%',align:'left',halign:'center'},    
         	        {field:'prType',title:'类型',width:'33%',align:'center',halign:'center',formatter:fo},    
         	        {field:'prCode',title:'代码',width:'30%',align:'center',halign:'center',editor : 'text'}, 
         	    	/* {field:'prDept',title:'开课单位',width:'12%',align:'center',halign:'center',editor : 'text'},  
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
        */       	    ]],
              	   customAttr: {
                       parentField: 'prPid'
                   }
               }).treegrid('followCustomHandle');
}
function initRecommendTree(id,relationId){
	$("#recommendTree").treegrid({
            url: 'recommendCourse/reByPlan',
            idField: 'id',
            treeField: 'text',
            lines:true,
        	checkOnSelect:true,
			striped: true,
			border:false,	
			queryParams:{
				"data":JSON.stringify({
					 id:id,
				     relationId:relationId
				})
		        }, 
			rownumbers:true, 
            columns:[[    
              	        {title:'名称',field:'text',width:'95%',align:'left',halign:'center'},    
              	          ]],
              	   customAttr: {
                       parentField: 'pid'
                   }
               }).treegrid('followCustomHandle');
}
function fo(value){
	if( value=="1") return "教学计划";
	if( value=="2") return "课程类型";
	if( value=="3") return "专业方向";
	if( value=="4") return "课程";
	}
function initCombotree(){
		$('#position').combotree({
			cascadeCheck:false,//取消树级联
			customAttr:{
				dataModel: 'simpleData',
				idField: 'relationId',
	            textField: 'relationRes',
	            parentField: 'relationPid'
			}
		}).combotree('followCustomHandle');
		$.ajax({
			type : 'POST',
	        url: 'relation/relationTree',
	        data:{},
	        dataType:'json',
	        success: function(data){
	            if(data){
	            	$('#position').combotree('loadData',data.data);
	            }
	        },
	        error: function(){
	            $.messager.alert('提示','组织机构初始化失败!','warning');
	        }
		});
	}
//在线编辑

</script>
</head>
<body class="easyui-layout">   
	<div data-options="region:'north',split:true" style="height:50px;">
		<div id="tb" style="padding-bottom: 5px">
			专业方向 ：  <input id="planDircct" class="easyui-combobox" style="margin-top:20px;"/>
			企业职位：   <input id="position" class="easyui-combotree" style="margin-top:20px;"/>
			<a id="querybtn" class="easyui-linkbutton" data-options="iconCls:'icon-search'">开始推荐</a>
			<a id="clearBtn" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">清空</a>
			</div> 
	</div>   
    <div data-options="region:'east',iconCls:'icon-reload',title:'课程推荐',split:true" style="width:50%;">
    		<table id="recommendTree" calss="easyui-datagrid" style="height: 100%"></table>
    </div>   
    <div data-options="region:'center',title:'培养方案'" style="padding:5px;background:#eee;width:50%">
			<table id="restree" calss="easyui-datagrid" style="height: 100%"></table>
    </div>   
	</body>
</html>
