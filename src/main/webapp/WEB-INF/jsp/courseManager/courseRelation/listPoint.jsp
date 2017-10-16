<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="easyui-layout" data-options="fit:true">
	<table id="listPoint" data-options="fit:true,region:'center',rownumbers:true,singleSelect:true" class="easyui-datagrid">
			<thead>
				<tr>  
					<th data-options="field:'pointId',halign:'center',align:'center',width:120,hidden:true">id</th>
					<th data-options="field:'unitName',halign:'center',align:'center',width:120">单元</th>
					<th data-options="field:'pointName',halign:'center',align:'center',width:120">知识点名称</th>
					<th data-options="field:'pointContent',halign:'center',align:'center',width:120">知识点内容</th>
					<th data-options="field:'pointRemake',halign:'center',align:'center',width:120">备注</th>
					</tr>
			</thead>      
		</table>
  				</div>	
  	<script type="text/javascript">
  	var node ;
  	var srOtherId ;
  	var srType ;
  	function doInit(dialog){		
  		node = dialog.getData("node");
  		initdatagrid();
  	}
  	function initdatagrid(srOtherId){
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
  		var node = $("#listPoint").datagrid("getSelected");
  		var pointName = node.pointName ;
  		$('#srName').textbox("setValue",pointName);
  		$('#srType').textbox("setValue",'知识点');
  		$('#srRemake').textbox('setValue',node.pointRemake);
  		srOtherId = node.pointId ;
  		srType = '3';
  		dialog.close();
  	}
  	</script>
