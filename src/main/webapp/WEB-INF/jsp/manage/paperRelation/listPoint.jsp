<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="easyui-layout" data-options="fit:true">
	<table id="listPoint" data-options="region:'center',rownumbers:true,singleSelect:true" class="easyui-datagrid">
	
			<thead>
				<tr>  
					<th data-options="field:'pointUnitId',halign:'center',align:'center',width:120">单元id</th>
					<th data-options="field:'pointName',halign:'center',align:'center',width:120">知识点名称</th>
					<th data-options="field:'pointContent',halign:'center',align:'center',width:120">知识点内容</th>
					<th data-options="field:'pointRemake',halign:'center',align:'center',width:120">备注</th>
					<!-- <th data-options="field:'caozuo',halign:'center',align:'center',width:200,formatter:foeDel">操作</th> -->
				</tr>
			</thead>      
		</table>
  				</div>	
  	<script type="text/javascript">
	var selected ;
	var otherIdj;
  	function doInits(dialog){
  		selected = dialog.getData("node");
  		console.log('pr'+pr)
  		console.log('node'+selected)
  		initdatagrid();
  	}
  function initdatagrid(){
  		$.ajax({
  			url:'point/allPoint',
  			type:'POST',
  			dataType:'json',
  			data:{
  			},
  			success:function(data){
  				$("#listPoint").datagrid("loadData",data.data);
  			}
  		});
	}
  	function doChoose(dialog){
  		var node = $("#listPoint").datagrid("getSelected")  		
  		$('#prName').textbox("setValue",node.pointName);
  		$('#prType').textbox("setValue",'知识点');
  		otherId = node.pointId;
  		dialog.close();
  	}
  	</script>
