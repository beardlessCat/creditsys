<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="easyui-layout" data-options="fit:true">
	<table id="listUnit" data-options="fit:true,region:'center',rownumbers:true,singleSelect:true" class="easyui-datagrid">
			<thead>
				<tr>  
					<th data-options="field:'unitId',halign:'center',align:'center',width:120,hidden:true">id</th>
					<th data-options="field:'unitName',halign:'center',align:'center',width:120">单元名称</th>
					<th data-options="field:'unitContent',halign:'center',align:'center',width:120">单元内容</th>
					<th data-options="field:'unitRemake',halign:'center',align:'center',width:120">备注</th>
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
  			url:'unit/allUnit',
  			type:'POST',
  			data:{
  				
  			},
  			dataType:'json',
		success:function(data){
			$("#listUnit").datagrid("loadData",data.data);
		}
	});
}
  	function doChoose(dialog){
  		var node = $("#listUnit").datagrid("getSelected");
  		var unitName = node.unitName ;
  		$('#srName').textbox("setValue",unitName);
  		$('#srType').textbox("setValue",'单元');
  		$('#srRemake').textbox('setValue',node.unitRemake);
  		srOtherId = node.unitId ;
  		srType = '2';
  		dialog.close();
  	}
  	</script>
