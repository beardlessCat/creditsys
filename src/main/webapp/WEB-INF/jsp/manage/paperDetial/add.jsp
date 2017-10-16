<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'west',border:true" class="easyui-panel" 
  					style="width: 800px">
  				<input type="hidden" id="companyId"  />				
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
							<!-- <td class="form-label" align="right">得分率：</td>
							<td class="form-control" ><input id="detialRate"
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	 -->
								<td class="form-label" align="right">题目描述：</td>
							<td class="form-control" ><input id="detialDesc"
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
							<td class="form-label" align="right">题目难度：</td>
							<td class="form-control"><input id="detialDegree"
								 class="easyui-textbox"  
								data-options="required:true" style="width:250px">				
						</tr>
					
  				</table>
  				</div>
  				</div>	
  	<script type="text/javascript">

	  	function doInit(dialog){
	  		initCobbobox();
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
  				url : "paperDetial/add",
  				datatype:"json",
  				//提交的数据
  				data :{
  					"data":JSON.stringify({
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
