<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'west',border:true" class="easyui-panel" 
  					style="width: 800px">
  				<input type="hidden" id="companyId"  />				
  					<table id="areaList" calss="form" style="margin-left:20px;margin-top:20px;border-collapse:separate; border-spacing:10px 10px;">
		  				<tr>
							<td class="form-label" align="right">名称：</td>
							<td class="form-control" ><input id="srName"
								 class="easyui-textbox"
								data-options="required:true,editable:false" style="width:250px" ></td>	
							<td class="form-label" align="right">类型：</td>
							<td class="form-control"><input id="srType"
								 class="easyui-textbox"  
								data-options="required:true,editable:false" style="width:250px">				
						</tr>
						<tr>
							<td class="form-label" align="right">上级资源：</td>
							<td class="form-control"><input id="srPid"
								 class="easyui-textbox"  
								data-options="required:true" style="width:250px">	
							<td class="form-label" align="right">课时：</td>
							<td class="form-control" ><input id="srDate"
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
						</tr>
						<tr>
							<td class="form-label" align="right">是否必修：</td>
							<td class="form-control"><input id="srIsNess"
								 class="easyui-textbox"  
								data-options="required:true" style="width:250px">	
								<td class="form-label" align="right">属性：</td>
							<td class="form-control"><input id="srProperty"
								 class="easyui-textbox"  
								data-options="required:true" style="width:250px">				
						</tr>
						<tr>
							<td class="form-label" align="right">备注：</td>
							<td class="form-control"><input id="srRemake"
								 class="easyui-textbox"  
								data-options="required:true,editable:false" style="width:250px">				
						</tr>
  				</table>
  				</div>
  				</div>	
  <script type="text/javascript">
  	var type ;
	var pid ;
	var node;
  	function doInit(dialog){
  			type =dialog.getData("type");
  			node = dialog.getData("node");
  			$("#srPid").textbox('setValue',node.srName);
  	}
	  	function doSave(dialog){
  			$.ajax({
  				type : "POST",
  				//提交的网址
  				url : "courseRelation/addRe",
  				datatype:"json",
  				//提交的数据
  				data :{
  					"data":JSON.stringify({
  						"srPid":node.srId,
  		 				"srName":$("#srName").textbox('getValue'),
  		 				"srType":srType,
  		 				"srDate":$("#srDate").textbox('getValue'),
  		 				"srIsNess":$("#srIsNess").textbox('getValue'),
  		 				"srProperty":$("#srProperty").textbox('getValue'),
  		 				"srOtherId":srOtherId,
  		 				"srRemake":$("#srRemake").textbox('getValue'),
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
	  	function choose(){
	  		var url ;
	  		var title ;
	  		if(type=="2"){
	  			url='url:courseRelation/toAddUnit';
	  			title='选择单元';
	  		}else if(type=="3"){
	  			url='url:courseRelation/toAddPoint';
	  			title='选择知识点';
	  		}
	  		 $.showModalDialog({
	             title: title,
	             content:url,
	             data: {
	             	node:node
	             	},//扩展属性，给dilog页面传值
	             useiframe:false,//默认false，扩展属性
	             width:'800px',
	             height:'80%',
	             toolbar:[{
	                 text:'保存',
	                 iconCls:'icon-save',
	                 handler: 'doChoose'
	             },'-',{
	                 text: '关闭',
	                 iconCls: 'icon-cancel',
	                 handler: function(dialog){
	                     dialog.close();
	                 }
	             }],
	             onLoad: function(dialog, cotent){//参数扩展，dialog表示弹出页面，cotent表示弹出页面的body
	                 if(cotent && cotent.doInit){//判断弹出页面是否加载完，是否有这个方法
	                     cotent.doInit(dialog);//调用dialog页面的方法
	                 }
	             }
	         });
	  	}
  	</script>
