<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'west',border:true" class="easyui-panel" 
  					style="width: 800px">
  				<input type="hidden" id="id"  />				
  					<table id="areaList" calss="form" style="margin-left:20px;margin-top:20px;border-collapse:separate; border-spacing:10px 10px;">
		  				<tr>
							<td class="form-label" align="right">题目名称：</td>
							<td class="form-control" ><input id="detialName"
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
							<td class="form-label" align="right">试卷：</td>
							<td class="form-control"><input id="paperName"
								 class="easyui-combobox"  
								data-options="required:true" style="width:250px">				
						</tr>
					<tr>
							<td class="form-label" align="right">题目类型：</td>
							<td class="form-control" ><input id="detialType"
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
							<td class="form-label" align="right">题目分值：</td>
							<td class="form-control"><input id="detialResult"
								 class="easyui-textbox"  
								data-options="required:true" style="width:250px">				
						</tr>
						<tr>
<!-- 							<td class="form-label" align="right">得分率：</td>
							<td class="form-control" ><input id="detialRate"
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
 -->						<td class="form-label" align="right">题目描述：</td>
							<td class="form-control" ><input id="detialDesc"
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>			
 							<td class="form-label" align="right">题目难度：</td>
							<td class="form-control"><input id="detialDegree"
								 class="easyui-textbox"  
								data-options="required:true" style="width:250px">				
						</tr>
						<!-- <tr>
							<td class="form-label" align="right">题目描述：</td>
							<td class="form-control" ><input id="detialDesc"
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>				
						</tr> -->
  				</table>
  				</div>
  	</div>
  	<script type="text/javascript">
  		var selected ;
	  	function doInit(dialog){
	  		initCobbobox();
	  		selected= dialog.getData("selected");
	  		$('#detialName').textbox('setValue',selected.detialName);
	  		$('#paperName').combobox('setValue',selected.detialPaperId);
	  		$('#detialType').textbox('setValue',selected.detialType);
	  		$('#detialResult').textbox('setValue',selected.detialResult);
	  		/* $('#detialRate').textbox('setValue',selected.detialRate); */
	  		$('#detialDegree').textbox('setValue',selected.detialDegree);
	  		$('#detialDesc').textbox('setValue',selected.detialDesc);
	  	}
	  	function initCobbobox(){
	  		$('#paperName').combobox({    
	  		    url:'paper/initCobbobox',    
	  		    valueField:'id',    
	  		    textField:'text'   
	  		});  
	  	}
  		function doSave(dialog){
  			$.ajax({
  				type : "POST",
  				//提交的网址
  				url : "paperDetial/edit",
  				datatype:"json",
  				//提交的数据
  				data :{
  					"data":JSON.stringify({
  						"detialId":selected.detialId,
  						"detialName":$('#detialName').textbox('getValue'),
  		 				"detialPaperId": $("#paperName").combobox('getValue'),
  		 				"detialType":$('#detialType').textbox('getValue'),
  		 				"detialResult": $("#detialResult").textbox('getValue'),
  		 				/* "detialRate":$('#detialRate').textbox('getValue'), */
  		 				"detialDegree": $("#detialDegree").textbox('getValue'),
  		 				"detialDesc":$('#detialDesc').textbox('getValue')
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
  	</script>
