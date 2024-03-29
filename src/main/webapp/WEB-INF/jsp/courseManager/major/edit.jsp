<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'west',border:true" class="easyui-panel" 
  					style="width: 800px">
  				<input type="hidden" id="id"  />				
  					<table id="areaList" calss="form" style="margin-left:20px;margin-top:20px;border-collapse:separate; border-spacing:10px 10px;">
		  				<tr>
							<td class="form-label" align="right">专业代码：</td>
							<td class="form-control" ><input id="majorCode"
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
								<td class="form-label" align="right">所属学院：</td>
							<td class="form-control"><input id="majorAcademy" 
								 class="easyui-combobox"
								data-options="required:true" style="width:250px"></td>
						</tr>
						<tr>
							<td class="form-label" align="right">专业名称：</td> 
							<td class="form-control"><input id="majorName" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
								<td class="form-label" align="right">英文名称：</td>
							<td class="form-control"><input id="majorEnglishName" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>
						</tr> 
						<tr >
							<td class="form-label" align="right">学制：</td> 
							<td class="form-control"><input id="majorLength" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
								 <td class="form-label" align="right">学位：</td>
								<td class="form-control"><input id="majorDegree"
								 class="easyui-textbox"  
								data-options="required:true" style="width:250px">	
						</tr> 
						<tr >
							<td class="form-label" align="right">专业目标：</td> 
							<td class="form-control"><input id="majorPurpose" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
								<td class="form-label" align="right">专业条件：</td>
							<td class="form-control"><input id="majorCondition" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>
						</tr> 
  				</table>
  				<table style="margin-left:20px;margin-top:20px;">
  					<tr style="width:800px">
							<td class="form-label" align="right">专业概述：</td>
							<td>
								<input class="easyui-textbox" name="majorOverview"  id="majorOverview" data-options="multiline:true" style="height:100px;width:600px"/>
							</td>
						</tr>	
  				</table>
  				</div>
  	</div>
  	<script type="text/javascript">
  		var selected ;
  		var majorId;
	  	function doInit(dialog){
	  		commonComboTree('majorAcademy','sysDept/initDeptTree')	; 
	  		selected= dialog.getData("selected");
	  		majorId=selected.majorId;
	  		$('#majorCode').textbox('setValue',selected.majorCode);
	  		$('#majorName').textbox('setValue',selected.majorName);
	  		$('#majorEnglishName').textbox('setValue',selected.majorEnglishName);
	  		$('#majorAcademy').combobox('setValue',selected.majorAcademy);
	  		$('#majorLength').textbox('setValue',selected.majorLength);
	  		$('#majorDegree').textbox('setValue',selected.majorDegree);
			$('#majorPurpose').textbox('setValue',selected.majorPurpose);
			$('#majorCondition').textbox('setValue',selected.majorCondition);
			$('#majorOverview').textbox('setValue',selected.majorOverview);
	  	}
  		function doSave(dialog){ 
  			if(!vailNull()){
  				$.messager.alert('提示','请填写必填项!','warning');
  				return
  			}
  			$.ajax({
  				type : "POST",
  				//提交的网址
  				url : "major/edit",
  				datatype:"json",
  				//提交的数据
  				data :{
  					"data":JSON.stringify({
  	  					"majorId":majorId,
  						"majorCode":$('#majorCode').textbox('getValue'),
  		 				"majorName": $("#majorName").textbox("getValue"),
  						"majorEnglishName":$('#majorEnglishName').textbox('getValue'),
  						"majorLength":$('#majorLength').textbox('getValue'),
  						"majorDegree":$('#majorDegree').textbox('getValue'),
  						"majorAcademy":$('#majorAcademy').combobox('getValue'),
  						"majorPurpose":$('#majorPurpose').textbox('getValue'),
  						"majorCondition":$('#majorCondition').textbox('getValue'),
  						"majorOverview":$('#majorOverview').textbox('getValue')
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
			var majorCode =$('#majorCode').textbox('getValue')  ? true : false;
			var majorName=$('#majorName').textbox('getValue')  ? true : false;
			var majorEnglishName=$('#majorEnglishName').textbox('getValue')  ? true : false;
			var majorLength=$('#majorLength').textbox('getValue')  ? true : false;
			var majorDegree=$('#majorDegree').textbox('getValue')  ? true : false;
			var majorAcademy=$('#majorAcademy').textbox('getValue')  ? true : false;
			var majorPurpose=$('#majorPurpose').textbox('getValue')  ? true : false;
			var majorCondition=$('#majorCondition').textbox('getValue')  ? true : false;
			var majorOverview=$('#majorOverview').textbox('getValue')  ? true : false;
			return (majorCode && majorName && majorEnglishName && majorLength && majorDegree && majorAcademy && majorPurpose && majorCondition && majorOverview);
		}
  	</script>
