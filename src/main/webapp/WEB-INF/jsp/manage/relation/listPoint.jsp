<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="easyui-layout" data-options="fit:true">
	<table id="listPoint" data-options="region:'center',fit:true,rownumbers:true,singleSelect:false" class="easyui-datagrid">
	
			<thead>
				<tr>  
					<th data-options="field:'pointId',halign:'center',align:'center',width:120,hidden:true">id</th>
					<th data-options="field:'pointUnitId',halign:'center',align:'center',width:120,hidden:true">单元id</th>
					<th data-options="field:'pointName',halign:'center',align:'center',width:120">知识点名称</th>
					<th data-options="field:'pointContent',halign:'center',align:'center',width:120">知识点内容</th>
					<th data-options="field:'pointRemake',halign:'center',align:'center',width:120">备注</th>
					<!-- <th data-options="field:'caozuo',halign:'center',align:'center',width:200,formatter:foeDel">操作</th> -->
				</tr>
			</thead>      
		</table>
  				</div>	
  	<script type="text/javascript">
	var type ;
	var selected;
  	function doInit(dialog){
  		type =dialog.getData("type");
  		selected = dialog.getData("selected");
  		initGrid('','1','10') ;
  	}
  	function initGrid(pointName, pageNumber, pageSize) {
  		if(pageNumber==null||pageNumber==""){
  			pageNumber = "1" ;
  		}
  		if(pageSize==null||pageSize==""){
  			pageSize = "10" ;
  		}
  		var jsonData = JSON.stringify({
  			'pointName':pointName ,
  			'pageNumber' : pageNumber,
  			'pageSize' : pageSize
  		});
  		initDataGrid('listPoint', 'point/allPoint', 'POST', 'json', jsonData);
  	}

  	function doChoose(dialog){
  		var allChosoe = $("#listPoint").datagrid("getSelections");
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
  						"relationRes":allChosoe[i].pointName,
  		 				"relationRemain":allChosoe[i].pointContent,
  		 				"relationRemake":allChosoe[i].pointRemake,
  		 				"relationType":type,
  		 				"relationPid":selected.relationId,
  		 				"otherId":allChosoe[i].pointId,
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
