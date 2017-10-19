<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'west',border:true" class="easyui-panel" 
  					style="width: 800px">
  				<input type="hidden" id="companyId"  />				
  					<table id="areaList" calss="form" style="margin-left:20px;margin-top:20px;border-collapse:separate; border-spacing:10px 10px;">
		  				<tr>
							<td class="form-label" align="right">专业：</td>
							<td class="form-control" ><input id="dMajorId"
								 class="easyui-combobox"
								data-options="required:true" style="width:250px"></td>	
								<td class="form-label" align="right">名称：</td>
							<td class="form-control"><input id="majorDirectName" 
								 class="easyui-textbox"
								data-options="required:true,multiple:true" style="width:250px"></td>
						</tr>
  				</table>
  				<table style="margin-left:20px;margin-top:20px;">
  					<tr style="width:800px">
							<td class="form-label" align="right">描述：</td>
							<td>
								<input class="easyui-textbox" name="majorDirectDesc"  id="majorDirectDesc" data-options="multiline:true" style="height:100px;width:600px"/>
							</td>
						</tr>	
  				</table>
  				</div>
  				</div>	
  	<script type="text/javascript">
	  	function doInit(dialog){
	  		initCobbobox()
	  	}
	  	function initCobbobox(){
	  		$('#dMajorId').combobox({    
	  		    url:'major/initMajor',    
	  		    valueField:'id',    
	  		    textField:'text'   
	  		});  
	  	}
	  	function doSave(dialog){
	  		if(!vailNull()){
	  			$.messager.alert('提示','请填写必填项!','warning');
	  			return
	  		}
  			$.ajax({
  				type : "POST",
  				//提交的网址
  				url : "majorDirect/add",
  				datatype:"json",
  				//提交的数据
  				data :{
  					"data":JSON.stringify({
  						"dMajorId":$('#dMajorId').combobox('getValue'),
  						"majorDirectName":$('#majorDirectName').textbox('getValue'),
  						"majorDirectDesc":$('#majorDirectDesc').textbox('getValue'),
  		 				
  						})					
  					},
  				//成功返回之后调用的函数             
  				success : function(data) {
  						$.messager.alert('提示','保存成功!','warning');
  						initGrid('','1','10') ;
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
	 
	  	function vailNull(){        
			var dMajorId =$('#dMajorId').textbox('getValue')  ? true : false;
			var majorDirectName=$('#majorDirectName').textbox('getValue')  ? true : false;
			var majorDirectDesc=$('#majorDirectDesc').textbox('getValue')  ? true : false;
			return (dMajorId && majorDirectName && majorDirectDesc);
		}
  	</script>
