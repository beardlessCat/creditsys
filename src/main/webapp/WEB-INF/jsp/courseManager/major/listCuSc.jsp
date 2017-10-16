<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript">
var selected ;
function doInit(dialog){
	$("#addbtns").hide();
	$("#editbtns").hide();
	selected= dialog.getData("selected");
	initdatagrid(selected.majorId);
	}
$(function(){
	//点击添加按钮
	$('#addbtns').bind('click', function(){
		$.showModalDialog({
            title: '添加培养方案信息',
            content:'url:cultivateScheme/toAdd',   
            data: {
            	grid: $('#dgzd'),
            	selected:selected
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
                    cotent.doInits(dialog);//调用dialog页面的方法
                }
            }
        }); 
	})
	$('#editbtns').bind('click', function(){
		var row = $("#dgzds").treegrid("getSelected");
		 $.showModalDialog({
	            title: '修改培养方案信息',
	            content:'url:cultivateScheme/toEdit',
	            data: {
	            	selected: selected,
	            	row:row
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
	$('#toMadir').bind('click', function(){
		 $.showModalDialog({
	            title: '教学计划',
	            content:'url:cultivateScheme/toMaDir',
	            data: {
	            	selected:selected
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
	                    cotent.doInits(dialog);//调用dialog页面的方法
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
			$("#dgzds").datagrid("loadData",data.data);
			if(data.data.length<=0) {
				$("#addbtns").show();
			}else{
				$("#editbtns").show();
			}
		}
	});
}
function  foeDel(value, rec, rowIndex){
	value ='<a href="javascript:void(0);" onclick="edit('+'\''+rowIndex+'\''+')">编辑</a>' +"|"+
		   '<a href="javascript:void(0);" onclick="del('+'\''+rowIndex+'\''+')">删除</a>'  +"|"+
		   '<a href="javascript:void(0);" onclick="show('+'\''+rowIndex+'\''+')">查看详细信息</a>'
	return value ;		
}
</script>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center',border:true" class="easyui-panel" 
  					style="width: 800px">
   		<div id="tb" style="padding-bottom: 5px">
		专业名称     <input id="queryName" class="easyui-textbox"/>
		<a id="addbtns" class="easyui-linkbutton" data-options="iconCls:'icon-add'">新增</a>
		<a id="editbtns" class="easyui-linkbutton" data-options="iconCls:'icon-add'">修改</a>
		<a id="toMadir" class="easyui-linkbutton" data-options="iconCls:'icon-add'">教学计划</a>
	</div>
	<table id="dgzds" data-options="region:'center',rownumbers:true,singleSelect:true" class="easyui-datagrid">
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
</div>

