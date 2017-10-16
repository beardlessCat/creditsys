<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'west',border:true" class="easyui-panel" 
  					style="width: 800px">
  				<input type="hidden" id="companyId"  />				
  					<table id="areaList" calss="form" style="margin-left:20px;margin-top:20px;border-collapse:separate; border-spacing:10px 10px;">
		  				<tr>
							<td class="form-label" align="right">公司名称：</td>
							<td class="form-control" ><input id="companyName"
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
								<td class="form-label" align="right">公司类型：</td>
							<td class="form-control"><input id="companyTypeId" 
								 class="easyui-combobox"
								data-options="required:true" style="width:250px"></td>
										
						</tr>
						<tr >
							<td class="form-label" align="right">公司电话：</td> 
							<td class="form-control"><input id="companyTel" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
								<td class="form-label" align="right">公司网址：</td>
							<td class="form-control"><input id="companyUrl" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>
						</tr> 
						<tr >
							<td class="form-label" align="right">公司规模：</td> 
							<td class="form-control"><input id="companySize" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
								 <td class="form-label" align="right">公司地址：</td>
								<td class="form-control"><input id="companyAddress"
								 class="easyui-textbox"  
								data-options="required:true" style="width:250px">	
						</tr> 
						<tr >
							<td class="form-label" align="right">公司资质：</td> 
							<td class="form-control"><input id="companyAptitude" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
								<td class="form-label" align="right">公司业务：</td>
							<td class="form-control"><input id="companyBusiness" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>
						</tr> 
  				</table>
  				<table style="margin-left:20px;margin-top:20px;">
  					<tr style="width:800px">
							<td class="form-label" align="right">公司详情：</td>
							<td>
								<input class="easyui-textbox" name="companyInfo"  id="companyInfo" data-options="multiline:true" style="height:100px;width:600px"/>
							</td>
						</tr>	
  				</table>
  				</div>
  				</div>	
  	<script type="text/javascript">

	  	function doInit(dialog){
	  		initCobbobox() ;
	  	}
	  	//初始化类型下拉框
	  	function initCobbobox(){
	  		$('#companyTypeId').combobox({    
	  		    url:'companyType/initType',    
	  		    valueField:'id',    
	  		    textField:'text'   
	  		});  
	  	}
	  	function doSave(dialog){
	  		if(vailNull()){
	  			$.ajax({
	  				type : "POST",
	  				//提交的网址
	  				url : "company/add",
	  				datatype:"json",
	  				//提交的数据
	  				data :{
	  					"data":JSON.stringify({
	  						"companyName":$('#companyName').textbox('getValue'),
	  		 				"companyAddress": $("#companyAddress").textbox("getValue"),
	  						"companyTel":$('#companyTel').textbox('getValue'),
	  						"companyUrl":$('#companyUrl').textbox('getValue'),
	  						"companyInfo":$('#companyInfo').textbox('getValue'),
	  						"companySize":$('#companySize').textbox('getValue'),
	  						"companyTypeId":$('#companyTypeId').combobox('getValue'),
	  						"companyAptitude":$('#companyAptitude').textbox('getValue'),
	  						"companyBusiness":$('#companyBusiness').textbox('getValue'),
	  						})					
	  					},
	  				//成功返回之后调用的函数             
	  				success : function(data) {
	  					if(data.meta.success){
	  						$.messager.alert('提示','保存成功!','warning');
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
	  		}else{
	  			$.messager.alert('提示','请填写必填项!','warning');
	  			}
  			
  		}
	  	function vailNull(){        
			var companyName =$('#companyName').textbox('getValue')  ? true : false;
			var companyTypeId=$('#companyTypeId').combobox('getValue')  ? true : false;
			var companyTel=$('#companyTel').textbox('getValue')  ? true : false;
			var companyUrl=$('#companyUrl').textbox('getValue')  ? true : false;
			var companySize=$('#companySize').textbox('getValue')  ? true : false;
			var companyAddress=$('#companyAddress').textbox('getValue')  ? true : false;
			var companyAptitude=$('#companyAptitude').textbox('getValue')  ? true : false;
			var companyBusiness=$('#companyBusiness').textbox('getValue')  ? true : false;
			var companyInfo=$('#companyInfo').textbox('getValue')  ? true : false;
			return (companyName && companyTypeId && companyTel && companyUrl && companySize && companyAddress && companyAptitude  && companyAddress && companyBusiness && companyInfo );
		}
  	</script>
