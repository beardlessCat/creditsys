<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'north',border:true" class="easyui-panel"  style="width: 350px;padding:60px">  
  		<table id="deptList"  >
			 <tr>
				<td class="form-label" align="right" >
					<div>角色名称:</div>
				</td>
				<td class="form-control">
					<input class="easyui-textbox" id="roleName" style="width:300px;height:30px;margin-top: 10px">
				</td>	
				<td class="form-label" align="right">上级角色：</td>
				<td class="form-control">			
					<input id="roleParentId"  class="easyui-combotree"   data-options="required:true"  style="width:300px;height:30px">
				</td>
			</tr>
			<tr >
				<td class="form-label" align="right" style="padding-top: 30px">有效标识：</td>
				<td class="form-control" style="padding-top: 20px">
				<select id="roleIsValid" class="easyui-combobox" data-options="required:true"  style="width:300px;height:30px">
					<option value ="0">无效</option>
					<option value ="1">有效</option>
				</select>
				<td class="form-label" align="right" style="padding-top: 20px">备注：</td>
				<td class="form-control" style="padding-top: 20px">
					<input id="remake" class="easyui-textbox" data-options="required:true"  style="width:300px;height:30px;">
				</tr>
		</table>	
  	</div>
 	<script type="text/javascript">
  		var selected ;
	  	function doInit(dialog){
	  		commonComboTree('roleParentId','sysRole/initRoleTree')
	  		selected= dialog.getData("selected")[0];
	  		$('#roleName').textbox('setValue',selected.roleName);
	  		$('#roleParentId').combo('setValue',selected.roleParentId);
	  		$('#roleIsValid').combobox('setValue',selected.roleIsValid);
	  		$('#remake').textbox('setValue',selected.remake);
	  	}
  		function doSave(dialog){
  			datas = JSON.stringify({
  				"roleId":selected.roleId ,
				"roleName":$('#roleName').textbox('getValue'),
				"roleParentId": $('#roleParentId').combotree('getValue'),
				"roleIsValid":$('#roleIsValid').combobox('getValue'),
				"remake":$('#remake').textbox('getValue')
			}) ;
			doActionForm('sysRole/edit',datas,initGrid,dialog) ;
  		}
  	</script>
  	</div>
  	