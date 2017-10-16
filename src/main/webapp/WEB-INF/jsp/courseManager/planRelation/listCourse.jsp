<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="easyui-layout" data-options="fit:true">
	<table id="listCourse" data-options="region:'center',fit:true,rownumbers:true,singleSelect:false" class="easyui-datagrid">
	
			<thead>
				<tr>  
					<th data-options="field:'courseId',halign:'center',align:'center',width:120,hidden:true">courseId</th>
					<th data-options="field:'courseCode',halign:'center',align:'center',width:120">课程代码</th>
					<th data-options="field:'courseName',halign:'center',align:'center',width:120">课程名称</th>
					<th data-options="field:'coursePeriod',halign:'center',align:'center',width:120">课时</th>
					<th data-options="field:'courseRequire',halign:'center',align:'center',width:120">课程要求</th>
					<th data-options="field:'courseScore',halign:'center',align:'center',width:120">成绩构成</th>	
					<th data-options="field:'courseForm',halign:'center',align:'center',width:120">考试形式</th>
					<th data-options="field:'courseRefer',halign:'center',align:'center',width:120">参考教材</th>
					<th data-options="field:'courseFeed',halign:'center',align:'center',width:120">课程反馈</th>
					<th data-options="field:'courseCredit',halign:'center',align:'center',width:120">学分</th>
					<th data-options="field:'courseChecked',halign:'center',align:'center',width:120">考核方式</th>
					<th data-options="field:'pdLesson',halign:'center',align:'center',width:120">讲课学时</th>
					<th data-options="field:'plLesson',halign:'center',align:'center',width:120">上机学时</th>
					<th data-options="field:'courseProperty',halign:'center',align:'center',width:120">课程属性</th>
					<th data-options="field:'pdTest',halign:'center',align:'center',width:120">实验学时</th>
					<!-- <th data-options="field:'caozuo',halign:'center',align:'center',width:200,formatter:foeDel">操作</th> -->
				</tr>
			</thead>      
		</table>
  				</div>	
  	<script type="text/javascript">
	var selected ;
	var type ;
	var row;
  	function doInit(dialog){
  		selected = dialog.getData("node");
  		type =dialog.getData("type");
  		row = dialog.getData("row");
  		initdatagrid();
  	}
  function initdatagrid(){
	  $.ajax({
			url:'course/allCourse',
			type:'POST',
			dataType:'json',
			data:{
			},
			success:function(data){
				$("#listCourse").datagrid("loadData",data.data);
			}
		});
	}
  	function doSave(dialog){
  		var allChosoe = $("#listCourse").datagrid("getSelections")
  		for(var i=0;i<allChosoe.length;i++ ){
  			$.ajax({
  				type : "POST",
  				//提交的网址
  				url : "planRelation/addCourse",
  				datatype:"json",
  				//提交的数据
  				data :{
  					"data":JSON.stringify({
  						"prPid":selected.prId,
  						"prName":allChosoe[i].courseName,
  						"prType":type,
  						"otherId":allChosoe[i].courseId,
  						"prDegree":parseInt(selected.prDegree)+1,
  						"majorId":row.majorId,
  						"prCode":allChosoe[i].courseCode,
  						"prDept":row.majorName,
  						"actualCredit":allChosoe[i].courseCredit,
  						"checkStyle":allChosoe[i].courseForm,
  						"talkPeriod":allChosoe[i].pdLesson,
  						"compPeriod":allChosoe[i].plLesson,
  						"testPeriod":allChosoe[i].pdTest,
  						"ifCharge":"是"
  						
  						})					
  					},
  				//成功返回之后调用的函数             
  				success : function(data) {
  						$.messager.alert('提示','保存成功!','warning');
  						initTree(row.majorId);
  		           		dialog.close();
  				},
  				//调用出错执行的函数
  				error: function(XMLHttpRequest, textStatus, errorThrown) {
  					$.messager.alert('提示','保存失败!','warning');
                    alert(XMLHttpRequest.status);
                    alert(XMLHttpRequest.readyState);
                    alert(textStatus);
                }
  			});
  		}
  	}
  	</script>
