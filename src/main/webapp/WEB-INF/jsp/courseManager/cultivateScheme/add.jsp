<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'west',border:true" class="easyui-panel" 
  					style="width: 100%">
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
  	var selected
  	var node ;
  	function doInits(dialog){
  		selected= dialog.getData("selected");
  		$('#majorId').textbox('setValue',selected.majorName);
  	}

  	function doSave(dialog){
	
			$.ajax({
				type : "POST",
				//提交的网址
				url : "cultivateScheme/add",
				datatype:"json",
				//提交的数据
				data :{
					"data":JSON.stringify({
						"majorId":selected.majorId,
						"cultivatePercent":$('#cultivatePercent').textbox('getValue'),
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
						$.messager.alert('提示','保存成功!','warning');
						initGrid('','1','10') ;
						$("#addbtns").hide();
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