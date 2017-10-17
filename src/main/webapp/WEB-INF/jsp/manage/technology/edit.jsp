<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'west',border:true" class="easyui-panel" 
  					style="width: 800px">
  				<input type="hidden" id="companyId"  />				
  					<table id="areaList" calss="form" style="margin-left:20px;margin-top:20px;border-collapse:separate; border-spacing:10px 10px;">
		  				<tr>
							<td class="form-label" align="right">技术名称：</td>
							<td class="form-control" ><input id="technologyName"
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
							<td class="form-label" align="right">技术与信息：</td>
							<td class="form-control"><input id="technologyInfo"
								 class="easyui-textbox"  
								data-options="required:true" style="width:250px">				
						</tr>

  				</table>
  				<table style="margin-left:20px;margin-top:20px;">
  					<tr style="width:800px">
							<td class="form-label" align="right">技术备注描述：</td>
							<td>
								<input class="easyui-textbox" name="positionDesc"  id="technologyRemake" data-options="multiline:true" style="height:100px;width:600px"/>
							</td>
						</tr>	
  				</table>
  				</div>
  	</div>
  	<script type="text/javascript">
  		var selected ;
	  	function doInit(dialog){
	  		selected= dialog.getData("selected");
	  		$('#technologyName').textbox('setValue',selected.technologyName);
	  		$('#technologyInfo').textbox('setValue',selected.technologyInfo);
	  		$('#technologyRemake').textbox('setValue',selected.technologyRemake);
	  	}
  		
  		function doSave(dialog){
  			if(!vailNull()){
	  			$.messager.alert('提示','请填写必填项!','warning');
	  			return
	  		}
  			$.ajax({
  				type : "POST",
  				//提交的网址
  				url : "technology/edit",
  				datatype:"json",
  				//提交的数据
  				data :{
  					"data":JSON.stringify({
  						"technologyId":selected.technologyId,
  						"technologyName":$('#technologyName').textbox('getValue'),
  		 				"technologyInfo": $("#technologyInfo").textbox('getValue'),
  		 				"technologyRemake":$("#technologyRemake").textbox('getValue')
  						})						
  					},
  				//成功返回之后调用的函数             
  				success : function(data) {
  					if(data.meta.success){
  						$.messager.alert('提示','修改成功!','info');
  						initGrid('','1','10') ;
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
  		function vailNull(){        
			var technologyName =$('#technologyName').textbox('getValue')  ? true : false;
			var technologyInfo=$('#technologyInfo').textbox('getValue')  ? true : false;
			var positionDesc=$('#technologyRemake').textbox('getValue')  ? true : false;
			return (technologyName && technologyInfo && positionDesc);
		}
  	</script>
