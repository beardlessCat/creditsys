<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="easyui-layout" data-options="fit:true">
	<table id="listDetial" data-options="region:'center',rownumbers:true,singleSelect:true" class="easyui-datagrid" pagination="true">
			<thead>
				<tr>  
					<th data-options="field:'detialId',halign:'center',align:'center',width:120,hidden:true">id</th>
					<th data-options="field:'paperName',halign:'center',align:'center',width:120">试卷</th>
					<!-- <th data-options="field:'detialName',halign:'center',align:'center',width:120">题目名称</th> -->
					<th data-options="field:'detialType',halign:'center',align:'center',width:120">题目类型</th>
					<th data-options="field:'detialDesc',halign:'center',align:'center',width:360">题目描述</th>
					<th data-options="field:'detialResult',halign:'center',align:'center',width:120">题目分值</th>
					<th data-options="field:'detialDegree',halign:'center',align:'center',width:120">难度</th>
				</tr>
			</thead>      
		</table>
  				</div>	
  	<script type="text/javascript">
  	$(function(){
  		initGrid('','1','1000') ;
  	}) ;
  	function initGrid(coursePaperId, pageNumber, pageSize) {
		if(pageNumber==null||pageNumber==""){
			pageNumber = "1" ;
		}
		if(pageSize==null||pageSize==""){
			pageSize = "10" ;
		}
		var jsonData = JSON.stringify({
			'pageNumber' : pageNumber,
			'pageSize' : pageSize
		});
		initDataGrid('listDetial', 'paperDetial/allData', 'POST', 'json', jsonData);
	}
  	function doChoose(dialog){
  		var node = $("#listDetial").datagrid("getSelected") ;
  //		$('#prName').textbox("setValue",node.detialName);
  		$('#prType').textbox("setValue",node.detialType);
  		$('#prDesc').textbox('setValue',node.detialDesc);
  		$('#prScore').textbox("setValue",node.detialResult);
  		$('#prRate').textbox("setValue",node.detialRate);
  		$('#prHard').textbox("setValue",node.detialDegree);
  		otherId = node.detialId;
  		dialog.close();
  	}
  	</script>
