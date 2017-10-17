<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'west',border:true" class="easyui-panel" 
  					style="width: 800px">
  				<input type="hidden" id="id"  />				
  					<table id="areaList" calss="form" style="margin-left:20px;margin-top:20px;border-collapse:separate; border-spacing:10px 10px;">
		  				<tr>
							<td class="form-label" align="right">试卷名称：</td>
							<td class="form-control" ><input id="paperName"
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
							<td class="form-label" align="right">所属学科：</td>
							<td class="form-control"><input id="coursePaperId"
								 class="easyui-combobox"  
								data-options="required:true" style="width:250px">				
						</tr>
						<tr>
							<td class="form-label" align="right">学期标识：</td>
							<td class="form-control" ><input id="termMark"
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
							<td class="form-label" align="right">总成绩：</td>
							<td class="form-control"><input id="totalResult"
								 class="easyui-textbox"  
								data-options="required:true" style="width:250px">				
						</tr>
						<tr>
							<td class="form-label" align="right">最高成绩：</td>
							<td class="form-control" ><input id="resultMax"
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
							<td class="form-label" align="right">最低成绩：</td>
							<td class="form-control"><input id="resultMin"
								 class="easyui-textbox"  
								data-options="required:true" style="width:250px">				
						</tr>
						<tr>
							<td class="form-label" align="right">成绩描述：</td>
							<td class="form-control" ><input id="resultDesc"
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
							<td class="form-label" align="right">考试人数：</td>
							<td class="form-control"><input id="userTotal"
								 class="easyui-textbox"  
								data-options="required:true" style="width:250px">				
						</tr>
						<tr>
							<td class="form-label" align="right">试卷难度：</td>
							<td class="form-control" ><input id="hardDegree"
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>	
								<td class="form-label" align="right">所属专业：</td>
							<td class="form-control" ><input id="majorPaperId"
								 class="easyui-textbox"
								data-options="required:true" style="width:250px"></td>
						</tr>
						<tr>
							<td class="form-label" align="right">试卷代码：</td>
							<td class="form-control"><input id="paperCode"
								 class="easyui-textbox"  
								data-options="required:true" style="width:250px">						
						</tr>
  				</table>
  				</div>
  	</div>
  	<script type="text/javascript">
  		var selected ;
	  	function doInit(dialog){
	  		initCourse();
	  		selected= dialog.getData("selected");
	  		$('#paperName').textbox('setValue',selected.paperName);
	  		$('#coursePaperId').combobox('setValue',selected.coursePaperId);
	  		$('#termMark').textbox('setValue',selected.termMark);
	  		$('#totalResult').textbox('setValue',selected.totalResult);
	  		$('#resultMax').textbox('setValue',selected.resultMax);
	  		$('#resultMin').textbox('setValue',selected.resultMin);
	  		$('#resultDesc').textbox('setValue',selected.resultDesc);
	  		$('#userTotal').textbox('setValue',selected.userTotal);
	  		$('#hardDegree').textbox('setValue',selected.hardDegree);
	  		$('#majorPaperId').textbox('setValue',selected.majorPaperId);
	  		$('#paperCode').textbox('setValue',selected.paperCode);
	  		
	  	}
		function initCourse(){
			$('#coursePaperId').combobox({    
	  		    url:'course/initCourse',    
	  		    valueField:'id',    
	  		    textField:'text'   
	  		}); 
  
	  	}
  		function doSave(dialog){
  			$.ajax({
  				type : "POST",
  				//提交的网址
  				url : "paper/edit",
  				datatype:"json",
  				//提交的数据
  				data :{
  					"data":JSON.stringify({
  						"paperName":$('#paperName').textbox('getValue'),
  		 				"coursePaperId": $("#coursePaperId").combobox('getValue'),
  		 				"termMark":$('#termMark').textbox('getValue'),
  		 				"totalResult": $("#totalResult").textbox('getValue'),
  		 				"resultMax":$('#resultMax').textbox('getValue'),
  		 				"resultMin": $("#resultMin").textbox('getValue'),
  		 				"resultDesc":$('#resultDesc').textbox('getValue'),
  		 				"userTotal": $("#userTotal").textbox('getValue'),
  		 				"hardDegree":$('#hardDegree').textbox('getValue'),
  		 				"majorPaperId":$('#majorPaperId').textbox('getValue'),
  		 				"paperId":selected.paperId,
  		 				"paperCode":$('#paperCode').textbox('getValue'),
  						})						
  					},
  				//成功返回之后调用的函数             
  				success : function(data) {
  					if(data.meta.success){
  						$.messager.alert('提示','修改成功!','info');
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
  	</script>
