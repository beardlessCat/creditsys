<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="easyui-layout" data-options="fit:true">
	<table id="listTh" data-options="region:'center',fit:true,rownumbers:true,singleSelect:false" class="easyui-datagrid">
			<thead>
				<tr>  
					<th data-options="field:'technologyId',halign:'center',align:'center',width:120,hidden:true">id</th>
					<th data-options="field:'technologyName',halign:'center',align:'center',width:120">技术名称</th>
					<th data-options="field:'technologyInfo',halign:'center',align:'center',width:120">技术信息</th>
					<th data-options="field:'technologyRemake',halign:'center',align:'center',width:120">备注</th>
				</tr>
			</thead>      
		</table>
</div>	
<script type="text/javascript">
var selected ;
var type ;
function doInit(dialog){
	type =dialog.getData("type");
	selected = dialog.getData("selected");
	initGrid('','1','1000') ;
}
function initGrid(technologyName, pageNumber, pageSize) {
	if(pageNumber==null||pageNumber==""){
		pageNumber = "1" ;
	}
	if(pageSize==null||pageSize==""){
		pageSize = "10" ;
	}
	var jsonData = JSON.stringify({
		'technologyName':technologyName ,
		'pageNumber' : pageNumber,
		'pageSize' : pageSize
	});
	initDataGrid('listTh', 'technology/allTechnology', 'POST', 'json', jsonData);
}

function doChoose(dialog){
	var allChosoe = $("#listTh").datagrid("getSelections");
	if(allChosoe==null){
		return
	}
	for(var i=0;i<allChosoe.length;i++ ){
		$.ajax({
			type : "POST",
			//提交的网址
			url : "relation/addCompanys",
			datatype:"json",
			//提交的数据
			data :{
				"data":JSON.stringify({
					"relationRes":allChosoe[i].technologyName,
	 				"relationRemain":allChosoe[i].technologyInfo,
	 				"relationRemake":allChosoe[i].technologyRemake,
	 				"relationType":type,
	 				"relationPid":selected.relationId,
	 				"otherId":allChosoe[i].technologyId,
					})					
				},
			//成功返回之后调用的函数             
			success : function(data) {
				if(data.meta.success){
					$.messager.alert('提示','保存成功!','warning');
					initTree(); 
					dialog.close();
	               }else{
	                   $.messager.alert('error', 'error');
	               }
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
