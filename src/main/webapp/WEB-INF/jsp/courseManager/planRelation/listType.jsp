<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="easyui-layout" data-options="fit:true">
	<table id="listType" data-options="region:'center',rownumbers:true,singleSelect:false" class="easyui-datagrid">
	
			<thead>
				<tr>  
					<th data-options="field:'ctypeId',halign:'center',align:'center',width:120,hidden:true">courseId</th>
					<th data-options="field:'ctypeName',halign:'center',align:'center',width:120">类型名称</th>
					<th data-options="field:'ctypeDesc',halign:'center',align:'center',width:120">类型描述</th>
						<!-- <th data-options="field:'caozuo',halign:'center',align:'center',width:200,formatter:foeDel">操作</th> -->
				</tr>
			</thead>      
		</table>
  				</div>	
  	<script type="text/javascript">
	var selected ;
	var row;
	var type ;
  	function doInit(dialog){
  		selected = dialog.getData("node");
  		type =dialog.getData("type");
  		row = dialog.getData("row");
  		initdatagrid();
  	}
  function initdatagrid(){
	  $.ajax({
			url:'courseType/allType',
			type:'POST',
			dataType:'json',
			data:{
			},
			success:function(data){
				$("#listType").datagrid("loadData",data.data);
			}
		});
	}
  	function doSave(dialog){
  		var allChosoe = $("#listType").datagrid("getSelections")
  		for(var i=0;i<allChosoe.length;i++ ){
  			$.ajax({
  				type : "POST",
  				//提交的网址
  				url : "planRelation/add",
  				datatype:"json",
  				//提交的数据
  				data :{
  					"data":JSON.stringify({
  						"prPid":selected.prId,
  						"prName":allChosoe[i].ctypeName,
  						"prType":type,
  						"otherId":allChosoe[i].ctypeId,
  						"prDegree":parseInt(selected.prDegree)+1,
  						"majorId":row.majorId
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
