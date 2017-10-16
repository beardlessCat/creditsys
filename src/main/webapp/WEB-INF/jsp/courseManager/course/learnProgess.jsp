<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/commonJs.jsp"%> 
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<head>
<script type="text/javascript">
$(function(){
	initdatagrid();
});
//初始化数据格
function initdatagrid(){
	$.ajax({
		url:'course/getChoose',
		type:'POST',
		dataType:'json',
		data:{
		},
		success:function(data){
			$("#dgzd").datagrid("loadData",data.data);
		}
	});
}

</script>
</head>
<body class="easyui-layout">   
		<div data-options="region:'center'">
	    		<div id="tb" style="padding-bottom: 5px">
				已选课程如下：
			</div>
			<table id="dgzd" data-options="region:'center',rownumbers:true,singleSelect:true" class="easyui-datagrid">
			<thead>
				<tr>  
					<th data-options="field:'courseId',halign:'center',align:'center',width:120,hidden:true">courseId</th>
					<th data-options="field:'courseCode',halign:'center',align:'center',width:120">课程代码</th>
					<th data-options="field:'courseName',halign:'center',align:'center',width:120">课程名称</th>
					<th data-options="field:'coursePeriod',halign:'center',align:'center',width:120">课时</th>
					<th data-options="field:'courseRequire',halign:'center',align:'center',width:120">课程要求</th>
					<th data-options="field:'courseScore',halign:'center',align:'center',width:120,hidden:true">成绩构成</th>	
					<th data-options="field:'courseForm',halign:'center',align:'center',width:120">考试形式</th>
					<th data-options="field:'courseRefer',halign:'center',align:'center',width:120,hidden:true">参考教材</th>
					<th data-options="field:'courseFeed',halign:'center',align:'center',width:120,hidden:true">课程反馈</th>
					<th data-options="field:'courseCredit',halign:'center',align:'center',width:120">学分</th>
					<th data-options="field:'courseChecked',halign:'center',align:'center',width:120">考核方式</th>
					<th data-options="field:'pdLesson',halign:'center',align:'center',width:120,hidden:true">讲课学时</th>
					<th data-options="field:'plLesson',halign:'center',align:'center',width:120,hidden:true">上机学时</th>
					<th data-options="field:'courseProperty',halign:'center',align:'center',width:120">课程属性</th>
					<th data-options="field:'pdTest',halign:'center',align:'center',width:120,hidden:true">实验学时</th>
					<!-- <th data-options="field:'caozuo',halign:'center',align:'center',width:200,formatter:foeDel">操作</th> -->
				</tr>
			</thead>      
		</table>
		</div>   	
	</body>
</html>