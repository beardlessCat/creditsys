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
			<tr>
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
  	<script type="text/javascript">
  	function doInit(dialog){
  		commonComboTree('resParentId','sysRes/initResTree')	;  	
  	}
  	function doSave(dialog){
  		datas = JSON.stringify({
			"resName":$('#resName').textbox('getValue'),
			"resParentId": $('#resParentId').combotree('getValue'),
			"resUrl":$('#resUrl').textbox('getValue'),
			"resCode":$('#resCode').textbox('getValue'),
			"resType":$('#resType').textbox('getValue'),
			"resOrder":$('#resOeder').textbox('getValue'),
			"resDesc":$('#resDesc').val()
		}) ;
		doActionForm('sysRes/add',datas,initTreeData,dialog) ;
  	}
  	</script>
 </div>