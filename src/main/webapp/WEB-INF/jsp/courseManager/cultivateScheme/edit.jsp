<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'west',border:true" class="easyui-panel" 
  					style="width: 900px">
  				<input type="hidden" id="cultivateId"  />				
  					<table id="areaList" calss="form" style="margin-left:20px;margin-top:20px;border-collapse:separate; border-spacing:10px 10px;">
		  				<tr>
							<td class="form-label" align="right">专业名称：</td>
							<td class="form-control" ><input id="majorId"
								 class="easyui-textbox"
								data-options="required:true,editable:false" style="width:250px"></td>	
								<td class="form-label" align="right">学时学分比例：</td>
							<td class="form-control"><input id="cultivatePercent" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>
						</tr>
						<tr>
							<td class="form-label" align="right">能力技能：</td> 
							<td class="form-control"><input id="cultivateSkills" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
								<td class="form-label" align="right">教学环节：</td>
							<td class="form-control"><input id="cultivateProcess" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>
						</tr> 
						<tr >
							<td class="form-label" align="right">最少学习年限：</td> 
							<td class="form-control"><input id="cultivateLeastStudyTime" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
								<td class="form-label" align="right">最多学习年限：</td>
							<td class="form-control"><input id="cultivateMostStudyTime" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>
						</tr> 
						<tr >
							<td class="form-label" align="right">课程总学时：</td> 
							<td class="form-control"><input id="cultivateAllCoursePeriod" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
								<td class="form-label" align="right">课程总学分：</td>
							<td class="form-control"><input id="cultivateAllCourseScore" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>
						</tr> 
						<tr >
							<td class="form-label" align="right">专业任选课学分：</td> 
							<td class="form-control"><input id="cultivateMajorOptScore" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
								<td class="form-label" align="right">公共选修课学分：</td>
							<td class="form-control"><input id="cultivatePublicOptScore" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>
						</tr> 
						<tr >
							<td class="form-label" align="right">必修课学时：</td> 
							<td class="form-control"><input id="cultivateReqCoursePeriod" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
								<td class="form-label" align="right">必修课学分：</td>
							<td class="form-control"><input id="cultivateReqCourseScore" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>
						</tr>
						<tr >
							<td class="form-label" align="right">选修课学时：</td> 
							<td class="form-control"><input id="cultivateOptPeriod" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
								<td class="form-label" align="right">选修课学分：</td>
							<td class="form-control"><input id="cultivateOptScore" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>
						</tr>
						<tr >
							<td class="form-label" align="right">理论教学课程学时：</td> 
							<td class="form-control"><input id="cultivateTheoryPeriod" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
								<td class="form-label" align="right">理论教学课程学分：</td>
							<td class="form-control"><input id="cultivateTheoryScore" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>
						</tr>
							<tr >
							<td class="form-label" align="right">实践教学课程学时：</td> 
							<td class="form-control"><input id="cultivatePracticePeriod" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
								<td class="form-label" align="right">实践教学课程学分：</td>
							<td class="form-control"><input id="cultivatePracticeScore" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>
						</tr>
							<tr >
							<td class="form-label" align="right">集中实践教学环节学分：</td> 
							<td class="form-control"><input id="cultivateCenterScore" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
								<td class="form-label" align="right">创新学分：</td>
							<td class="form-control"><input id="cultivateInnovateScore" 
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>
						</tr>
  				</table>
  				<table style="margin-left:20px;margin-top:20px;">
  					<tr style="width:800px">
							<td class="form-label" align="right">毕业标准：</td>
							<td>
								<input class="easyui-textbox" name="cultivateStandard"  id="cultivateStandard" data-options="multiline:true" style="height:100px;width:600px"/>
							</td>
						</tr>	
  				</table>
  				<table style="margin-left:20px;margin-top:20px;">
  					<tr style="width:800px">
							<td class="form-label" align="right">培养目标：</td>
							<td>
								<input class="easyui-textbox" name="cultivateBusiness"  id="cultivateBusiness" data-options="multiline:true" style="height:100px;width:600px"/>
							</td>
						</tr>	
  				</table>
  				</div>
  			</div>	
  	<script type="text/javascript">
  		var selected ;
  		var cultivateId;
  		var row ;
	  	function doInit(dialog){
	  		selected= dialog.getData("row");
	  		row = dialog.getData("selected");
	  		cultivateId=selected.cultivateId;
	  		$('#majorId').textbox('setValue',row.majorName);
	  		$('#cultivatePercent').textbox('setValue',selected.cultivatePercent);
	  		$('#cultivateSkills').textbox('setValue',selected.cultivateSkills);
	  		$('#cultivateProcess').textbox('setValue',selected.cultivateProcess);
	  		$('#cultivateLeastStudyTime').textbox('setValue',selected.cultivateLeastStudyTime);
	  		$('#cultivateMostStudyTime').textbox('setValue',selected.cultivateMostStudyTime);
	  		$('#cultivateAllCoursePeriod').textbox('setValue',selected.cultivateAllCoursePeriod);
			$('#cultivateAllCourseScore').textbox('setValue',selected.cultivateAllCourseScore);
			$('#cultivateMajorOptScore').textbox('setValue',selected.cultivateMajorOptScore);
			$('#cultivatePublicOptScore').textbox('setValue',selected.cultivatePublicOptScore);
	  		$('#cultivateReqCoursePeriod').textbox('setValue',selected.cultivateReqCoursePeriod);
	  		$('#cultivateReqCourseScore').textbox('setValue',selected.cultivateReqCourseScore);
	  		$('#cultivateOptPeriod').textbox('setValue',selected.cultivateOptPeriod);
	  		$('#cultivateOptScore').textbox('setValue',selected.cultivateOptScore);
	  		$('#cultivateTheoryPeriod').textbox('setValue',selected.cultivateTheoryPeriod);
	  		$('#cultivateTheoryScore').textbox('setValue',selected.cultivateTheoryScore);
	  		$('#cultivatePracticePeriod').textbox('setValue',selected.cultivatePracticePeriod);
	  		$('#cultivatePracticeScore').textbox('setValue',selected.cultivatePracticeScore);
	  		$('#cultivateCenterScore').textbox('setValue',selected.cultivateCenterScore);
	  		$('#cultivateInnovateScore').textbox('setValue',selected.cultivateInnovateScore);
	  		$('#cultivateStandard').textbox('setValue',selected.cultivateStandard);
	  		$('#cultivateBusiness').textbox('setValue',selected.cultivateBusiness);
	  	}
  		function doSave(dialog){	  		
  			$.ajax({
  				type : "POST",
  				//提交的网址
  				url : "cultivateScheme/edit",
  				datatype:"json",
  				//提交的数据
  				data :{
  					"data":JSON.stringify({
  	  					"cultivateId":selected.cultivateId,
  						"majorId":row.majorId,
  						"cultivatePercent":selected.cultivatePercent,
  						"cultivateSkills":$('#cultivateSkills').textbox('getValue'),
  		 				"cultivateProcess": $("#cultivateProcess").textbox("getValue"),
  						"cultivateLeastStudyTime":$('#cultivateLeastStudyTime').textbox('getValue'),
  						"cultivateMostStudyTime":$('#cultivateMostStudyTime').textbox('getValue'),
  						"cultivateAllCoursePeriod":$('#cultivateAllCoursePeriod').textbox('getValue'),
  						"cultivateAllCourseScore":$('#cultivateAllCourseScore').textbox('getValue'),
  						"cultivateMajorOptScore":$('#cultivateMajorOptScore').textbox('getValue'),
  						"cultivatePublicOptScore":$('#cultivatePublicOptScore').textbox('getValue'),
  						"cultivateReqCoursePeriod":$('#cultivateReqCoursePeriod').textbox('getValue'),
  		 				"cultivateReqCourseScore": $("#cultivateReqCourseScore").textbox("getValue"),
  						"cultivateOptPeriod":$('#cultivateOptPeriod').textbox('getValue'),
  						"cultivateOptScore":$('#cultivateOptScore').textbox('getValue'),
  						"cultivateTheoryPeriod":$('#cultivateTheoryPeriod').textbox('getValue'),
  						"cultivateTheoryScore":$('#cultivateTheoryScore').textbox('getValue'),
  						"cultivatePracticePeriod":$('#cultivatePracticePeriod').textbox('getValue'),
  						"cultivatePracticeScore":$('#cultivatePracticeScore').textbox('getValue'),
  						"cultivateCenterScore":$('#cultivateCenterScore').textbox('getValue'),
  						"cultivateInnovateScore":$('#cultivateInnovateScore').textbox('getValue'),
  						"cultivateStandard":$('#cultivateStandard').textbox('getValue'),
  						"cultivateBusiness":$('#cultivateBusiness').textbox('getValue')
  						})						
  					},
  				//成功返回之后调用的函数             
  				success : function(data) {
  					if(data.meta.success){
  						$.messager.alert('提示','修改成功!','info');
  						initdatagrid(row.majorName);
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
  	</script>
