<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'west',border:true" class="easyui-panel" 
  					style="width: 800px">
  				<input type="hidden" id="id"  />				
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
  		var selected ;
  		var courseId;
	  	function doInit(dialog){
	  		initCobbobox()
	  		selected= dialog.getData("selected");
	  		courseId=selected.courseId;
	  		$('#dMajorId').combobox('setValue',selected.dMajorId);
	  		$('#majorDirectName').textbox('setValue',selected.majorDirectName);
	  		$('#majorDirectDesc').textbox('setValue',selected.majorDirectDesc);
	  		
	  	}
	  	function initCobbobox(){
	  		$('#dMajorId').combobox({    
	  		    url:'major/initMajor',    
	  		    valueField:'id',    
	  		    textField:'text'   
	  		});  
	  	}
  		function doSave(dialog){
  			if(row==null){
  				$.messager.alert('提示','请选择一行!','warning');
  				return;
  			}

  			$.ajax({
  				type : "POST",
  				//提交的网址
  				url : "majorDirect/edit",
  				datatype:"json",
  				//提交的数据
  				data :{
  					"data":JSON.stringify({
  						"majorDirectId":selected.majorDirectId,
  						"dMajorId":$('#dMajorId').combobox('getValue'),
  						"majorDirectName":$('#majorDirectName').textbox('getValue'),
  						"majorDirectDesc":$('#majorDirectDesc').textbox('getValue'),
  		 				
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
  		function chooseMust(courseSid){
	  		 $.showModalDialog({
	            title: '判定选修课程的关系',
	            content:'url:course/toNesCourse',   
	            data: {
	            	courseSid: courseSid
	            	},//扩展属性，给dilog页面传值
	            useiframe:false,//默认false，扩展属性
	            width:'80%',
	            height:'80%',
	            toolbar:[{
	                text:'保存',
	                iconCls:'icon-save',
	                handler: 'doSave'
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
  	 	function vailNull(){        
			var dMajorId =$('#dMajorId').textbox('getValue')  ? true : false;
			var majorDirectName=$('#majorDirectName').textbox('getValue')  ? true : false;
			var majorDirectDesc=$('#majorDirectDesc').textbox('getValue')  ? true : false;
			return (dMajorId && majorDirectName && majorDirectDesc);
		}
  	</script>
