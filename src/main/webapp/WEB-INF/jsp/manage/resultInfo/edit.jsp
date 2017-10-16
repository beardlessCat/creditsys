<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'west',border:true" class="easyui-panel" 
  					style="width: 800px">
  				<input type="hidden" id="id"  />				
  					<table id="areaList" calss="form" style="margin-left:20px;margin-top:20px;border-collapse:separate; border-spacing:10px 10px;">
		  				<tr>
							<td class="form-label" align="right">选择试卷：</td>
							<td class="form-control" ><input id="paperId"
								 class="easyui-combobox"
								data-options="required:true" style="width:250px"></td>	
								<td class="form-label" align="right">考试学生：</td>
							<td class="form-control"><input id="userId" 
								 class="easyui-combobox"
								data-options="required:true" style="width:250px"></td>
										
						</tr>
						<tr >
							<td class="form-label" align="right">试卷成绩：</td> 
							<td class="form-control"><input id="riResult" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
								<td class="form-label" align="right">排名百分比：</td>
							<td class="form-control"><input id="riRate" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>
						</tr> 
  				</table>
  				</div>
  	</div>
  	<script type="text/javascript">
  		var selected ;
	  	function doInit(dialog){
	  		initUsercombo();
	  		initComBoBox();
	  		selected= dialog.getData("selected");
	  		$('#paperId').textbox('setValue',selected.riPaperId);
	  		$('#userId').textbox('setValue',selected.riUserId);
	  		$('#riResult').textbox('setValue',selected.riResult);
	  		$('#riRate').textbox('setValue',selected.riRate);
	  	}
		function initUsercombo(){
  			$('#userId').combobox({    
  			    url:'user/initCobbobox',    
  			    valueField:'id',    
  			    textField:'text'   
  			});  
  			}
  	function initComBoBox(){
  		$('#paperId').combobox({    
  			    url:'paper/initCobbobox',    
  			    valueField:'id',    
  			    textField:'text'   
  			});  
  	}
  		function doSave(dialog){
  			$.ajax({
  				type : "POST",
  				//提交的网址
  				url : "resultInfo/edit",
  				datatype:"json",
  				//提交的数据
  				data :{
  					"data":JSON.stringify({
  						"resultId":selected.resultId,
  						"riPaperId":$('#paperId').combobox('getValue'),
  		 				"riUserId": $("#userId").combobox("getValue"),
  						"riResult":$('#riResult').textbox('getValue'),
  						"riRate":$('#riRate').textbox('getValue')	
  						})						
  					},
  				//成功返回之后调用的函数             
  				success : function(data) {
  					if(data.meta.success){
  						$.messager.alert('提示','修改成功!','info');
  						initdatagrid();
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
