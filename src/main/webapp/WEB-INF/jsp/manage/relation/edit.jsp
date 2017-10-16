<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'west',border:true" class="easyui-panel" 
  					style="width: 800px">
  				<input type="hidden" id="companyId"  />				
  					<table id="areaList" calss="form" style="margin-left:20px;margin-top:20px;border-collapse:separate; border-spacing:10px 10px;">
		  				
						<tr>
							<td class="form-label" align="right">备注：</td>
							<td class="form-control"><input id="relationRemake"
								 class="easyui-textbox"  
								data-options="required:true" style="width:250px">	
							<td class="form-label" align="right">要求：</td>
							<td class="form-control" ><input id="relationRemain"
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
						</tr>
  				</table>
  			</div>
  		</div>	
  	<script type="text/javascript">
  	var relationId 
  	function doInit(dialog){
  		relationId  = dialog.getData("relationId");
  		initDiv(relationId);
  	}
	function initDiv(relationId){
  		$.ajax({
  			url:'relation/getRealtionById',
  			type:'post',
  			data:{
  				relationId:relationId
  			},            
  			success:function(data){
  				$("#relationRemake").textbox('setValue',data.data.relationRemake);
  				$("#relationRemain").textbox('setValue',data.data.relationRemain);
  			}
  		})
  	}
	  	function doSave(dialog){
  			$.ajax({
  				type : "POST",
  				//提交的网址
  				url : "relation/editRealtion",
  				datatype:"json",
  				//提交的数据
  				data :{
  					"data":JSON.stringify({
  		 				"relationRemain":$("#relationRemain").textbox('getValue'),
  		 				"relationRemake":$("#relationRemake").textbox('getValue'),
  		 				"relationId":relationId
  						})					
  					},
  				//成功返回之后调用的函数             
  				success : function(data) {
  					if(data.meta.success){
  						$.messager.alert('提示','保存成功!','warning');
  						initTree();
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
