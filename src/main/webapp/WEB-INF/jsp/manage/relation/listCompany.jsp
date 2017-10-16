<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="easyui-layout" data-options="fit:true">
	<table id="listcomp" data-options="region:'center',fit:true,rownumbers:true,singleSelect:false" class="easyui-datagrid">
	
			<thead>
				<tr>  
					<th data-options="field:'companyId',halign:'center',align:'center',width:120,hidden:true">id</th>
					<th data-options="field:'companyName',halign:'center',align:'center',width:120">公司名称</th>
					<th data-options="field:'companyTypeId',halign:'center',align:'center',width:120,hidden:true">公司类型id</th>
					<th data-options="field:'typeName',halign:'center',align:'center',width:120">公司类型</th>
					<th data-options="field:'companyInfo',halign:'center',align:'center',width:120">公司信息</th>
					<th data-options="field:'companyAddress',halign:'center',align:'center',width:120">公司地址</th>	
					<th data-options="field:'companyTel',halign:'center',align:'center',width:120">公司电话</th>
					<th data-options="field:'companyUrl',halign:'center',align:'center',width:120">公司网址</th>
					<th data-options="field:'companySize',halign:'center',align:'center',width:120">公司规模</th>
					<th data-options="field:'companyBusiness',halign:'center',align:'center',width:120">公司业务</th>
					<th data-options="field:'companyAptitude',halign:'center',align:'center',width:120">公司资质</th>
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
  		initdatagrid();
  	}
  	function initdatagrid(companyName){
	$.ajax({
		url:'company/allCompany',
		type:'GET',
		dataType:'json',
		data:{
			companyName:companyName
		},
		success:function(data){
			$("#listcomp").datagrid("loadData",data);
		}
	});
}
  	function doChoose(dialog){
  		var allChosoe = $("#listcomp").datagrid("getSelections");
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
  						"relationRes":allChosoe[i].companyName,
  		 				"relationRemain":allChosoe[i].companyBusiness,
  		 				"relationRemake":allChosoe[i].companyInfo,
  		 				"relationType":type,
  		 				"relationPid":'0',
  		 				"otherId":allChosoe[i].companyId,
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
