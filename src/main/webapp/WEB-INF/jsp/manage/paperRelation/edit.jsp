<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'west',border:true" class="easyui-panel" 
  					style="width: 800px">
  				<input type="hidden" id="id"  />				
  					<table id="areaList" calss="form" style="margin-left:20px;margin-top:20px;border-collapse:separate; border-spacing:10px 10px;">
		  				<tr>
							<td class="form-label" align="right">名称：</td>
							<td class="form-control" ><input id="prName"
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
							<td class="form-label" align="right">题目类型：</td>
							<td class="form-control" ><input id="prType"
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
						</tr>
						<tr>
							<td class="form-label" align="right">分值：</td>
							<td class="form-control" ><input id="prScore"
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
							<td class="form-label" align="right">难易程度：</td>
							<td class="form-control"><input id="prHard"
								 class="easyui-textbox"  
								data-options="required:true" style="width:250px">				
						</tr>
						<tr>
							<td class="form-label" align="right">得分率：</td>
							<td class="form-control" ><input id="prRate"
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
								<td class="form-label" align="right">资源描述：</td>
							<td class="form-control"><input id="prDesc"
								 class="easyui-textbox"  
								data-options="required:true" style="width:250px">		
						</tr>						
  				</table>
  				</div>
  	</div>
  	<script type="text/javascript">
  		var prId ;
  		var prName;
	  	function doInit(dialog){
	  		prId= dialog.getData("prId");
	  		prName=dialog.getData("prName");
	  		initDiv(prId);
	  	}
  		function initDiv(prId){
  			$.ajax({
  	  			url:'paperRelation/getRealtionById',
  	  			type:'post',
  	  			data:{
  	  				prId:prId
  	  			},            
  	  			success:function(data){
  	  				$("#prName").textbox('setValue',data.data.prName);
  	  				$("#prType").textbox('setValue',data.data.prType);
  	  				$("#prScore").textbox('setValue',data.data.prScore);
  	  				$("#prHard").textbox('setValue',data.data.prHard);
  	  				$("#prRate").textbox('setValue',data.data.prRate);
	  				$("#prDesc").textbox('setValue',data.data.prDesc);
  	  			}
  	  		})
  		}
  		function doSave(dialog){
  			$.ajax({
  				type : "POST",
  				//提交的网址
  				url : "paperRelation/edit",
  				datatype:"json",
  				//提交的数据
  				data :{
  					"data":JSON.stringify({
  						"prId":prId,
  						"prName":$('#prName').textbox('getValue'),
  		 				"prType": $("#prType").textbox("getValue"),
  		 				"prScore":$('#prScore').textbox('getValue'),
  		 				"prHard":$('#prHard').textbox('getValue'),
  		 				"prRate":$('#prRate').textbox('getValue'),
  		 				"prDesc":$('#prDesc').textbox('getValue')
  						})						
  					},
  				//成功返回之后调用的函数             
  				success : function(data) {
  					if(data.meta.success){
  						$.messager.alert('提示','修改成功!','info');
  						initTree(prName);
  						$('#restree').treegrid('expandAll')
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
  	</script>
