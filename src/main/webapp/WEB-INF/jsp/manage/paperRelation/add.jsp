<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'west',border:true" class="easyui-panel" 
  					style="width: 800px">
  				<input type="hidden" id="companyId"  />				
  					<table id="areaList" calss="form" style="margin-left:20px;margin-top:20px;border-collapse:separate; border-spacing:10px 10px;">
		  				<tr>
							<td class="form-label" align="right">名称：</td>
							<td class="form-control" ><input id="prName"
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
							<td class="form-label" align="right">类型：</td>
							<td class="form-control"><input id="type"
								 class="easyui-textbox"  
								data-options="required:true,editable:false" style="width:250px">				
						</tr>
						<tr>
							<td class="form-label" align="right">题目类型：</td>
							<td class="form-control" ><input id="prType"
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
							<td class="form-label" align="right">题目序号：</td>
							<td class="form-control"><input id="prIndex"
								 class="easyui-textbox"  
								data-options="required:true" style="width:250px">				
						</tr>
						<tr>
							<td class="form-label" align="right">分值：</td>
							<td class="form-control" ><input id="prScore"
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
							<td class="form-label" align="right">难易程度：</td>
							<td class="form-control"><input id="prHard"
								 class="easyui-textbox"  
								data-options="required:true" style="width:250px">				
						</tr>
						<tr>
							
								<td class="form-label" align="right">上级资源：</td>
							<td class="form-control"><input id="prPid"
								 class="easyui-textbox"  
								data-options="required:true,editable:false" style="width:250px">
								<td class="form-label" align="right">资源描述：</td>
							<td class="form-control"><input id="prDesc"
								 class="easyui-textbox"  
								data-options="required:true" style="width:250px">		
						</tr>
					<!-- 	<tr>
							<td class="form-label" align="right">得分率：</td>
							<td class="form-control" ><input id="prRate"
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
						</tr> -->
							
  				</table>
  				<div style="margin-top: 10px; margin-left: 50px;">
  					<p style="color: #666">*注：名称指的是题目的题号，序号指的是所在级别排序的序号</p>  				
  				</div>
  				</div>	
  	<script type="text/javascript">
  		var type ;
  		var url ;
  		var title ;
  		var node ;
  		var paperName;
  		var otherId ;
  		var paperId ;
	  	function doInit(dialog){
	  		type = dialog.getData("type");
	  		node = dialog.getData("node");
	  		paperId = dialog.getData("paperId");
	  		paperName =  dialog.getData("pr");
	  		$('#prPid').textbox('setValue',node.prName);
	  		if(type=='1'){
	  			$('#type').textbox('setValue','大题');
	  			$('#prIndex').textbox('textbox').attr('readonly',true);  
	  		}else if(type == '2'){
	  			$('#type').textbox('setValue','小题');
	  		}else{
	  			$('#prIndex').textbox('textbox').attr('readonly',true); 
	  			$('#type').textbox('setValue','知识点');
	  		}
	  	}
		function choose(){
			if(type == "1"){
				$.messager.alert('提示','答题信息无法选择，请手动添加！','warning');
				return ;
			}
			if(type == "2"){
				url = "url:paperRelation/toListPaperDetial" ;
				title = "选择试题详情";
			}else{
				url = "url:paperRelation/toChoosePoint" ;
				title = "选择试题知识点";
				//路径  /manage/relation/listPoint
			}
			$.showModalDialog({
	            title: title,
	            content:url,   
	            data: {
	            	type:type 
	            	},//扩展属性，给dilog页面传值
	            useiframe:false,//默认false，扩展属性
	            width:'850px',
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
	                if(cotent && cotent.doInits){//判断弹出页面是否加载完，是否有这个方法
	                    cotent.doInits(dialog);//调用dialog页面的方法
	                }
	            }
		})
		}
	  	function doSave(dialog){
  			  $.ajax({
  				type : "POST",
  				//提交的网址
  				url : "paperRelation/add",
  				datatype:"json",
  				//提交的数据
  				data :{
  					"data":JSON.stringify({
  						"prName":$('#prName').textbox('getValue'),
  		 				"type": String(parseInt(type)+1),
  		 				"prType": $("#prType").textbox('getValue'),
  		 				"prDesc": $("#prDesc").textbox('getValue'),
  		 				"prScore": $("#prScore").textbox('getValue'),
  		 				"prHard": $("#prHard").textbox('getValue'),
  		 				/* "prRate": $("#prRate").textbox('getValue'), */
  		 				"prIndex": $("#prIndex").textbox('getValue'),
  		 				"prPid":node.prId,
  		 				"otherId":otherId,
  						})					
  					},
  				//成功返回之后调用的函数             
  				success : function(data) {
  					if(data.meta.success){
  						$.messager.alert('提示','保存成功!','warning');
  						initTree(paperId);
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
  			 $('#restree').treegrid('expandAll');
  		}
  	</script>
