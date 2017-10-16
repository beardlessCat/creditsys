<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'west',border:true" class="easyui-panel" 
  					style="width: 800px">
  				<input type="hidden" id="companyId"  />				
  					<table id="areaList" calss="form" style="margin-left:20px;margin-top:20px;border-collapse:separate; border-spacing:10px 10px;">
		  				<tr>
							<td class="form-label" align="right">名称：</td>
							<td class="form-control" ><input id="relationRes"
								 class="easyui-textbox"
								data-options="required:true,editable:false" style="width:250px" ></td>	
							<td class="form-label" align="right">类型：</td>
							<td class="form-control"><input id="relationType"
								 class="easyui-textbox"  
								data-options="required:true,editable:false" style="width:250px">				
						</tr>
						<tr>
							<td class="form-label" align="right">上级资源：</td>
							<td class="form-control"><input id="relationPid"
								 class="easyui-textbox"  
								data-options="required:true,editable:false" style="width:250px">	
							<td class="form-label" align="right">要求：</td>
							<td class="form-control" ><input id="relationRemain"
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
										
						</tr>
						<tr>
							<td class="form-label" align="right">备注：</td>
							<td class="form-control"><input id="relationRemake"
								 class="easyui-textbox"  
								data-options="required:true" style="width:250px">					
						</tr>
  				</table>
  				</div>
  				</div>	
  <script type="text/javascript">
  	var type ;
	var selected 
	var pid ;
	var otherId;
  	function doInit(dialog){
  			type =dialog.getData("type");
  			selected = dialog.getData("selected");
  			 if(selected=='0'){
  				type="1";
  				pid="0";
  			}else{
  				pid=selected.relationId;
  			}		
  	}
	  	function doSave(dialog){
  			$.ajax({
  				type : "POST",
  				//提交的网址
  				url : "relation/addCompanys",
  				datatype:"json",
  				//提交的数据
  				data :{
  					"data":JSON.stringify({
  						"relationRes":$('#relationRes').textbox('getValue'),
  		 				"relationRemain":$("#relationRemain").textbox('getValue'),
  		 				"relationRemake":$("#relationRemake").textbox('getValue'),
  		 				"relationType":type,
  		 				"relationPid":pid,
  		 				"otherId":otherId
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
	  		if(type=="1"){
	  			url='url:relation/toAddCompany';
	  			title='选择公司';
	  		}else if(type=="2"){
	  			url='url:relation/addPosition';
	  			title='选择职位';
	  		}else if(type=="3"){
	  			url='url:relation/addTechnology';
	  			title='选择技能';
	  		}else{
	  			url='url:relation/addPoint';
	  			title='选择知识点';
	  			}
	  		 $.showModalDialog({
	             title: title,
	             content:url,
	             data: {
	             	selected:selected
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
