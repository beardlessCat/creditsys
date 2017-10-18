<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'west',border:true" class="easyui-panel" 
  					style="width: 800px">
  				<input type="hidden" id="companyId"  />				
  					<table id="areaList" calss="form" style="margin-left:20px;margin-top:20px;border-collapse:separate; border-spacing:10px 10px;">
		  				<tr>
								<td class="form-label" align="right">知识点名称：</td>
							<td class="form-control"><input id="pointName" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>
							<td class="form-label" align="right">知识点内容：</td>
							<td class="form-control" ><input id="pointContent"
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
						</tr>
  				</table>
  				<table style="margin-left:20px;margin-top:20px;">
  					<tr style="width:800px">
							<td class="form-label" align="right">知识点备注：</td>
							<td>
								<input class="easyui-textbox" name="pointRemake"  id="pointRemake" data-options="multiline:true" style="height:100px;width:600px"/>
							</td>
						</tr>	
  				</table>
  				</div>
  				</div>	
  	<script type="text/javascript">
	  	$(function(){
	  		$("#courseId2").combobox({
	  			onChange: function (n,o) {
	  				initCobbobox(n);
	  			}
	  		});
	  	}) ;
	  
	  	function doSave(dialog){
	  		if(!vailNull()){
	  			$.messager.alert('提示','请填写必填项!','warning');
	  			return
	  		}
  			$.ajax({
  				type : "POST",
  				//提交的网址
  				url : "point/add",
  				datatype:"json",
  				//提交的数据
  				data :{
  					"data":JSON.stringify({
  		 				"pointName": $("#pointName").textbox("getValue"),
  						"pointContent":$('#pointContent').textbox('getValue'),
  						"pointRemake":$('#pointRemake').textbox('getValue')
  						})					
  					},
  				//成功返回之后调用的函数             
  				success : function(data) {
  					if(data.meta.success){
  						$.messager.alert('提示','保存成功!','warning');
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
			var pointContent =$('#pointContent').textbox('getValue')  ? true : false;
			var pointName=$('#pointName').textbox('getValue')  ? true : false;
			var pointRemake=$('#pointRemake').textbox('getValue')  ? true : false;
			return (pointContent && pointName && pointRemake);
		}
  	</script>