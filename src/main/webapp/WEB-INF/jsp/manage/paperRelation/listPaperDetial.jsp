<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="easyui-layout" data-options="fit:true">
	<table id="listDetial" data-options="region:'center',rownumbers:true,singleSelect:true" class="easyui-datagrid">
			<thead>
				<tr>  
					<th data-options="field:'detialId',halign:'center',align:'center',width:120,hidden:true">id</th>
					<th data-options="field:'paperName',halign:'center',align:'center',width:120">试卷</th>
					<th data-options="field:'detialName',halign:'center',align:'center',width:120">题目名称</th>
					<th data-options="field:'detialType',halign:'center',align:'center',width:120">题目类型</th>
					<th data-options="field:'detialDesc',halign:'center',align:'center',width:120">题目描述</th>
					<th data-options="field:'detialResult',halign:'center',align:'center',width:120">题目分值</th>
					<th data-options="field:'detialDegree',halign:'center',align:'center',width:120">难度</th>
				</tr>
			</thead>      
		</table>
  				</div>	
  	<script type="text/javascript">
  	$(function(){
  		initdatagrid();
  	})
  	
  function initdatagrid(companyName){
	$.ajax({
		url:'paperDetial/allData',
		type:'POST',
		dataType:'json',
		success:function(data){
			$("#listDetial").datagrid("loadData",data.data);
		}
	});
}
  	function doChoose(dialog){
  		var node = $("#listDetial").datagrid("getSelected")
  		$('#prName').textbox("setValue",node.detialName);
  		$('#prType').textbox("setValue",node.detialType);
  		$('#prDesc').textbox('setValue',node.detialDesc);
  		$('#prScore').textbox("setValue",node.detialResult);
  		$('#prRate').textbox("setValue",node.detialRate);
  		$('#prHard').textbox("setValue",node.detialDegree);
  		otherId = node.detialId;
  		dialog.close();
  	}
  	</script>
