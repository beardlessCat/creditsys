<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/commonJs.jsp"%> 
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<head>
<script type="text/javascript">
$(function(){
	initdatagrid("");
	initCobbobox();
	$('#querybtn').bind('click', function(){
		var majorName = $("#queryName").textbox("getValue");
		initdatagrid(majorName);
	})
	$('#clearBtn').bind('click', function(){
		$("#queryName").textbox("setValue",'');
		initdatagrid("");
	})
	//点击添加按钮
	$('#addbtn').bind('click', function(){
		$.showModalDialog({
            title: '添加培养方案信息',
            content:'url:cultivateScheme/toAdd',   
            data: {
            	grid: $('#dgzd')
            	},//扩展属性，给dilog页面传值
            useiframe:false,//默认false，扩展属性
            width:'900px',
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
	$('#delbtn').bind('click', function(){
		var row = $("#dgzd").treegrid("getSelected");
		 $.messager.confirm('提示','您确认删除所选数据',function(r){
				if(r){
					$.ajax({
						//提交数据的类型 POST GET
						type : "POST",
						//提交的网址
						url : "cultivateScheme/delete",
						//提交的数据
						data :{cultivateId:row.cultivateId},
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
	$("#majorId").combobox({
		onChange: function (n,o) {
			initdatagrid(n);
		}
	});
	$('#editbtn').bind('click', function(){
		var row = $("#dgzd").treegrid("getSelected");
		 $.showModalDialog({
	            title: '修改培养方案信息',
	            content:'url:cultivateScheme/toEdit',
	            data: {
	            	selected: row,
	            	},//扩展属性，给dilog页面传值
	            useiframe:false,//默认false，扩展属性
	            width:'900px',
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
function initdatagrid(majorId){
	$.ajax({
		url:'cultivateScheme/allCultivateScheme',
		type:'POST',
		dataType:'json',
		data:{majorId:majorId},
		success:function(data){
			$("#dgzd").datagrid("loadData",data.data);
		}
	});
}
function  foeDel(value, rec, rowIndex){
	value ='<a href="javascript:void(0);" onclick="edit('+'\''+rowIndex+'\''+')">编辑</a>' +"|"+
		   '<a href="javascript:void(0);" onclick="del('+'\''+rowIndex+'\''+')">删除</a>'  +"|"+
		   '<a href="javascript:void(0);" onclick="show('+'\''+rowIndex+'\''+')">查看详细信息</a>'
	return value ;		
}
function initCobbobox(){
		$('#majorId').combobox({    
		    url:'major/initMajor',    
		    valueField:'id',    
		    textField:'text'   
		});  
	}

</script>
</head>
<body class="easyui-layout">   
		<div data-options="region:'center'">
	    		<div id="tb" style="padding-bottom: 5px">
				专业     <input id="majorId" class="easyui-combobox"/>
		     	<a id="clearBtn" class="easyui-linkbutton" data-options="iconCls:'icon-search'">清空</a>
				<!-- <a id="addbtn" class="easyui-linkbutton" data-options="iconCls:'icon-add'">新增</a>
				<a id="delbtn" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
				<a id="editbtn" class="easyui-linkbutton" data-options="iconCls:'icon-add'">修改</a> -->
			</div>
			<table id="dgzd" data-options="region:'center',rownumbers:true,singleSelect:true" class="easyui-datagrid">
			<thead>
				<tr>  
					<th data-options="field:'cultivateId',halign:'center',align:'center',width:120,hidden:true">cultivateId</th>
					<th data-options="field:'majorName',halign:'center',align:'center',width:120">专业名称</th>
					<th data-options="field:'cultivateBusiness',halign:'center',align:'center',width:120">培养目标</th>
					<th data-options="field:'cultivateSkills',halign:'center',align:'center',width:120">能力技能</th>
					<th data-options="field:'cultivateProcess',halign:'center',align:'center',width:120">教学环节</th>
					<th data-options="field:'cultivatePercent',halign:'center',align:'center',width:120">学时学分比例</th>
					<th data-options="field:'cultivateStandard',halign:'center',align:'center',width:120">毕业标准</th>	
					<th data-options="field:'cultivateLeastStudyTime',halign:'center',align:'center',width:120">最少学习年限</th>
					<th data-options="field:'cultivateMostStudyTime',halign:'center',align:'center',width:120">最多学习年限</th>
					<th data-options="field:'cultivateInnovateScore',halign:'center',align:'center',width:120">创新学分</th>
					<th data-options="field:'cultivateAllCoursePeriod',halign:'center',align:'center',width:120">课程总学时</th>
					<th data-options="field:'cultivateAllCourseScore',halign:'center',align:'center',width:120">课程总学分</th>
					<th data-options="field:'cultivateMajorOptScore',halign:'center',align:'center',width:120">专业任选课学分</th>
					<th data-options="field:'cultivatePublicOptScore',halign:'center',align:'center',width:120">公共选修课学分</th>
					<th data-options="field:'cultivateReqCoursePeriod',halign:'center',align:'center',width:120">必修课学时</th>
					<th data-options="field:'cultivateReqCourseScore',halign:'center',align:'center',width:120">必修课学分</th>
					<th data-options="field:'cultivateOptPeriod',halign:'center',align:'center',width:120">选修课学时</th>
					<th data-options="field:'cultivateOptScore',halign:'center',align:'center',width:120">选修课学分</th>
					<th data-options="field:'cultivateTheoryPeriod',halign:'center',align:'center',width:120">理论教学课程学时</th>
					<th data-options="field:'cultivateTheoryScore',halign:'center',align:'center',width:120">理论教学课程学分</th>
					<th data-options="field:'cultivatePracticePeriod',halign:'center',align:'center',width:120">实践教学课程学时</th>
					<th data-options="field:'cultivatePracticeScore',halign:'center',align:'center',width:120">实践教学课程学分</th>
					<th data-options="field:'cultivateCenterScore',halign:'center',align:'center',width:120">集中实践教学环节学分</th>
					
					<!-- <th data-options="field:'caozuo',halign:'center',align:'center',width:200,formatter:foeDel">操作</th> -->
				</tr>
			</thead>      
		</table>
		</div>   	 
     <div id="treeTools">
			<a href="javascript:" onclick="undoSelTreeNode()"  class="icon-undo" title="取消选择"></a>
	 </div>
	</body>
</html>