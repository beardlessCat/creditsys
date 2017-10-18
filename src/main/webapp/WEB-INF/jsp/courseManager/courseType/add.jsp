<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'west',border:true" class="easyui-panel" 
  					style="width: 800px">
  				<input type="hidden" id="companyId"  />				
  					<table id="areaList" calss="form" style="margin-left:20px;margin-top:20px;border-collapse:separate; border-spacing:10px 10px;">
		  				<tr>
							<td class="form-label" align="right">名称：</td>
							<td class="form-control" ><input id="ctypeName"
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
								<td class="form-label" align="right">描述：</td>
							<td class="form-control"><input id="ctypeDesc" 
								 class="easyui-textbox"
								data-options="required:true,multiple:true" style="width:250px"></td>
						</tr>
  				</table>
  				</div>
  				</div>	
  	<script type="text/javascript">
	  	function doInit(dialog){
	  	}
	  
	  	function doSave(dialog){
  			$.ajax({
  				type : "POST",
  				//提交的网址
  				url : "courseType/add",
  				datatype:"json",
  				//提交的数据
  				data :{
  					"data":JSON.stringify({
  						"ctypeName":$('#ctypeName').textbox('getValue'),
  						"ctypeDesc":$('#ctypeDesc').textbox('getValue'),
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
			var projectName =$('#projectName').textbox('getValue')  ? true : false;
			var state=$('#state').combobox('getValue')  ? true : false;
			var dept=$('#dept').combotree('getValue')  ? true : false;
			var creator=$('#creator').textbox('getValue')  ? true : false;
			var createTime=$('#createTime').textbox('getValue')  ? true : false;
			var mapParam=$('#mapParam').textbox('getValue')  ? true : false;
			return (projectName && state && dept && creator && createTime && mapParam );
		}
  	</script>
