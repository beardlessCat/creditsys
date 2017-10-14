<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<div class="easyui-layout" data-options="fit:true" style="padding:60px" >
	<div data-options="region:'cnter',border:false" class="easyui-panel" style="width: 800px">
  		<table id="deptList"  >
			<tr>
				<td class="form-label" align="right" >
					<div>权限资源名称:</div>
				</td>
				<td class="form-control">
					<input class="easyui-textbox" id="resName" style="width:300px;height:30px;margin-top: 10px">
				</td>	
				<td class="form-label" align="right">上级权限：</td>
				<td class="form-control">			
					<input id="resParentId"  class="easyui-combotree"   data-options="required:true"  style="width:300px;height:30px">
				</td>
			</tr>
				<tr>
					<td class="form-label" align="right" style="padding-top: 30px"> 权限路径：</td>
					<td class="form-control" style="padding-top: 20px"><input id="resUrl"
						 class="easyui-textbox"  
						data-options="required:true"  style="width:300px;height:30px">
					<td class="form-label" align="right" style="padding-top: 20px">权限代码：</td>
					<td class="form-control" style="padding-top: 20px ">
						<input id="resCode" class="easyui-textbox" data-options="required:true"  style="width:300px;height:30px;">
					</td>
			</tr>
			<tr >
				<td class="form-label" align="right" style="padding-top: 30px">权限类型：</td>
				<td class="form-control" style="padding-top: 20px">
				<select id="resType" class="easyui-combobox" data-options="required:true"  style="width:300px;height:30px">
					<option value ="1">界面</option>
					<option value ="2">按钮</option>
				</select>
				<td class="form-label" align="right" style="padding-top: 20px">权限序号：</td>
				<td class="form-control" style="padding-top: 20px">
					<input id="resOeder" class="easyui-textbox" data-options="required:true"  style="width:300px;height:30px;">
				</td>
			</tr>
			<tr>
				<td class="form-label" align="right" style="padding-top: 20px">资源描述：</td>
				<td class="form-control" style="padding-top: 20px">
			 		<textarea style="height:50px;width: 300px" id="resDesc"></textarea>			
				</td>
			</tr>
	</table>	
  	</div>
  	</div>
  	<script type="text/javascript">
	var selected  ;
  	function doInit(dialog){
  		commonComboTree('resParentId','sysRes/initResTree')	;  	
		selected  = dialog.getData("selected")[0];
		console.log(selected.remake) ;
		$('#resName').textbox('setValue',selected.resName);
		$('#resParentId').textbox('setValue',selected.resParentId);
		$('#resUrl').textbox('setValue',selected.resUrl);
		$('#resCode').textbox('setValue',selected.resCode);
		$('#resType').combobox('setValue',selected.resType);
		$('#resOeder').textbox('setValue',selected.resOrder);
		$('#resDesc').val(selected.resDesc);
	}  
  	function doSave(dialog){
  		datas = JSON.stringify({
  			"resId":selected.resId ,
  			"resName":$('#resName').textbox('getValue'),
			"resParentId": $('#resParentId').combotree('getValue'),
			"resUrl":$('#resUrl').textbox('getValue'),
			"resCode":$('#resCode').textbox('getValue'),
			"resType":$('#resType').textbox('getValue'),
			"resOrder":$('#resOeder').textbox('getValue'),
			"resDesc":$('#resDesc').val()
			}) ;

		doActionForm('sysRes/edit',datas,initTreeData,dialog) ;
  	}
 </script>